<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>转盘奖励配置</title>
<link rel="stylesheet" href="<%=path%>/css/common.css">
<link rel="stylesheet" href="<%=path%>/css/main.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/js/core.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDrag.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/reward.js"></script>
<script type="text/javascript" src="<%=path%>/js/laydate/laydate.js"></script>
<script type="text/javascript" src="<%=path%>/js/layer/layer.js"></script>
<script type="text/javascript">
	$(function() {
		$(".list_table").colResizable({
			liveDrag : true,
			gripInnerHtml : "<div class='grip'></div>",
			draggingClass : "dragging",
			minWidth : 30
		});
	});
	
	$(document).ready(function (){
		
		callSvr("adminReward/rewardConfig", {"activityId":"${activityId}"}, function(data){
			if(data!=null && typeof(data)!="undefined"){
				var configs = data.rewardConfig; 

				var insuranceTypes = data.lstMst;
				for (var i = 0; i < insuranceTypes.length; i++)
				{
					$("#SPECIAL_INSURANCE").append("<option value="+data.lstMst[i].M_NAME+">"+data.lstMst[i].M_NAME+"</option>");
				}
				
				if(configs == null) {
					$("#btnAdd").hide();
					return;
				}
				
				for (var i = 0; i < configs.length; i ++){
					// 奖品数量
					var rewardNum = configs[i].REWARD_NUM;
					if (rewardNum == null)
					{
						rewardNum = "无限制";
					}
					// 剩余数量
					var surplusNum = configs[i].SURPLUS_NUM;
					if (surplusNum == null)
					{
						surplusNum = "无限制";
					}
					// 中奖条件
					var rewardCondition = configs[i].REWARD_CONDITION;
					if (rewardCondition == 0)
					{
						rewardCondition = "无限制";
					}
					else if (rewardCondition == 1)
					{
						rewardCondition = "活动期间购买过保险";
					}
					$("#configTable").append(
					"<tr>"+
					"<td>"+configs[i].REWARD_LEVEL+"</td>"+
					"<td>"+configs[i].REWARD_NAME+"</td>"+
					"<td>"+rewardNum+"</td>"+
					"<td>"+surplusNum+"</td>"+
					"<td>"+configs[i].REWARD_RATE+"</td>"+
					"<td>"+rewardCondition+"</td>"+
					"<td>"+
					"<input type='button' value='编辑' onclick='editReward("+configs[i].ID+")' class='btn btn82 btn_config'/>&nbsp;&nbsp;&nbsp;"+
					"<input type='button' value='删除' onclick='deleteReward("+configs[i].ID+")' class='btn btn82 btn_del'/>"+
					"</td>"+
					"</tr>"
					);
				}
				
				// 活动基本信息
				$("#ACTIVITY_ID").val(data.basicInfo.ID);
				$("#ACTIVITY_NAME").val(data.basicInfo.ACTIVITY_NAME);
				// 活动开始时间
				$("#START_TIME").val(data.startTime);
				// 活动结束时间
				$("#END_TIME").val(data.endTime);
				// 基本抽奖次数
				$("#BASIC_COUNT").val(data.basicInfo.BASIC_COUNT);
				// 购买保险后额外获得抽奖次数
				$("#EXTRA_COUNT").val(data.basicInfo.EXTRA_COUNT);
				// 购买特殊保险获得抽奖次数
				$("#SPECIAL_COUNT").val(data.basicInfo.SPECIAL_COUNT);
				// 活动规则
				$("#REWARD_RULE").val(data.basicInfo.REWARD_RULE);
				
				// 额外抽奖次数类型
				var extraType = data.basicInfo.EXTRA_TYPE;
				var extraTypes = $("#EXTRA_TYPE option");
				
				for (var i = 0; i < extraTypes.length; i ++)
				{
					if (extraTypes.eq(i).val() == extraType)
					{
						extraTypes.eq(i).attr("selected", "selected");
						break;
					}
				}
				
				// 险种类型
				var specialInsurance = data.basicInfo.SPECIAL_INSURANCE;
				var specialInsurances = $("#SPECIAL_INSURANCE option");
				
				for (var j = 0; j < specialInsurances.length; j ++)
				{
					if (specialInsurances.eq(j).val() == specialInsurance)
					{
						specialInsurances.eq(j).attr("selected", "selected");
						break;
					}
				}
				
				// 险种抽奖次数类型
				var specialType = data.basicInfo.SPECIAL_TYPE;
				var specialTypes = $("#SPECIAL_TYPE option");
				
				for (var m = 0; m < specialTypes.length; m ++)
				{
					if (specialTypes.eq(m).val() == specialType)
					{
						specialTypes.eq(m).attr("selected", "selected");
						break;
					}
				}
				
				// 活动开启状态
				var activityState = data.basicInfo.STATE;
				var activityStates = $("#ACTIVITY_STATE option");
				
				for (var n = 0 ; n < activityStates.length; n ++)
				{
					if (activityStates.eq(n).val() == activityState)
					{
						activityStates.eq(n).attr("selected", "selected");
						break;
					}
				}
				
				// 添加按钮控制
				if(null == data.basicInfo.ID || "" == data.basicInfo.ID)
				{
					$("#btnAdd").hide();
				} else{
					$("#btnAdd").show();
				}
			}
		});
	});
