var mileageData;
/**
 * 加载里程签到查询
 */
function loadMileageList() {
	// 当前位置设定
	$("#current_func").text("里程签到查询");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"" + getLocationUrl()+"/admin/adminMileageSign/Index.json\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
}
/**
 * 里程数查询
 */
function SearchMileage() {
	callSvr("adminMileageSign/signRec",$("#mileageForm").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});
		}else{
				var table = new StringBuffer();
				table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
				table.append("<tr><th width='15%'>姓名</th><th width='10%'>手机号码</th><th width='10%'>航空公司</th>");
				table.append("<th width='15%'>常旅客号</th><th width='15%'>本次获得里程（公里）</th><th width='10%'>奖励平台</th><th width='10%'>奖励方式</th><th width='15%'>签到时间</th></tr>");
				if (data != null && typeof (data) != "undefined") {
					mileageData=data;
					for (var i = 0; i < data.length; i++) {
						table.append("<tr><tD>");
						table.append(data[i].USER_NAME);
						table.append("</td><tD>");
						table.append(data[i].MOBILE_NO);
						table.append("</td><tD>");
						table.append(data[i].AIRLINE_COMP);
						table.append("</td><tD>");
						table.append(data[i].PASSENGER_CODE);
						table.append("</td><tD>");
						table.append(data[i].MILEAGE);
						table.append("</td><tD>");
						if("1" == mileageData[i].CLIENT_TYPE) {
							table.append("支付宝");
						} else if("2" == mileageData[i].CLIENT_TYPE) {
							table.append("微信");
						} else{
							table.append(mileageData[i].CLIENT_TYPE);	
						}
						table.append("</td><tD>");
						if(mileageData[i].MTYPE == null || "" == mileageData[i].MTYPE ||
								"0" == mileageData[i].MTYPE) {
							table.append("里程签到");
						} else if("1" == mileageData[i].MTYPE) {
							table.append("里程抽奖");
						} else{
							table.append("未知");	
						}
						table.append("</td><tD>");
						table.append(data[i].SIGN_TIME);
						table.append("</td></tr>");
						if(i==9){
							break;
						}
					}
					table.append("</table>");
					table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
					table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"mileageflip(0);return false;\">首页</a></li>");
					table.append("<li class=\"disabled\"><span>上一页</span></li>");
					if(mileageData.length <= 10){
						table.append("<li class=\"disabled\"><span>下一页</span></li>");
					} else{
			            table.append("<li><a href=\"#\" onclick=\"mileageflip(1);return false;\">下一页</a></li>"); 
					}
		            table.append("<li class=\"disabled\"><span>共"+mileageData.length+"条记录</span></li></ul></div>");
		            var tableHTML = table.toString();
					document.getElementById("tableDiv").innerHTML = tableHTML;
				}
		}
	});
}

/**
 * 里程数查询
 */
function mileageSearch(){
	SearchMileage();
}

function mileageCount() {
	callSvr("adminMileageSign/countMileage",$("#mileageForm").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});
		}else{
				var table = new StringBuffer();
				table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
				table.append("<tr><th width='10%'>姓名</th><th width='10%'>手机号码</th><th width='10%'>航空公司</th>");
				table.append("<th width='15%'>常旅客号</th><th width='15%'>获得里程（公里）</th><th width='10%'>奖励次数</th><th width='10%'>奖励平台</th><th width='10%'>奖励方式</th><th width='10%'>最后签到时间</th></tr>");
				if (data != null && typeof (data) != "undefined") {
					mileageData=data;
					for (var i = 0; i < data.length; i++) {
						table.append("<tr><tD>");
						table.append(data[i].USER_NAME);
						table.append("</td><tD>");
						table.append(data[i].MOBILE_NO);
						table.append("</td><tD>");
						table.append(data[i].AIRLINE_COMP);
						table.append("</td><tD>");
						table.append(data[i].PASSENGER_CODE);
						table.append("</td><tD>");
						table.append(data[i].MILEAGE_COUNT);
						table.append("</td><tD>");
						table.append(data[i].SIGN_COUNT);
						table.append("</td><tD>");
						if("1" == mileageData[i].CLIENT_TYPE) {
							table.append("支付宝");
						} else if("2" == mileageData[i].CLIENT_TYPE) {
							table.append("微信");
						} else{
							table.append(mileageData[i].CLIENT_TYPE);	
						}
						table.append("</td><tD>");
						if(data[i].MTYPE == null || "" == data[i].MTYPE ||
								"0" == data[i].MTYPE) {
							table.append("里程签到");
						} else if("1" == data[i].MTYPE) {
							table.append("里程抽奖");
						} else{
							table.append("未知");	
						}
						table.append("</td><tD>");
						table.append(data[i].SIGN_TIME);
						table.append("</td></tr>");
						if(i==9){
							break;
						}
					}
					table.append("</table>");
					table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
					table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"mileageCountflip(0);return false;\">首页</a></li>");
					table.append("<li class=\"disabled\"><span>上一页</span></li>");
					if(mileageData.length <= 10){
						table.append("<li class=\"disabled\"><span>下一页</span></li>");
					} else{
			            table.append("<li><a href=\"#\" onclick=\"mileageCountflip(1);return false;\">下一页</a></li>"); 
					}
		            table.append("<li class=\"disabled\"><span>共"+mileageData.length+"条记录</span></li></ul></div>");
		            var tableHTML = table.toString();
					document.getElementById("tableDiv").innerHTML = tableHTML;
				}
		}
	});
}

