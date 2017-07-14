
/************************嗨悠游后台管理相关js start**********************/
/**
 * 登录
 */
var pointData;
var myDate = new Date();
var START_TIME = "";
var END_TIME = "";


function login() {
	// 用户名
	var userName = document.getElementById("userName").value;
	// 密码
	var passWord = document.getElementById("passWord").value;

	if (userName == '') {
		loginText.innerHTML = "请输入用户名！";
		return false;
	}
	if (passWord == '') {
		loginText.innerHTML = "请输入密码！";
		return false;
	}
	document.getElementById("loginForm").submit();
}

function out(){
    location.href = "/Admin/admin/adminUserLogin/loginOut.json";
}
/**
 * 字符拼接
 */
function StringBuffer() {
	this.__strings__ = [];
};
StringBuffer.prototype.append = function(str) {
	this.__strings__.push(str);
};
StringBuffer.prototype.toString = function() {
	return this.__strings__.join('');
};
/**
 * 集分宝查询
 */
function SearchPoint() {
	$("#current_func").text("集分宝查询");
	callSvr("adminPoint/SearchPoint",$("#timePoint").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
				var table = new StringBuffer();
				table.append("<div class=\"container\"><div id=\"button\" class=\"mt10\"><form id=\"timePoint\" name=\"timePoint\"><input type=\"button\"  onclick=\"AutomateExcel('1');return false;\" name=\"button\" class=\"btn btn82 btn_export\" value=\"导出\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开始时间：&nbsp;&nbsp;<input type=\"text\"  name=\"START_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间：&nbsp;&nbsp;<input type=\"text\" name=\"END_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\"  onclick=\"SearchPoint()\" name=\"button\" class=\"btn btn82 btn_search\" value=\"查询\"></form>");
				table.append("</div><div id=\"search_bar\" class=\"mt10\"></div><div id=\"table\" class=\"mt10\"><div id=\"tableDiv\">");
				table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
				table.append("<tr><th width='15%'>ID</th><th width='15%'>支付宝账号</th><th width='15%'>支付宝账户开户姓名</th>");
				table.append("<th width='15%'>支付宝预留手机号</th><th width='15%'>每次签到获得集分宝</th><th width='15%'>签到时间</th></tr>");
				if (data != null && typeof (data) != "undefined") {
					pointData = data;
					for (var i = 0; i < data.length; i++) {
						table.append("<tr><tD>");
						table.append(data[i].ID);
						table.append("</td><tD>");
						table.append(data[i].ALIPAY_NO);
						table.append("</td><tD>");
						table.append(data[i].ALIPAY_ACCOUNT_NAME);
						table.append("</td><tD>");
						table.append(data[i].ALIPAY_MOBILE_NO);
						table.append("</td><tD>");
						table.append(data[i].POINT);
						table.append("/分</td><tD>");
						table.append(data[i].SIGN_TIME);
						table.append("</tr>");
						if(i==9){
							break;
						}
					}
					table.append("</table>");
					table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
					table.append("<li class=\"disabled\"><span>首页</span></li>");
					table.append("<li class=\"disabled\"><span>上一页</span></li>");
					if(data.length<10 || data.length==10){
						 table.append("<li class=\"disabled\"><span>下一页</span></li>"); 
					}else{
						 table.append("<li><a href=\"#\" onclick=\"flip(1)\">下一页</a></li>"); 
					}
		            table.append("<li class=\"disabled\"><span>第1页</span></li>");
		            table.append("<li class=\"disabled\"><span>共"+pointData.length+"条记录</span></li></ul></div></div>");
		            table.append("</div></div></div>");
		            var tableHTML = table.toString();
					document.getElementById("main").innerHTML = tableHTML;
				}
		}
});
}
/**
 * 翻页操作
 */
function flip(page){
	var table = new StringBuffer();
	table.append("<div class=\"container\"><div id=\"button\" class=\"mt10\"><form id=\"timePoint\" name=\"timePoint\"><input type=\"button\"  onclick=\"AutomateExcel('1');\" name=\"button\" class=\"btn btn82 btn_export\" value=\"导出\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开始时间：&nbsp;&nbsp;<input type=\"text\"  name=\"START_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间：&nbsp;&nbsp;<input type=\"text\" name=\"END_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\"  onclick=\"sumSign()\" name=\"button\" class=\"btn btn82 btn_search\" value=\"查询\"></form>");
	table.append("</div><div id=\"search_bar\" class=\"mt10\"></div><div id=\"table\" class=\"mt10\"><div id=\"tableDiv\">");
	table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
	table.append("<tr><th width='15%'>ID</th><th width='15%'>支付宝账号</th><th width='15%'>支付宝账户开户姓名</th>");
	table.append("<th width='15%'>支付宝预留手机号</th><th width='15%'>每次签到获得集分宝</th><th width='15%'>签到时间</th></tr>");
		for (var i = page*10; i < pointData.length; i++) {
			if(i==(page*10+10)){
				break;
			}
			table.append("<tr><tD>");
			table.append(pointData[i].ID);
			table.append("</td><tD>");
			table.append(pointData[i].ALIPAY_NO);
			table.append("</td><tD>");
			table.append(pointData[i].ALIPAY_ACCOUNT_NAME);
			table.append("</td><tD>");
			table.append(pointData[i].ALIPAY_MOBILE_NO);
			table.append("</td><tD>");
			table.append(pointData[i].POINT);
			table.append("/分</td><tD>");
			table.append(pointData[i].SIGN_TIME);
			table.append("</tr>");
		}
		table.append("</table>");
		table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
		if(page==0){
			table.append("<li class=\"disabled\"><span>首页</span></li>");
			table.append("<li class=\"disabled\"><span>上一页</span></li>");
		}else{
			table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"SearchPoint()\">首页</a></li>");
			table.append("<li><a href=\"#\" onclick=\"flip("+(page-1)+")\">上一页</a></li>");
		}
		if((page+1)*10>pointData.length || (page+1)*10==pointData.length){
			table.append("<li class=\"disabled\"><span>下一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"flip("+(page+1)+")\">下一页</a></li>");
		}
		 table.append("<li class=\"disabled\"><span>第"+(page+1)+"页</span></li>");
        table.append("<li class=\"disabled\"><span>共"+pointData.length+"条记录</span></li></ul></div></div>");
        table.append("</div></div></div>");
		var tableHTML = table.toString();
		document.getElementById("main").innerHTML = tableHTML;
}
/**
 * 集分宝签到统计
 */
