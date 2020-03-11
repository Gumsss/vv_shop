let App = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    goods_list: [], // 商品列表
    order_total_num: 0,
    order_total_price: 0,
    item: [],
    iscart: false,
    hidden: null,
    isAllSelect: false,
    totalMoney: 0
    
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    let _this = this;
    _this.setData({
      isLogin: App.checkIsLogin()
    });
    if (_this.data.isLogin) {
      // 获取购物车列表
      _this.getCartList();
      _this.priceCount();
    }
  },

  /**
   * 获取购物车列表
   */
  getCartList() {
   
    var arr = wx.getStorageSync('cart') || [];
    if (arr.length > 0) {
      // 更新数据 
      this.priceCount();  
      this.setData({
        goods_list: arr,
        iscart: true,
        hidden: false
      });
      
    } else {
      this.setData({
        iscart: false,
        hidden: true,
        goods_list: ""
      });
    }

    
  },

  /**
   * 递增指定的商品数量
   */
  addCount(e) {
    let _this = this,
      index = e.currentTarget.dataset.index,
      goodsSkuId = e.currentTarget.dataset.skuId,
      goods = _this.data.goods_list[index],
      order_total_price = _this.data.order_total_price;
    var count = _this.data.goods_list[index].count;    // 商品总数量+1  
    if (count < 10) {
      _this.data.goods_list[index].count++;
    }
    // 将数值与状态写回  
    _this.setData({
      goods_list: _this.data.goods_list
    });   
    _this.priceCount(); 
    wx.setStorageSync('cart', _this.data.goods_list)
  },

  /**
   * 递减指定的商品数量
   */
  minusCount(e) {
    let _this = this,
      index = e.currentTarget.dataset.index,
     count = _this.data.goods_list[index].count,
      goodsSkuId = e.currentTarget.dataset.skuId,
      goods = _this.data.goods_list[index],
      order_total_price = _this.data.order_total_price;
    if (count > 1) {
      _this.data.goods_list[index].count--;
    }  
    _this.setData({
      goods_list: _this.data.goods_list
    });
    _this.priceCount(); 
  },
  
  priceCount: function (e) {
    this.data.totalMoney = 0;
    for (var i = 0; i < this.data.goods_list.length; i++) {
        this.data.totalMoney = this.data.totalMoney + (this.data.goods_list[i].counter_price * this.data.goods_list[i].count);
    }
    this.setData({
      totalMoney: this.data.totalMoney,
    })
    wx.setStorageSync('totalMoney', this.data.totalMoney);
  },
  /**
   * 删除商品
   */
  del(e) {
    this.data.goods_list.splice(e.target.id.substring(3), 1);    // 更新data数据对象  
    if (this.data.goods_list.length > 0) {
      this.setData({
        goods_list: this.data.goods_list
      })
      wx.setStorageSync('cart', this.data.goods_list);
      this.priceCount();
    } else {
      this.setData({
        goods_list: this.data.goods_list,
        iscart: false,
        hidden: true,
      })
      wx.setStorageSync('cart', []);
    }
   
  },

  /**
   * 购物车结算
   */
  submit(t) {
    wx.navigateTo({
      url: '../flow/checkout?order_type=cart'
    });
  },

  /**
   * 加法
   */
  mathadd(arg1, arg2) {
    return (Number(arg1) + Number(arg2)).toFixed(2);
  },

  /**
   * 减法
   */
  mathsub(arg1, arg2) {
    return (Number(arg1) - Number(arg2)).toFixed(2);
  },

  /**
   * 去购物
   */
  goShopping() {
    wx.switchTab({
      url: '../index/index',
    });
  },

})