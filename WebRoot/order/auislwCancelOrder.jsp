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
   <c:if test="${err == 9}">
      <script type="text/javascript">
     Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});   
     </script>
   </c:if>
   <input type="hidden" id="hiddenMsg" value="${msg}">
   <c:if test="${not empty msg}">
	   <script type="text/javascript">
		   Dialog.alert($("#hiddenMsg").val());
	   </script>
   </c:if>
	<div class="container">
		<div id="search_bar" class="mt10">
			<form id="CancelOrder" name="CancelOrder" method="post" action="admin/adminOrderSearch/CancelOrder.json">
				<!-- 查询条件 -->
				<table class="search_table" width="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>操作密码：</td>
						<td><input type="password" name="OPERATION_PASSWORD" id="OPERATION_PASSWORD"
								   class="input-text lh30" value="${OPERATION_PASSWORD }" size="30" maxlength="20"></td>
						<td>订单流水号：</td>
						<td><input type="text" name="ORDER_NUMBER" id="ORDER_NUMBER"
							class="input-text lh30" value="${ORDER_NUMBER }" size="30"></td>
					</tr>
				</table>

				<input type="hidden" name="cancelOrderType" id="cancelOrderType" value="">
				<input type="hidden" name="CancelOrderId" id="CancelOrderId" value="${CancelOrderId }">

				<div id="button" class="mt10"><input type="button"
							onclick="CancelTheOrder();" name="searchBtn"
							class="btn btn82 btn_search" value="退保"> &nbsp;&nbsp;<input
							type="button" onclick="RefundTheOrder();" name="exportBtn"
							class="btn btn82 btn_export" value="退款">&nbsp;&nbsp;&nbsp;<input
							type="button" onclick="SearchTheOrder();" name="exportBtn"
							class="btn btn82 btn_search" value="查询">
				</div>
			</form>
			<!-- 订单列表 -->
			<div id="table" class="mt10">
				<div id="tableDiv">
					<table id="data" width="100%" border="0" cellpadding="0"
						cellspacing="0" class="list_table1">
						<tr>
							<th width="8%">姓名</th>
							<th width="8%">商户订单号</th>
							<th width="8%">保单号</th>
							<th width="8%">保单开始时间</th>
							<th width="8%">保单结束时间</th>
							<th width="14%">订单商品</th>
							<th width="8%">保费(元)</th>
							<th width="10%">下单时间</th>
							<th width="8%">订单来源</th>
							<th width="8%">状态</th>
						</tr>
						<c:if test="${not empty OrderInfo}">
							<c:forEach var="OrderInfo" items="${OrderInfo}" varStatus="status">
								<tr>
									<th width="8%">${OrderInfo.NAME }</th>
									<th width="8%">${OrderInfo.ORDER_NUMBER }</th>
									<th width="8%">${OrderInfo.POLICY_NO }</th>
									<th width="8%">${OrderInfo.POLICY_START_DATE }</th>
									<th width="8%">${OrderInfo.POLICY_END_DATE }</th>
									<th width="14%">${OrderInfo.PRODUCT_TITLE }</th>
									<th width="8%">${OrderInfo.AMOUNT }</th>
									<th width="10%">${OrderInfo.CREATE_DATE }</th>
									<th width="8%"><c:if test="${OrderInfo.ORDER_TYPE=='5' }">PC端</c:if>
										<c:if test="${OrderInfo.ORDER_TYPE=='6' }">H5端</c:if>
										<c:if test="${OrderInfo.ORDER_TYPE=='3' }">北部湾</c:if>
									</th>
									<th width="8%"><c:if test="${OrderInfo.STATE=='100' }">未支付</c:if>
										<c:if test="${OrderInfo.STATE=='110' }">已支付</c:if> <c:if
											test="${OrderInfo.STATE=='120' }">投保失败</c:if> <c:if
											test="${OrderInfo.STATE=='130' }">已承保</c:if> <c:if
											test="${OrderInfo.STATE=='140' }">已退款</c:if> <c:if
											test="${OrderInfo.STATE=='150' }">已退保</c:if></th>
								</tr>
							</c:forEach>
						</c:if>
						<!--<tbody id="billContent"></tbody>-->
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	function CancelTheOrder(){
		if($("#OPERATION_PASSWORD").val()==''){
			Dialog.alert("请输入操作密码")
			return
		}
		if($("#ORDER_NUMBER").val()==''){
			Dialog.alert("请输入订单号")
			return
		}
		$("#cancelOrderType").val(1)//退保
		$("#CancelOrder").submit()
	}
	function RefundTheOrder(){
		if($("#OPERATION_PASSWORD").val()==''){
			Dialog.alert("请输入操作密码")
			return
		}
		if($("#ORDER_NUMBER").val()==''){
			Dialog.alert("请输入订单号")
			return
		}
		$("#cancelOrderType").val(2)//退款
		$("#CancelOrder").submit()
	}
	function SearchTheOrder(){
	  var CancelOrder = document.getElementById("CancelOrder");
		if($("#ORDER_NUMBER").val()==''){
			var order_number=$("#ORDER_NUMBER").val();
			CancelOrder.action = "admin/adminOrderSearch/SearchTheOrder.json?ORDER_NUMBER="+order_number+"";
			CancelOrder.submit();
		}
			CancelOrder.action = "admin/adminOrderSearch/SearchTheOrder.json";
			CancelOrder.submit();
	}
</script>