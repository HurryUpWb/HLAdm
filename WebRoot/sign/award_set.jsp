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
    
    <title>里程奖励设置</title>
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
			<form id="awardSetForm" name="awardSetForm" method="post" action="<%=basePath%>admin/adminAward/saveAwardSetting.json">
				<!-- 查询条件 -->
				<table class="search_table" width="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td class="td_right">活动期间：</td>
						<td colspan="3"><input type="text" name="START_TIME" id="START_TIME" class="laydate-icon"
							onclick="laydate()" value="${award.START_TIME }">&nbsp;~&nbsp;
							<input type="text" name="END_TIME" id="END_TIME" class="laydate-icon"
							onclick="laydate()" value="${award.END_TIME }"><span style="font-size:12px;color:#aaa;">&nbsp;&nbsp;未填则为无限制</span></td>
					</tr>
					<tr>
						<td class="td_right"><font color="red">*&nbsp;</font>重复规则：</td>
						<td colspan="3"><input type="text" name="PARAM_VALUE" id="PARAM_VALUE" class="input-text lh10" value="${award.PARAM_VALUE }" style="ime-mode:inactive" size="3" maxlength="3" />&nbsp;&nbsp;天内只能进行一次抽奖。</td>
					</tr>
					<tr>
						<td colspan="4" class="td_center"><input type="button"
							onclick="saveAwardSetting();" id="saveBtn"
							class="btn btn82 btn_save2" value="&nbsp;保存"></td>
					</tr>
				</table>
				<input type="hidden" value="MILEAGE_AWARD" name="PARAM_NAME" ID="PARAM_NAME"/>
				<input type="hidden" value="1" name="PARAM_TYPE" ID="PARAM_TYPE"/>
				<input type="hidden" value="${award.ID}" name="ID" ID="ID"/>
			</form>
		</div>
	</div>
</body>
</html>