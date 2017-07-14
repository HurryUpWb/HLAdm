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
<title>atm列表</title>
<link rel="stylesheet" href="<%=path%>/css/common.css">
<link rel="stylesheet" href="<%=path%>/css/main.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/core.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDrag.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/atmExport.js"></script>
<script type="text/javascript" src="<%=path%>/js/laydate/laydate.js"></script>
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
 <c:set var="pageList" scope="page" value="${list}"/>
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
			<form name="atmExportForm" id="atmExportForm" method="post">

				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="search_table">
					<tr>
						<td width="10%">保险公司:</td>
						<td width="20%"><input type="text" name="companyname"
							class="input-text lh20" size="20" value="${companyname}">
						</td>
						<td width="10%">险种:</td>
						<td width="20%"><input type="text" name="product_type"
							class="input-text lh20" size="20" value="${product_type}">
						</td>
					</tr>
					<tr>
						<td width="60%" colspan="4" style="color: red;">*
							单独输入起始年月或者截止年月前者查后3个月后者查前3个月数据(包括本月)，两者输入查间隔时间数据（限制间隔时间不超过3个月）！</td>
					</tr>
					<tr>
						<td width="10%">起始年月:</td>
						<td width="20%"><input id="starTime" class="laydate-icon"
							onclick="laydate({istime: true, format: 'YYYYMM'})"
							name="starTime" type="text" value="${starTime}" /></td>
						<td width="10%">截止年月:</td>
						<td width="20%"><input id="endTime" name="endTime"
							type="text" class="laydate-icon"
							onclick="laydate({istime: true, format: 'YYYYMM'})"
							value="${endTime}" /></td>
					</tr>
					<tr>
						<td colspan="4"><input type="button" name="button"
							onclick="atmExportSearch();" class="btn btn82 btn_search"
							value="查询"> <input type="button" name="exportBtn"
							onclick="exPortCell();" class="btn btn82 btn_export" value="导出">
						</td>
					</tr>
				</table>
				<input type="hidden" name="pageNum" value="1">
			</form>

		</div>
		<div id="table" class="mt10">
			<div class="box span10 oh">
				<form id="form1" name="form1" method="post">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="list_table">
						<tr>
							<th width="15%">保险公司名称</th>
							<th width="10%">险种</th>
							<th width="14%">产品</th>
							<th width="8%">保费</th>
							<th width="8%">保费总额</th>
							<th width="8%">应收代理费</th>
							<th width="8%">应付机场服务费</th>
							<th width="8%">刷卡手续费</th>
							<th width="10%">机器编号</th>
							<th width="10%">年月</th>
						</tr>
						<c:if test="${!empty list }">
							<c:forEach var="product" items="${list.list}">
								<tr class="tr">
									<td>${product.INSURANCE_COMPANY}</td>
									<td>${product.PRODUCT_TYPE}</td>
									<td>${product.PRODUCT_TITLE}</td>
									<td>${product.PREMIUM}</td>
									<td>${product.TOTAL_PREMIUM}</td>
									<td>${product.AGENCY_FEE}</td>
									<td>${product.AIRPORT_SERVICE_CHARGE}</td>
									<td>${product.COMMISSION_CHARGE}</td>
									<td>${product.MACHINE_NUMBER}</td>
									<td>${product.TIME}</td>
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
							<c:set var="formName" scope="request" value="queryForm" />
							<c:set var="pageUrl" scope="request"
								value="admin/adminATM/atmExportSearch.json?pageNum=" />
							<jsp:include page="/page.jsp" />
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>