function sumSign(){
	$("#current_func").text("集分宝签到统计");
	callSvr("adminPoint/pointStatistics",$("#sumSigns").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
			var table = new StringBuffer();
			table.append("<div class=\"container\"><div id=\"button\" class=\"mt10\"><form id=\"sumSigns\" name=\"sumSigns\">&nbsp;&nbsp;&nbsp;开始时间：&nbsp;&nbsp;<input type=\"text\"  name=\"START_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间：&nbsp;&nbsp;<input type=\"text\" name=\"END_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\"  onclick=\"sumSign()\" name=\"button\" class=\"btn btn82 btn_search\" value=\"查询\"></form>");
			table.append("</div><div id=\"search_bar\" class=\"mt10\"></div><div id=\"table\" class=\"mt10\"><div id=\"tableDiv\">");
			table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
			table.append("<tr><th width='20%'>支付宝帐号</th><th width='15%'>累积集分宝积分</th><th width='15%'>累积签到次数</th><th width='15%'>查询时间</th></tr>");
			if (data != null && typeof (data) != "undefined") {
				pointData = data;
				for (var i = 0; i < data.length; i++) {
					if(i == 10){
						break;
					}
					table.append("<tr><tD>");
					table.append(data[i].ALIPAY_NO);
					table.append("</td><tD>");
					table.append(data[i].POINT);
					table.append("/分</td><tD>");
					table.append(data[i].CUMU_SIGN_COUNT);
					table.append("</td><tD>");
					table.append(myDate.toLocaleString());
					table.append("</td></tr>");
				}
				table.append("</table>");
				table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
				table.append("<li class=\"disabled\"><span>首页</span></li>");
				table.append("<li class=\"disabled\"><span>上一页</span></li>");
				if(10 > data.length || 10 == data.length){
					table.append("<li class=\"disabled\"><span>下一页</span></li>"); 
				}else{
					table.append("<li><a href=\"#\" onclick=\"pointflip(1)\">下一页</a></li>"); 
				}
				table.append("<li class=\"disabled\"><span>第1页</span></li>"); 
				table.append("<li class=\"disabled\"><span>共"+pointData.length+"条记录</span></li></ul></div></div>");
				table.append("</div></div></div>");
				var tableHTML = table.toString();
				document.getElementById("main").innerHTML = tableHTML;
			}
			}
		});
}
/**
 * 集分签到统计数翻页操作
 */
function pointflip(page){
	var table = new StringBuffer();
	table.append("<div class=\"container\"><div id=\"button\" class=\"mt10\"><form id=\"sumSigns\" name=\"sumSigns\">&nbsp;&nbsp;&nbsp;开始时间：&nbsp;&nbsp;<input type=\"text\"  name=\"START_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间：&nbsp;&nbsp;<input type=\"text\" name=\"END_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\"  onclick=\"sumSign()\" name=\"button\" class=\"btn btn82 btn_search\" value=\"查询\"></form>");
	table.append("</div><div id=\"search_bar\" class=\"mt10\"></div><div id=\"table\" class=\"mt10\"><div id=\"tableDiv\">");
	table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
	table.append("<tr><th width='20%'>支付宝帐号</th><th width='15%'>累积集分宝积分</th><th width='15%'>累积签到次数</th><th width='15%'>查询时间</th></tr>");
	for (var i = page*10; i < pointData.length; i++) {
			if(i==(page*10+10)){
				break;
			}
			table.append("<tr><tD>");
			table.append(pointData[i].ALIPAY_NO);
			table.append("</td><tD>");
			table.append(pointData[i].POINT);
			table.append("/分</td><tD>");
			table.append(pointData[i].CUMU_SIGN_COUNT);
			table.append("</td><tD>");
			table.append(myDate.toLocaleString());
			table.append("</td></tr>");
		}
		table.append("</table>");

		table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
		if(page==0){
			table.append("<li class=\"disabled\"><span>首页</span></li>");
			table.append("<li class=\"disabled\"><span>上一页</span></li>");
		}else{
			table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"sumSign()\">首页</a></li>");
			table.append("<li><a href=\"#\" onclick=\"pointflip("+(page-1)+")\">上一页</a></li>");
		}
		if((page+1)*10>pointData.length || (page+1)*10==pointData.length){
			table.append("<li class=\"disabled\"><span>下一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"pointflip("+(page+1)+")\">下一页</a></li>");
		}
		table.append("<li class=\"disabled\"><span>第"+(page+1)+"页</span></li>");
        table.append("<li class=\"disabled\"><span>共"+pointData.length+"条记录</span></li></ul></div></div>");
        table.append("</div></div></div>");
		var tableHTML = table.toString();
		document.getElementById("main").innerHTML = tableHTML;
}



/**
 * excel导出
 * @param type
 */
function AutomateExcel(type){
	var url = getLocationUrl()+"/admin/adminExport/exportEx.json?type="+type;
	if (type == 6){
		var form = document.getElementById("settlementSearch");
		form.action = url;
		form.method = "post";
		form.submit();
	} else if (type == 5){
		var form = document.getElementById("rewardRecSearchForm");
		form.action = url;
		form.method = "post";
		form.submit();
	} else if(type == 99) {
		var form = document.getElementById("orderSearch");
		form.action = url;
		form.method = "post";
		form.submit();
	}else if(type == 88) {
		var form = document.getElementById("muSearch");
		form.action = url;
		form.method = "post";
		form.submit();
	}else if(type== 11){
		var form = document.getElementById("muSearch");
		form.action = url;
		form.method = "post";
		form.submit();
	}else if(type== 66){
		var form = document.getElementById("westSearch");
		form.action = url;
		form.method = "post";
		form.submit();
	}else if(type == 2) {
		var form = document.getElementById("mileageForm");
		form.action = url;
		form.method = "post";
		form.submit();
	}else if(type == 3) {
		var form = document.getElementById("meetingForm");
		form.action = url;
		form.method = "post";
		form.submit();
	} else{
		var form = document.getElementById("timePoint");
		form.action = url;
		form.method = "post";
		form.submit();
	}
}

$( function() {
    $("#test li").click(function(){
            $("#test li").removeClass("on");
            $(this).addClass("on");
     });
    });
$( function() {
    $("#product li").click(function(){
            $("#product li").removeClass("on");
            $(this).addClass("on");
     });
    });
