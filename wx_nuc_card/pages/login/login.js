//login.js
//获取应用实例
var app = getApp();
Page({
  data: {
    remind: '加载中',
    help_status: false,
    userCode_focus: false,
    passwd_focus: false,
    userCode: '',
    passwd: '',
    angle: 0
  },
  onReady: function () {
    var _this = this;
    setTimeout(function () {
      _this.setData({
        remind: ''
      });
    }, 1000);
    wx.onAccelerometerChange(function (res) {
      var angle = -(res.x * 30).toFixed(1);
      if (angle > 14) { angle = 14; }
      else if (angle < -14) { angle = -14; }
      if (_this.data.angle !== angle) {
        _this.setData({
          angle: angle
        });
      }
    });
  },
  bind: function () {
    var _this = this;
    if (!_this.data.userCode || !_this.data.passwd) {
      app.showErrorModal('账号及密码不能为空', '提醒');
      return false;
    }
    app.showLoadToast('绑定中');
    getApp().globalData.userCode = _this.data.userCode;
    wx.request({
      method: 'POST',
      //url: "http://www.ocpro.cc/nuc_card" + '/wx_login?userCode=' + _this.data.userCode + '&userPassword=' + _this.data.passwd,
      //url: "http://localhost:8080" + '/wx_login?userCode=' + _this.data.userCode + '&userPassword=' + _this.data.passwd,
      //url: "http://localhost:8080" + '/wx_login', 
      url: "http://www.ocpro.cc/NUC-CARD" + '/wx_login',  
      data:{
        userCode: _this.data.userCode,
        userPassword:  _this.data.passwd,
        nickName: app.globalData.userInfo.nickName
      },
      header: { 'Content-Type': 'application/x-www-form-urlencoded' },
      success: function (res) {
        console.log(app.globalData.userInfo.nickName)
        if(res.statusCode==200){
          console.log(res)
          app.showLoadToast('请稍候');
          //清除缓存
          wx.clearStorage();
          wx.showToast({
              title: '绑定成功',
              icon: 'success',
              duration: 500,
          });
          wx.showModal({
            title: '提示',
            content: '绑定成功，是否前往一卡通管理页面？',
            cancelText: '以后再说',
            confirmText: '确认前往',
            success: function (res) {
              console.log(res)
              if (res.confirm) {
                wx.navigateTo({
                  url: "../card/card?userCode=" + _this.data.userCode,
                  header: { 'Content-Type': 'application/x-www-form-urlencoded' },
                })
                /*
                wx.redirectTo({
                  url: "../card/card?userCode=" + _this.data.userCode
                });
                */
              } else {
                wx.navigateBack();
              }
            }
          });
        }
        else {
          app.showErrorModal('用户名或密码错误||微信号不同步', '提醒');
        }
      },
    });
    
  },
  userCodeInput: function (e) {
    this.setData({
      userCode: e.detail.value
    });
    if (e.detail.value.length >= 11) {
      wx.hideKeyboard();
    }
  },
  passwdInput: function (e) {
    this.setData({
      passwd: e.detail.value
    });
  },
  inputFocus: function (e) {
    if (e.target.id == 'userCode') {
      this.setData({
        'userCode_focus': true
      });
    } else if (e.target.id == 'passwd') {
      this.setData({
        'passwd_focus': true
      });
    }
  },
  inputBlur: function (e) {
    if (e.target.id == 'userCode') {
      this.setData({
        'userCode_focus': false
      });
    } else if (e.target.id == 'passwd') {
      this.setData({
        'passwd_focus': false
      });
    }
  },
  tapHelp: function (e) {
    if (e.target.id == 'help') {
      this.hideHelp();
    }
  },
  showHelp: function (e) {
    this.setData({
      'help_status': true
    });
  },
  hideHelp: function (e) {
    this.setData({
      'help_status': false
    });
  }
});