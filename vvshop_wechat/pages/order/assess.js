let App = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    default_score: 0,
    score: 0,
    score_text_arr: ['非常差', '差', '一般', '好', '非常好'],
    score_text: "",
    score_img_arr: [],
    is_upload: false,
    time: null,
    text: ""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this._default_score(this.data.default_score);

  },
  //初始化星的数量
  _default_score: function (tauch_score = 0) {
    var score_img = [];
    var score = 0;
    for (let i = 0; i < 5; i++) {
      if (i < tauch_score) {
        score_img[i] = "/images/star_on.png"
        score = i;
      } else {
        score_img[i] = "/images/star_off.png"
      }
    }

    this.setData({
      score_img_arr: score_img,
      score_text: this.data.score_text_arr[score]
    });
  },

  onScore: function (e) {
    var score = e.currentTarget.dataset.score;
    this._default_score(score);
    this.setData({
      score: score
    })
  },
 

  //上传评论
  onSubmit: function (e) {
    wx.showLoading({
      title: '上传中',
    })
    var id = this.options.id;
    var score = this.data.score;
    var text = e.detail.value.text;
    //添加评论
    App._post('assess/post', {
      user_id: JSON.stringify(wx.getStorageSync("user_id")),
      id: id,
      text: text,
      score: score
    }, function (result) {
      wx.navigateBack({
      });  
    }
    );
  },
  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  },
})