$( function() {
    $("#indent li").click(function(){
            $("#indent li").removeClass("on");
            $(this).addClass("on");
     });
    });
    
   /**
    * 签到奖励规则查询
    */
  function awardSearch(){
	$("#current_func").text("签到奖励规则查询");
	callSvr("adminAward/awardSearch","",function(data) {
	if(null != data.err && data.err == 9){
		Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
	}else{
		var table = new StringBuffer();
		table.append("<div class=\"container\"><div id=\"button\" class=\"mt10\"><input type=\"button\" onclick=\"awardAdd();\" name=\"button\" class=\"btn btn82 btn_add\" value=\"新增\">");
		table.append("</div><div id=\"search_bar\" class=\"mt10\"></div><div id=\"table\" class=\"mt10\"><div id=\"tableDiv\">");
		table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
		table.append("<tr><th width='20%'>签到规则</th><th width='8%'>适用平台</th><th width='15%'>有效期限</th><th width='15%'>最近操作时间</th><th width='10%' align=\"center\">删除</th>");
		table.append("<th width='10%'>修改</th></tr>");
		if (data != null && typeof (data) != "undefined") {
			for (var i = 0; i < data.length; i++) {
				table.append("<tr><tD>");
				table.append(data[i].EXPLAIN+data[i].PARAM_VALUE+"次&nbsp;<span style=\"color:#F00; font-size:15px\">奖励:&nbsp;</span>"+data[i].AWARD_VALUE+"集分宝/里程");
				table.append("</td><tD>");
				table.append(data[i].TYPE);
				table.append("</td><tD>");
				table.append(data[i].START_TIME.substring(0,10)+"       至     "+data[i].END_TIME.substring(0,10));
				table.append("</td><tD>");
				table.append(data[i].OPERATION_TIME);
				table.append("</td><tD><input type=\"button\" onclick=\"javascript:Dialog.confirm('警告：您确认要删除该条记录吗？',function(){awardDel("+data[i].ID+")});\" name=\"button\" class=\"btn btn82 btn_del\" value=\"删除\"></td><tD>");
				table.append("<input type=\"button\"  onclick=\"awardconfig("+data[i].ID+");\" name=\"button\" class=\"btn btn82 btn_config\" value=\"修改\"></tD></tr>");
			}
			table.append("</table>");
			table.append("</div></div></div>");
			var tableHTML = table.toString();
			document.getElementById("main").innerHTML = tableHTML;
		}
	}
 });
}  
 
  /**
   * 新增奖励规则
   */
function awardAdd(){
	 var diag = new Dialog();
	diag.Width = 600;
	diag.Height = 360;
	diag.Title = "嗨悠游签到奖励规则添加";
	diag.URL = "addPara.html";
	diag.show();
}

/**
 * 添加奖励规则
 * 	
 */
function postRules(){
	callSvr("adminAward/postRule",$("#postRule").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
			if (data != null && typeof (data) != "undefined") {
				  window.parent.awardSearch();
				  Dialog.close();
			}
		}
	 });
}

/**
 * 删除奖励规则
 * 	
 */
function awardDel(ID){
	callSvr("adminAward/deleteRule",{"ID":ID},function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
			if (data != null && typeof (data) != "undefined") {
					 awardSearch();
			}
		}
	 });
}
/**
 * 修改规则
 */
function awardconfig(ID){
	callSvr("adminAward/findRule",{"ID":ID},function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
		if (data != null && typeof (data) != "undefined") {
			var table = new StringBuffer();
			table.append("<form name=\"modifyRule\" id=\"modifyRule\">");
			table.append("<input type=\"text\" style=\"display:none\" value="+data.id+" name=\"ID\"  />");
			table.append("<table class=\"form_table pt15 pb15\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
			table.append("<tr><td colspan=\"2\" bgcolor=\"#eeeeee\"></td></tr>");
			table.append("<tr><td class=\"td_right\">奖励规则类别：</td><td><select class=\"select\" name=\"PARAM_NAME\">" );
			if(data.param_name == "JIFENBAO_POINT"){
				table.append("<option selected value =\"JIFENBAO_POINT\">集分宝每次签到</option>");
			}else{
				table.append("<option value =\"JIFENBAO_POINT\">集分宝每次签到</option>");
			}
			if(data.param_name == "POINT_SIGN_COUNT"){
				table.append("<option selected value =\"POINT_SIGN_COUNT\">集分宝连续签到</option>");
			}else{
				table.append("<option value =\"POINT_SIGN_COUNT\">集分宝连续签到</option>");
			}
			if(data.param_name == "CUMULATIVE_POINT"){
				table.append("<option selected value =\"CUMULATIVE_POINT\">集分宝累积签到</option>");
			}else{
				table.append("<option value =\"CUMULATIVE_POINT\">集分宝累积签到</option>");
			}
			if(data.param_name == "MILEAGE"){
				table.append("<option selected value =\"MILEAGE\">里程每次签到</option>");
			}else{
				table.append("<option value =\"MILEAGE\">里程每次签到</option>");
			}
			if(data.param_name == "MILEAGE_SIGN_COUNT"){
				table.append("<option selected value =\"MILEAGE_SIGN_COUNT\">里程连续签到</option>");
			}else{
				table.append("<option value =\"MILEAGE_SIGN_COUNT\">里程连续签到</option>");
			}
			if(data.param_name == "CUMULATIVE_MILEAGE"){
				table.append("<option selected value =\"CUMULATIVE_MILEAGE\">里程累积签到</option>");
			}else{
				table.append("<option value =\"CUMULATIVE_MILEAGE\">里程累积签到</option>");
			}
			table.append("</td></tr>");
			table.append("<tr><td class=\"td_right\">奖励条件：</td><td><input type=\"text\" class=\"input-text lh25\" value="+data.param_value+" name=\"PARAM_VALUE\"  /></td></tr>");
			table.append("<tr><td class=\"td_right\">有效期限：</td><td><input type=\"text\" class=\"input-text lh25\" value="+data.start_time+" name=\"START_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/>&nbsp;&nbsp;<input type=\"text\"  class=\"input-text lh25\" value="+data.end_time+" name=\"END_TIME\"  class=\"laydate-icon\"  onclick=\"laydate()\"/></td></tr>");
			table.append("<tr><td class=\"td_right\">适用平台：</td><td><select class=\"select\" name=\"TYPE\">");
			if(data.type == "微信"){
				table.append("<option selected value =\"微信\">微信</option>");
			}else{
				table.append("<option value =\"微信\">微信</option>");
			}
			if(data.type == "支付宝"){
				table.append("<option selected value =\"支付宝\">支付宝</option>");
			}else{
				table.append("<option value =\"支付宝\">支付宝</option>");
			}
			if(data.type == "移动端"){
				table.append("<option selected value =\"移动端\">移动端</option>");
			}else{
				table.append("<option value =\"移动端\">移动端</option>");
			}
			if(data.type == "pc端"){
				table.append("<option selected value =\"pc端\">pc端</option>");
			}else{
				table.append("<option value =\"pc端\">pc端</option>");
			}
			table.append("</select></td></tr>");
			table.append("<tr><td class=\"td_right\">奖励：</td><td><input type=\"text\" class=\"input-text lh25\" value="+data.award_value+" name=\"AWARD_VALUE\"  />&nbsp;&nbsp;集分宝/里程</td></tr>");
			table.append("</table>");
			table.append("</form>");
			var tableHTML = table.toString();
			document.getElementById("forlogin").innerHTML = tableHTML;
			var diag = new Dialog();
			diag.Width = 500;
			diag.Height = 240;
			diag.Title = "奖励规则修改";
			diag.InvokeElementId="forlogin";
			diag.OKEvent = function(){window.parent.modifyRules(data.id);};
			diag.show();
		}
		}
	 });
}
function modifyRules(ID){
	callSvr("adminAward/modifyRules",$("#modifyRule").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
			if (data != null && typeof (data) != "undefined") {
				  window.parent.awardSearch();
				  Dialog.close();
			}
		}
	 });
}

