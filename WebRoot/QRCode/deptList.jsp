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
    <title>部门列表</title>
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
    <a href="<%=basePath%>admin/QRCode/addDept.json?id=${companyID}"><input type="button" name="button" class="btn btn82 btn_save2" value="新增"></a>
    <a href="<%=basePath%>admin/QRCode/CompanyInfoConfig.json"><input type="button" name="button" class="btn btn82 btn_save2" value="返回"></a>
    <br/>
    <div class="mt10">
        <div class="box span10 oh">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr align="center">
                    <th width="35%">航司名称</th>
                    <th width="35%">部门名称</th>
                    <th width="30%">操作</th>
                </tr>
                <c:if test="${not empty list}">
                    <c:forEach items="${list}" var="dept">
                        <tr align="center">
                            <td width="35%">${dept.CNAME}</td>
                            <td width="35%">${dept.NAME}</td>
                            <td width="30%">
                                <input class="ext_btn ext_btn_error" type="button" value="管理人员" onclick="manageEmp(${dept.DEPT_ID});">
                                <input class="ext_btn ext_btn_error" type="button" value="编辑" onclick="editDept(${dept.DEPT_ID},'${dept.NAME}');">
                                <input class="ext_btn ext_btn_error" type="button" value="删除" onclick="deleteDept(${dept.DEPT_ID},'${dept.NAME}');">
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
    function deleteDept(did,name){
        Dialog.confirm("确认删除"+name+"？",function () {
            window.location.href="<%=basePath%>admin/QRCode/deleteDept.json?companyID=${companyID}&id="+did
        })
    }
    function editDept(did,name){
        var dname=encodeURI(name)
        window.location.href="<%=basePath%>admin/QRCode/editDept.json?companyID=${companyID}&id="+did+"&name="+dname
    }
    function manageEmp(did){
        window.location.href="<%=basePath%>admin/QRCode/manageEmp.json?companyID=${companyID}&deptID="+did
    }
</script>
</body>
</html>