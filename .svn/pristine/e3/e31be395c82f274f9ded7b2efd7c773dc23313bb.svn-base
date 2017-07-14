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
    
    <title>订单查询</title>
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/main.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/core.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
    <script type="text/javascript" src="<%=path %>/js/main.js?tm=<%=new java.util.Date().getTime()%>"></script>
    <script type="text/javascript" src="<%=path %>/js/order.js?tm=<%=new java.util.Date().getTime()%>"></script>
    <script type="text/javascript" src="<%=path %>/js/user.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDrag.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDialog.js"></script>   
    <script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script> 
   <script type="text/javascript">
      $(function(){  
        $(".list_table1").colResizable({
          liveDrag:true,
          gripInnerHtml:"<div class='grip'></div>", 
          draggingClass:"dragging", 
          minWidth:30
        }); 
      });
   </script>
   <style>
   .list_table1 td{text-align:center}
   </style>
  </head>

<body>
	<div class="container">
		
		<div id="search_bar" class="mt10">
			<form id="userSearch" name="userSearch" method="post">
				<!-- 查询条件 -->
				<table class="search_table" width="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>手机号：</td>
						<td><input type="text" name="MOBILE_NO"
							class="input-text lh30" value="" size="30"></td>
						<td>身份证：</td>
						<td><input type="text" name="CER_NO"
							class="input-text lh30" value="" size="30"></td>
						<td>姓名：</td>
						<td><input type="text" name="NAME"
							class="input-text lh30" value="" size="30"></td>
					</tr>
				</table>
				<input type="hidden" name="type" value="4">
				<div id="button" class="mt10"><input type="button"
							onclick="userBillSearch();" name="searchBtn"
							class="btn btn82 btn_search" value="查询"> &nbsp;&nbsp;</div>
							<!-- <input
							type="button" onclick="AutomateExcel('99');" name="exportBtn"
							class="btn btn82 btn_export" value="导出"> -->
			</form>
			<!-- 订单列表 -->
			<div id="table" class="mt10">
				<div id="tableDiv">
					<table id="data" width="100%" border="0" cellpadding="0"
						cellspacing="0" class="list_table1">
						<tr>
							<th width="8%">姓名</th>
							<th width="10%">身份证号</th>
							<th width="8%">手机号</th>
							<th width="8%">商户订单号</th>
							<th width="8%">航空公司</th>
							<th width="8%">常旅客号</th>
							<!-- <th width="8%">保单开始时间</th>
							<th width="8%">保单结束时间</th>
							<th width="14%">订单商品</th>
							<th width="8%">保费(元)</th>
							<th width="10%">下单时间</th>
							<th width="8%">订单来源</th>
							<th width="8%">状态</th> -->
						</tr>
						<tbody id="billContent"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>