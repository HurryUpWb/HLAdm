var billData;
/**
 * 加载结算查询
 */
function loadSettlementList() {
	// 当前位置设定
	$("#current_func").text("查询");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"" + getLocationUrl()+"/settlement/settlement.jsp\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
}

/**
 *结算查询
 */
function settlementSearch() {
	callSvr("adminSettlementSearch/SettlementSearch",$("#settlementSearch").formToJson(),function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});
		}else{
				var table = new StringBuffer();
				table.append("<table id='data' width='800px;' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
				table.append("<tr><th width='3%'>投保人姓名</th><th width='8%'>证件号码</th><th width='8%'>产品名称</th>");
				table.append("<th width='6%'>保险公司名称</th><th width='6%'>险种</th><th width='8%'>机场</th><th width='3%'>保费</th>");
				
				if (data != null && typeof (data) != "undefined") {
					billData=data;
					for (var i = 0; i < data.length; i++) {
						if(i==10){
							break;
						}
						table.append("<tr class=\"tr\"><tD>");
						table.append(data[i].NAME);
						table.append("</td><tD>");
						table.append(data[i].CER_NO);
						table.append("</td><tD>");
						table.append(data[i].PRODUCT_TITLE);
						table.append("</td><tD>");
						
						
						table.append(data[i].INSURANCE_COMPANY);
						table.append("</td><tD>");
						table.append(data[i].PRODUCT_TYPE);
						table.append("</td><tD>");
						table.append(data[i].OFFICE_NAME);
						table.append("</td><tD>");
						table.append(data[i].PRODUCT_PRICE);
						table.append("</td></tr>");
					}
					table.append("</table>");
					table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
					table.append("<li class=\"disabled\"><a href=\"#\" onclick=\"settlementSearchflip(0);return false;\">首页</a></li>");
					table.append("<li class=\"disabled\"><span>上一页</span></li>");
					if(billData.length <= 10){
						table.append("<li class=\"disabled\"><span>下一页</span></li>");
					} else{
			            table.append("<li><a href=\"#\" onclick=\"settlementSearchflip(1);return false;\">下一页</a></li>"); 
					}
		            table.append("<li class=\"disabled\"><span>共"+billData.length+"条记录</span></li></ul></div>");
		            var tableHTML = table.toString();
					document.getElementById("tableDiv").innerHTML = tableHTML;
				}
		}
	});
}

/**
 * 结算查询
 */
function billSearch(){
	settlementSearch();
}

/**
 * 结算查询翻页操作
 */
function settlementSearchflip(page){
	var table = new StringBuffer();
	table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
	table.append("<tr><th width='3%'>投保人姓名</th><th width='8%'>证件号码</th><th width='8%'>产品名称</th>");
	table.append("<th width='6%'>保险公司名称</th><th width='6%'>险种</th><th width='8%'>机场</th><th width='3%'>保费</th>");
		for (var i = page*10; i < billData.length; i++) {
			if(i==(page*10+10)){
				break;
			}
			
			table.append("<tr class=\"tr\"><tD>");
			table.append(billData[i].NAME);
			table.append("</td><tD>");
			table.append(billData[i].CER_NO);
			table.append("</td><tD>");
			table.append(billData[i].PRODUCT_TITLE);
			table.append("</td><tD>");
			
			table.append(billData[i].INSURANCE_COMPANY);
			table.append("</td><tD>");
			table.append(billData[i].PRODUCT_TYPE);
			table.append("</td><tD>");
			table.append(billData[i].OFFICE_NAME);
			table.append("</td><tD>");
			table.append(billData[i].PRODUCT_PRICE);
			table.append("</td></tr>");
		}
		table.append("</table>");
		table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
		table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"settlementSearchflip(0);return false;\">首页</a></li>");
		if(page==0){
			table.append("<li class=\"disabled\"><span>上一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"settlementSearchflip("+(page-1)+");return false;\">上一页</a></li>");
		}
		if((page+1)*10>billData.length || (page+1)*10==billData.length){
			table.append("<li class=\"disabled\"><span>下一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"settlementSearchflip("+(page+1)+");return false;\">下一页</a></li>");
		}
        table.append("<li class=\"disabled\"><span>共"+billData.length+"条记录</span></li></ul></div>");
		var tableHTML = table.toString();
		document.getElementById("tableDiv").innerHTML = tableHTML;
}
