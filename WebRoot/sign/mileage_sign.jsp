<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>里程签到查询</title>
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/main.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/core.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
    <script type="text/javascript" src="<%=path %>/js/main.js"></script>
    <script type="text/javascript" src="<%=path %>/js/mileage.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDrag.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDialog.js"></script>   
    <script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>

  </head>

<body>
	<div class="container">
		<div id="search_bar" class="mt10">
			<form id="mileageForm" name="mileageForm" method="post">
				<!-- 查询条件 -->
				<table class="search_table" width="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>开始时间：</td>
						<td><input type="text" name="START_TIME" class="laydate-icon"
							onclick="laydate()" value=""></td>
						<td>结束时间：</td>
						<td><input type="text" name="END_TIME" class="laydate-icon"
							onclick="laydate()" value=""></td>
						<td>奖励平台：</td>
						<td colspan="3"><select id="CLIENT_TYPE" name="CLIENT_TYPE" class="select">
						<option value="">全部</option>
						<option value="1">支付宝</option>
						<option value="2">微信</option>
						</select></td>
					</tr>
					<tr>
						<td>姓名：</td>
						<td><input type="text" name="USER_NAME"
							class="input-text lh30" value="" size="20"></td>
						<td>里程数：</td>
						<td><input type="text" name="MILEAGE_NUM"
							class="input-text lh30" value="" size="10"></td>
						<td>奖励方式：</td>
						<td><select id="MTYPE" name="MTYPE" class="select">
						<option value="">全部</option>
						<option value="0">里程签到</option>
						<option value="1">里程抽奖</option>
						</select></td>
						<td>签到次数：</td>
						<td><input type="text" name="SIGN_COUNT"
							class="input-text lh30" value="" size="10"></td>
					</tr>

				</table>
				<div id="button" class="mt10"><input type="button"
							onclick="mileageSearch();" name="searchBtn"
							class="btn btn82 btn_search" value="查询"> &nbsp;&nbsp;
							<input type="button"
							onclick="mileageCount();" name="countBtn"
							class="btn btn82 btn_count" value="统计"> &nbsp;&nbsp;
							<input
							type="button" onclick="AutomateExcel('2');" name="exportBtn"
							class="btn btn82 btn_export" value="导出"></div>
			</form>
			</div>
			<!-- 订单列表 -->
			<div id="table" class="mt10">
				<div id="tableDiv">
					<table id="data" width="100%" border="0" cellpadding="0"
						cellspacing="0" class="list_table">
						<tr>
							<th width='15%'>姓名</th>
							<th width='10%'>手机号码</th>
							<th width='10%'>航空公司</th>
							<th width='15%'>常旅客号</th>
							<th width='15%'>本次获得里程（公里）</th>
							<th width='10%'>奖励平台</th>
							<th width='10%'>奖励方式</th>
							<th width='15%'>签到时间</th>
						</tr>
						<tbody id="mileageContent"></tbody>
					</table>
				</div>
			</div>
		
	</div>
</body>
</html>