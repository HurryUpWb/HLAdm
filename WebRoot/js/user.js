var userData;
/**
 * 加载订单查询
 */
function loadUserList() {
	// 当前位置设定
	$("#current_func").text("用户查询");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"" + getLocationUrl()+"/admin/adminUserSearch/Index.json\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
}

/**
 * 用户信息查询
 */
function loadUserMessageList(){
	$("#current_func").text("用户信息查询");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"" + getLocationUrl()+"/admin/adminUserSearch/Indexs.json\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";

}

/**
 *订单查询
 */
function userSearch() {
	callSvr("adminUserSearch/UserSearch",$("#userSearch").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});
		}else{
				var table = new StringBuffer();
				table.append("<table id='data' border='0' cellpadding='0' cellspacing='0' class='list_table1'>");
				table.append("<tr><th width='6%'>姓名</th><th width='10%'>身份证号</th><th width='7%'>手机号</th>");
				table.append("<th width='8%'>商户订单号</th><th width='8%'>航空公司</th><th width='8%'>常旅客号</th>");
				if (data != null && typeof (data) != "undefined") {
					userData=data;
					for (var i = 0; i < data.length; i++) {
						if(i==9){
							break;
						}
						table.append("<tr class=\"tr\"><tD>");
						table.append(data[i].NAME);
						table.append("</td><tD>");
						table.append(data[i].CER_NO);
						table.append("</td><tD>");
						table.append(data[i].MOBILE_NO);
						table.append("</td><tD>");
						table.append(data[i].ORDER_NUMBER);
						table.append("</td><tD>");
						table.append(data[i].AIRLINE_COMP);
						table.append("</td><tD>");
						table.append(data[i].PASSENGER_CODE);
					}
					table.append("</table>");
					table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
					table.append("<li class=\"disabled\"><a href=\"#\" onclick=\"userMessageSearchflip(0);return false;\">首页</a></li>");
					table.append("<li class=\"disabled\"><span>上一页</span></li>");
					if(userData.length <= 10){
						table.append("<li class=\"disabled\"><span>下一页</span></li>");
					} else{
			            table.append("<li><a href=\"#\" onclick=\"userMessageSearchflip(1);return false;\">下一页</a></li>"); 
					}
		            table.append("<li class=\"disabled\"><span>共"+userData.length+"条记录</span></li></ul></div>");
		            var tableHTML = table.toString();
					document.getElementById("tableDiv").innerHTML = tableHTML;
				}
		}
	});
}

/**
 * 订单查询
 */
function userBillSearch(){
	userSearch();
}

/**
 * 订单查询翻页操作
 */
function userSearchflip(page){
	var table = new StringBuffer();
	table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table1'>");
	table.append("<tr><th width='6%'>姓名</th><th width='10%'>身份证号</th><th width='7%'>手机号</th>");
	table.append("<th width='8%'>商户订单号</th><th width='8%'>航空公司</th><th width='8%'>常旅客号</th>");
	//table.append("<th width='8%'>保单开始时间</th><th width='8%'>保单结束时间</th><th width='14%'>订单商品</th>");
	//table.append("<th width='5%'>保费</th><th width='7%'>下单时间</th><th width='8%'>订单来源</th><th width='8%'>状态</th></tr>");
		for (var i = page*10; i < userData.length; i++) {
			if(i==(page*10+10)){
				break;
			}
			table.append("<tr class=\"tr\"><tD>");
			table.append(userData[i].NAME);
			table.append("</td><tD>");
			table.append(userData[i].CER_NO);
			table.append("</td><tD>");
			table.append(userData[i].MOBILE_NO);
			table.append("</td><tD>");
			table.append(userData[i].ORDER_NUMBER);
			table.append("</td><tD>");
			table.append(userData[i].AIRLINE_COMP);
			table.append("</td><tD>");
			table.append(userData[i].PASSENGER_CODE);
		}
		table.append("</table>");
		table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
		table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"userSearchflip(0);return false;\">首页</a></li>");
		if(page==0){
			table.append("<li class=\"disabled\"><span>上一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"userSearchflip("+(page-1)+");return false;\">上一页</a></li>");
		}
		if((page+1)*10>userData.length || (page+1)*10==userData.length){
			table.append("<li class=\"disabled\"><span>下一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"userSearchflip("+(page+1)+");return false;\">下一页</a></li>");
		}
        table.append("<li class=\"disabled\"><span>共"+userData.length+"条记录</span></li></ul></div>");
		var tableHTML = table.toString();
		document.getElementById("tableDiv").innerHTML = tableHTML;
}


