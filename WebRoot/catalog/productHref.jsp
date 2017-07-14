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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" ></meta>
<title>产口目录前台显示地址链接</title>
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
<div id="forlogin">
      <table width="100%" border="0" align="center" cellpadding="4" cellspacing="4" bordercolor="#666666">
        <tr>
          <td colspan="2" bgcolor="#eeeeee">前台产品目录链接地址：</td>
        </tr>
         <tr>
          <td colspan="2"><%=request.getParameter("url") %>&platform=<%=request.getParameter("platform") %></td>
        </tr>
      </table>
</div>
</body>
</html>