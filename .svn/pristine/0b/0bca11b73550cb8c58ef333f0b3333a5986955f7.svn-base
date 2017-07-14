<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>atm列表</title>
   <link rel="stylesheet" href="<%=path %>/css/common.css">
   <link rel="stylesheet" href="<%=path %>/css/main.css">
   <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
   <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="<%=path %>/js/common.js"></script>
   <script type="text/javascript" src="<%=path %>/js/main.js"></script>
   <script type="text/javascript" src="<%=path %>/js/zDrag.js"></script>
   <script type="text/javascript" src="<%=path %>/js/zDialog.js"></script>   
   <script type="text/javascript">
      $(function(){  
        $(".list_table").colResizable({
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
     <div id="button" class="mt10">
     <form action="admin/adminProduct/queryProduct.json" name="queryForm" id="queryForm"  method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr><td><input type="button" name="button" onclick="queryProduct()" class="btn btn82 btn_search" value="查询"></td>
            <td width="60%"></td>
            <td><input type="button" name="button" class="btn btn82 btn_add" onclick="productAdd();return false;" value="新增"></td>
            </tr>
        </table>
         <input type="hidden"  name="pageNum" value="1">
     </form> 
     
     </div>
     <div id="table" class="mt10">
        <div class="box span10 oh">
        <form action="admin/adminProduct/configProduct.json" id="form1" name="form1" method="post">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                   <th width="10%">Office Code</th>
                   <th width="10%">Office Name</th>
                   <th width="8%">产品价格</th>
                   <th width="20%">产品简介</th>
                   <th width="8%">产品销量</th>
                   <th width="8%">收款箱钱数</th>
                   <th width="10%">钱箱状态</th>
                   <th width="10%">打印机状态</th>
                   <th width="10%">ATM状态</th>
                   <th width="10%">最后更新时间</th>
                 </tr>
                 <c:if test="${!empty list }">
	                <c:forEach var="product" items="${list}">
	                <tr class="tr">
	                   <td>${product.OFFICE_CODE}</td>
	                   <td>${product.OFFICE_NAME}</td>
	                   <td>${product.FIRSTBOX_NUMBER}</td>
	                   <td>${product.SECONDBOX_NUMBER}</td>
	                   <td>${product.COLLECTBOX_NUMBER}</td>
	                   <td>${product.OUTBOX_STATUS}
	                   <c:if test="${product.OUTBOX_STATUS == '1'}">正常</c:if>
	                   <c:if test="${product.OUTBOX_STATUS == '2'}">1号箱</c:if>
	                   <c:if test="${product.OUTBOX_STATUS == '3'}">倍</c:if>
	                   </td>
	                   <td>${product.PRINTER_STATUS}</td>
	                   <td>${product.ATM_STATUS}</td>
	                   <td>${product.DATETIME}</td>
	                   <td class="td_center">
	                   <input type="button" name="button" class="btn btn82 btn_config" onclick="policyAdd('${product.PRODUCT_ID}');return false" value="配置">
	                   </td>
	                   <td class="td_center">
	                   <input type="button" name="button" class="btn btn82 btn_del" onclick="javascript:Dialog.confirm('警告：您确认要删除（${product.PRODUCT_TITLE}）该产品吗？',function(){policyDelete('${product.PRODUCT_ID}')});" value="删除">
	                   </td>
	                 </tr>
	               </c:forEach>
               </c:if>
              </table>
              </form>
        </div>
     </div>
   </div> 
 </body>
 </html>