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
    <title>编辑URL</title>
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
    <a href="<%=basePath%>admin/QRCode/manageURL.json?id=${url.COMPANY}"><input type="button" name="button" class="btn btn82 btn_save2" value="返回"></a>
    <br/>
    <div class="mt10">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="search_table">
            <form action="<%=basePath%>admin/QRCode/editUrlSave.json" method="post">
                <input type="hidden" name="companyID" value="${url.COMPANY}">
                <input type="hidden" name="id" value="${url.ID}">
                <input type="hidden" name="url" id="urlHidden" value="">
                <tr>
                    <td colspan="2" bgcolor="#eeeeee"><label style="font-weight:bold; font-size:14px;">编辑URL</label></td>
                </tr>
                <tr>
                    <td width="170" align="right">URL类型</td>
                    <td>
                        <select id="type" name="type" class="input-text lh30" style="width:200px;">
                            <option value="1">首页类</option>
                            <option value="2">列表类</option>
                            <option value="3">详情类</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="170" align="right">URL名称</td>
                    <td>
                        <input type="text" id="name" name="name" value="${url.NAME}" class="input-text lh30" size="45" />&nbsp;&nbsp;<font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td width="170" align="right">URL地址</td>
                    <td>
                        <input type="text" id="url" value="${url.URL}" class="input-text lh30" size="45" />&nbsp;&nbsp;<font color="red">*</font>
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
    $(document).ready(function () {
        $("#type").val(${url.TYPE})
    })
    function submit(){
        if($("#name").val()==''|| $("#name").val()==undefined){
            Dialog.alert("请输入URL名称")
            return
        }
        if($("#url").val()==''|| $("#url").val()==undefined){
            Dialog.alert("请输入URL地址")
            return
        }
        var URL=$("#url").val();
        URL=encodeURI(URL);
        $("#urlHidden").val(URL)
        $('form').submit()
    }
</script>
</body>
</html>