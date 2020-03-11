let App = getApp(),
  wxParse = require("../../wxParse/wxParse.js");
var data = new Object();
Page({

  /**
   * 页面的初始数据
   */
  data: {

    indicatorDots: true, // 是否显示面板指示点
    autoplay: true, // 是否自动切换
    interval: 3000, // 自动切换时间间隔
    duration: 800, // 滑动动画时长
    currentIndex: 1, // 轮播图指针
    floorstatus: false, // 返回顶部
    showView: true, // 显示商品规格
    goods_detail: {}, // 商品详情信息
    bimg:{},
    assess:{},
    goods_price: 0, // 商品价格
    stock_num: 0, // 库存数量
    goods_num: 1, // 商品数量
    cart_total_num: 0, // 购物车商品总数量
    isLogin: false

  },

  // 记录规格的数组
  goods_spec_arr: [],

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    let _this = this;
    // 商品id
    _this.data.goods_id = options.goods_id;
    // 获取商品信息
    _this.getGoodsDetail();
  },

  /**
   * 获取商品信息
   */
  getGoodsDetail() {
    let _this = this;
    App._get('GoodsDetail/detail', {
      goods_id: _this.data.goods_id
    }, function(result) {
      // 初始化商品详情数据
      data.goods_detail = result.goods_detail;
      data.bimg = result.BImg;
      if (result.AssessVo.A !=null){
      data.assess = result.AssessVo.A;}
      else{
        data.assess = null;
      }
      _this.setData(data);
    });
  },

  /**
   * 初始化商品详情数据
   */
  
  initGoodsDetailData(data) {
    let _this = this;
    data.counter_price = data.detail.spec[0].counter_price;
    data.sales_actual = data.detail.spec[0].sales_actual;
    data.stock_num = data.detail.spec[0].stock_num;

    return data;
  },

  /**
   * 设置轮播图当前指针 数字
   */
  setCurrent(e) {
    this.setData({
      currentIndex: e.detail.current + 1
    });
  },

  /**
   * 控制商品规格/数量的显示隐藏
   */
  onChangeShowState() {
    this.setData({
      showView: !this.data.showView
    });
  },

  /**
   * 返回顶部
   */
  goTop(t) {
    this.setData({
      scrollTop: 0
    });
  },

  /**
   * 显示/隐藏 返回顶部按钮
   */
  scroll(e) {
    this.setData({
      floorstatus: e.detail.scrollTop > 200
    })
  },

  /**
   * 增加商品数量
   */
  up() {
    this.setData({
      goods_num: ++this.data.goods_num
    })
  },

  /**
   * 减少商品数量
   */
  down() {
    if (this.data.goods_num > 1) {
      this.setData({
        goods_num: --this.data.goods_num
      });
    }
  },

  /**
   * 跳转购物车页面
   */
  flowCart: function () {
    wx.switchTab({
      url: "../flow/index"
    });
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
    }
  },

  /**
    * 验证是否已登录
    */
  onCheckLogin() {
    let _this = this;
    if (!_this.data.isLogin) {
      App.showError('很抱歉，您还没有登录');
      return false;
    }
    return true;
  },
  /**
   * 加入购物车and立即购买
   */
  submit(e) {
    let _this = this,
      submitType = e.currentTarget.dataset.type;
    if (!_this.onCheckLogin()) {
      return false;
    }
    if (submitType === 'buyNow') {
      // 立即购买
      wx.navigateTo({
        url: '../flow/checkout?' + App.urlEncode({
          order_type: 'buyNow',
          goods_id: _this.data.goods_id,
          goods_num: _this.data.goods_num
        })
        
      });
     
    } else if (submitType === 'addCart') {
      // 加入购物车
        var goods_detail = _this.data.goods_detail;
      _this.setData({ 
        ['goods_detail.count']: _this.data.goods_num
         })
      goods_detail.goods_id = _this.data.goods_id;
      
        // 获取购物车的缓存数组（没有数据，则赋予一个空数组）  
        var arr = wx.getStorageSync('cart') || [];
        if (arr.length > 0) {
          // 遍历购物车数组  
          for (var j in arr) {
            // 判断购物车内的item的id，和事件传递过来的id，是否相等  
            if (arr[j].goods_id == _this.data.goods_id) {
              // 相等的话，给count+1（即再次添加入购物车，数量+1）  
              arr[j].count = arr[j].count + _this.data.goods_num;
              // 最后，把购物车数据，存放入缓存（此处不用再给购物车数组push元素进去，因为这个是购物车有的，直接更新当前数组即可）  
              try {
                wx.setStorageSync('cart', arr)
              } catch (e) {
                console.log(e)
              }
            
              wx.showToast({
                title: '加入购物车成功！',
                icon: 'success',
                duration: 2000
              });
 
              return;
            }
          }
      
          arr.push(goods_detail);
        } else {
          arr.push(goods_detail);
        }
        // 最后，把购物车数据，存放入缓存  
        try {
          wx.setStorageSync('cart', arr)
         
          wx.showToast({
            title: '加入购物车成功！',
            icon: 'success',
            duration: 2000
          });
        
          return;
        } catch (e) {
          console.log(e)
      }
    } 
  },

  /**
   * 分享当前页面
   */
  onShareAppMessage: function() {
    // 构建页面参数
    let _this = this;
    return {
      title: _this.data.detail.goods_name,
      path: "/pages/goods/index?goods_id=" + _this.data.goods_id
    };
  },
  

})