function product(){
	$("#current_func").text("产品信息配置");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"" + getLocationUrl()+"/admin/adminProduct/loadproduct.json\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
}

function policyAdd(ID){
	var form = document.getElementById("form1");
	form.action = "admin/adminProduct/configAdminProduct.json";
	var input = document.createElement("INPUT");
	input.name="ID";
	input.value = ID;
	input.type = "hidden";
	form.appendChild(input);
	form.submit();
}

function policyDelete(ID){
	var form = document.getElementById("form1");
	form.action = "admin/adminProduct/deleteAdminProduct.json";
	var input = document.createElement("INPUT");
	input.name="ID";
	input.value = ID;
	input.type = "hidden";
	form.appendChild(input);
	form.submit();
}

function productAdd(){
	var form = document.getElementById("form1");
	form.action = "admin/adminProduct/createAdminProduct.json";
	form.submit();
}

function saveProduct(){
	document.getElementById("productForm").submit();
}

function productConfig(ID){
	var form = document.getElementById("form1");
	var input = document.createElement("INPUT");
	input.name="ID";
	input.value = ID;
	input.type = "hidden";
	form.appendChild(input);
	form.submit();
}

function queryProduct(){
	var url = getLocationUrl() + "/admin/adminProduct/queryProduct.json";
	var form = document.getElementById("queryForm");
	form.action = url;
	document.getElementById("queryForm").submit();
}

function setShowLength(obj, maxlength, id) { 
	var rem = maxlength - obj.value.length; 
	var wid = id; 
	if (rem < 0){ 
	rem = 0; 
	} 
	document.getElementById(wid).innerHTML = rem+"个字"; 
}

function adminProduct(){
	var title = document.getElementById("PRODUCT_TITLE").value;
	if(title == ''){
	        Dialog.alert("提示：产品标题不能为空！");
	        return false;
	}
	var price = document.getElementById("PRODUCT_PRICE").value;
	if(price == ''){
	         Dialog.alert("提示：产品价格不能为空！");
	        return false;
	}
	var explan = document.getElementById("PRODUCT_EXPLAN").value;
	if(explan == ''){
	         Dialog.alert("提示：保险简介不能为空！");
	        return false;
	}
//	var salesType="";
//	 $('input:checkbox[name=CLIENT_TYPE]:checked').each(function(i){
//		 if($(this).val() == 0){
//  		    salesType=0;
//  	      }
//	});
//	if(salesType==0){
//		var proxy=$("#PROXY_RATE").val();
//		if(proxy==null || proxy==""){
//			Dialog.alert("提示：应收代理费费率不能为空！");
//			return false;
//		}else{
//			
//		}
//		var service=$("#SERVICE_RATE").val();
//		if(service==null || service==""){
//			Dialog.alert("提示：机场服务费费率不能为空！");
//			return false;
//		}
//		var procedures=$("#PROCEDURES_RATE").val();
//		if(procedures==null || procedures==""){
//			Dialog.alert("提示：刷卡手续费费率不能为空！");
//			return false;
//		}
//	}

	document.getElementById("productForm").submit();
}

function deleteInsuranceAge(ID,SALES_ATTRIBUTE){
     var div = document.getElementById(ID);
	 div.parentNode.removeChild(div);
	 var tr = document.getElementById(SALES_ATTRIBUTE);
	 if(null != tr){
	 	tr.parentNode.removeChild(tr);
	 }
	 var INSURANCE_SALES_AGE = document.getElementById("INSURANCE_SALES_AGE");
	 var ageValue = INSURANCE_SALES_AGE.value.split(",");
	 for(var i=0;i<ageValue.length;i++){
	    if(SALES_ATTRIBUTE == ageValue[i]){
	       ageValue.splice(i,1);
	    }
	 }
	 INSURANCE_SALES_AGE.value = ageValue.join(",");
	 combination();
}

function addInsuranceAge(){
	 var ID = new Date().getTime();
     var SALES_ATTRIBUTE = document.getElementById("inputToken").value;
     var INSURANCE_SALES_AGE = document.getElementById("INSURANCE_SALES_AGE");
     if(SALES_ATTRIBUTE == "" || SALES_ATTRIBUTE == null){
			Dialog.alert("提示：添加投保年龄属性值不能为空！");
			return false;
	 }else{
		    var div = document.createElement('div'); // 新增元素
			div.id = ID;
			div.className="token";
			div.innerHTML="<span class=\"token-label\" style=\"max-width: 661px;\">"+SALES_ATTRIBUTE+"</span><a href=\"javascript:deleteInsuranceAge("+ID+",'"+SALES_ATTRIBUTE+"');\" class=\"close\" tabindex=\"-1\">×</a>";
			var inputToken = document.getElementById('inputToken');
			inputToken.value = "";
			inputToken.parentNode.insertBefore(div, inputToken);
			if(INSURANCE_SALES_AGE.value == "" || INSURANCE_SALES_AGE.value == null){
			      INSURANCE_SALES_AGE.value=SALES_ATTRIBUTE;
			}else{
			     INSURANCE_SALES_AGE.value = INSURANCE_SALES_AGE.value+","+SALES_ATTRIBUTE;
			}
		 combination();
		 getSales(SALES_ATTRIBUTE);
	}
}

