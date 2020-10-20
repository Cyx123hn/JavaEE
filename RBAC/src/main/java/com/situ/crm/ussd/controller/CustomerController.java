package com.situ.crm.ussd.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.situ.crm.ussd.model.CustomerModel;
import com.situ.util.Job3;

import tool.FmtEmpty;
import tool.FmtScheduler;
import tool.FormatPOI;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@Autowired
	private ICommonService<CustomerModel> customerService;
	
	@RequestMapping("toCustomer")
	public String toCustomer() {
		return "/ussd/customer/customer";
	}
	
	@RequestMapping("add")
	public String add(Model model,String code) {
		CustomerModel model2 =new CustomerModel();
		if(!FmtEmpty.isEmpty(code)) { //code不为空则回显
		  model2.setCode(code);
		  model.addAttribute("model",customerService.selectModel(model2));
		 }
		return "/ussd/customer/add";
	}
	
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(CustomerModel model2,Integer id,Model model) {
		System.out.println(id);
		if(FmtEmpty.isEmpty(id)) {
			return customerService.insertByUQCode(model2);
		}
		else {
			return customerService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String delete(CustomerModel model) {
		return customerService.delete(model)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(CustomerModel model,Integer pageIndex,Integer pageLimit) {
		model.setCode("%"+model.getCode()+"%");
		model.setName("%"+model.getName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<CustomerModel> list = customerService.selectList(model);
		int count = customerService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
	
	@RequestMapping("toEmail")
	public String toEmail(String email,Model model) {
		model.addAttribute("mail", email);
		return "/ussd/customer/email";
	}
	
	@ResponseBody
	@RequestMapping("email")
	public String email(String email,String title,String content,Timestamp time) throws MessagingException {
		Map<String, Object> map =new HashMap<>();
		map.put("email", email);
		map.put("title", title);
		map.put("content", content);
		System.out.println(time);
		System.out.println(title);
		FmtScheduler fmt =FmtScheduler.getInit(Job3.class,map);
		SimpleDateFormat sdf =new SimpleDateFormat("ss mm HH dd MM ? yyyy");
		if(!FmtEmpty.isEmpty(time)) {
			fmt.startCronTrigger(sdf.format(time));
			 return "1";
		}
		return "2";
       
	}
	
	@RequestMapping(value="exportExcel")
	public void  exportExcel(HttpServletResponse response) throws Exception{
		List<CustomerModel> dataList =customerService.selectList(new CustomerModel());
		List<String> propList =Arrays.asList("id","code","name","status","email");
		List<String> fieldName =Arrays.asList("id","账号","姓名","身份","邮箱");
		
		Workbook wb =FormatPOI.exportExcel(dataList, propList, fieldName);
		
		//设置响应的头文件
		response.setContentType("multipart/form-data");
		
		//设置
		response.setHeader("Content-Disposition", "attachment;filename=customer.xls");
		
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
				result.put("data", parse(file.getInputStream()));
				
			}
		}
		return new JSONObject(result).toString();
	}
	private List<CustomerModel> parse(InputStream fis) throws IOException{
		XSSFWorkbook workbook =new XSSFWorkbook(fis);
		//得到工作表
		XSSFSheet sheet =workbook.getSheet("list");
		List<CustomerModel> list =new ArrayList<>();
		for(Row row : sheet) {
			if(0 == row.getRowNum()) {
				continue;
			}
			CustomerModel model =new CustomerModel();
			model.setCode(getValue(row.getCell(0)));
			model.setName(getValue(row.getCell(1)));
			model.setStatus(getValue(row.getCell(2)));
			model.setEmail(getValue(row.getCell(3)));
			list.add(model);
			reg(model);
		}
		workbook.close();
		fis.close();
		return list;
	}
	public void reg(CustomerModel model) {
		customerService.insertByUQCode(model);
	}
	private String getValue(Cell cell) {
		CellType type =cell.getCellTypeEnum();
		if(CellType.STRING.equals(type)) {
			return cell.getStringCellValue();
		}else if(CellType.NUMERIC.equals(type)) {
			NumberFormat nf = NumberFormat.getInstance();
			return nf.format(cell.getNumericCellValue());
		}
		return null;
	}
}
