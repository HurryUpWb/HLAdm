package com.auis.auib.admin.quartz;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.auis.auib.cmn.Const;
import com.auis.auib.fw.util.UUIDGenerator;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;


/**
 * 
 * ClassName: QuartzJob <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(保单任务执行类). <br/>
 * date: 2015-12-1 下午3:12:41 <br/>
 * 
 * @author wangfx
 * @version
 * @since JDK 1.6
 */
public class QuartzJob implements Job {
    	
	private Logger log=Logger.getLogger(QuartzJob.class);
	
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		log.info("月帐单数据统计导出任务开始：");
		Calendar now = Calendar.getInstance();  
	     int year = now.get(Calendar.YEAR);
	     int month = now.get(Calendar.MONTH);//上月
	     if (month == 0) {
	    	 year = year-1;
	    	 month = 12;
		 }
	     now.set(Calendar.DAY_OF_MONTH, 1);
	     now.add(Calendar.DAY_OF_MONTH, -1);
	     //上月最后一天日期
	     int day = now.get(Calendar.DAY_OF_MONTH); 
	     String nowTime = "_"+year+month;//当前年
	     String tableName = "T_SETTLEMENT_DATA"+nowTime;
	     log.info("创建月帐单月份表："+tableName);
	     String sql = "select count(*) as COUNTS from user_tables where table_name = '"+tableName+"'";
	     List<Record> list = Db.use(Const.DB_SERVICE).find(sql);
	     if (BigDecimal.valueOf(1).equals(list.get(0).getBigDecimal("COUNTS"))) {
	    	 log.info("月帐单月份表："+tableName+"已经存在:"+list.size());
		}else{
			 String createHql="create table "+tableName+"("
					  +" \nid                     VARCHAR2(32) not null,"
					  +"\ninsurance_company      VARCHAR2(255),"
					  +"\nproduct_type           VARCHAR2(255),"
					  +"\nproduct_title          VARCHAR2(255),"
					  +"\npremium                VARCHAR2(32),"
					  +"\ntotal_premium          VARCHAR2(32),"
					  +"\nagency_fee             VARCHAR2(32),"
					  +"\nairport_service_charge VARCHAR2(32),"
					  +"\ncommission_charge      VARCHAR2(32),"
					  +"\nmachine_number         VARCHAR2(32),"
					  +"\nconstraint PK_E_"+((Math.random()*9+1)*100000)+" primary key (ID))";
			int createStatus = Db.use(Const.DB_SERVICE).update(createHql);
			log.info(createHql);
			log.info("月帐单月份表创建成功:"+createStatus);
			if (createStatus == 0) {
			String startTime = year+"-"+month+"-1 00:00:00";
			String endTime = year+"-"+month+"-"+day+" 23:59:59";
			String StrWhere = " \nand to_date(a.POLICY_START_DATE,'yyyy-mm-dd HH24:MI:SS') between to_date('"+startTime+"','yyyy-mm-dd HH24:MI:SS') and to_date('"+endTime+"','yyyy-mm-dd HH24:MI:SS')";
			StringBuffer sba = new StringBuffer("select max(INSURANCE_COMPANY) as INSURANCE_COMPANY,max(b.PRODUCT_TYPE) as PRODUCT_TYPE," +
															    		"\nmax(b.PRODUCT_TITLE) as PRODUCT_TITLE,max(b.PRODUCT_PRICE) " +
															    		"\nas PRODUCT_PRICE,sum(b.PRODUCT_PRICE) as PRODUCT_FLAG,b.PROXY_RATE as PROXY_RATE,b.SERVICE_RATE as SERVICE_RATE,b.PROCEDURES_RATE as PROCEDURES_RATE,a.OFFICE_CODE as PRODUCT_INFO ");
			sba.append("\nfrom T_Main_Policy a left join T_PRODUCT_INFO b on a.PRODUCT_ID=b.PRODUCT_ID ");
			sba.append("\nwhere  a.STATE=0  and b.PRODUCT_SALES_TYPE='0'");
			sba.append(StrWhere);
			sba.append("\ngroup by a.OFFICE_CODE");
			log.info("统计月份数据：:"+sba.toString());
			List<Record> listRecord = Db.use(Const.DB_SERVICE).find(sba.toString());
			log.info("将结算数据导入月帐单表"+tableName+"中，共"+list.size()+"条数据。");
			int dateCount = 0;
			for(Record record:listRecord){
				//保险总额
				Double count = Double.valueOf(record.getStr("PRODUCT_FLAG"));
				//应收代理费费率
				Double agency_fee=Double.valueOf(record.getStr("PROXY_RATE"))/100;
				//应付机场服务费费率
				Double airport_service_charge=Double.valueOf(record.getStr("SERVICE_RATE"))/100;
				//刷卡手续费费率
				Double commission_charge=Double.valueOf(record.getStr("PROCEDURES_RATE"))/100;
				String insertHql = "insert into "+tableName+"(id,insurance_company,product_type,product_title,premium,total_premium,agency_fee" +
						",\nairport_service_charge,commission_charge,machine_number) values('"+UUIDGenerator.getUUID()+"','"+record.getStr("INSURANCE_COMPANY")+"'," +
						"\n'"+record.getStr("PRODUCT_TYPE")+"','"+record.getStr("PRODUCT_TITLE")+"','"+record.getStr("PRODUCT_PRICE")+"','"+record.getBigDecimal("PRODUCT_FLAG")+"'," +
						"\n'"+count*agency_fee+"','"+count*airport_service_charge+"','"+count*commission_charge+"','"+record.getStr("PRODUCT_INFO")+"')";
				int insertStatus = Db.use(Const.DB_SERVICE).update(insertHql);
				if (insertStatus == 1) {
					dateCount++;
				}else {
					log.info("数据插入失败："+insertHql);
				}
			}
			log.info("成功导入"+dateCount+"条数据。");
			}
			log.info("月帐单数据统计导出任务结束！");
		}
	}
}
