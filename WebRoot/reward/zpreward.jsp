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
<title>中奖记录查询</title>
<link rel="stylesheet" href="<%=path%>/css/common.css">
<link rel="stylesheet" href="<%=path%>/css/main.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path %>/js/core.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDrag.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/reward.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function() {
		$(".list_table").colResizable({
			liveDrag : true,
			gripInnerHtml : "<div class='grip'></div>",
			draggingClass : "dragging",
			minWidth : 30
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
		<div id="button" class="mt10">
			<form
				action="admin/adminReward/getAllRewardRec.json?datetime=<%=new java.util.Date().getTime()%>>"
				name="rewardRecSearchForm" id="rewardRecSearchForm" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="search_table">
					<tr>
						<td style="width:100px;">活动ID</td>
						<td><input type="text" name="activityId" id="activityId" class="input-text lh30" size="10" value="${activityId}"></td>
						<td style="width:100px;">活动名称：</td>
						<td colspan="3"><input type="text" name="activityName"
							class="input-text lh50" size="50" value="${activityName}"></td>
					</tr>
					<tr>
						<td style="width:100px;">用户手机号：</td>
						<td><input type="text" name="MOBILE_NO"
							class="input-text lh30" size="30" value="${mobileNo}"></td>
						<td style="width:100px;">微信昵称：</td>
						<td colspan="3"><input type="text" name="WECHAT_NICK_NAME"
							class="input-text lh30" size="30" value="${wechatNickName}"></td>
					</tr>
					<tr>
						<td style="width:100px;">活动开始时间：</td>
						<td><input type="text" name="startTime" class="laydate-icon"
							onclick="laydate()" value="${startTime}"/></td>
						<td style="width:100px;">活动结束时间：</td>
						<td colspan="3"><input type="text" name="endTime" class="laydate-icon"
							onclick="laydate()" value="${endTime}"/></td>
					</tr>
				</table>
				<div id="button" class="mt10">
				   <input type="button" name="button"
							onclick="searchRewardRec()" class="btn btn82 btn_search"
							value="查询"> <input type="button" name="exportBtn"
							onclick="AutomateExcel('5');" class="btn btn82 btn_export"
							value="导出">
				</div>
				<input type="hidden" name="pageNum" value="1">
			</form>

		</div>
		<label style="float:right">共${counts}条</label>
		<div id="table" class="mt10">
			<div class="box span10 oh">
				<form action="" id="rewardRecForm" name="rewardRecForm" method="post">
					<table width="800px;" border="0" cellpadding="0" cellspacing="0"
						class="list_table">
						<tr>
							<!-- <th width="8%">ID</th>  -->
							<th width="10%">活动名称</th>
							<th width="8%">用户手机号</th>
							<th width="8%">用户微信昵称</th>
							<th width="8%">中奖级别</th>
							<th width="8%">航空公司</th>
							<th width="8%">常旅客号</th>
							<th width="14%">奖项名称</th>
							<th width="10%">中奖时间</th>
							<th width="10%">发放状态</th>
						</tr>
						<c:if test="${!empty list }">
							<c:forEach var="reward" items="${list.list}">
								<tr class="tr" style="height:40px;">
									<!-- <td>${reward.ID}</td>  -->
									<td>${reward.ACTIVITY_NAME}</td>
									<td>${reward.MOBILE_NO}</td>
									<td>${reward.WECHAT_NICK_NAME}</td>
									<td>${reward.REWARD_LEVEL}等奖</td>
									<td>${reward.AIRLINE_COMP}</td>
									<td>${reward.PASSENGER_CODE}</td>
									<td>${reward.REWARD_NAME}</td>
									<td>${reward.REWARD_TIME}</td>
									<td><c:if test="${reward.STATE == 0}">未发放</c:if> <c:if
											test="${reward.STATE == 1}">已发放</c:if></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</form>

				<c:if test="${pageList.totalRow>0}">
					<div class="page mt10">
						<div class="pagination">
							<c:set var="pageNumber" scope="request"
								value="${pageList.pageNumber}" />
							<c:set var="pageSize" scope="request"
								value="${pageList.pageSize}" />
							<c:set var="totalPage" scope="request"
								value="${pageList.totalPage}" />
							<c:set var="totalRow" scope="request"
								value="${pageList.totalRow}" />
							<c:set var="formName" scope="request"
								value="rewardRecSearchForm" />
							<c:set var="pageUrl" scope="request"
								value="admin/adminReward/getAllRewardRec.json/?pageNum=" />
							<jsp:include page="/page.jsp" />
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>