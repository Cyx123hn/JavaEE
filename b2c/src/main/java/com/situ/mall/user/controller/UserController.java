package com.situ.mall.user.controller;






import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.situ.mall.user.model.UserModel;
import com.situ.mall.user.service.IUserService;
import com.situ.until.MD5;



  



@Controller
@RequestMapping("/user")
public class UserController {
	


	
@Autowired
private IUserService userService;

@ResponseBody
@RequestMapping("/reg")
public Integer reg(UserModel userModel ) {		
	System.out.println("执行reg"+userModel);
		    
    return userService.insert(userModel);
	
} 
@ResponseBody
@RequestMapping("/login")
public Integer login(UserModel userModel, HttpServletRequest request) {		
	System.out.println("执行login"+userModel);
	
	if (!isOKAuthCode(request)) {
        return 0;//"登录失败，验证码错误。"
    }
	UserModel em=userService.selectByCode(userModel.getCode());	
	userModel.setPass(MD5.encode(userModel.getPass()));
	System.out.println("++++"+userModel.getPass());
	if(em==null) {
		return 1;//"登录失败，账号不存在。"
	}else if(userModel.getPass().equals(em.getPass())) {
		
		 request.getSession().setAttribute("user", em);
		 if(em.getAdmin().equals("是")) {
			 return 2;
		 }
		return 4;//登陆成功
	}else {
		 return 3;//"登录失败，密码错误。"
	}
			
}
/**
 * 验证码功能
 * @param request
 * @return
 */
    private boolean isOKAuthCode(HttpServletRequest request) {
		Object obj = request.getSession().getAttribute("authCode");
		String a1 = (String) obj;
		String a2 = request.getParameter("text1");
		return a1.equals(a2);
	}

@ResponseBody
@RequestMapping("/add")
public Integer add(UserModel userModel) {						
	
	userModel.setAdmin("否");
System.out.println("执行add"+userModel);
		    
  return userService.insert(userModel);

} 

@ResponseBody
@RequestMapping("/delete")
public Integer delete(UserModel UserModel,HttpServletRequest request ) {
   System.out.println("执行delete:"+UserModel);
   UserModel sessionUser = (UserModel) request.getSession().getAttribute("user");
   if (UserModel.getCode().equals(sessionUser.getCode())) {
       return 3;
   }
    return  userService.delete(UserModel);
}
@ResponseBody
@RequestMapping("/update")
public Integer update(UserModel UserModel,String entryTime1) {
    System.out.println("+++"+entryTime1);
	
	System.out.println("执行UPDATE"+UserModel);
    return  userService.update(UserModel);
	
}
@ResponseBody
@RequestMapping("/updatePas")
public Integer updatePas(UserModel UserModel) {
    
    return  userService.update(UserModel);
	
}



@ResponseBody
@RequestMapping("/selectByCode")
private UserModel selectByCode(UserModel UserModel) {
	System.out.println("执行selectByCode"+UserModel.getCode());
	UserModel um = userService.selectByCode(UserModel.getCode());
	System.out.println("++++++++"+um);
	return um;
}




@ResponseBody
@RequestMapping("/selectAll")
private List<UserModel> selectAll(UserModel UserModel) {
	System.out.println("+++"+UserModel);
	List<UserModel> list = userService.selectAll(UserModel);
	
	return list;
}

@ResponseBody
@RequestMapping("/selectModel")
private Map<String,Object> selectModel(UserModel UserModel) {
	UserModel.setPageOn(true);
	System.out.println("执行slectModel:"+UserModel);
	UserModel.setCode("%"+UserModel.getCode()+"%");
	UserModel.setName("%"+UserModel.getName()+"%");
	List<UserModel> list = userService.selectModel(UserModel);
	
    Map<String,Object> map=new HashMap<>();
    map.put("list", list);
   
    map.put("count", userService.selectCount(UserModel));
   
	
	
	return map;
}



@RequestMapping("/logout")
public String logout(HttpServletRequest request) {
request.getSession().removeAttribute("user");

return "redirect:/web/login.jsp";
}

@RequestMapping("/logout2")
public String logout2(HttpServletRequest request) {
request.getSession().removeAttribute("user");
return "redirect:/web/index.jsp";
}
}
