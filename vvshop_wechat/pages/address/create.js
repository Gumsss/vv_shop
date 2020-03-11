let App = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    
    disabled: false,
    user_name: '',
    region: '',
    tel_number: '',
    detail_Info: ''

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {

  },

  /**
   * 表单提交
   */
  saveData: function(e) {
    let _this = this,
    values = e.detail.value
    values.region = _this.data.region;
    values.user_id = wx.getStorageSync('user_id');
    
    // 表单验证
    if (!_this.validation(values)) {
      App.showError(_this.data.error);
      return false;
    }

    // 按钮禁用
    _this.setData({
      disabled: true
    });

    // 提交到后端
    App._post_form('address/save', values, function(result) {
      App.showSuccess(result.msg, function() {
        wx.navigateBack();
      });
    }, false, function() {
      // 解除禁用
      _this.setData({
        disabled: false
      });
    });
  },

  /**
   * 表单验证
   */
  validation: function(values) {
    if (values.user_name === '') {
      this.data.error = '收件人不能为空';
      return false;
    }
    if (values.tel_number.length < 1) {
      this.data.error = '手机号不能为空';
      return false;
    }
    if (values.tel_number.length !== 11) {
      this.data.error = '手机号长度有误';
      return false;
    }
    let reg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
    if (!reg.test(values.tel_number)) {
      this.data.error = '手机号不符合要求';
      return false;
    }
    if (!this.data.region) {
      this.data.error = '省市区不能空';
      return false;
    }
    if (values.detail_Info === '') {
      this.data.error = '详细地址不能为空';
      return false;
    }
    return true;
  },

  /**
   * 修改地区
   */
  bindRegionChange: function(e) {
    this.setData({
      region: e.detail.value
    })
  },

})