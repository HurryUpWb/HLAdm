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
    <title>新增航司</title>
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
    <a href="<%=basePath%>admin/QRCode/CompanyInfoConfig.json"><input type="button" name="button" class="btn btn82 btn_save2" value="返回"></a>
    <br/>
    <div class="mt10">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="search_table">
            <form action="<%=basePath%>admin/QRCode/addCompanySave.json" method="post">
            <tr>
                <td colspan="2" bgcolor="#eeeeee"><label style="font-weight:bold; font-size:14px;">新增航司信息</label></td>
            </tr>
            <tr>
                <td width="170" align="right">航司名称</td>
                <td>
                    <input type="text" id="name" name="name" value="" class="input-text lh30" size="45" />&nbsp;&nbsp;<font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="170" align="right">选择产品类型</td>
                <td>
                    <c:forEach items="${list}" var="record">
                        <input type="checkbox" name="type" value="${record.M_CODE}" id="CODE${record.M_CODE}">&nbsp;&nbsp;<label for="CODE${record.M_CODE}">${record.M_NAME}</label>&nbsp;&nbsp;
                    </c:forEach>
                </td>
            </tr>
                <tr>
                    <td width="170" align="right">订单是否需要同步</td>
                    <td>
                        <input type="radio" value="0" name="SYNC_NEED" id="noNeed">&nbsp;&nbsp;<label for="noNeed">不同步</label>&nbsp;&nbsp;
                        <input type="radio" value="1" name="SYNC_NEED" id="inNeed">&nbsp;&nbsp;<label for="inNeed">同步</label>&nbsp;&nbsp;
                    </td>
                </tr>
                <tr id="Sync_Url" style="display: none;">
                    <td width="170" align="right">同步URL</td>
                    <td>
                        <input type="text" id="url" name="SYNC_URL" value="" class="input-text lh30" size="45" />
                    </td>
                </tr>
            </form>
            <tr>
                <td colspan="2" align="left" style="padding-left:200px;">
                    <input type="button" class="btn btn82 btn_save2" value="新增" onclick="return submit();">
                </td>
            </tr>
        </table>
    </div>
    <br/>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#inNeed").change(function () {
            if($(this).attr("checked"))
                $("#Sync_Url").show()
        })
        $("#noNeed").change(function () {
            if($(this).attr("checked"))
                $("#Sync_Url").hide()
        })
    })
    function submit(){
        if($("#name").val()=='' || $("#name").val()==undefined){
            Dialog.alert("请输入航司名称！")
            return
        }
        if($("input:checked").length==0){
            Dialog.alert("请选择销售的产品类型！")
            return
        }
        if(!$("input:radio:checked").val()){
            Dialog.alert("请选择是否需要订单同步！")
            return
        }
        if($("input:radio:checked").val()==1){
            if(!$("#url").val()){
                Dialog.alert("请输入同步URL！")
                return
            }
        }
       $("form").submit()
    }
</script>
</body>
</html>