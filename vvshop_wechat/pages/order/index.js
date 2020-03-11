let App = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    dataType: "",
    list: [],
    check: 10
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.data.dataType = options.type || '';
    this.setData({ dataType: this.data.dataType });
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    // 获取订单列表
    this.getOrderList(this.data.dataType);
  },

  /**
   * 获取订单列表
   */
  getOrderList: function (dataType) {
    let _this = this;
    let user_id = wx.getStorageSync("user_id");
    App._get('order/lists', { dataType:dataType,user_id:user_id }, function (result) {
      _this.setData({list:result.list});
    });
  },

  /**
   * 切换标签
   */
  bindHeaderTap: function (e) {
    this.setData({ dataType: e.target.dataset.type });
    // 获取订单列表
    this.getOrderList(e.target.dataset.type);
  },

  /**
   * 取消订单
   */
  cancelOrder: function (e) {
    let _this = this;
    let id = e.currentTarget.dataset.id;
    wx.showModal({
      title: "提示",
      content: "确认取消订单？",
      success: function (o) {
        if (o.confirm) {
          App._post_form('order/cancel', { id }, function (result) {
            _this.getOrderList(_this.data.dataType);
          });
        }

      }
    });
  },

  /**
   * 确认收货
   */
  receipt: function (e) {
    let _this = this;
    let id = e.currentTarget.dataset.id;
    wx.showModal({
      title: "提示",
      content: "确认收到商品？",
      success: function (o) {
        if (o.confirm) {
          App._post_form('order/updateFin', { id }, function (result) {
            _this.getOrderList(_this.data.dataType);
          });
        }
      }
    });
  },
  /**
    * 评价商品
    */
  assess: function (e) {
    let _this = this;
    let id = e.currentTarget.dataset.id;
   
    wx.showModal({
      title: "提示",
      content: "确认评价该订单？",
      success: function (o) {
        wx.navigateTo({
          url: '../order/assess?id=' + id 
        });
      }
    });
  },
  /**
   * 发起付款
   */
  payOrder: function (e) {
    let _this = this;
    let id = e.currentTarget.dataset.id;

    // 显示loading
    wx.showModal({
      title: "提示",
      content: "确认付款？",
      success: function (o) {
        if (o.confirm) {
          App._post_form('order/updatePay', { id }, function (result) {
            _this.getOrderList(_this.data.dataType);
          });
        }
      }
    });
  },

  /**
   * 跳转订单详情页
   */
  detail: function (e) {
    let id = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../order/detail?id=' + id
    });
  },
  onPullDownRefresh: function () {
    wx.stopPullDownRefresh();
  }
});