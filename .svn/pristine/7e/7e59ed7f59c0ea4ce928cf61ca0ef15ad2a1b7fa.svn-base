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
    
    <title>投保推送</title>
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/main.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/core.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
    <script type="text/javascript" src="<%=path %>/js/main.js?tm=<%=new java.util.Date().getTime()%>"></script>
    <script type="text/javascript" src="<%=path %>/js/order.js?tm=<%=new java.util.Date().getTime()%>"></script>
    <script type="text/javascript" src="<%=path %>/js/insure.js?tm=<%=new java.util.Date().getTime()%>"></script>
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
	<div class="container">
		
		<div id="search_bar" class="mt10">
			<form id="pushForm" name="pushForm" method="post" action="admin/TenpayPayment/TestPostXml.json">
				<!-- 查询条件 -->
				<table class="search_table" width="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>订单号：</td>
						<td><input type="text" id="orderNo" name="orderNo"
							class="input-text lh30" size="30" value="${orderNo }"></td>						
					</tr>
				</table>
				<div id="button" class="mt10">
				 <input type="button"
							onclick="push();" id="saveBtn"
							class="btn btn82 btn_save2" value="&nbsp;推送">&nbsp;&nbsp;</div>
							
			</form>
               <div id="table" class="mt10">
				<div id="tableDiv">
					<table id="data" width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center">&nbsp;&nbsp;</td>
						</tr>
						<c:if test="${! empty resultMsg}">
							<tr>
								<th align="center">投保推送结果返回：<font color=red>${resultMsg}</font></th>
							</tr>
						</c:if>
					</table>
				   </div>
				</div>
		</div>
	</div>
</body>
</html>