function deleteGuaranteePeriod(ID,SALES_ATTRIBUTE){
     var div = document.getElementById(ID);
	 div.parentNode.removeChild(div);
	 var tr = document.getElementById(SALES_ATTRIBUTE);
	 if(null != tr){
	 	  tr.parentNode.removeChild(tr);
	 }
	 var GUARANTEE_SALES_PERIOD = document.getElementById("GUARANTEE_SALES_PERIOD");
	 var ageValue = GUARANTEE_SALES_PERIOD.value.split(",");
	 for(var i=0;i<ageValue.length;i++){
	    if(SALES_ATTRIBUTE == ageValue[i]){
	       ageValue.splice(i,1);
	    }
	 }
	 GUARANTEE_SALES_PERIOD.value = ageValue.join(",");
	 combination();
}

function addGuaranteePeriod(){
	 var ID = new Date().getTime();
     var SALES_ATTRIBUTE = document.getElementById("inputToken1").value;
     var GUARANTEE_SALES_PERIOD = document.getElementById("GUARANTEE_SALES_PERIOD");
     if(SALES_ATTRIBUTE == "" || SALES_ATTRIBUTE == null){
			Dialog.alert("提示：添加保障期限属性值不能为空！");
			return false;
	 }else{
		    var div = document.createElement('div'); // 新增元素
			div.id = ID;
			div.className="token";
			div.innerHTML="<span class=\"token-label\" style=\"max-width: 661px;\">"+SALES_ATTRIBUTE+"</span><a href=\"javascript:deleteGuaranteePeriod("+ID+",'"+SALES_ATTRIBUTE+"');\" class=\"close\" tabindex=\"-1\">×</a>";
			var inputToken = document.getElementById('inputToken1');
			inputToken.value = "";
			inputToken.parentNode.insertBefore(div, inputToken);
			if(GUARANTEE_SALES_PERIOD.value == "" || GUARANTEE_SALES_PERIOD.value == null){
			      GUARANTEE_SALES_PERIOD.value=SALES_ATTRIBUTE;
			}else{
			     GUARANTEE_SALES_PERIOD.value = GUARANTEE_SALES_PERIOD.value+","+SALES_ATTRIBUTE;
			}
			combination();
			getSales(SALES_ATTRIBUTE);
	}
}

function deleteSageguardPlan(ID,SALES_ATTRIBUTE){
     var div = document.getElementById(ID);
	 div.parentNode.removeChild(div);
	 var tr = document.getElementById(SALES_ATTRIBUTE);
	 if(null != tr){
	 	  tr.parentNode.removeChild(tr);
	 }
	 var SAFEGUARD_SALES_PLAN = document.getElementById("SAFEGUARD_SALES_PLAN");
	 var ageValue = SAFEGUARD_SALES_PLAN.value.split(",");
	 for(var i=0;i<ageValue.length;i++){
	    if(SALES_ATTRIBUTE == ageValue[i]){
	       ageValue.splice(i,1);
	    }
	 }
	 SAFEGUARD_SALES_PLAN.value = ageValue.join(",");
	 combination();
}

function addSafeguardPlan(){
	 var ID = new Date().getTime();
     var SALES_ATTRIBUTE = document.getElementById("inputToken2").value;
     var SAFEGUARD_SALES_PLAN = document.getElementById("SAFEGUARD_SALES_PLAN");
     if(SALES_ATTRIBUTE == "" || SALES_ATTRIBUTE == null){
			Dialog.alert("提示：添加保障计划属性值不能为空！");
			return false;
	 }else{
		    var div = document.createElement('div'); // 新增元素
			div.id = ID;
			div.className="token";
			div.innerHTML="<span class=\"token-label\" style=\"max-width: 661px;\">"+SALES_ATTRIBUTE+"</span><a href=\"javascript:deleteSageguardPlan("+ID+",'"+SALES_ATTRIBUTE+"');\" class=\"close\" tabindex=\"-1\">×</a>";
			var inputToken = document.getElementById('inputToken2');
			inputToken.value = "";
			inputToken.parentNode.insertBefore(div, inputToken);
			if(SAFEGUARD_SALES_PLAN.value == "" || SAFEGUARD_SALES_PLAN.value == null){
			      SAFEGUARD_SALES_PLAN.value=SALES_ATTRIBUTE;
			}else{
			     SAFEGUARD_SALES_PLAN.value = SAFEGUARD_SALES_PLAN.value+","+SALES_ATTRIBUTE;
			}
			combination();
			getSales(SALES_ATTRIBUTE);
	}
}

function deleteFlightNumber(ID,SALES_ATTRIBUTE){
     var div = document.getElementById(ID);
	 div.parentNode.removeChild(div);
	 var tr = document.getElementById(SALES_ATTRIBUTE);
	 if(null != tr){
	 	  tr.parentNode.removeChild(tr);
	 }
	 var FLIGHT_NUMBER = document.getElementById("FLIGHT_NUMBER");
	 var ageValue = FLIGHT_NUMBER.value.split(",");
	 for(var i=0;i<ageValue.length;i++){
	    if(SALES_ATTRIBUTE == ageValue[i]){
	       ageValue.splice(i,1);
	    }
	 }
	 FLIGHT_NUMBER.value = ageValue.join(",");
	 combination();
}

