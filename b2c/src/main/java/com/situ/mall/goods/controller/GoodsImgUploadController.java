package com.situ.mall.goods.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.goods.model.GoodsImgModel;
import com.situ.mall.goods.service.IGoodsImgService;
import com.situ.until.Upload;



@Controller
@RequestMapping("/goodsImgUpload")
public class GoodsImgUploadController {
@Autowired
private IGoodsImgService userService;
	
	@ResponseBody
	@RequestMapping("/pic")
	public  Map<String, Object>  pic(HttpServletRequest request) throws ServletException, IOException {		
		 Map<String, Object> map = null;
	        try {
	            map = Upload.upload(request);
	        } catch (FileUploadException e) {
	            e.printStackTrace();
	        }
	       //得到MAP中商品编号
	        String goodsCode = map.get("code").toString();
	       //每次上传是覆盖原来的图片（上传单张时使用）
//	        GoodsImgModel dbmodel = userService.selectByCode(goodsCode);
//	        Upload.delFile(dbmodel.getUrl());

	        List<String> list = (List<String>) map.get("list");
	        String image = list.get(0);

	        GoodsImgModel model = new GoodsImgModel();
	        model.setGoodsCode(goodsCode);
	        model.setUrl(image);
	        model.setType("0");
	        userService.insert(model);
	       
	       Map<String, Object>  res = new HashMap<>();
	        res.put("code", "0");
	        res.put("data", list);
       
        return res;
        
        
    }
 
	
	
	
	
}
