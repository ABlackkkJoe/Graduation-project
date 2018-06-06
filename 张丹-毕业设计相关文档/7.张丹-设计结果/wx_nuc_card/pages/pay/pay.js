// pages/pay/pay.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    money: 0, //余额
    currentTab: 3, //默认选中标签
    payMoney: 10
  },

  //tab的切换
  switchNav: function (e) {
    var that = this;
    if (that.data.currentTab == e.target.dataset.current) {
      return false;
    } else {
      that.setData({
        //tab
        currentTab: e.target.dataset.current,
        payMoney: e.target.dataset.money
      })
    }
  },
  recharge: function () {
    var that = this;
    //充值提示框
    wx.showModal({
      title: '充值',
      content: '您是否进行充值' + that.data.payMoney + '元?',
      success: function (res) {
        console.log(res)
        //确认充值
        if (res.confirm) {
          //发送充值请求
          var balance = getApp().globalData.balance;
          var openid = getApp().globalData.openid;
          var payMoney =  that.data.payMoney;
          wx.request({
            url: 'http://www.ocpro.cc/nuc_card/recharge',
            //url: 'http://localhost:8080/recharge',
            method: 'POST',
            header: { 'content-type': 'application/x-www-form-urlencoded' },
            data: {
              balance: balance,
              payMoney: payMoney,
              userCode: getApp().globalData.userCode
            },
            success: function (res) {
              console.log(res.data[0].balance)
              var bl = res.data[0].balance
              if(res.data) {
                getApp().globalData.balance=bl
                wx.showModal({
                  title: '提示',
                  content: '充值成功！',
                  
                  success: function(res) {
                    if (res.confirm) {
                      wx.navigateTo({
                        url: '../card/card?balance=' + getApp().globalData.balance,
                      })
                    }
                  }
                })
              }
            }
          })
        }
      }
    })
  },

})