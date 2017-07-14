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
<title>属性类型编辑</title>
<link rel="stylesheet" href="<%=path%>/css/common.css">
<link rel="stylesheet" href="<%=path%>/css/main.css">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/core.js"></script>
<script type="text/javascript" src="<%=path%>/js/colResizable-1.3.min.js"></script>
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
		var tid=$("#id").val();
		if(tid!=null && tid!=""){
			$("#M_TYPE_CODE").css('visibility','visible')
		}
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
			<form name="mstTypeAddForm" id="mstTypeAddForm">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="search_table">
					<tr>
						<td colspan="2" bgcolor="#eeeeee"><label style="font-weight:bold; font-size:14px;">属性类型编辑</label></td>
					</tr>
					<tr>
						<td width="170" align="right">属性类型编码</td>
						<td><input type="text" id="M_TYPE_CODE" name="M_TYPE_CODE" value="${mstTypeModel.M_TYPE_CODE }" class="input-text lh30" size="45"  />&nbsp;&nbsp;<font color="red">*&nbsp;如：M0001</font></td>
					</tr>
					<tr>
						<td width="170" align="right">属性类型名称</td>
						<td><input type="text" id="M_TYPE_NAME" name="M_TYPE_NAME" value="${mstTypeModel.M_TYPE_NAME }" class="input-text lh30" size="45" />&nbsp;&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td width="170" align="right">属性说明</td>
						<td>
						<textarea  id="TYPE_INFO" name="TYPE_INFO" rows="10" cols="35">${mstTypeModel.TYPE_INFO }</textarea></td>
					</tr>
					<input id="hiddenText" type="text" style="display:none" />
					<tr>
						<td colspan="2" align="left" style="padding-left:200px;"><input
							type="button" name="button" onclick="mstTypeAdd();return false;" class="btn btn82 btn_save2" value="保存">
						</td>
					</tr>
				</table>
				<input type="hidden" name="id" id="id" value="${mstTypeModel.ID }">
			</form>
		</div>

		<br /> <label style="font-weight:bold; font-size:14px;">基础属性配置：</label>
		<br />
		<div id="button" class="mt10">
			<input type="button" name="button" class="btn btn82 btn_add"
				onclick="mstAddButton();return false;"
				value="添加">
		</div>
		<div id="table" class="mt10">
			<div class="box span10 oh">
				<form action="admin/adminProduct/productCatalog.json" id="form1"
					name="form1" method="post">

					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="list_table">
						<tr>
							<th width="22%">属性编码</th>
							<th width="22%">属性名称</th>
							<th width="22%">属性表示顺序</th>
							<th width="12%">编辑</th>
							<th width="12%">删除</th>
						</tr>
						<c:if test="${!empty list }">
							<c:forEach var="mstType" items="${list}">
								<tr>
									<td>&nbsp;&nbsp;${mstType.M_CODE}</td>
									<td>&nbsp;&nbsp;${mstType.M_NAME}</td>
									<td>&nbsp;&nbsp;${mstType.M_DISP_ORDER}</td>
									<td class="td_center">&nbsp;&nbsp; <input type="button"
										name="button" class="btn btn82 btn_config"
										onclick="mstToUpdate('${mstType.M_CODE}');return false"
										value="编辑"></td>
									<td class="td_center"><input type="button" name="button"
										class="btn btn82 btn_del"
										onclick="javascript:Dialog.confirm('警告：您确认要删除（${mstType.M_NAME}）基础属性吗？',function(){mstDelete(${mstType.M_CODE})});"
										value="删除">
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
					<input type="hidden" name="M_CODE" id="M_CODE" value="${M_CODE} }">
				</form>

			</div>
		</div>
		<br /> <input type="button" name="btnBack" id="btnBack"
			onclick="backMstType();return false;" class="btn btn_back btn82"
			value="返回" />
	</div>
</body>
</html>