<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>产品列表</title>
<link rel="stylesheet" href="<%=path%>/css/common.css">
<link rel="stylesheet" href="<%=path%>/css/main.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/colResizable-1.3.min.js"></script>
<link rel="stylesheet" href="<%=path%>/css/admin.css">
<link rel="stylesheet" href="<%=path%>/css/button.css">
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/core.js"></script>
<script type="text/javascript" src="<%=path%>/js/productExport.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDrag.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/laydate/laydate.js"></script>

<script type="text/javascript">
	$(function() {
		$(".list_table").colResizable({
			liveDrag : true,
			gripInnerHtml : "<div class='grip'></div>",
			draggingClass : "dragging",
			minWidth : 30
		});
		$("#checkAll").click(function() {
			var flag = $(this).prop("checked");
			$("[id=checkId]:checkbox").each(function() {
				$(this).prop("checked", flag);
			});
		});
	});
</script>

</head>
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
			<form name="queryForm" id="queryForm" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="search_table">
					<tr>
						<td>保险类型:</td>
						<td><select style="width: 150px;" id="product_type" name="product_type"
							class="select-control">
								<option value="" <c:if test="${product_type == '' }">selected</c:if> >全部</option>
								<c:forEach items="${mastDate1}" var="item">
									<option value="${item.M_NAME}" <c:if test="${product_type == item.M_NAME }">selected</c:if> >${item.M_NAME}</option>
        						</c:forEach>
						</select>
						</td>
						<td>产品销售类型:</td>
						<td><select style="width: 150px;" id="client_type" name="client_type"
							class="select-control">
								<option value="" <c:if test="${client_type == '' }">selected</c:if> >全部</option>
		 						<c:forEach items="${mastDate}" var="item">
									<option value="${item.M_CODE}" <c:if test="${client_type == item.M_CODE }">selected</c:if> >${item.M_NAME}</option>
        						</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="td_right"><input type="button" name="button"
							onclick="queryProductExport();" class="btn btn82 btn_search"
							value="查询">
						</td>


					</tr>
				</table>
				<input type="hidden" name="pageNum" value="1">
			</form>

		</div>
		<div id="button" class="mt10">
		<input type="button" name="button" class="btn btn82 btn_exPort"
			onclick="exportZip();" value="导出">
			</div>
		<div id="table" class="mt10">
			<div class="box span10 oh">
				<form id="form1" name="form1" method="post">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="list_table">
						<tr>
							<th width="5%"><input type="checkbox" id="checkAll"
								name="checkAll" />
							</th>
							<th width="10%">ID</th>
							<th width="10%">产品名称</th>
							<th width="8%">产品价格</th>
							<th width="20%">产品简介</th>
							<th width="8%">产品销量</th>
							<th width="8%">是否送里程</th>
							<th width="10%">产品公司</th>
							<th width="10%">产品类型</th>
						</tr>
						<c:if test="${!empty list }">
							<c:forEach var="product" items="${list}">
								<tr>
									<td align="center"><input type="checkbox" id="checkId"
										name="checkId" value="${product.PRODUCT_ID}" /></td>
									<td style="padding-left:10px!important">${product.PRODUCT_ID}</td>
									<td style="padding-left:10px!important">${product.PRODUCT_TITLE}</td>
									<td style="padding-left:10px!important">${product.PRODUCT_PRICE}</td>
									<td style="padding-left:10px!important">${product.PRODUCT_EXPLAN}</td>
									<td style="padding-left:10px!important">
									<c:if test="${product.CLIENT_TYPE == null}">
				                    <c:if test="${product.PRODUCT_SALES_TYPE =='0' }">ATM机销售</c:if>
								    <c:if test="${product.PRODUCT_SALES_TYPE =='1' }">其它</c:if>
								    <c:if test="${product.PRODUCT_SALES_TYPE =='2' }">微信</c:if>
								    <c:if test="${product.PRODUCT_SALES_TYPE =='3' }">移动端</c:if>
								    <c:if test="${product.PRODUCT_SALES_TYPE =='4' }">国航E平台</c:if>
								   	</c:if>
								    <c:if test="${product.CLIENT_TYPE != null}">
							   		<c:forEach items="${mastDate}" var="item">
									<c:if test="${fn:contains(product.CLIENT_TYPE,item.M_CODE)}"><text type="text" name="CLIENT_TYPE" id="CLIENT_TYPE" >${item.M_NAME}<br></c:if>
		        					</c:forEach>
			        				</c:if>
        							</td>
									<td style="padding-left:10px!important">${product.SEND_MILEAGE}<c:if
											test="${product.MILEAGE_TYPE == 1}">倍</c:if>
									</td>
									<td  style="padding-left:10px!important">${product.INSURANCE_COMPANY}</td>
									<td  style="padding-left:10px!important">${product.PRODUCT_TYPE}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>