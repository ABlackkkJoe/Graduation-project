//app.js
App({
  onLaunch: function () {
    //调用微信的login方法会返回code
    wx.login({
      success: function (res) {
        var openid = wx.getStorageSync("openid")
        if (openid) {
          getApp().globalData.openid = openid;
        } else {
          var appid = getApp().globalData.appid;
          var secret = getApp().globalData.secret;
          getApp().globalData.code = res.code;
          var code = getApp().globalData.code;
          //发起网络请求
          wx.request({
            url: 'https://api.weixin.qq.com/sns/jscode2session?appid=' + appid + '&secret=' + secret + '&js_code=' + code + '&grant_type=authorization_code',
            success: function (res) {
              openid = res.data.openid;
              getApp().globalData.openid = openid;
              //把用户的openid保存到本地
              wx.setStorageSync('openid', openid);
              getInfoByOpenid(openid);
            }
          })
        }
      }
    });
  },
  //后台切换至前台时
  onShow: function () {
  },
  getUserInfo: function (cb) {
    var that = this
    if (this.globalData.userInfo) {
      typeof cb == "function" && cb(this.globalData.userInfo)
    } else {
      //调用登录接口
      wx.getUserInfo({
        withCredentials: false,
        success: function (res) {
          console.log(res)
          that.globalData.userInfo = res.userInfo
          typeof cb == "function" && cb(that.globalData.userInfo)
        }
      })
    }
  },
  //调用函数获取微信用户信息
  getUserInfo:function (info) {
      var that = this
      if (this.globalData.userInfo) {
        typeof cb == "function" && cb(this.globalData.userInfo)
      } else {
        //调用登录接口
        //发送code与微信用户信息，获取学生数据
        wx.getUserInfo({
          withCredentials: false,
          success: function (res) {
            console.log(res)
            that.globalData.userInfo = res.userInfo
            typeof cb == "function" && cb(that.globalData.userInfo)
          },
        })
      }
    },
  showErrorModal: function (content, title) {
    wx.showModal({
      title: title || '加载失败',
      content: content || '未知错误',
      showCancel: false
    });
  },
  showLoadToast: function (title, duration) {
    wx.showToast({
      title: title || '加载中',
      icon: 'loading',
      mask: true,
      duration: duration || 10000
    });
  },
  
  globalData: {
    openid: "",
    outid:"",
    passwd:"",
    status: 0,
    userInfo: null,
    is_bind:true,
    appid : "wxe70cbc5ea4cad465",
    secret : "5bf95eaf3c6110d7265f83dab5ca3048",
    code:""
  }
})



