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
    <title>产品销售二维码</title>
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
    <div class="mt10">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="search_table">
                <tr>
                    <td colspan="2" bgcolor="#eeeeee"><label style="font-weight:bold; font-size:14px;">产品销售二维码</label></td>
                </tr>
                <tr>
                    <td width="170" align="right">URL</td>
                    <td>
                        <select id="url" class="input-text lh30" style="width:200px;">
                        </select>
                    </td>
                </tr>
                <tr id="productDetail" style="display: none">
                    <td width="170" align="right">选择产品</td>
                    <td>
                        <select id="detail" class="input-text lh30" style="width:200px;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="170" align="right">请选择航司</td>
                    <td>
                        <select id="company" class="input-text lh30" style="width:200px;">
                            <c:choose>
                                <c:when test="${empty companies}">
                                    <option value="0">没有选项</option>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${companies}" var="company">
                                        <option value="${company.ID}">${company.NAME}</option>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </select>
                        &nbsp;&nbsp;<font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td width="170" align="right">请选择部门</td>
                    <td>
                        <select id="dept" class="input-text lh30" style="width:200px;">
                        </select>
                        &nbsp;&nbsp;<font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td width="170" align="right">请选择员工</td>
                    <td>
                        <select id="emp" class="input-text lh30" style="width:200px;">
                        </select>
                        &nbsp;&nbsp;<font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left" style="padding-left:200px;">
                        <input type="button" name="button"
                               onclick="getTheQRcode()" class="btn btn82 btn_save2"
                               value="生成">
                        <input type="button" name="button"
                               onclick="getTheQRcodeGenerated()" class="btn btn82 btn_save2"
                               value="历史">
                    </td>
                </tr>
            </table>
    </div>
    <br />
    <br />
    <div class="mt10">
        <div class="box span10 oh">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table" id="tableQ">
                    <tr align="center">
                        <th width="15%">保险公司</th>
                        <th width="15%">部门</th>
                        <th width="15%">姓名</th>
                        <th width="15%">手机号</th>
                        <th width="15%">URL</th>
                        <th width="25%">二维码</th>
                    </tr>
                </table>
        </div>
    </div>
    <br />
