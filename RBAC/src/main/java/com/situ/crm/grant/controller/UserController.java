package com.situ.crm.grant.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.situ.base.service.ICommonService;
import com.situ.crm.grant.model.MenuModel;
import com.situ.crm.grant.model.RelModel;
import com.situ.crm.grant.model.RoleModel;
import com.situ.crm.grant.model.UserModel;
import com.situ.crm.grant.service.MenuServiceImpl;
import com.situ.crm.grant.service.RelServiceImpl;
import com.situ.crm.grant.service.RoleServiceImpl;

import tool.FmtEmpty;
import tool.FormatPOI;
import tool.MD5;
import tool.VerificationCode;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private ICommonService<UserModel> iUserService;
	
	@Autowired
	private RelServiceImpl relService;
	
	@Autowired
	private RoleServiceImpl roleService;
	
	@Autowired
	private MenuServiceImpl menuService;
	
	@RequestMapping("toLogin")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping("toUser")
	public String toUser() {
		return "/grant/user/user";
	}
	
	@RequestMapping("add")
	public String add(Model model,String code1){
		 RoleModel model3 =new RoleModel();
		 model.addAttribute("list2",roleService.selectList(model3));
		 UserModel model2 =new UserModel();
		 model.addAttribute("list",iUserService.selectList(model2));
		 if(!FmtEmpty.isEmpty(code1)) {
			 model2.setCode(code1);
			 model.addAttribute("model", iUserService.selectModel(model2));
		 }
		 return "/grant/user/add";
	}
	
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(UserModel model2,String id) {
		System.err.println("+++++++++++"+id);
		if(FmtEmpty.isEmpty(id)) {
			model2.setUserPass(MD5.encode("123456"));//初始密码为123456
			return iUserService.insertByUQCode(model2);
		}
		else {
			return iUserService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("del")
	public String del(UserModel model,HttpServletRequest request) {
		UserModel model2 =(UserModel)request.getSession().getAttribute("user");
		if(model.getCode().equals(model2.getCode())) {
			return "3"; //当前账号使用
		}
		return iUserService.delete(model)+"";
	}
	@RequestMapping("login")
	public String login(UserModel userModel,HttpSession session,HttpServletRequest request,Model model,String vercode) {
		UserModel model1 =iUserService.selectModel(userModel);
		String message;
		String view;
		Object authCode = request.getSession().getAttribute("authCode");
		System.out.println(authCode+"--------------"+vercode);
		if(FmtEmpty.isEmpty(model1)) {
			message ="账号不存在";
			view ="login";
		}else if (!vercode.equals(authCode)) {
			message ="验证码错误";
			view ="login";
			
		}else if(model1.getUserPass().equals(MD5.encode(userModel.getUserPass()))) {
			view ="main";
			session.setAttribute("user", model1);
			model.addAttribute("menu",getMenu(model1));
			message ="登录成功";
		}
		else {
			message="密码错误";
			view ="login";
		}
		model.addAttribute("message",message);
		System.out.println(view);
		return view;
	}
	
	
	public void reg(UserModel model) {
		iUserService.insertByUQCode(model);
	}
	
	private List<MenuModel> getMenu(UserModel model){
		String roleCode= model.getRoleCode();
		if(FmtEmpty.isEmpty(roleCode)) {
			return null;
		}
		RelModel model2 =new RelModel();
		model2.setRoleCode(roleCode);
		List<RelModel> list =relService.selectList(model2);
		if(FmtEmpty.isEmpty(list)) {
			return null;
		}
		List<MenuModel> result =new ArrayList<>();
		for(RelModel rel :list) {
			MenuModel menuModel =new MenuModel();
			menuModel.setCode(rel.getMenuCode());
			menuModel=menuService.selectModel(menuModel);
			String parentCode =menuModel.getParentCode();
			if(FmtEmpty.isEmpty(parentCode) || "menu0".equals(parentCode)) {
				result.add(menuModel);//存入一级菜单
				continue;
			}
			for(MenuModel m:result) {
				if(m.getCode().equals(parentCode)) {
					m.getChild().add(menuModel);//child存入二级菜单
					break;
				}
			}
		}
		return result;
	}
	
	@RequestMapping("/code")
	public void code(HttpServletRequest request, HttpServletResponse response) throws IOException {
		VerificationCode.code(request, response);
	}
	
	@RequestMapping("toUpdPass")
	public String toupd() {
		return "/grant/user/updPass";
	}
	
	@ResponseBody
	@RequestMapping("/updpass")
	public String updPass(String code,String password,String password1,String password2) {
		UserModel model =new UserModel();
		model.setCode(code);
		System.out.println(model);
		System.out.println(code);
		String pass =iUserService.selectModel(model).getUserPass();//获取密码
		System.out.println(pass);
		if(!MD5.encode(password).equals(pass)) {
			return "2";
		}
		if(!password1.equals(password2)) {
			return "3";
		}
		model.setUserPass(MD5.encode(password1));
		return iUserService.update(model)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(UserModel model,Integer pageIndex,Integer pageLimit,HttpServletRequest request) {
		model.setPageOn(true);
		System.out.println(model);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		UserModel userModel =(UserModel)request.getSession().getAttribute("user");
		String roleCode =userModel.getRoleCode();
		if(roleCode.equals("role2")) {
			model.setRoleCode("role3");
			map.put("data", iUserService.selectList(model));
		}else {
			map.put("data", iUserService.selectList(model));
		}
		int count = iUserService.selectCount(model);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
	
	@RequestMapping(value="exportExcel")
	public void exportExcel(HttpServletResponse response) throws Exception{
		List<UserModel> list =iUserService.selectList(new UserModel());
		List<UserModel> dataList =new ArrayList<>();
		for(int i=1;i<list.size();i++) {
			dataList.add(new UserModel(list.get(i).getCode(),list.get(i).getName(),list.get(i).getUserPass(),list.get(i).getRoleName(),list.get(i).getParentName()));
		}
		List<String> propList =Arrays.asList("code","name","userPass","roleName","parentName");
		List<String> fieldName =Arrays.asList("账号","姓名","密码","角色","领导");
		
		Workbook wb =FormatPOI.exportExcel(dataList, propList, fieldName);
		
		//设置响应的头文件
		response.setContentType("multipart/form-data");
		
		//设置
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		
		OutputStream out =response.getOutputStream();
		wb.write(out);
		wb.close();
		out.close();
		
		
	}
	@ResponseBody
	@RequestMapping(value="uploadExcel")
	public String uploadExcel(CommonsMultipartResolver multipartResolver,HttpServletRequest request) throws IOException {
		Map<String, Object> result =new HashMap<>();
		result.put("code", "0");
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest servletRequest =(MultipartHttpServletRequest) request;
			Iterator<String> iter =servletRequest.getFileNames();
			while(iter.hasNext()) {
				MultipartFile file =servletRequest.getFile(iter.next().toString());
				System.out.println(file.getInputStream());
				result.put("data", parse(file.getInputStream()));
				
			}
		}
		return new JSONObject(result).toString();
	}
	private List<UserModel> parse(InputStream fis) throws IOException{
		XSSFWorkbook workbook =new XSSFWorkbook(fis);
		System.err.println(workbook);
		//得到工作表
		XSSFSheet sheet =workbook.getSheet("list");
		System.out.println(sheet);
		List<UserModel> list =new ArrayList<>();
		for(Row row : sheet) {
			if(0 == row.getRowNum()) {
				continue;
			}
			UserModel model =new UserModel();
			model.setCode(getValue(row.getCell(0)));
			model.setName(getValue(row.getCell(1)));
			model.setUserPass(getValue(row.getCell(2)));
			
			list.add(model);
			reg(model);
		}
		workbook.close();
		fis.close();
		return list;
	}
	
	private String getValue(Cell cell) {
		CellType type =cell.getCellTypeEnum();
		if(CellType.STRING.equals(type)) {
			return cell.getStringCellValue();
		}else if(CellType.NUMERIC.equals(type)) {
			return Double.valueOf(cell.getNumericCellValue()).longValue()+"";
		}
		return null;
	}
}
