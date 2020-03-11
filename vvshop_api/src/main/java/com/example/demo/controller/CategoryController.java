package com.example.demo.controller;

import com.example.demo.annotation.IgnoreAuth;
import com.example.demo.entity.CategoryVo;
import com.example.demo.entity.GoodsVo;
import com.example.demo.service.ApiCategoryService;
import com.example.demo.service.ApiCategory_detService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "分类接口")
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private ApiCategoryService apiCategoryService;
    @Autowired
    private ApiCategory_detService apiCategory_detService;

    /**
     * 一级菜单栏目
     */
    @ApiOperation(value = "一级菜单")
    @IgnoreAuth
    @ApiImplicitParams({@ApiImplicitParam(name = "category_id", value = "种类id", paramType = "path", required = true)})
    @GetMapping(value = "detail")
    public Object Category(Integer category_id) {

        Map resultObj = new HashMap();
        List<GoodsVo> category = apiCategory_detService.queryCategoryList(category_id);
        if (null != category ) {
            resultObj.put("status", 1);
            resultObj.put("msg", "解密成功");}
            resultObj.put("category", category);
        return resultObj;
    }

    /**
     * 点击一级菜单显示出二级分类
     */
    @ApiOperation(value = "二级分类")
    @IgnoreAuth
    @GetMapping(value = "spe")
    public Object spe() {
        Map resultObj = new HashMap();
        List<CategoryVo> spe = apiCategoryService.queryCategorySpe();
        if (null != spe ) {
            resultObj.put("status", 1);
            resultObj.put("msg", "解密成功");}
            resultObj.put("spe", spe);
        return resultObj;
    }
}
