//package com.situ.util;
//
//import java.util.Arrays;
//
//import org.quartz.CronScheduleBuilder;
//import org.quartz.JobBuilder;
//import org.quartz.JobDataMap;
//import org.quartz.JobDetail;
//import org.quartz.Scheduler;
//import org.quartz.SimpleScheduleBuilder;
//import org.quartz.Trigger;
//import org.quartz.TriggerBuilder;
//import org.quartz.impl.StdSchedulerFactory;
//
//public class Job4 {
//	public static void main(String[] args) throws Exception{
//		JobBuilder jobB = JobBuilder.newJob();
//		JobDataMap jobData =new JobDataMap();
//		jobData.put("list", Arrays.asList("aa","bbb","cc"));
//		jobB.usingJobData(jobData);
//		JobDetail job =jobB.build();
//		
//		
//		TriggerBuilder<Trigger> tgrB =TriggerBuilder.newTrigger();
//		tgrB.withSchedule(SimpleScheduleBuilder.repeatSecondlyForever(3));
////		tgrB.withSchedule(CronScheduleBuilder.cronSchedule("0/5 * * * * ?"));
//		Trigger trigger =tgrB.build();
//		
//		Scheduler scheduler =StdSchedulerFactory.getDefaultScheduler();
//		scheduler.scheduleJob(job,trigger);
//		scheduler.start();
//		
//		
//	}
//}