</script>

</head>
<c:set var="pageList" scope="page" value="${list}" />
<body>
	<c:if test="${err == 9}">
		<script type="text/javascript">
			Dialog.alert("提示：您没有登录或登录已超时！", function() {
				parent.location.href = "/Admin/login.html";
			});
		</script>
	</c:if>
	<div class="container">
		<label style="font-weight:bold; font-size:14px;">活动基本信息：</label>
		<div id="button" class="mt10">
			<form
				action=""
				name="queryForm" id="queryForm" method="post">
				<input type="hidden" name="ACTIVITY_ID" id="ACTIVITY_ID" value="${activityId}"/>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="search_table">
					<tr>
						<td style="width:100px;">活动名称：</td>
						<td style="width:300px;"><input type="text"
							id="ACTIVITY_NAME" name="ACTIVITY_NAME" class="input-text lh30" size="30" value=""
							style="width : 300px;"></td>
						<td style="width:100px;">状态：</td>
						<td style="width:300px;"><select name="ACTIVITY_STATE" id="ACTIVITY_STATE" style="width : 100px;" class="select">
								<option value="0">开启</option>
								<option value="1">关闭</option>
						</select></td>
						<td style="width:100px;">基本抽奖次数：</td>
						<td style="width:300px;"><input type="number"
							id="BASIC_COUNT" name="BASIC_COUNT" class="input-text lh30" size="30" value="1"
							style="width : 100px;"></td>
					</tr>
					<tr>
						<td style="width:100px;">活动开始时间：</td>
						<td style="width:300px;"><input type="text" name="START_TIME" id="START_TIME"
							 class="laydate-icon" size="30" value=""
							onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" readonly></td>
						<td style="width:100px;">活动结束时间：</td>
						<td><input type="text" name="END_TIME" id="END_TIME"
							class="laydate-icon" size="30" value=""
							onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" readonly></td>
						<td style="width:100px;">购买保险后额外获得次数：</td>
						<td style="width:100px;">
							<input type="number" name="EXTRA_COUNT" id="EXTRA_COUNT"
								class="input-text lh30" size="30" value="0" style="width : 100px;">
							&nbsp;&nbsp;&nbsp;
							<select name="EXTRA_TYPE" id="EXTRA_TYPE" style="width:100px;" class="select">
								<option value="0">单次</option>
								<option value="1">每次</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>特殊险种：</td>
						<td colspan="5">
							<select id="SPECIAL_INSURANCE" name="SPECIAL_INSURANCE" style="width:100px;" class="select">
								
							</select>
							&nbsp;&nbsp;&nbsp;
							获得抽奖机会：<input type="number" value="0" id="SPECIAL_COUNT" name="SPECIAL_COUNT" class="input-text lh30"/>
							&nbsp;&nbsp;&nbsp;
							<select name="SPECIAL_TYPE" id="SPECIAL_TYPE" style="width:100px;" class="select">
								<option value="0">单次</option>
								<option value="1">每次</option>
							</select>
						</td>
					</tr>
					<tr><td>抽奖规则</td><td colspan="5"><textarea id="REWARD_RULE" name="REWARD_RULE" class="comment" style="width:500px;height:80px;"></textarea></td></tr>
					<tr>
						<td colspan="6" class="td_right"><input type="button" name="button"
							onclick="saveRewardBasicInfo()" class="btn btn82 btn_save2"
							value="保存"></td>
					</tr>
				</table>
				<input type="hidden" name="pageNum" value="1">
			</form>
		</div>
		<br /><label style="font-weight:bold; font-size:14px;">奖项配置：</label>
		<input type="button" id="btnAdd" class="btn btn82 btn_add" style="float:right;margin-bottom:5px;"
			onclick="addRewardConfig()" value="添加" />
		<div id="table" class="mt10">
			<div class="box span10 oh">
				<form action="" id="form1" name="form1" method="post">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="list_table" id="configTable">
						<tr>
							<th width="8%">奖项等级</th>
							<th width="20%">奖项内容</th>
							<th width="8%">奖品数量</th>
							<th width="8%">剩余数量</th>
							<th width="8%">中奖概率</th>
							<th width="8%">中奖条件</th>
							<th width="18%"></th>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<br /> 
		<input type="button" name="btnBack" id="btnBack" onclick="gotoList()" class="btn btn_back btn82" value="返回"/>
	</div>
</body>
</html>