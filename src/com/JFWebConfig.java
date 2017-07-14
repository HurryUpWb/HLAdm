package com;

import org.apache.log4j.Logger;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.util.JdbcConstants;
import com.alibaba.druid.wall.WallFilter;
import com.auis.auib.admin.quartz.QuartzJob;
import com.auis.auib.admin.quartz.QuartzManager;
import com.auis.auib.cmn.Const;
import com.auis.auib.fw.jfinal.ServletHandler;
import com.auis.auib.fw.jfinal.plugin.AutoTableBindPlugin;
import com.auis.auib.fw.jfinal.plugin.OrderContainerFactory;
import com.auis.auib.fw.jfinal.plugin.RoutesUtil;
import com.auis.auib.fw.jfinal.plugin.TableNameStyle;
import com.auis.auib.fw.util.PropertiesContent;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.ext.handler.FakeStaticHandler;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.druid.DruidStatViewHandler;
import com.jfinal.render.ViewType;


public class JFWebConfig extends JFinalConfig {
	private Logger log=Logger.getLogger(getClass());
	public static DruidPlugin druidPlugin;
	/**
	 * 配置常量O
	 */
	@Override
	public void configConstant(Constants me){
		
		me.setDevMode(PropertiesContent.getToBool("jfinal.devmode",false));
		System.out.println("setDevMode:"+ me.getDevMode());
		me.setViewType(ViewType.OTHER);

		me.setUploadedFileSaveDirectory(PathKit.getWebRootPath() +"/upload");
		me.setMaxPostSize(PropertiesContent.getToInteger("jfinal.maxpostsize",104857600));//100mb
	}
	
	@Override
	public void configRoute(Routes me) {
		RoutesUtil.add(me);
	}

	@Override
	public void configPlugin(Plugins me) {
		
		// 配置数据库连接池插件
		druidPlugin = new DruidPlugin(PropertiesContent.get("jdbc.oracle.url"),
									  PropertiesContent.get("jdbc.oracle.username"),
									  PropertiesContent.get("jdbc.oracle.password"),
									  PropertiesContent.get("jdbc.oracle.driverClassName")); 
		druidPlugin.set(3, 3, 3);
		druidPlugin.addFilter(new StatFilter());
		druidPlugin.setValidationQuery("select 1 FROM DUAL");  
		WallFilter wall = new WallFilter();
	    //设计数据库类型
	    wall.setDbType(JdbcConstants.ORACLE); 
	    druidPlugin.addFilter(wall); 

	    me.add(druidPlugin);

		//添加自动绑定model与表插件
	    AutoTableBindPlugin autoTableBindPlugin = new AutoTableBindPlugin(Const.DB_SERVICE,druidPlugin, TableNameStyle.UP);
		autoTableBindPlugin.setShowSql(true);
		autoTableBindPlugin.setDialect(new OracleDialect());
		autoTableBindPlugin.setContainerFactory(new OrderContainerFactory());	
		me.add(autoTableBindPlugin);
	}

	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new AccessInterceptor());//权限控制
		
		//PermissionInterceptor.addExcludedActionKey("/svr/Account/loginApp");
	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new ServletHandler());//添加处理Servlet的handler
		DruidStatViewHandler dvh =  new DruidStatViewHandler("/druid");
	    me.add(dvh);
	  //该处理器将request.getContextPath()存储在root中，可以解决路径问题
	  	ContextPathHandler path = new ContextPathHandler("root");
	  	me.add(path);

	  	me.add(new FakeStaticHandler(".json"));//通过.json后缀访问后台链接
	  	
	}
	
	@Override
	public void afterJFinalStart(){
//		String jobName = "结算数据月帐单";
//		QuartzManager.addJob(jobName, QuartzJob.class, "0 10 0 1 * ?");//0 10 0 1 * ?每月1号零晨0点10分执行任务
//		String DrawBackName="微信退款";
//		QuartzManager.addJob(DrawBackName, DrawBackJob.class, "0/10 * * * * ?"); //10s 执行一次
	}
}

