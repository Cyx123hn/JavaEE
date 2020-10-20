package com.situ.util;


import javax.mail.MessagingException;

import tool.FmtMail;

public class Job1 {
	public void exe() throws MessagingException {
		 String[] to = { "1060074099@qq.com" };// 收件人
	        String from = "1060074099@qq.com";// 发件人
	        String pass = "xwaqeuyegxjhbbda";
	        String hostSend = "smtp.qq.com";//发送邮件服务器
	        String portSend = "587"; //发送邮件服务器端口号
	        FmtMail ms = new FmtMail(to, from, pass, hostSend, portSend);
	        ms.send("AAA", "BBB");
	}
}