/**
 *用戶信息查询
 */
function userMessageSearch() {
	callSvr("adminUserSearch/UserMessageSearch",$("#userMessageSearch").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});
		}else{
				var table = new StringBuffer();
				table.append("<table id='data' border='0' cellpadding='0' cellspacing='0' class='list_table1'>");
				table.append("<tr><th width='16%'>姓名</th><th width='20%'>手机号</th>");
				table.append("<th width='18%'>出生日期</th><th width='24%'>邮箱地址</th>");
				if (data != null && typeof (data) != "undefined") {
					userData=data;
					for (var i = 0; i < data.length; i++) {
						if(i==9){
							break;
						}
						table.append("<tr class=\"tr\"><tD>");
						table.append(data[i].REALNAME);
						table.append("</td><tD>");
						table.append(data[i].MOBILENO);
						table.append("</td><tD>");
						table.append(data[i].BIRTYDAY);
						table.append("</td><tD>");
						table.append(data[i].EMAIL);
						table.append("</td></tr>");
						
					}
					table.append("</table>");
					table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
					table.append("<li class=\"disabled\"><a href=\"#\" onclick=\"userMessageSearchflip(0);return false;\">首页</a></li>");
					table.append("<li class=\"disabled\"><span>上一页</span></li>");
					if(userData.length <= 10){
						table.append("<li class=\"disabled\"><span>下一页</span></li>");
					} else{
			            table.append("<li><a href=\"#\" onclick=\"userMessageSearchflip(1);return false;\">下一页</a></li>"); 
					}
		            table.append("<li class=\"disabled\"><span>共"+userData.length+"条记录</span></li></ul></div>");
		            var tableHTML = table.toString();
					document.getElementById("tableDiv").innerHTML = tableHTML;
				}
		}
	});
}

/**
 * 用戶信息
 */
function userMessageBillSearch(){
	userMessageSearch();
}

/**
 * 用戶信息查询翻页操作
 */
function userMessageSearchflip(page){
	var table = new StringBuffer();
	table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table1'>");
	table.append("<tr><th width='16%'>姓名</th><th width='20%'>手机号</th>");
	table.append("<th width='18%'>出生日期</th><th width='24%'>邮箱地址</th></tr>");
		for (var i = page*10; i < userData.length; i++) {
			if(i==(page*10+10)){
				break;
			}
			table.append("<tr class=\"tr\"><tD>");
			table.append(userData[i].REALNAME);
			table.append("</td><tD>");
			table.append(userData[i].MOBILENO);
			table.append("</td><tD>");
			table.append(userData[i].BIRTYDAY);
			table.append("</td><tD>");
			table.append(userData[i].EMAIL);
			table.append("</td></tr>");
		}
		table.append("</table>");
		table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
		table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"userMessageSearchflip(0);return false;\">首页</a></li>");
		if(page==0){
			table.append("<li class=\"disabled\"><span>上一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"userMessageSearchflip("+(page-1)+");return false;\">上一页</a></li>");
		}
		if((page+1)*10>userData.length || (page+1)*10==userData.length){
			table.append("<li class=\"disabled\"><span>下一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"userMessageSearchflip("+(page+1)+");return false;\">下一页</a></li>");
		}
        table.append("<li class=\"disabled\"><span>共"+userData.length+"条记录</span></li></ul></div>");
		var tableHTML = table.toString();
		document.getElementById("tableDiv").innerHTML = tableHTML;
}

