package com.situ.util;

import javax.mail.MessagingException;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import tool.FmtMail;


public class Job3 implements Job {

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        JobDetail detail = context.getJobDetail();
        JobDataMap jobData = detail.getJobDataMap();
        
    	String from = "1060074099@qq.com";// 发件人
        String pass = "xwaqeuyegxjhbbda";
        String hostSend = "smtp.qq.com";//发送邮件服务器
        String portSend = "587"; //发送邮件服务器端口号
        String []to = { (String)jobData.get("email")};
        FmtMail ms = new FmtMail(to, from, pass, hostSend, portSend);
        try {
			ms.send((String)jobData.get("title"), (String)jobData.get("content"));
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

}
