<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>产品目录列表</title>
   <link rel="stylesheet" href="<%=path %>/css/common.css">
   <link rel="stylesheet" href="<%=path %>/css/main.css">
   <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
   <script type="text/javascript" src="<%=path %>/js/json2.js"></script>
   <script type="text/javascript" src="<%=path%>/js/core.js"></script>
   <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="<%=path %>/js/common.js"></script>
   <script type="text/javascript" src="<%=path %>/js/main.js"></script>
   <script type="text/javascript" src="<%=path %>/js/zDrag.js"></script>
   <script type="text/javascript" src="<%=path %>/js/zDialog.js"></script>
    <script type="text/javascript">
      
      $(function() { 
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
                Dialog.alert("提示：您没有登录或登录已超时！",function(){window.parent.location.href = "/Admin/login.html";Dialog.close();});   
     </script>
   </c:if>
 <div class="container">
   <div id="button" class="mt10" style="margin:10px;">
    <input type="button" name="button" class="btn btn82 btn_add" onclick="productToCatalog();return false;" value="添加">
     </div>
<div id="table" class="mt10" style="margin:10px;">
<div class="box span10 oh">
<form name="productList" id="productList" method="post">
     <input type="hidden" name="id" id="id" value="${id }">
      <table width="100%" border="0" cellpadding="4" cellspacing="0" class="list_table">
        <tr>
           <th width="3%"><input type="checkbox" id="checkAll" name="checkAll" /></th>
          <th width="15%">产品名称</th>
          <th width="20%">产品简介</th>
          <th width="5%">产品类型</th>
          <th width="5%">产品价格</th>
          <th width="8%">保险公司</th>
          <th width="6%">产品平台</th>
        </tr>
        <c:if test="${!empty list }">
	             <c:forEach var="product" items="${list}">
	                <TR>
	                      <td align="center"><input type="checkbox" id="checkId" name="checkId" value="${product.PRODUCT_ID}" /></td>
				          <td>${product.PRODUCT_TITLE }</td>
				          <td>${product.PRODUCT_EXPLAN }</td>
				          <td>${product.PRODUCT_TYPE }</td>
				          <td>${product.PRODUCT_PRICE }</td>
				          <td>${product.INSURANCE_COMPANY }</td>
				          <td>
				          	<c:if test="${product.CLIENT_TYPE == null }">
				                 <c:if test="${product.PRODUCT_SALES_TYPE =='0' }">ATM机销售</c:if>
					             <c:if test="${product.PRODUCT_SALES_TYPE =='1' }">其它</c:if>
					             <c:if test="${product.PRODUCT_SALES_TYPE =='2' }">微信</c:if>
					             <c:if test="${product.PRODUCT_SALES_TYPE =='3' }">移动端</c:if>
					        </c:if>
					        <c:if test="${product.CLIENT_TYPE != null }">
					     		<c:forEach items="${mastDate}" var="item">
									<c:if test="${fn:contains(product.CLIENT_TYPE,item.M_CODE)}"><text type="text" >${item.M_NAME}<br></c:if>
		        				</c:forEach>
					        </c:if>
				          </td>
				         </TR>
	             </c:forEach>
	    </c:if>
      </table>
</form>
        </div>
     </div>
   </div> 
 </body>
 </html>