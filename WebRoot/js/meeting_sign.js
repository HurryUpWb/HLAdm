
/**
 * 会议查询
 */
function meetingSignSearch() {
	$("#current_func").text("会议签到查询");
	callSvr("adminMeetingSign/MeetingSignRec","",function(data) {
		if(null != data.err && data.err == 9){
			Dialog.alert("提示：您没有登录或登录已超时！",function(){location.href = "/Admin/login.html";});
		}else{
				var table = new StringBuffer();
				table.append("<div class=\"container\"><div id=\"button\" class=\"mt10\"><form name=\"meetingForm\" id=\"meetingForm\" method=\"post\"><input type=\"button\"  onclick=\"AutomateExcel('3');\" name=\"button\" class=\"btn btn82 btn_export\" value=\"导出\"></form>");
				table.append("</div><div id=\"search_bar\" class=\"mt10\"></div><div id=\"table\" class=\"mt10\"><div id=\"tableDiv\">");
				table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
				table.append("<tr><th width='15%'>姓名</th><th width='15%'>工作单位</th><th width='10%'>返程航班号</th>");
				table.append("<th width='10%'>会议日期</th><th width='15%'>签到时间</th></tr>");
				if (data != null && typeof (data) != "undefined") {
					pointData=data;
					for (var i = 0; i < data.length; i++) {
						table.append("</td><tD>");
						table.append(data[i].USER_NAME);
						table.append("</td><tD>");
						table.append(data[i].AIRLINE_COMPANY_NAME);
						table.append("</td><tD>");
						table.append(data[i].FLIGHT_NO);
						table.append("</td><tD>");
						table.append(data[i].MEETING_DATE);
						table.append("</td><tD>");
						table.append(data[i].UPDATE_TIME);
						table.append("</td></tr>");
						if(i==9){
							break;
						}
					}
					table.append("</table>");
					table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
					table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"meetingSignSearch()\">首页</a></li>");
					table.append("<li class=\"disabled\"><span>上一页</span></li>");
		            table.append("<li><a href=\"#\" onclick=\"meetingSignflip(1)\">下一页</a></li>"); 
		            table.append("<li class=\"disabled\"><span>共"+pointData.length+"条记录</span></li></ul></div></div>");
					table.append("</div></div></div>");
		            var tableHTML = table.toString();
					document.getElementById("main").innerHTML = tableHTML;
				}
		}
	});
}

/**
 * 会议查询翻页操作
 */
function meetingSignflip(page){
	var table = new StringBuffer();
	table.append("<div class=\"container\"><div id=\"button\" class=\"mt10\"><form name=\"meetingForm\" id=\"meetingForm\" method=\"post\"><input type=\"button\"  onclick=\"AutomateExcel('3');\" name=\"button\" class=\"btn btn82 btn_export\" value=\"导出\"></form>");
	table.append("</div><div id=\"search_bar\" class=\"mt10\"></div><div id=\"table\" class=\"mt10\"><div id=\"tableDiv\">");
	table.append("<table id='data' width='100%' border='0' cellpadding='0' cellspacing='0' class='list_table'>");
	table.append("<tr><th width='15%'>姓名</th><th width='15%'>工作单位</th><th width='10%'>返程航班号</th>");
	table.append("<th width='10%'>会议日期</th><th width='15%'>签到时间</th></tr>");
		for (var i = page*10; i < pointData.length; i++) {
			if(i==(page*10+10)){
				break;
			}
			table.append("</td><tD>");
			table.append(pointData[i].USER_NAME);
			table.append("</td><tD>");
			table.append(pointData[i].AIRLINE_COMPANY_NAME);
			table.append("</td><tD>");
			table.append(pointData[i].FLIGHT_NO);
			table.append("</td><tD>");
			table.append(pointData[i].MEETING_DATE);
			table.append("</td><tD>");
			table.append(pointData[i].UPDATE_TIME);
			table.append("</td></tr>");
		}
		table.append("</table>");
		table.append("<div class=\"page mt10\"><div class=\"pagination\"><ul>");
		table.append("<li class=\"first-child\"><a href=\"#\" onclick=\"meetingSignSearch()\">首页</a></li>");
		if(page==0){
			table.append("<li class=\"disabled\"><span>上一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"meetingSignflip("+(page-1)+")\">上一页</a></li>");
		}
		if((page+1)*10>pointData.length || (page+1)*10==pointData.length){
			table.append("<li class=\"disabled\"><span>下一页</span></li>");
		}else{
			table.append("<li><a href=\"#\" onclick=\"meetingSignflip("+(page+1)+")\">下一页</a></li>");
		}
        table.append("<li class=\"disabled\"><span>共"+pointData.length+"条记录</span></li></ul></div></div>");
        table.append("</div></div></div>");
		var tableHTML = table.toString();
		document.getElementById("main").innerHTML = tableHTML;
}