function addFlightNumber(){
	 var ID = new Date().getTime();
     var SALES_ATTRIBUTE = document.getElementById("inputToken3").value;
     var FLIGHT_NUMBER = document.getElementById("FLIGHT_NUMBER");
     if(SALES_ATTRIBUTE == "" || SALES_ATTRIBUTE == null){
			Dialog.alert("提示：添加飞行次数属性值不能为空！");
			return false;
	 }else{
		    var div = document.createElement('div'); // 新增元素
			div.id = ID;
			div.className="token";
			div.innerHTML="<span class=\"token-label\" style=\"max-width: 661px;\">"+SALES_ATTRIBUTE+"</span><a href=\"javascript:deleteFlightNumber("+ID+",'"+SALES_ATTRIBUTE+"');\" class=\"close\" tabindex=\"-1\">×</a>";
			var inputToken = document.getElementById('inputToken3');
			inputToken.value = "";
			inputToken.parentNode.insertBefore(div, inputToken);
			if(FLIGHT_NUMBER.value == "" || FLIGHT_NUMBER.value == null){
			      FLIGHT_NUMBER.value=SALES_ATTRIBUTE;
			}else{
			     FLIGHT_NUMBER.value = FLIGHT_NUMBER.value+","+SALES_ATTRIBUTE;
			}
			combination();
			getSales(SALES_ATTRIBUTE);
	}
}

function combination(){ 
	  var INSURANCE_SALES_AGE = document.getElementById("INSURANCE_SALES_AGE").value;
	  var GUARANTEE_SALES_PERIOD = document.getElementById("GUARANTEE_SALES_PERIOD").value;
	  var SAFEGUARD_SALES_PLAN = document.getElementById("SAFEGUARD_SALES_PLAN").value;
	  var FLIGHT_NUMBER = document.getElementById("FLIGHT_NUMBER").value; 
      callSvr("adminProduct/combination",{"INSURANCE_SALES_AGE":INSURANCE_SALES_AGE,"GUARANTEE_SALES_PERIOD":GUARANTEE_SALES_PERIOD,"SAFEGUARD_SALES_PLAN":SAFEGUARD_SALES_PLAN,"FLIGHT_NUMBER":FLIGHT_NUMBER},function(data) {
		if (data != null && typeof (data) != "undefined") {
			 var table = new StringBuffer();
			table.append("<tr><th width=\"20\"></th>");
			var str = JSON.stringify(data[0]);
			if(str.indexOf("投保年龄",0) > -1){
				table.append("<th id=\"tb\">投保年龄</th>");
			}
			if(str.indexOf("保障期限",0) > -1){
				table.append("<th id=\"qx\">保障期限</th>");
			}
			if(str.indexOf("保障计划",0) > -1){
				table.append("<th id=\"jx\">保障计划</th>");
			}
			if(str.indexOf("飞行次数",0) > -1){
				table.append("<th id=\"jx\">飞行次数</th>");
			}
			table.append("<th>商家编码</th><th>一口价</th><th width=\"80\">保险简介</th></tr>");

			for (var i = 0; i < data.length; i++) {
				table.append("<tr><td rowspan=\"2\">"+(i+1)+"</td>");
				for(var j = 0;j < data[i].length;j++){
					table.append("<td >"+data[i][j].split(",")[0]+"</td>");
					table.append("<input type=hidden name=\"SALES_ATTRIBUTE\" value="+data[i][j].split(",")[0]+">");
					table.append("<input type=hidden name=\"ATTRIBUTE_TYPE\" value="+data[i][j].split(",")[1]+">");
				}
				table.append("<td><input type=\"text\" id=\"MERCHANT_CODE\" class=\"form_min\" name=\"MERCHANT_CODE\"> </td><td>");
				table.append("<input type=\"text\" id=\"COMBINATION_PRICE\" class=\"form_min\" name=\"COMBINATION_PRICE\"> </td><td width=\"80\"></td></tr>");
				table.append("<tr><td colspan=\"7\"><textarea id=\"COMBINATION_INFO\" class=\"text-input\" name=\"COMBINATION_INFO\" rows=\"2\" style=\"width: 100%;\"></textarea></td></tr>");
			}
			var tableHTML = table.toString();
			document.getElementById("table1").innerHTML = tableHTML;
		}
	 });
}

function getSales(SALES_ATTRIBUTE){
			var table = new StringBuffer();
			table.append("<tr><td><select name=\"salesID\" id=\"salesID\"><option value='"+SALES_ATTRIBUTE+"'>"+SALES_ATTRIBUTE+"</option>");
			table.append("</select></td><td><input type=\"text\" class=\"form_mid\" maxlength=20 name=\"INSURE_ALLOWED\"></td>");
			table.append("<td><input type=\"text\" class=\"form_min\" maxlength=10 name=\"GUARANTEE_AMOUNT\"></td>");
			table.append("<td><input type=\"text\" class=\"form_mid\" maxlength=200 name=\"INSURE_INFO\"></td></tr>");
			var trHTML = table.toString();
			var tr = document.createElement('tr');
			tr.id = SALES_ATTRIBUTE;
			tr.innerHTML = trHTML;
			$("#table_numb").append(tr);
}
/**
 * 选项改变的时候更改tr的id
 */
$(document).ready(function(){
	$("#table_numb").on('change','select',function(){
		var newid=$(this).children(":selected").text()
		$(this).closest("tr").attr("id",newid)
	})
});

function addSales(){
	var table = new StringBuffer();
	table.append("<tr><td><select name=\"salesID\" id=\"salesID\"><option value='整个产品'>整个产品</option>");
	$(".token-label").each(function () {
			var str="<option value='"+$(this).text()+"'>"+$(this).text()+"</option>"
			table.append(str)
	})
	table.append("</select></td><td><input type=\"text\" class=\"form_mid\" maxlength=20 name=\"INSURE_ALLOWED\"></td>");
	table.append("<td><input type=\"text\" class=\"form_min\" maxlength=10 name=\"GUARANTEE_AMOUNT\"></td>");
	table.append("<td><input type=\"text\" class=\"form_mid\" maxlength=200 name=\"INSURE_INFO\"></td></tr>");
	var trHTML = table.toString();
	var tr = document.createElement('tr');
	tr.id = "整个产品";
	tr.innerHTML = trHTML;
	$("#table_numb").append(tr);
}


function changeCom(ID,TYPE){
	      var MERCHANT_CODE1 = document.getElementById("MERCHANT_CODE"+ID).value;
          var COMBINATION_PRICE1 = document.getElementById("COMBINATION_PRICE"+ID).value;
          var COMBINATION_INFO1 = document.getElementById("COMBINATION_INFO"+ID).value;
          callSvr("adminProduct/change",{"ID":ID,"TYPE":TYPE,"MERCHANT_CODE1":MERCHANT_CODE1,"COMBINATION_PRICE1":COMBINATION_PRICE1,"COMBINATION_INFO1":COMBINATION_INFO1},function(data) {
	   	     if (data != null && typeof (data) != "undefined") {
//	   	     	 if(data.err == '0'){
//	   	     	     Dialog.alert("提示：修改成功！");
//	   	     	 }
	   	     }
	  });
}

