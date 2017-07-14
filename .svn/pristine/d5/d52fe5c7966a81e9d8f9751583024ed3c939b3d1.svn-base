<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>编辑人员</title>
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
<div class="container">
    <a href="<%=basePath%>admin/QRCode/manageEmp.json?companyID=${companyID}&deptID=${deptID}"><input type="button" name="button" class="btn btn82 btn_save2" value="返回"></a>
    <br/>
    <div class="mt10">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="search_table">
            <form action="<%=basePath%>admin/QRCode/editEmpSave.json" method="post">
                <input type="hidden" name="companyID" value="${companyID}">
                <input type="hidden" name="deptID" value="${deptID}">
                <input type="hidden" name="empID" value="${empID}">
                <input type="hidden" name="pageNum" value="${pageNum}">
                <tr>
                    <td colspan="2" bgcolor="#eeeeee"><label style="font-weight:bold; font-size:14px;">编辑人员</label></td>
                </tr>
                <tr>
                    <td width="170" align="right">人员姓名</td>
                    <td>
                        <input type="text" id="name" name="name" value="${name}" class="input-text lh30" size="45" />&nbsp;&nbsp;<font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td width="170" align="right">联系电话</td>
                    <td>
                        <input type="text" id="phone" name="phone" value="${phone}" class="input-text lh30" size="45" />&nbsp;&nbsp;<font color="red">*</font>
                    </td>
                </tr>
            </form>
            <tr>
                <td colspan="2" align="left" style="padding-left:200px;">
                    <input type="button" class="btn btn82 btn_save2" value="保存" onclick="submit();">
                </td>
            </tr>
        </table>
    </div>
    <br/>
</div>
<script type="text/javascript">
    function submit(){
        if($("#name").val()==''|| $("#name").val()==undefined){
            Dialog.alert("请输入人员姓名")
            return
        }
        if($("#phone").val()==''|| $("#phone").val()==undefined){
            Dialog.alert("请输入联系电话")
            return
        }
        $('form').submit()
    }
</script>
</body>
</html>