<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>基础属性编辑</title>
<link rel="stylesheet" href="<%=path%>/css/common.css">
<link rel="stylesheet" href="<%=path%>/css/main.css">
<link rel="stylesheet" href="<%=path%>/css/button.css">
<link rel="stylesheet" href="<%=path%>/css/jquery-ui.css">
<link rel="stylesheet" href="<%=path%>/css/admin.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/core.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
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
			<form name="mstAddForm" id="mstAddForm" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="search_table">
					<tr>
						<td colspan="2" bgcolor="#eeeeee"><label
							style="font-weight:bold; font-size:14px;">基础属性编辑</label></td>
					</tr>
					<tr>
						<td width="170" align="right">基础属性名称</td>
						<td><input type="text" id="M_NAME" name="M_NAME"
							value="${mstModel.M_NAME }" class="input-text lh30"
							size="45" />&nbsp;&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td width="170" align="right">属性表示顺序</td>
						<td><input type="text" id="M_DISP_ORDER" name="M_DISP_ORDER"
							value="${mstModel.M_DISP_ORDER }" class="input-text lh30"
							size="45"
							onchange="if(/[^\d\.]/g.test(this.value)){Dialog.alert('提示：只能输入数字!');this.value='';}" />
							&nbsp;&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td width="170" align="right">基础属性类型</td>
						<td><select id="M_TYPE" name="M_TYPE"
							class="select-control">

								<option value="">--请选择--</option>

								<option value="M0001"  <c:if test="${mstModel.M_TYPE == 'M0001' }">selected</c:if>>航空险</option>

						</select>&nbsp;&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td colspan="2" align="left" style="padding-left:200px;"><input
							type="button" name="button"
							onclick="mstAddOrUpdate();return false;"
							class="btn btn82 btn_save2" value="保存">
						</td>
					</tr>
				</table>
				<input type="hidden" name="M_CODE" id="M_CODE" value="${mstModel.M_CODE}">
			</form>
		</div>
		<br /> <input type="button" name="btnBack" id="btnBack"
			onclick="backMst();return false;" class="btn btn_back btn82"
			value="返回" />
	</div>
</body>
</html>