function change(){
	var radio = document.getElementsByName("SAFEGUARD_MARK");
    var radioLength = radio.length;
	   for(var i = 0;i < radioLength;i++)
	   {
		    if(radio[i].checked){
			     var radioValue = radio[i].value;
			     if(radioValue == '0'){
			     	document.getElementById("PRODUCT_FEATURE").style.display="";
			        document.getElementById("INSURE").style.display="none";
			     }else{
					 document.getElementById("PRODUCT_FEATURE").style.display="none";
			        document.getElementById("INSURE").style.display="";
			     }
		    }
	   }
}

function close(type){
     if(type == "1"){
       var table =document.getElementById("table_about1");
       var rows = table.rows.length;
       for(var i=1;i<rows;i++){
          table.rows[i].style.display="none";
       }
       document.getElementById("policy1").innerHTML = "<a href=\"javascript:open('1');\">展开列表</a>";
    }else if(type == "2"){
    	var table =document.getElementById("table_about2");
        var rows = table.rows.length;
        for(var i=1;i<rows;i++){
           table.rows[i].style.display="none";
        }
        document.getElementById("policy2").innerHTML = "<a href=\"javascript:open('2');\">展开列表</a>";
    }else{
        var table =document.getElementById("table_about3");
        var rows = table.rows.length;
        for(var i=1;i<rows;i++){
           table.rows[i].style.display="none";
        }
        document.getElementById("policy3").innerHTML = "<a href=\"javascript:open('3');\">展开列表</a>";
    }
}

function open(type){
	if(type == "1"){
		var table =document.getElementById("table_about1");
        var rows = table.rows.length;
        for(var i=1;i<rows;i++){
            table.rows[i].style.display="";
        }
        document.getElementById("policy1").innerHTML = "<a href=\"javascript:close('1');\">收起列表</a>";
	}else if(type == "2"){
	 	var table =document.getElementById("table_about2");
        var rows = table.rows.length;
        for(var i=1;i<rows;i++){
            table.rows[i].style.display="";
        }
        document.getElementById("policy2").innerHTML = "<a href=\"javascript:close('2');\">收起列表</a>";
	}else{
	   	var table =document.getElementById("table_about3");
        var rows = table.rows.length;
        for(var i=1;i<rows;i++){
            table.rows[i].style.display="";
        }
        document.getElementById("policy3").innerHTML = "<a href=\"javascript:close('3');\">收起列表</a>";
	}  
}

function back(){
    location.href = "/Admin/admin/adminProduct/queryProduct.json?pageNum=1";
}

function productCatalog(){
    $("#current_func").text("产品目录配置");
    var main = document.getElementById("main");
	main.innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"productCatalog.jsp\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
    var form = document.createElement("form");
    document.body.appendChild(form);
    form.action = "admin/adminProduct/productCatalog.json";
    form.target = 'right';
    form.submit();
}

/**
 * 产品目录列表查询
 */
function searchCatalog(){
       document.getElementById("productCatalog").submit();
}

function backCatalog(){
    var form = document.createElement("form");
    document.body.appendChild(form);
    form.action = "admin/adminProduct/productCatalog.json";
    form.target = 'right';
    form.submit();
}

/**
 * 保存
 * @return {Boolean}
 */
function saveCatalog(){
	if(document.getElementById("CATALOG_NAME").value == "" ){
	      Dialog.alert("提示：请输入产品目录名称！");
	      return false;
	}
	if(document.getElementById("DISP_NUM").value == "" ){
	      Dialog.alert("提示：请输入排序号！");
	      return false;
	}
	if(!/^[0-9]+$/.test(document.getElementById("DISP_NUM").value)){
          Dialog.alert("提示：排序号只能为数字！");
	      return false;
    }
	if(document.getElementById("USE_PLATFORM").value == "" ){
	      Dialog.alert("提示：请输入使用平台！");
	      return false;
	}
	callSvr("adminProduct/saveCatalog",$("#productCatalog").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
			if (data != null && typeof (data) != "undefined") {
				  window.parent.productCatalog();
				  Dialog.close();
			}
		}
	 });
}

/**
 * 修改保存
 * @return {Boolean}
 */
function configCatalog(){

	if(document.getElementById("CATALOG_NAME").value == "" ){
	      Dialog.alert("提示：请输入产品目录名称！");
	      return false;
	}
	if(document.getElementById("DISP_NUM").value == "" ){
	      Dialog.alert("提示：请输入排序号！");
	      return false;
	}
	if(!/^-?\d+(\.\d{1,5})?$/.test(document.getElementById("DISP_NUM").value)){
          Dialog.alert("提示：排序号只能为数字！");
	      return false;
    }
    if(document.getElementById("USE_PLATFORM").value != document.getElementById("PLATFORM").value){
	    Dialog.confirm('警告：平台发生了变化，原来配置的产品将会删除。是否继续？',function(){
	    	    var form = document.getElementById("productCatalog");
			    form.action = "admin/adminProduct/configCatalog.json";
				form.submit();
	      });
	}else{
	     var form = document.getElementById("productCatalog");
		 form.action = "admin/adminProduct/configCatalog.json";
		 form.submit();
	}
}

/**
 * 删除产品目录信息
 */
function catalogDelete(){
	 if($("input[type='checkbox']:checked").length == 0){
	 	 Dialog.alert("提示：请选择要删除的产品目录");
	 }else{
	     Dialog.confirm('警告：您确认要删除所选产品目录吗？',function(){
	             	var form = document.getElementById("form1");
					form.action = "admin/adminProduct/catalogDelete.json";
					form.submit();
	      });
	 }
}

/**
 * 修改产品目录信息
 */
function catalogConfig(ID){
	var form = document.createElement("form");
    document.body.appendChild(form);
    form.action = "admin/adminProduct/catalogConfig.json";
    form.target = 'right';
     var input = document.createElement("INPUT");
	 input.name="ID";
	 input.value = ID;
	 input.type = "hidden";
	 form.appendChild(input);
	 form.submit();
}

function searchProductList(){
      var form = document.getElementById("queryProductList");
      var input = document.createElement("INPUT");
	  input.name="id";
	  input.value = document.getElementById("id").value;
	  input.type = "hidden";
	  form.appendChild(input);
	  form.submit();
}

