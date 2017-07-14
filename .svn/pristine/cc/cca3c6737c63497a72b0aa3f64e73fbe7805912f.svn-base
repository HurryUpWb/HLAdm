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
<title>摇奖活动一览</title>
<link rel="stylesheet" href="<%=path%>/css/common.css">
<link rel="stylesheet" href="<%=path%>/css/main.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path %>/js/core.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDrag.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/reward.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function() {

		$(document).ready(function (){
			// 活动状态
			var state = "${state}";
			var states = $("#ACTIVITY_STATE option");
			
			for (var i = 0; i < states.length; i ++)
			{
				if (states.eq(i).val() == state)
				{
					states.eq(i).attr("selected", "selected");
					break;
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
		<div id="button" class="mt10">
			<form
				action="admin/adminReward/getAllRewardConfigRec.json?datetime=<%=new java.util.Date().getTime()%>>"
				name="rewardConfigSearchForm" id="rewardConfigSearchForm" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="search_table">
					<tr>
						<td>活动名称：</td>
						<td colspan="5"><input type="text" name="activityName"
							class="input-text lh30" size="60" value="${activityName}"></td>
					</tr>
					<tr>
						<td>活动开始时间：</td>
						<td><input type="text" name="startTime" class="laydate-icon"
							onclick="laydate()" value="${startTime}"/></td>
						<td>活动结束时间：</td>
						<td><input type="text" name="endTime" class="laydate-icon"
							onclick="laydate()" value="${endTime}"/></td>
						<td>状态：</td>
						<td><select name="state" id="ACTIVITY_STATE" class="select">
							<option value="">全部</option>
							<option value="0">开启</option>
							<option value="1">关闭</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="6" class="td_right"><input type="button" name="button"
							onclick="searchRewardConfig()" class="btn btn82 btn_search"
							value="查询"></td>
					</tr>
				</table>
				<input type="hidden" name="pageNum" value="1">
			</form>

		</div>
		<div id="button" class="mt10">
		<input type="button" class="btn btn82 btn_add"
			onclick="editRewardConfig('')" value="添加" />
			</div>
		<div id="table" class="mt10">
			<div class="box span10 oh">
				<form action="" id="rewardRecForm" name="rewardRecForm" method="post">
					<table width="800px;" border="0" cellpadding="0" cellspacing="0"
						class="list_table">
						<tr>
							<!-- <th width="8%">ID</th>  -->
							<th width="8%">活动ID</th>
							<th width="32%">活动名称</th>
							<th width="15%">开始时间</th>
							<th width="15%">结束时间</th>
							<th width="10%">当前状态</th>
							<th width="20%">操作</th>
						</tr>
						<c:if test="${!empty list }">
							<c:forEach var="reward" items="${list.list}">
								<tr class="tr" style="height:40px;">
									<td class="td_center">${reward.ID}</td>
									<td>${reward.ACTIVITY_NAME}</td>
									<td>${reward.START_TIME}</td>
									<td>${reward.END_TIME}</td>
									<td class="td_center"><c:if test="${reward.STATE == 0}">开启</c:if> <c:if
											test="${reward.STATE == 1}">关闭</c:if></td>
									<td><input type='button' value='编辑' onclick='editRewardConfig("${reward.ID}")' class='btn btn82 btn_config'/>&nbsp;&nbsp;
									<input type='button' value='记录' onclick='showRec("${reward.ID}")' class='btn btn82 btn_search'/>&nbsp;&nbsp;
									<input type="button" value="链接" onclick='zprewardHref("${reward.ID}","<%=path %>");return false;' class='btn btn82 btn_exPort'/></td>
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
							<c:set var="pageUrl" scope="request"
								value="admin/adminReward/getAllRewardConfigRec.json/?pageNum=" />
							<jsp:include page="/page.jsp" />
						
							<div style="float:right;margin-top:5px;margin-right:15px;">共${counts}条</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>