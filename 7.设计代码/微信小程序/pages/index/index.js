//index.js
//获取应用实例
var app = getApp();
Page({
  data: {
    offline: false,
    remind: '加载中',
    cores: [
      [
        { id: 'ykt', name: '一卡通', disabled: false, teacher_disabled: false, offline_disabled: false }
      ],
    ],
    card: {
      'ykt': {
        show: false,
        data: {
          'last_time': '',
          'balance': 0,
          'cost_status': false,
          'today_cost': {
            value: [],
            total: 0
          }
        }
      },
    },
    user: {},
    disabledItemTap: false //点击了不可用的页面
  },
  //分享
  onShareAppMessage: function(){
    return {
      title: 'nuc',
      desc: '一卡通微信小程序',
      path: '/pages/card/card'
    };
  },
  //下拉更新
  onPullDownRefresh: function(){
    if(app._user.is_bind){
      this.getCardData();
    }else{
      wx.stopPullDownRefresh();
    }
  },
  onShow: function(){
    var _this = this;
    //离线模式重新登录
    if(_this.data.offline){
      _this.login();
      return false;
    }
    function isEmptyObject(obj){ for(var key in obj){return false;} return true; }
    function isEqualObject(obj1, obj2){ if(JSON.stringify(obj1) != JSON.stringify(obj2)){return false;} return true; }
    var l_user = _this.data.user,  //本页用户数据
        g_user = app._user; //全局用户数据
    //排除第一次加载页面的情况（全局用户数据未加载完整 或 本页用户数据与全局用户数据相等）
    if(isEmptyObject(l_user) || !g_user.openid || isEqualObject(l_user.we, g_user.we)){
      return false;
    }
    //全局用户数据和本页用户数据不一致时，重新获取卡片数据
    if(!isEqualObject(l_user.we, g_user.we)){
      //判断绑定状态
      if(!g_user.is_bind){
        _this.setData({
          'remind': '未绑定'
        });
      }else{
        _this.setData({
          'remind': '加载中'
        });
        //清空数据
        _this.setData({
          user: app._user,
          'card.ykt.show': false
        });
        _this.getCardData();
      }
    }
  },
  onLoad: function(){
    this.login();
  },
  login: function(){
    var _this = this;
    //然后再尝试登录用户, 如果缓存更新将执行该回调函数
    app.getUserInfo(function(status){
      _this.response.call(_this, status);
    });
  },
  response: function(status){
    var _this = this;
    if(status){
      if(status != '离线缓存模式'){
        //错误
        _this.setData({
          'remind': status
        });
        return;
      }else{
        //离线缓存模式
        _this.setData({
          offline: true
        });
      }
    }
    _this.setData({
      user: app._user
    });
    //判断绑定状态
    if(!app._user.is_bind){
      _this.setData({
        'remind': '未绑定'
      });
    }else{
      _this.setData({
        'remind': '加载中'
      });
      _this.getCardData();
    }
  },
  disabled_item: function(){
    var _this = this;
    if(!_this.data.disabledItemTap){
      _this.setData({
        disabledItemTap: true
      });
      setTimeout(function(){
        _this.setData({
          disabledItemTap: false
        });
      }, 2000);
    }
  },
  getCardData: function(){
    var _this = this;
    if(_this.data.offline){ return; }
    wx.showNavigationBarLoading();

    //一卡通渲染
    function yktRender(list){
      if(list.length > 0){
        var last = list[0],
            last_time = last.time.split(' ')[0],
            now_time = app.util.formatTime(new Date()).split(' ')[0];
        //筛选并计算当日消费（一卡通数据有一定延迟，无法成功获取到今日数据，主页卡片通常不能展示）
        for(var i = 0, today_cost = [], cost_total = 0; i < list.length; i++){
          if(list[i].time.split(' ')[0] == now_time && list[i].cost.indexOf('-') == 0){
            var cost_value = Math.abs(parseInt(list[i].cost));
            today_cost.push(cost_value);
            cost_total += cost_value;
          }
        }
        if(today_cost.length){
          _this.setData({
            'card.ykt.data.today_cost.value': today_cost,
            'card.ykt.data.today_cost.total': cost_total,
            'card.ykt.data.cost_status': true
          });
        }
        _this.setData({
          'card.ykt.data.last_time': last_time,
          'card.ykt.data.balance': parseFloat(last.balance),
          'card.ykt.show': true,
          'remind': ''
        });
      }
    }
    //获取一卡通数据
    loadsum++; //新增正在请求连接
    wx.request({
      url: "http://www.ocpro.cc" + '/',
      method: 'POST',
      data: app.key({
        yktID: app._user.we.ykth
      }),
      success: function(res) {
        if(res.data && res.data.status === 200){
          var list = res.data.data;
          if(list){
            //保存一卡通缓存
            app.saveCache('ykt', list);
            yktRender(list);
          }
        }else{ app.removeCache('ykt'); }
      },
      complete: function() {
        loadsum--; //减少正在请求连接
        if(!loadsum){
          if(_this.data.remind){
            _this.setData({
              remind: '首页暂无展示'
            });
          }
          wx.hideNavigationBarLoading();
          wx.stopPullDownRefresh();
        }
      }
    });
  }
});