/**
 * 产品追加页面
 * @param {} ID 目录主键ID
 */
function queryProductList(){
	var ID = document.getElementById("id").value;
	var usePlatform = document.getElementById("PLATFORM").value;
	if(ID == "" || ID == null ){
	        Dialog.alert("提示：您还没有添加产品目录，无法进行产品配置！")
	}else{
		    var diag = new Dialog();
			diag.Width = 900;
			diag.Height = 700;
			diag.Title = "产品追加列表";
			diag.URL = "queryProductList.json?id="+ID+"&catalogUsePlatform="+usePlatform;
			diag.show();
	}
}
/**
 * 添加产品到产品目录
 */
function productToCatalog(){
     callSvr("adminProduct/productToCatalog",$("#productList").formToJson(),function(data) {
			if(null != data.err && data.err == 9){
					Dialog.alert("提示：您没有登录或登录已超时！",function(){window.parent.parent.location.href = "/Admin/login.html";});
			}else{
					if (data != null && typeof (data) != "undefined") {
							window.parent.catalogConfig(data.ID);
							Dialog.close();
					}
			}
	});
}

/**
 * 移除产品
 * @param {} ID 产品目录中产品ID
 */
function rmProduct(ID){
     var form = document.createElement("form");
     document.body.appendChild(form);
     var input = document.createElement("INPUT");
	 input.name="ID";
	 input.value = ID;
	 input.type = "hidden";
	 form.appendChild(input);
	 form.action = "admin/adminProduct/rmProduct.json";
	 form.target = 'right';
	 form.submit();
}

function addDispNum(ID){
     var diag = new Dialog();
	 diag.Width = 500;
	 diag.Height = 200;
	 diag.Title = "产品排序号编辑";
	 diag.URL = getLocationUrl()+"/catalog/addDispNum.jsp?id="+ID;
	 diag.show();
}

function saveDispNum(){
   
    if(document.getElementById("dispNum").value == "" ){
	      Dialog.alert("提示：请输入排序号！");
	      return false;
	}
	if(!/^-?\d+(\.\d{1,5})?$/.test(document.getElementById("dispNum").value)){
          Dialog.alert("提示：排序号只能为数字！");
	      return false;
    }
     callSvr("adminProduct/saveDispNum",$("#form1").formToJson(),function(data) {
			if(null != data.err && data.err == 9){
					Dialog.alert("提示：您没有登录或登录已超时！",function(){window.parent.parent.location.href = "/Admin/login.html";});
			}else{
					if (data != null && typeof (data) != "undefined") {
							window.parent.catalogConfig(data.ID);
							Dialog.close();
					}
			}
	});
}

function exportHref(id,platform,path){
	 var url = "http://www.auib.com.cn/Wechat/product/catalogProduct.html?p="+id+"&platform="+platform;
	 var diag = new Dialog();
	 diag.Width = 600;
	 diag.Height = 150;
	 diag.Title = "产品目录链接地址";
	 diag.URL = path+"/catalog/productHref.jsp?url="+url;
	 diag.show();
}

/**
 * ATM状态查询
 */
function atmStatus(){
    $("#current_func").text("ATM状态查询");
    var main = document.getElementById("main");
	main.innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"atmStatus.jsp\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
    var form = document.createElement("form");
    document.body.appendChild(form);
    form.action = "admin/adminATM/atmStatus.json";
    form.target = 'right';
    form.submit();
}

function atmStatusQuery(){
    document.getElementById("form1").submit();
}

function awardSetting() {
	// 当前位置设定
	$("#current_func").text("里程奖励设置");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"" + getLocationUrl()+"/admin/adminAward/awardSetting.json\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
}

function saveAwardSetting(){
	
	var startTime = $("#START_TIME").val();
	var endTime = $("#END_TIME").val();
	var paramVal = $("#PARAM_VALUE").val();
	
	if(!isEmpty(startTime) && !dateCheck(startTime)) {
		Dialog.alert("请输入正确的开始日期！", function(){$("#START_TIME")[0].focus();});
		return;
	}
	if(!isEmpty(endTime) && !dateCheck(endTime)) {
		Dialog.alert("请输入正确的结束日期！", function(){$("#END_TIME")[0].focus();});
		return;
	}
	if(!isEmpty(startTime) && !isEmpty(endTime) != null && !dateCompare(startTime, endTime)){
		Dialog.alert("开始日期不能大于结束日期！", function(){$("#START_TIME")[0].focus();});
		return;
	}
	
	if(!isNum(paramVal)) {
		Dialog.alert("请输入数字！", function(){$("#PARAM_VALUE")[0].focus();});
		return;
	}
	
	callSvr("adminAward/saveAwardSetting",$("#awardSetForm").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
			if(data.err == 0) {
				if(null != data.id && "" != data.id) {
					$("#ID").val(data.id);
				}
				Dialog.alert("里程奖励设置已经成功保存！");
			} else{
				Dialog.alert("里程奖励设置保存失败！");
			}
		}
	});
}


function salesTypeSelect(){
	var salesType=$("#PRODUCT_SALES_TYPE").val();
	if(salesType==0){
		//隐藏
		$("#PROXY").css('display','block');
		$("#SERVICE").css('display','block');
		$("#PROCEDURES").css('display','block');
	}else{
		//显示
		$("#PROXY").css('display','none');
		$("#SERVICE").css('display','none');
		$("#PROCEDURES").css('display','none');
	}
}


function productExport(){
//	var form = document.getElementById("queryForm");
//	form.action = "admin/adminProduct/loadproductExport.json";
//	form.submit();
	$("#current_func").text("国航E平台产品导出");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"productExport.jsp\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
	var form = document.createElement("form");
    document.body.appendChild(form);
    form.action = "admin/adminProduct/loadproductExport.json";
    form.target = 'right';
    form.submit();
}

function mstInfo(){
	$("#current_func").text("基础属性配置");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"master/masterInfo.jsp\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
	var form = document.createElement("form");
    document.body.appendChild(form);
    form.action = "admin/masertInfo/mstTypeList.json";
    form.target = 'right';
    form.submit();
}

function changeType(){
	var check = document.getElementsByName("CLIENT_TYPE");
    var checkLength = check.length;
    var str = "";
	   for(var i = 0;i < checkLength;i++)
	   {
		    if(check[i].checked){
			     var checkValue = check[i].value;
			     str +=checkValue;
		    }
	   }
	   //alert(str);
}


function linkOptions(){

}