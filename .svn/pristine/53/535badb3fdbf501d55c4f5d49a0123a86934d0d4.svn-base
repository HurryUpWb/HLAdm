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
    
    <title>里程累计查询</title>
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
 <c:set var="pageList" scope="page" value="${list}"/>
<body>
   <c:if test="${err == 9}">
      <script type="text/javascript">
     Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});   
     </script>
   </c:if>
	<div class="container">
		
		<div id="search_bar" class="mt10">
			<form id="searchForm" name="searchForm" method="post" action="admin/adminOrderSearch/totalMileage.json">
				<!-- 查询条件 -->
				<table class="search_table" width="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>订单号：</td>
						<td><input type="text" id="orderNum" name="orderNum"
							class="input-text lh30" value="" size="30" value="${orderNum }"></td>
						<td>航空公司：</td>
						<td><input type="text" name="airlineComp" id="airlineComp"
							class="input-text lh30" value="" size="30" value="${airlineComp }"></td>
						
					</tr>
					<tr>
					    <td>常旅客卡号：</td>
						<td><input type="text" name="passengerCode" id="passengerCode"
							class="input-text lh30" value="" size="30" value="${passengerCode }"></td>
						<td>常旅客姓名：</td>
						<td><input type="text" name="passengerName" id="passengerName"
							class="input-text lh30" value="" size="30" value="${passengerName }"></td>
					</tr>
				</table>
				<div id="button" class="mt10"><input type="button"
							onclick="totalMileageSearch();" name="searchBtn"
							class="btn btn82 btn_search" value="查询"> &nbsp;&nbsp;</div>
			</form>

			<div id="table" class="mt10">
				<div id="tableDiv">
					<table id="data" width="100%" border="0" cellpadding="0"
						cellspacing="0" class="list_table1">
						<tr>
							<th width="10%">航空公司</th>
							<th width="10%">常旅客卡号</th>
							<th width="10%">常旅客姓名</th>
							<th width="10%">累计里程数</th>
							<th width="10%">查看详情</th>
						</tr>
						<c:if test="${!empty pageList }">
							<c:forEach items="${pageList.list }" var="list">
									<tr>
										<td width="10%">${list.AIRLINE_COMP }</td>
										<td width="10%">${list.PASSENGER_CODE }</td>
										<td width="10%">${list.PASSENGER_NAME }</td>
										<td width="10%">${list.MILEAGS }</td>
										<td align="center">
										     <input type="button" id="details" name="details" onclick="totalMileageDetails('${list.AIRLINE_COMP }','${list.PASSENGER_CODE }','${list.PASSENGER_NAME }','${orderNum }');return false;" class="ext_btn ext_btn_error" value="查看">
										</td>
									</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				
			<c:if test="${pageList.totalRow>0}">
              <div class="page mt10">
                <div class="pagination">
				            <c:set var="pageNumber" scope="request" value="${pageList.pageNumber}" />
				            <c:set var="pageSize" scope="request" value="${pageList.pageSize}" />
				            <c:set var="totalPage" scope="request" value="${pageList.totalPage}" />
				            <c:set var="totalRow" scope="request" value="${pageList.totalRow}" />
				            <c:set var="formName" scope="request" value="queryForm" />
				            <c:set var="pageUrl" scope="request" value="admin/adminOrderSearch/totalMileage.json?pageIndex=" />
				            <jsp:include page="/page.jsp"/>
				            <div style="float:right;margin-top:5px;margin-right:15px;">共${counts}条</div>
                </div>
              </div>
               </c:if>
			</div>
		</div>
	</div>
</body>
</html>