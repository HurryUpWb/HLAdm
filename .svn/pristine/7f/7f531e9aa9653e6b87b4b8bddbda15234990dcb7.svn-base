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
    
    <title>结算查询</title>
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/main.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/core.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
    <script type="text/javascript" src="<%=path %>/js/main.js"></script>
    <script type="text/javascript" src="<%=path %>/js/order.js"></script>
    <script type="text/javascript" src="<%=path %>/js/settlement.js"></script>
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

  </head>

<body>
	<div class="container">
		<div id="search_bar" class="mt10">
			<form id="settlementSearch" action="admin/adminSettlementSearch/Index.json" name="settlementSearch" method="post">
				<!-- 查询条件 -->
				<table class="search_table" width="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>保险公司名称：</td>
						<td><input type="text" name="INSURANCE_COMPANY"
							class="input-text lh30" value="" size="30"></td>
						<td>险种：</td>
						<td><input type="text" name="PRODUCT_TYPE"
							class="input-text lh30" value="" size="30"></td>
						<td>机场：</td>
						<td><input type="text" name="OFFICE_NAME"
							class="input-text lh30" value="" size="30"></td>
						
					</tr>
				</table>
				<div id="button" class="mt10">
				     <input type="button"
							onclick="billSearch();" name="searchBtn"
							class="btn btn82 btn_search" value="查询"> &nbsp;&nbsp;<input
							type="button" onclick="AutomateExcel('6');" name="exportBtn"
							class="btn btn82 btn_export" value="导出">
				</div>
				<input type="hidden" name="type" value="4">
			</form>
			<!-- 订单列表 -->
			<div id="table" class="mt10">
				<div id="tableDiv">
					<table id="data" width="800px;" border="0" cellpadding="0"
						cellspacing="0" class="list_table">
						<tr>
						    <th width="3%">投保人姓名</th>
						    <th width="8%">证件号码</th>
						    <th width="8%">产品名称</th>
							<th width="6%">保险公司名称</th>
							<th width="6%">险种</th>
							<th width="8%">机场</th>
							<th width="3%">保费</th>
						</tr>
						<tbody id="billContent"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>