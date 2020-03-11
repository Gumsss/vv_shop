let App = getApp();
var data = new Object();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    options: {}, // 当前页面参数
    address: {}, // 默认收货地址
    exist_address: true, // 是否存在收货地址
    goods: {}, // 商品信息
    disabled: false,
    hasError: false,
    error: '',
    cart: {},
    totalMoney:'',
    alength:'',
    check : ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    // 当前页面参数
    this.data.options = options;
    console.log(options);
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {
    // 获取当前订单信息
    this.getOrderData();
  },

  /**
   * 获取当前订单信息
   */
  getOrderData: function() {
    let _this = this,
      options = _this.data.options;

    // 获取订单信息回调方法
    let callback = function(result) {
      if (result.code !== 1) {
        App.showError(result.msg);
        return false;
      }
      // 显示错误信息
      if (result.data.has_error) {
        _this.data.hasError = true;
        _this.data.error = result.data.error_msg;
        App.showError(_this.data.error);
      }
      _this.setData(result.data);
    };

    // 立即购买
    if (options.order_type === 'buyNow') {
    var   goods_num = options.goods_num;
     
      App._get('address/goods_check', {
        user_id: wx.getStorageSync("user_id"),
        goods_id: options.goods_id,
        goods_num: options.goods_num
      }, function(result) {
        var price = result.entity.counter_price;
      var totalMoney =goods_num * price;
        data.address = result.address;
        data.cart = result.entity;
        data.totalMoney = totalMoney ;
        data.goods_num = goods_num;
        data.check = '' ;
        _this.setData(data);
      });
    }

    // 购物车结算
    else if (options.order_type === 'cart') {
      App._get('address/check', {
        user_id: wx.getStorageSync("user_id")
      }, function(result) {
       data.address = result.address;
        var arr = wx.getStorageSync('cart');
        var totalMoney = wx.getStorageSync("totalMoney");
        var alength = wx.getStorageSync("alength");
        data.totalMoney = totalMoney;
        data.cart = arr;
        data.check = 1;
        _this.setData(data);
        
      });
    }

  },

  /**
   * 选择收货地址
   */
  selectAddress: function() {
    wx.navigateTo({
      url: '../address/' + (this.data.exist_address ? 'index?from=flow' : 'create')
    });
  },

  /**
   * 订单提交
   */
  submitOrder: function() {
    let _this = this,
      options = _this.data.options;

    if (_this.data.disabled) {
      return false;
    }

    if (_this.data.hasError) {
      App.showError(_this.data.error);
      return false;
    }

    // 按钮禁用, 防止二次提交
    _this.data.disabled = true;

    // 显示loading
    wx.showLoading({
      title: '正在处理...'
    });

    // 创建订单-立即购买
    if (options.order_type === 'buyNow') {
      var address = JSON.stringify(this.data.address);
      App._post('order/buyNow', {
        user_id: JSON.stringify(wx.getStorageSync("user_id")),
        cart: data.cart,
        totalMoney: data.totalMoney,
        address: address,
        goods_num:data.goods_num
      }, function(result) {
        // success
        console.log('success');
        wx.redirectTo({
          url: '../order/index?type=payment',
        });
      }, function(result) {
        // fail
        console.log('fail');
      }, function() {
        // complete
        console.log('complete');
        // 解除按钮禁用
        _this.data.disabled = false;
      });
      console.log(_this.data.address);
    }
    
    // 创建订单-购物车结算
    else if (options.order_type === 'cart') {
      var address = JSON.stringify(this.data.address);
      var cart = wx.getStorageSync("cart");
      var totalMoney = wx.getStorageSync("totalMoney") + 10;
      App._post('order/create_cart', {
        user_id : JSON.stringify(wx.getStorageSync("user_id")),
        cart: cart,
        totalMoney: totalMoney,
        address: address
      }, function(result) {
        // success
        wx.removeStorage({
          key : 'cart'
          }
        );
        wx.removeStorage({
          key: 'totalMoney'
        }
        );
        wx.redirectTo({
          url: '../order/index?type=payment',
        });
      }, function(result) {
        // fail
        console.log('fail');
      }, function() {
        // complete
        console.log('complete');
        // 解除按钮禁用
        _this.data.disabled = false;
      });
    }
  },

});