//news.js
//获取应用实例
var app = getApp();
Page({
  data: {
    page: 0,
    list: [
      { id: 0, 'type': 'all', name: '头条', storage: [], url: 'http://www.nuc.edu.cn/'},
      { id: 1, 'type': 'jw', name: '教务公告', storage: [], url: 'http://www.nuc.edu.cn/'},
      { id: 2, 'type': 'hy', name: '会议通知', storage: [], url: 'http://www.nuc.edu.cn/'},
      { id: 3, 'type': 'jz', name: '学术讲座', storage: [], url: 'http://www.nuc.edu.cn/'},
      { id: 4, 'type': 'new', name: '综合新闻', storage: [], url: 'http://www.nuc.edu.cn/'}
    ],
  },
  onLoad: function(){

  },
  onShow: function(){
  },
});