</div>
<%--隐藏的历史记录--%>
<div id="HiddenTable" class="mt10" style="display: none;position: absolute;left: 0px;top: 0px;bottom:0px;width: 100%;height: 100%;background-color: white;margin-top: 0px;margin-bottom: 0px">
    <div id="QRCodeHistory">
        <table id="data" width="100%" border="0" cellpadding="0"
               cellspacing="0" class="list_table1">
            <thead>
            <tr>
                <td colspan="6" align="center" >
                    <input type="button" name="button"
                           onclick="closeHistoryDiv()" class="btn btn82 btn_save2"
                           value="返回">
                </td>
            </tr>
            <tr align="center">
                <th width="15%">保险公司</th>
                <th width="15%">部门</th>
                <th width="15%">姓名</th>
                <th width="15%">手机号</th>
                <th width="15%">URL</th>
                <th width="20%">二维码</th>
                <th width="5%">操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="page mt10">
            <div class="pagination" id="QRCodeHistoryPagination">
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var QRCodeHistory;
    function getTheQRcodeGenerated() {
        openProgerssLoad=true;
        $.ajax(
            {
                type:'get',
                url:  getLocationUrl()+"/admin/QRCode/getTheQRcodeGenerated.json",
                dataType:'json',
                beforeSend:function(xhr){
                    if(openProgerssLoad){
                        $("body").append($bg).append($show);
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    if(openProgerssLoad){
                        $("#bg").remove();
                        $("#show").remove();
                    }
                    if(XMLHttpRequest.status==500){
                        Dialog.alert('服务器内部错误.code:500.');
                    }
                },
                success:function(data){
                    $("#QRCodeHistoryPagination").empty()
                    $("#QRCodeHistory table tbody").empty()
                    if(openProgerssLoad){
                        $("#bg").css("display","none");
                        $("#show").css("display","none");
                    }
                    if(data.length==0 || data ==null){
                        Dialog.alert('没有生成二维码的历史记录');
                    }else{
                        QRCodeHistory=data
                        for (var i = 0; i < QRCodeHistory.length; i++) {
                            if(i==10){
                                break;
                            }
                            var str='<tr align="center">'+
                                '<td width="15%">'+QRCodeHistory[i].COMPANY+'</td>'+
                                '<td width="15%">'+nullKiller(QRCodeHistory[i].DEPARTMENT)+'</td>'+
                                '<td width="15%">'+nullKiller(QRCodeHistory[i].EMPLOYEE)+'</td>'+
                                '<td width="15%">'+nullKiller(QRCodeHistory[i].PHONE)+'</td>'+
                                '<td width="15%">'+QRCodeHistory[i].URL+'</td>'+
                                '<td width="20%"><img style="height:100px;width:100px" src="<%=basePath%>'+QRCodeHistory[i].IMGLOC+'"></td>'+
                                '<td width="5%"><input class="ext_btn ext_btn_error" onclick="deleteQRCodeHistory('+QRCodeHistory[i].ID+',this);" type="button" value="删除"></td>'+
                                '</tr>'
                            $("#QRCodeHistory table tbody").append(str)
                        }
                        var pageStr="<ul><li class=\"disabled\"><a href=\"#\" onclick=\"QRCodeHistoryFlip(0);return false;\">首页</a></li>";
                        pageStr+="<li class=\"disabled\"><span>上一页</span></li>";
                        if(QRCodeHistory.length <= 10){
                            pageStr+="<li class=\"disabled\"><span>下一页</span></li>";
                        } else{
                            pageStr+="<li><a href=\"#\" onclick=\"QRCodeHistoryFlip(1);return false;\">下一页</a></li>";
                        }
                        pageStr+="<li class=\"disabled\"><span>共"+QRCodeHistory.length+"条记录</span></li></ul>";
                        $("#QRCodeHistoryPagination").append(pageStr);
                    }
                }
            });
        $("#HiddenTable").show()
    }
    //删除历史记录
    function deleteQRCodeHistory(ID,button){
        $.get(getLocationUrl()+"/admin/QRCode/delete.json?id="+ID, function(data) {
            Dialog.alert(data.msg)
            if(data.code==0){
                QRCodeHistory=QRCodeHistory.filter(function(record){
                    return record.ID !=ID
                })
                $(button).closest("tr").remove()
                var str="<span>共"+QRCodeHistory.length+"条记录</span>";
                $("#QRCodeHistoryPagination li:last-child").html(str)
            }
        });
    }

    function QRCodeHistoryFlip(page){
        $("#QRCodeHistory table tbody").empty()
        for (var i = page*10; i < QRCodeHistory.length; i++) {
            if(i==(page*10+10)){
                break;
            }
            var str='<tr align="center">'+
                '<td width="15%">'+QRCodeHistory[i].COMPANY+'</td>'+
                '<td width="15%">'+QRCodeHistory[i].DEPARTMENT+'</td>'+
                '<td width="15%">'+QRCodeHistory[i].EMPLOYEE+'</td>'+
                '<td width="15%">'+QRCodeHistory[i].PHONE+'</td>'+
                '<td width="15%">'+QRCodeHistory[i].URL+'</td>'+
                '<td width="20%"><img style="height:100px;width:100px" src="<%=basePath%>'+QRCodeHistory[i].IMGLOC+'"></td>'+
                '<td width="5%"><input class="ext_btn ext_btn_error" onclick="deleteQRCodeHistory('+QRCodeHistory[i].ID+',this);" type="button" value="删除"></td>'+
                '</tr>';
            $("#QRCodeHistory table tbody").append(str)
        }
        $("#QRCodeHistoryPagination").empty()
        var pageStr="<ul><li class=\"first-child\"><a href=\"#\" onclick=\"QRCodeHistoryFlip(0);return false;\">首页</a></li>";
        if(page==0){
            pageStr+="<li class=\"disabled\"><span>上一页</span></li>";
        }else{
            pageStr+="<li><a href=\"#\" onclick=\"QRCodeHistoryFlip("+(page-1)+");return false;\">上一页</a></li>";
        }
        if((page+1)*10>QRCodeHistory.length || (page+1)*10==QRCodeHistory.length){
            pageStr+="<li class=\"disabled\"><span>下一页</span></li>";
        }else{
            pageStr+="<li><a href=\"#\" onclick=\"QRCodeHistoryFlip("+(page+1)+");return false;\">下一页</a></li>";
        }
        pageStr+="<li class=\"disabled\"><span>共"+QRCodeHistory.length+"条记录</span></li></ul>";
        $("#QRCodeHistoryPagination").append(pageStr);
    }
    function closeHistoryDiv() {
        $("#HiddenTable").hide()
    }
    $(document).ready(function () {
        var companyID=$("#company").val()
        if(companyID==0)
            return
        else{
            getDepts()
            getCompanyUrls()
        }
    })
    function getCompanyUrls(){
        $.ajax({
            type:"GET",
            url:'<%=basePath%>admin/QRCode/getCompanyUrls.json',
            data: {companyID:$("#company").val()},
            dataType: "json",
            success:function (data) {
                $("#url").empty()
                $("#detail").empty()
                $("#productDetail").hide()
                if(data.length !=0){
                    var flag=0;
                    data.forEach(function (e) {
                        if(e.TYPE!=3){
                            $("#url").append('<option value="'+e.URL+'">'+e.NAME+'</option>')
                        }else{
                            flag=1;
                            $("#detail").append('<option value="'+e.URL+'">'+e.NAME+'</option>')
                        }
                    })
                    if(flag==1){
                        $("#url").append('<option value="3">产品详情</option>')
                    }
                }else
                    $("#url").append('<option value="0">请配置URL</option>')
            },
            error:function () {
                Dialog.alert("查询服务器失败")
            }
        })
    }
    $("#company").change(function () {
        var companyID=$(this).val()
        if(companyID==0)
            return
        else{
            getDepts()
            getCompanyUrls()
        }
    })
    $("#dept").change(function () {
        var deptID=$(this).val()
        if(deptID==undefined || deptID==null)
            return
        else{
            getEmps()
        }
    })
    $("#url").change(function () {
        if($("#url").val()==3){
            $("#productDetail").show()
        }else{
            $("#productDetail").hide()
        }
    })
    //获取部门
    function getDepts(){
         $.ajax({
             type:"GET",
             url:'<%=basePath%>admin/QRCode/getDepts.json',
             data: {companyID:$("#company").val()},
             dataType: "json",
             success:function (data) {
                 $("#dept").empty()
                 $("#dept").append('<option value="0">所有部门</option>')
                 if(data.length==0 || data==null){
                     $("#emp").empty()
                     $("#emp").append('<option value="0">所有人员</option>')
                 }else{
                     for(var i=0;i<data.length;i++){
                         $("#dept").append('<option value="'+data[i].DEPT_ID+'">'+data[i].NAME+'</option>')
                     }
                     getEmps()
                 }
             },
             error:function () {
                 Dialog.alert("查询服务器失败")
             }
         })
    }
    //获取员工
    function getEmps(){
        $.ajax({
            type:"GET",
            url:'<%=basePath%>admin/QRCode/getEmps.json',
            data: {companyID:$("#company").val(), deptID:$("#dept").val()},
            dataType: "json",
            success:function (data) {
                $("#emp").empty()
                $("#emp").append('<option value="0">所有人员</option>')
                if(data.length==0 || data==null){

                }else{
                    for(var i=0;i<data.length;i++){
                        $("#emp").append('<option value="'+data[i].EMP_ID+'">'+data[i].NAME+'</option>')
                    }
                }
            },
            error:function () {
                Dialog.alert("查询服务器失败")
            }
        })
    }
    function getTheQRcode() {
        var companyID=$("#company").val()
        var deptID=$("#dept").val()
        var empID=$("#emp").val()
        var URL;
        if($("#url").val()!=3){
            URL=$("#url").val()
        }else{
            URL=$("#detail").val()
        }
        if(URL==0){
            Dialog.alert("请添加航司URL！")
            return
        }
        URL=encodeURI(URL)
        if(companyID==0 || isNaN(deptID) || isNaN(empID)){
            Dialog.alert("选项无效！")
            return
        }
        $.ajax({
            type:"GET",
            url:'<%=basePath%>admin/QRCode/getEmpInfo.json',
            data: {companyID:companyID,deptID:deptID,empID:empID},
            dataType: "json",
            success:function (data) {
                var tr='<tr>' +
                    '<td width="15%" style="text-align: center">'+data.CNAME+'</td>'+
                '<td width="15%" style="text-align: center">'+nullKiller(data.DNAME)+'</td>'+
                '<td width="15%" style="text-align: center">'+nullKiller(data.ENAME)+'</td>'+
                '<td width="15%" style="text-align: center">'+nullKiller(data.PHONE)+'</td>'+
                    '<td width="15%" style="text-align: center">'+URL+'</td>'+
                '<td width="25%" style="text-align: center"></td>'+
                '</tr>'
                $("#tableQ").append(tr)
                //获取二维码图片
                var QRCodeUrl='<%=basePath%>admin/QRCode/getQRCode.json?URL='+URL+'&companyID='+companyID+'&deptID='+deptID+'&empID='+empID;
                var xhr = new XMLHttpRequest();
                xhr.open("get", QRCodeUrl, true);
                xhr.responseType = "blob";
                xhr.onload = function() {
                    if (this.status == 200) {
                        var blob = this.response;
                        var img = document.createElement("img");
                        img.onload = function(e) {
                            window.URL.revokeObjectURL(img.src);
                        };
                        img.src = window.URL.createObjectURL(blob);
                        $("#tableQ tr:last-child td:last-child").html(img);
                        $("#tableQ tr:last-child img").css("height","100px")
                        $("#tableQ tr:last-child img").css("width","100px")
                    }
                }
                xhr.send();
            },
            error:function () {
                Dialog.alert("查询服务器失败")
            }
        })
    }

    $(document).ready(function(){
        $("#tableQ,#data").on("mouseenter","tr",function(){
            $(this).find("img").css("height","200px")
            $(this).find("img").css("width","200px")
        })
        $("#tableQ,#data").on("mouseleave","tr",function(){
            $(this).find("img").css("height","100px")
            $(this).find("img").css("width","100px")
        })
    })
    function nullKiller(s){
        if(s==undefined || s==null){
            return ""
        }else{
            return s
        }
    }
</script>
</html>