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
    <title>二维码销售统计</title>
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/main.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
    <script type="text/javascript" src="<%=path %>/js/main.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDrag.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDialog.js"></script>
    <script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
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
                <td colspan="2" bgcolor="#eeeeee"><label style="font-weight:bold; font-size:14px;">二维码销售统计</label></td>
            </tr>
            <form action="<%=basePath%>admin/QRCode/getStatistics.json" method="post">
            <tr>
                <td width="170" align="right">请选择航司</td>
                <td>
                    <select id="company" name="company" class="input-text lh30" style="width:200px;">
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
                    <select id="dept" name="dept" class="input-text lh30" style="width:200px;">
                    </select>
                    &nbsp;&nbsp;<font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="170" align="right">请选择员工</td>
                <td>
                    <select id="emp" name="emp" class="input-text lh30" style="width:200px;">
                    </select>
                    &nbsp;&nbsp;<font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="170" align="right">请选择订单状态</td>
                <td>
                    <select id="orderState" name="orderState" class="input-text lh30" style="width:200px;">
                        <option
                                <c:if test="${orderState =='0' }">selected</c:if> value="0">全部
                        </option>
                        <option
                                <c:if test="${orderState =='100' }">selected</c:if> value="100">未支付
                        </option>
                        <option
                                <c:if test="${orderState =='110' }">selected</c:if> value="110">已支付
                        </option>
                        <option
                                <c:if test="${orderState =='120' }">selected</c:if> value="120">承保失败
                        </option>
                        <option
                                <c:if test="${orderState =='130' }">selected</c:if> value="130">已承保
                        </option>
                        <option
                                <c:if test="${orderState =='150' }">selected</c:if> value="150">已退保
                        </option>
                        <option
                                <c:if test="${orderState =='140' }">selected</c:if> value="140">已退款
                        </option>
                    </select>
                    &nbsp;&nbsp;<font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="170" align="right">开始时间</td>
                <td><input type="text" name="START_TIME" value="${START_TIME }" class="laydate-icon" onclick="laydate()"></td>
            </tr>
            <tr>
                <td width="170" align="right">结束时间</td>
                <td><input type="text" name="END_TIME" value="${END_TIME }" class="laydate-icon" onclick="laydate()"></td>
            </tr>
            </form>
            <tr>
                <td colspan="2" align="left" style="padding-left:200px;">
                    <input type="button" name="button"
                           onclick="getStatistics()" class="btn btn82 btn_save2"
                           value="查询">
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
                    <th width="5%">姓名</th>
                    <th width="8%">商户订单号</th>
                    <th width="10%">订单流水号</th>
                    <th width="10%">保单号</th>
                    <th width="7%">保单开始时间</th>
                    <th width="7%">保单结束时间</th>
                    <th width="13%">订单商品</th>
                    <th width="7%">保费(元)</th>
                    <th width="9%">下单时间</th>
                    <th width="7%">订单来源</th>
                    <th width="7%">状态</th>
                </tr>
                <c:forEach var="order" items="${page.list }">
                    <tr align="center">
                        <td width="5%">${order.NAME }</td>
                        <td width="8%">${order.ORDER_NUMBER }</td>
                        <td width="10%">${order.TRANS_NO }</td>
                        <td width="11%">${order.POLICY_NO }</td>
                        <c:choose>
                            <c:when test="${not empty order.POLICY_START_DATE}">
                                <td width="8%">${order.POLICY_START_DATE }</td>
                            </c:when>
                            <c:otherwise>
                                <td width="8%">${order.FLIGHT_DATE }</td>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${not empty order.POLICY_END_DATE}">
                                <td width="8%">${order.POLICY_END_DATE }</td>
                            </c:when>
                            <c:otherwise>
                                <td width="8%">${order.FLIGHT_NUMBER }</td>
                            </c:otherwise>
                        </c:choose>
                        <td width="14%">${order.PRODUCT_TITLE }</td>
                        <td width="8%">${order.AMOUNT }</td>
                        <td width="10%">${order.CREATE_DATE }</td>
                        <td width="8%"><c:if test="${order.ORDER_TYPE=='5' }">PC端</c:if>
                            <c:if test="${order.ORDER_TYPE=='6' }">H5端</c:if>
                            <c:if test="${order.ORDER_TYPE=='7' }">北部湾</c:if>
                            <c:if test="${order.ORDER_TYPE=='10' }">西部航空</c:if>
                        </td>
                        <td width="8%">
                            <c:if test="${order.STATE=='100' }">未支付</c:if>
                            <c:if test="${order.STATE=='110' }">已支付</c:if>
                            <c:if test="${order.STATE=='120' }">投保失败</c:if>
                            <c:if test="${order.STATE=='130' }">已承保</c:if>
                            <c:if test="${order.STATE=='140' }">已退款</c:if>
                            <c:if test="${order.STATE=='150' }">已退保</c:if>
                        </td>
                    </tr>
                </c:forEach>
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
                                <li class="first-child"><a href="<%=basePath%>admin/QRCode/getStatistics.json?company=${company}&dept=${dept}&emp=${emp}&START_TIME=${START_TIME}&END_TIME=${END_TIME}&orderState=${orderState}">首页</a></li>
                                <li><a href="<%=basePath%>admin/QRCode/getStatistics.json?company=${company}&dept=${dept}&emp=${emp}&START_TIME=${START_TIME}&END_TIME=${END_TIME}&orderState=${orderState}&pageNum=${page.pageNumber-1}">上一页</a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page.pageNumber==page.totalPage}">
                                <li class="disabled"><span>下一页</span></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="<%=basePath%>admin/QRCode/getStatistics.json?company=${company}&dept=${dept}&emp=${emp}&START_TIME=${START_TIME}&END_TIME=${END_TIME}&orderState=${orderState}&pageNum=${page.pageNumber+1}">下一页</a></li>
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
</body>
<script type="text/javascript">
    $(document).ready(function () {
        var company='${company}'
        var dept='${dept}'
        var emp='${emp}'
        if(company!='' || company!=null){
            $("#company").val(company)
        }
        if(dept!='' || dept!=null){
            setTimeout(function () {
                $("#dept").val(dept)
                $("#dept").trigger('change')
            },500)
        }
        if(dept!='' || dept!=null){
            setTimeout(function () {
                $("#emp").val(emp)
            },1000)
        }
    })
    function getStatistics(){
        var companyID=$("#company").val()
        if(companyID==0){
            Dialog.alert("请添加航司！")
            return
        }
        $("form").submit()
    }
    $(document).ready(function () {
        var companyID=$("#company").val()
        if(companyID==0)
            return
        else{
            getDepts()
        }
    })
    $("#company").change(function () {
        var companyID=$(this).val()
        if(companyID==0)
            return
        else{
            getDepts()
        }
    })
    $("#dept").change(function () {
        var deptID=$(this).val()
        if(deptID==0)
            return
        else{
            getEmps()
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
    function nullKiller(s){
        if(s==undefined || s==null){
            return ""
        }else{
            return s
        }
    }
</script>
</html>
