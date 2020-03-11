package com.example.demo.utils;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
    int save(T t);

    int saveDetail(T t);

    T queryByOpenId(Object id);

    void save(Map<String, Object> map);

    int updata(T t);

    int update(Object id);

    int updateFin(Object id);

    int updateAssess(Object id);

    int delete(Object id);

    int setDefault (Map req);

    List<T> queryList (Map req);

    List<T> queryAllList (Map req);

    int queryAddress_Id(Object id);

    T queryObject(Object id);

    String queryOrder_no(Object id);

    List<T> queryGoodsList();

    List<T> queryList();

    List<T> queryHotList();

    List<T> queryCategoryList(Object cate_id);

    List<T> queryListGetOrder_no(Object id);

    List<T> queryCategorySpe();

    T queryGoodsDetail(Object id);

    List<T> queryBImgList(Object id);

    List<T> queryList(Object id);

}
