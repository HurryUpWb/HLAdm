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
    <title>人员管理</title>
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
    <a href="<%=basePath%>admin/QRCode/addEmp.json?companyID=${companyID}&deptID=${deptID}"><input type="button" name="button" class="btn btn82 btn_save2" value="新增"></a>
    <a href="<%=basePath%>admin/QRCode/manageDept.json?companyID=${companyID}"><input type="button" name="button" class="btn btn82 btn_save2" value="返回"></a>
    <br/>
    <div class="mt10">
        <div class="box span10 oh">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr align="center">
                    <th width="20%">航司名称</th>
                    <th width="20%">部门名称</th>
                    <th width="20%">人员姓名</th>
                    <th width="20%">联系电话</th>
                    <th width="20%">操作</th>
                </tr>
                <c:if test="${not empty page.list}">
                    <c:forEach items="${page.list}" var="emp">
                        <tr align="center">
                            <td width="20%">${CNAME}</td>
                            <td width="20%">${DNAME}</td>
                            <td width="20%">${emp.NAME}</td>
                            <td width="20%">${emp.PHONE}</td>
                            <td width="20%">
                                <input class="ext_btn ext_btn_error" type="button" value="编辑" onclick="editEmp(${emp.EMP_ID},'${emp.NAME}','${emp.PHONE}');">
                                <input class="ext_btn ext_btn_error" type="button" value="删除" onclick="deleteEmp(${emp.EMP_ID},'${emp.NAME}');">
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
            <div class="page mt10">
                <div class="pagination">
                    <c:if test="${not empty page.list}">
                    <ul>
                    <c:choose>
                        <c:when test="${page.pageNumber==1}">
                            <li class="disabled"><a>首页</a></li>
                            <li class="disabled"><span>上一页</span></li>
                        </c:when>
                        <c:otherwise>
                            <li class="first-child"><a href="<%=basePath%>admin/QRCode/manageEmp.json?companyID=${companyID}&deptID=${deptID}">首页</a></li>
                            <li><a href="<%=basePath%>admin/QRCode/manageEmp.json?companyID=${companyID}&deptID=${deptID}&pageNum=${page.pageNumber-1}">上一页</a></li>
                        </c:otherwise>
                    </c:choose>
                        <c:choose>
                            <c:when test="${page.pageNumber==page.totalPage}">
                                <li class="disabled"><span>下一页</span></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="<%=basePath%>admin/QRCode/manageEmp.json?companyID=${companyID}&deptID=${deptID}&pageNum=${page.pageNumber+1}">下一页</a></li>
                            </c:otherwise>
                        </c:choose>
                        <li class="disabled"><span>共${page.totalRow}条记录</span></li>
                    </ul>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <br />
</div>
<script type="text/javascript">
    function deleteEmp(eid,name){
        Dialog.confirm("确认删除"+name+"？",function () {
            window.location.href="<%=basePath%>admin/QRCode/deleteEmp.json?companyID=${companyID}&deptID=${deptID}&pageNum=${page.pageNumber}&empID="+eid
        })
    }
    function editEmp(eid,name,phone){
        var ename=encodeURI(name)
        window.location.href="<%=basePath%>admin/QRCode/editEmp.json?companyID=${companyID}&deptID=${deptID}&pageNum=${page.pageNumber}&empID="+eid+"&name="+ename+"&phone="+phone
    }
</script>
</body>
</html>