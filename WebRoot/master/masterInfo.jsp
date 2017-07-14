<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>基础属性列表</title>
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
<script type="text/javascript" src="<%=path%>/js/masterInfo.js"></script>
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
			<form id="mstInfoForm" name="mstInfoForm" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="search_table">
					<tr>
						<td width="10%" class="td_left">属性类型：</td>
						<td>
						  <input type="text" class="input-text lh30"
							size="35" name="m_type_name" id="m_name" value="${m_type_name }">
						</td>
					</tr>
                    <input id="hiddenText" type="text" style="display:none" />
					<tr>
						<td colspan="2" class="td_center"><input type="button"
							name="button" onclick="mstTypeSearch();"
							class="btn btn82 btn_search" value="查询">
						</td>
					</tr>
				</table>
			</form>
		</div>
		
       <div id="button" class="mt10">
			<input type="button" name="button" class="btn btn82 btn_add"
				style="float:left;margin-bottom:5px;margin-top:5px;"
				onclick="mstTypeToAdd();" value="添加">
       </div>
       
		<div id="table" class="mt10">
			<div class="box span10 oh">
				<form id="form1" name="form1" method="post">
					<table width="100%" border="0" cellpadding="4" cellspacing="0"
						class="list_table">
						<tr>
							<th width="20%">属性编码</th>
							<th width="20%">属性类型</th>
							<th width="20%">属性说明</th>
							<th width="20%">创建时间</th>
							<th width="10%">编辑</th>
							<th width="10%">删除</th>
						</tr>
						<c:if test="${!empty list }">
							<c:forEach var="mst" items="${list.list}">
								<tr>
									<td>&nbsp;&nbsp;${mst.M_TYPE_CODE}</td>
									<td>&nbsp;&nbsp;${mst.M_TYPE_NAME}</td>
									<td>&nbsp;&nbsp;${mst.TYPE_INFO}</td>
									<td>&nbsp;&nbsp;${fn:substring(mst.CREATE_TIME, 0, 19)}</td>
									<td class="td_center">&nbsp;&nbsp; <input type="button"
										name="button" class="btn btn82 btn_config"
										onclick="mstTypeToUpdate('${mst.ID}');return false" value="编辑">
									</td>
									<td class="td_center"><input type="button" name="button"
										class="btn btn82 btn_del" onclick="mstTypeDalete('${mst.ID}');" value="删除">
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
					<input type="hidden" id="id" name="id">
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
								value="admin/masertInfo/mstTypeList.json?pageNum=" />
							<jsp:include page="/page.jsp" />
							<div style="float:right;margin-top:5px;margin-right:15px;">共${pageList.totalRow}条</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>