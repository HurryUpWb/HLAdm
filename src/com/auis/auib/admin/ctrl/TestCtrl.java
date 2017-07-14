package com.auis.auib.admin.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.auis.auib.cmn.Const;
import com.auis.auib.fw.ctrl.BaseController;
import com.auis.auib.fw.jfinal.anatation.RouteBind;

@RouteBind(path="admintest")
public class TestCtrl extends BaseController {
	public void testRedirect(){
		JSONObject json=this.getSessionValue(Const.KEY_SESSION);
		json.put("id", "我");
		this.getSession().setAttribute(Const.KEY_SESSION, json);
		
		this.renderJson("{\"err\":0,\"url\":\"/indexx.html\"}");
	}
	
}
