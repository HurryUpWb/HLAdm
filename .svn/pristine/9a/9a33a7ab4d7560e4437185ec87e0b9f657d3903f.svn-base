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
    <title>航司信息</title>
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/main.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core.js"></script>
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
<div class="container">
    <a href="<%=basePath%>admin/QRCode/addCompany.json"><input type="button" name="button" class="btn btn82 btn_save2" value="新增"></a>
    <br />
    <div class="mt10">
        <div class="box span10 oh">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table" id="company_list">
                <tr align="center">
                    <th width="50%">保险公司</th>
                    <th width="50%">操作</th>
                </tr>
                <c:if test="${not empty companies}">
                    <c:forEach items="${companies}" var="company">
                        <tr align="center">
                            <td width="50%">${company.NAME}</td>
                            <td width="50%">
                                <a href="<%=basePath%>admin/QRCode/editCompany.json?id=${company.ID}"><input class="ext_btn ext_btn_error" type="button" value="编辑"></a>
                                <a href="<%=basePath%>admin/QRCode/manageURL.json?id=${company.ID}"><input class="ext_btn ext_btn_error" type="button" value="管理URL"></a>
                                <a href="<%=basePath%>admin/QRCode/manageDept.json?companyID=${company.ID}"><input class="ext_btn ext_btn_error" type="button" value="管理部门"></a>
                                <input class="ext_btn ext_btn_error" type="button" value="删除" onclick="deleteCompany(${company.ID},'${company.NAME}');">
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
    </div>
    <br />
</div>
<script type="text/javascript">
    function deleteCompany(id,name){
        Dialog.confirm("确认删除"+name+"？",function () {
            window.location.href="<%=basePath%>admin/QRCode/deleteCompany.json?id="+id
        })
    }
</script>
</body>
</html>
