package com.situ.mall.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.goods.model.GoodsImgModel;
import com.situ.mall.goods.service.IGoodsImgService;
import com.situ.until.Upload;



@Controller
@RequestMapping("/goodsImg")
public class GoodsImgController {
	@Autowired
	private IGoodsImgService userService;
	
	
	@ResponseBody
	@RequestMapping("/add")
	public int add(GoodsImgModel GoodsImgModel,String entryTime1) {						

	System.out.println("执行add"+GoodsImgModel);
			    
	  return userService.insert(GoodsImgModel);

	} 
	
	
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(GoodsImgModel GoodsImgModel, Model model) {
	   System.out.println("执行delete:"+GoodsImgModel);
		
	    return  userService.delete(GoodsImgModel);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public int update(GoodsImgModel GoodsImgModel) {			
		System.out.println("执行UPDATE"+GoodsImgModel);
	    return  userService.update(GoodsImgModel);
		
	}
	
	@ResponseBody
	@RequestMapping("/selectByCode")
	private GoodsImgModel selectByCode(GoodsImgModel GoodsImgModel) {
		System.out.println("执行selectByCode"+GoodsImgModel.getGoodsCode());
		GoodsImgModel um = userService.selectByCode(GoodsImgModel.getGoodsCode());
		System.out.println("++++++++"+um);
		return um;
	}
	
	@ResponseBody
	@RequestMapping("/selectAll")
	private List<GoodsImgModel> selectAll(GoodsImgModel GoodsImgModel) {
		System.out.println("+++"+GoodsImgModel);
		List<GoodsImgModel> list = userService.selectAll(GoodsImgModel);
		
		return list;
	}

	@ResponseBody
	@RequestMapping("/selectModel")
	private Map<String,Object> selectModel(GoodsImgModel GoodsImgModel) {
		GoodsImgModel.setPageOn(true);
		System.out.println("执行slectModel:"+GoodsImgModel);
		GoodsImgModel.setGoodsCode("%"+GoodsImgModel.getGoodsCode()+"%");
		
		
		List<GoodsImgModel> list = userService.selectModel(GoodsImgModel);
		
	    Map<String,Object> map=new HashMap<>();
	    map.put("list", list);
	   
	    map.put("count", userService.selectCount(GoodsImgModel));
	   
		
		
		return map;
	}

	@ResponseBody
	@RequestMapping("/getPic")
	 public List<GoodsImgModel> getEmployee(GoodsImgModel GoodsImgModel,String goodsCode) {
		
			System.out.println("执行selectByCode"+goodsCode);
			List<GoodsImgModel> list = userService.selectModel(GoodsImgModel);
			System.out.println("++++++++"+list);
	        return list;
	    }
	
	@ResponseBody
	@RequestMapping("/delPic")
	public Integer delPic(GoodsImgModel GoodsImgModel,HttpServletRequest request) {
		    System.out.println("执行delPic:"+GoodsImgModel);         
            Integer id=  GoodsImgModel.getId();
		    GoodsImgModel dbmodel = userService.selectById(id);
	        String image = dbmodel.getUrl();
	        Upload.delFile(image);
	        dbmodel.setUrl("");
//	        GoodsImgModel modelSession = (GoodsImgModel) request.getSession().getAttribute("user");
//	        if (modelSession.getId().equals(id)) {
//	            request.getSession().setAttribute("user", dbmodel);
//	        }
	        GoodsImgModel.setUrl("");
	        return userService.delete(GoodsImgModel);
		}
	
	
}
