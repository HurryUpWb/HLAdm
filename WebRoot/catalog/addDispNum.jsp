<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
   <script type="text/javascript" src="<%=path%>/js/core.js"></script>
   <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="<%=path %>/js/common.js"></script>
   <script type="text/javascript" src="<%=path %>/js/main.js"></script>
   <script type="text/javascript" src="<%=path %>/js/zDrag.js"></script>
   <script type="text/javascript" src="<%=path %>/js/zDialog.js"></script>
</head>
<body>
  <c:if test="${err == 9}">
      <script type="text/javascript">
                Dialog.alert("提示：您没有登录或登录已超时！",function(){window.parent.location.href = "/Admin/login.html";Dialog.close();});   
     </script>
   </c:if>
 <div class="container">
 <div id="button" class="mt10">
     <form action="admin/adminProduct/saveDispNum.json" id="form1" name="form1" method="post">
         <input type="hidden" id="id" name="id" value="<%=request.getParameter("id") %>" />
        <table width="100%" border="0" cellpadding="4" cellspacing="0" class="search_table">
            <tr>
           <td colspan="2" class="td_left">
                <font color="red" size="2">产品在目录下显示的排序，数字越小显示越靠前</font>
           </td>
			</tr>
            <tr>
             <td width="40%">排序号：</td>
             <td align="td_left">
	              <input type="text" id="dispNum" name="dispNum" maxlength="2" class="input-text lh30" size="35" />
              </td>
            </tr>

           <tr>
           <td colspan="2" class="td_center">
           <input type="button" name="button" onclick="saveDispNum();return false;" class="btn btn82 btn_save2" value="保存"/>
           </td>
			</tr>
        </table>
     </form>
</div>
   </div> 
 </body>
 </html>