/**
 * 里程数翻页操作
 */
function mileageflip(page){
	var table = new StringBuffer();
	table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
	table.append("<tr><th width='15%'>姓名</th><th width='10%'>手机号码</th><th width='10%'>航空公司</th>");
	table.append("<th width='15%'>常旅客号</th><th width='15%'>本次获得里程（公里）</th><th width='10%'>奖励平台</th><th width='10%'>奖励方式</th><th width='15%'>签到时间</th></tr>");
		for (var i = page*10; i < mileageData.length; i++) {
			if(i==(page*10+10)){
				break;
			}
			table.append("<tr><tD>");
			table.append(mileageData[i].USER_NAME);
			table.append("</td><tD>");
			table.append(mileageData[i].MOBILE_NO);
			table.append("</td><tD>");
			table.append(mileageData[i].AIRLINE_COMP);
			table.append("</td><tD>");
			table.append(mileageData[i].PASSENGER_CODE);
			table.append("</td><tD>");
			table.append(mileageData[i].MILEAGE);
			table.append("</td><tD>");
			if("1" == mileageData[i].CLIENT_TYPE) {
				table.append("支付宝");
			} else if("2" == mileageData[i].CLIENT_TYPE) {
				table.append("微信");
			} else{
				table.append(mileageData[i].CLIENT_TYPE);	
			}
			table.append("</td><tD>");
			if(mileageData[i].MTYPE == null || "" == mileageData[i].MTYPE ||
					"0" == mileageData[i].MTYPE) {
				table.append("里程签到");
			} else if("1" == mileageData[i].MTYPE) {
				table.append("里程抽奖");
			} else{
				table.append("未知");	
			}
			table.append("</td><tD>");
			table.append(mileageData[i].SIGN_TIME);
			table.append("</td></tr>");
		}
		table.append("</table>");
		table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
		table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"mileageflip(0);return false;\">首页</a></li>");
		if(page==0){
			table.append("<li class=\"disabled\"><span>上一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"mileageflip("+(page-1)+");return false;\">上一页</a></li>");
		}
		if((page+1)*10>mileageData.length || (page+1)*10==mileageData.length){
			table.append("<li class=\"disabled\"><span>下一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"mileageflip("+(page+1)+");return false;\">下一页</a></li>");
		}
        table.append("<li class=\"disabled\"><span>共"+mileageData.length+"条记录</span></li></ul></div>");
		var tableHTML = table.toString();
		document.getElementById("tableDiv").innerHTML = tableHTML;
}


/**
 * 里程数翻页操作
 */
function mileageCountflip(page){
	var table = new StringBuffer();
	table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
	table.append("<tr><th width='10%'>姓名</th><th width='10%'>手机号码</th><th width='10%'>航空公司</th>");
	table.append("<th width='15%'>常旅客号</th><th width='15%'>获得里程（公里）</th><th width='10%'>奖励次数</th><th width='10%'>奖励平台</th><th width='10%'>奖励方式</th><th width='10%'>最后签到时间</th></tr>");
		for (var i = page*10; i < mileageData.length; i++) {
			if(i==(page*10+10)){
				break;
			}
			table.append("<tr><tD>");
			table.append(mileageData[i].USER_NAME);
			table.append("</td><tD>");
			table.append(mileageData[i].MOBILE_NO);
			table.append("</td><tD>");
			table.append(mileageData[i].AIRLINE_COMP);
			table.append("</td><tD>");
			table.append(mileageData[i].PASSENGER_CODE);
			table.append("</td><tD>");
			table.append(mileageData[i].MILEAGE_COUNT);
			table.append("</td><tD>");
			table.append(mileageData[i].SIGN_COUNT);
			table.append("</td><tD>");
			if("1" == mileageData[i].CLIENT_TYPE) {
				table.append("支付宝");
			} else if("2" == mileageData[i].CLIENT_TYPE) {
				table.append("微信");
			} else{
				table.append(mileageData[i].CLIENT_TYPE);	
			}
			table.append("</td><tD>");
			if(mileageData[i].MTYPE == null || "" == mileageData[i].MTYPE ||
					"0" == mileageData[i].MTYPE) {
				table.append("里程签到");
			} else if("1" == mileageData[i].MTYPE) {
				table.append("里程抽奖");
			} else{
				table.append("未知");	
			}
			table.append("</td><tD>");
			table.append(mileageData[i].SIGN_TIME);
			table.append("</td></tr>");
		}
		table.append("</table>");
		table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
		table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"mileageCountflip(0);return false;\">首页</a></li>");
		if(page==0){
			table.append("<li class=\"disabled\"><span>上一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"mileageCountflip("+(page-1)+");return false;\">上一页</a></li>");
		}
		if((page+1)*10>mileageData.length || (page+1)*10==mileageData.length){
			table.append("<li class=\"disabled\"><span>下一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"mileageCountflip("+(page+1)+");return false;\">下一页</a></li>");
		}
        table.append("<li class=\"disabled\"><span>共"+mileageData.length+"条记录</span></li></ul></div>");
		var tableHTML = table.toString();
		document.getElementById("tableDiv").innerHTML = tableHTML;
}