<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>订单查询</title>
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/main.css">
    <style type="text/css">
        #InsurancePolicyDetail {
            width: 100%;
            padding：0 10px;
        }

        #InsurancePolicyDetail tr {
            border-bottom: 1px solid #949294;
            background: #fafafa;
        }

        #InsurancePolicyDetail tr td {
            padding: 10px;
            width: 50%;
        }

        #HiddenInsurancePolicyDetail button {
            height: 65px;
            width: 150px;
            text-align: center;
            border-radius: .5em;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
            text-decoration: none;
            font: 14px/100% Arial, Helvetica, sans-serif;
            cursor: pointer;
            outline: none;
            margin: 0 2px;
            display: inline-block;
            zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
            *display: inline;
            vertical-align: baseline;
            color: #e8f0de;
            border: solid 1px #538312;
            background: #64991e;
            background: -webkit-gradient(linear, left top, left bottom, from(#7db72f), to(#4e7d0e));
            background: -moz-linear-gradient(top, #7db72f, #4e7d0e);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#7db72f', endColorstr='#4e7d0e');
        }

        #HiddenInsurancePolicyDetail button:hover {
            background: #538018;
            background: -webkit-gradient(linear, left top, left bottom, from(#6b9d28), to(#436b0c));
            background: -moz-linear-gradient(top, #6b9d28, #436b0c);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6b9d28', endColorstr='#436b0c');
        }

        #HiddenInsurancePolicyDetail button:active {
            color: #a9c08c;
            background: -webkit-gradient(linear, left top, left bottom, from(#4e7d0e), to(#7db72f));
            background: -moz-linear-gradient(top, #4e7d0e, #7db72f);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4e7d0e', endColorstr='#7db72f');
        }
    </style>
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/core.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
    <script type="text/javascript" src="<%=path %>/js/main.js?tm=<%=new java.util.Date().getTime()%>"></script>
    <script type="text/javascript" src="<%=path %>/js/order.js?tm=<%=new java.util.Date().getTime()%>"></script>
    <script type="text/javascript" src="<%=path %>/js/zDrag.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDialog.js"></script>
    <script type="text/javascript" src="<%=path %>/js/laydate/laydate.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".list_table1").colResizable({
                liveDrag: true,
                gripInnerHtml: "<div class='grip'></div>",
                draggingClass: "dragging",
                minWidth: 30
            });
        });
    </script>

</head>

<body>
<c:if test="${err == 9}">
    <script type="text/javascript">
        Dialog.alert("提示：您没有登录或登录已超时！", function () {
            parent.location.href = "/Admin/login.html";
        });
    </script>
</c:if>
<c:set var="pageList" scope="page" value="${list}"/>
<div class="container">

    <div id="search_bar" class="mt10">
        <form id="muSearch" name="muSearch" method="post" action="admin/adminOrderSearch/MuSearch.json">
            <!-- 查询条件 -->
            <table class="search_table" width="100%" border="0" cellpadding="0"
                   cellspacing="0">
                <tr>
                    <td>开始时间：</td>
                    <td><input type="text" name="START_TIME" value="${START_TIME }" class="laydate-icon"
                               onclick="laydate()" value=""></td>
                    <td>结束时间：</td>
                    <td><input type="text" name="END_TIME" value="${END_TIME }" class="laydate-icon"
                               onclick="laydate()" value=""></td>
                    <td>订单状态：</td>
                    <td><select id="BILL_STATUS" name="BILL_STATUS" class="select">
                        <option
                                <c:if test="${BILL_STATUS =='' }">selected</c:if> value="">全部
                        </option>
                        <option
                                <c:if test="${BILL_STATUS =='100' }">selected</c:if> value="100">未支付
                        </option>
                        <option
                                <c:if test="${BILL_STATUS =='110' }">selected</c:if> value="110">已支付
                        </option>
                        <option
                                <c:if test="${BILL_STATUS =='120' }">selected</c:if> value="120">承保失败
                        </option>
                        <option
                                <c:if test="${BILL_STATUS =='130' }">selected</c:if> value="130">已承保
                        </option>
                        <option
                                <c:if test="${BILL_STATUS =='150' }">selected</c:if> value="150">已退保
                        </option>
                        <option
                                <c:if test="${BILL_STATUS =='140' }">selected</c:if> value="140">已退款
                        </option>
                    </select></td>
                </tr>
                <tr>
                    <td>手机号：</td>
                    <td><input type="text" name="MOBILE_NO"
                               class="input-text lh30" value="${MOBILE_NO }" size="30"></td>
                    <td>身份证：</td>
                    <td><input type="text" name="CER_NO"
                               class="input-text lh30" value="${CER_NO }" size="30"></td>
                    <td>姓名：</td>
                    <td><input type="text" name="NAME"
                               class="input-text lh30" value="${NAME }" size="30"></td>
                </tr>
                <tr>
                    <td>产品名称：</td>
                    <td><input type="text" name="PRODUCT_NAME"
                               class="input-text lh30" value="${PRODUCT_NAME }" size="30"></td>
                    <td>订单来源：</td>
                    <input type="hidden" value="${Authority}">
                    <td colspan="3"><select id="ORDER_TYPE" name="ORDER_TYPE" class="select">
                        <c:choose>
                            <c:when test="${Authority=='2'}">
                                <option <c:if test="${ORDER_TYPE =='' }">selected</c:if> value="">全部</option>
                                <option <c:if test="${ORDER_TYPE =='5' }">selected</c:if> value="5">东航PC端</option>
                                <option <c:if test="${ORDER_TYPE =='6' }">selected</c:if> value="6">东航H5端</option>
                            </c:when>
                            <c:when test="${Authority=='4'}">
                                <option <c:if test="${ORDER_TYPE =='7' }">selected</c:if> value="7">北部湾</option>
                            </c:when>
                            <c:when test="${Authority=='5'}">
                            	<c:if test="${currentFunc=='1'}">
                            		<option <c:if test="${ORDER_TYPE =='' }">selected</c:if> value="">全部</option>
                                	<option <c:if test="${ORDER_TYPE =='5' }">selected</c:if> value="5">东航PC端</option>
                                	<option <c:if test="${ORDER_TYPE =='6' }">selected</c:if> value="6">东航H5端</option>
                            	</c:if>
                            	<c:if test="${currentFunc=='2'}">
                               		<option <c:if test="${ORDER_TYPE =='7' }">selected</c:if> value="7">北部湾</option>
                            	</c:if>
                            </c:when>
                             <c:when test="${Authority=='6'}">
                            		<option <c:if test="${ORDER_TYPE =='9' }">selected</c:if> value="9">西部航空</option>
                            </c:when>
                        </c:choose>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>订单号码：</td>
                    <td><input type="text" name="ORDER_NUMBER"
                               class="input-text lh30" value="${ORDER_NUMBER }" size="30"></td>
                    <td>保单号码：</td>
                    <td colspan="3"><input type="text" name="POLICY_NO"
                                           class="input-text lh30" value="${POLICY_NO }" size="30"></td>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="type" value="4">
            <div id="button" class="mt10"><input type="button"
                                                 onclick="muOrderInquiry(${currentFunc});" name="searchBtn"
                                                 class="btn btn82 btn_search" value="查询"> &nbsp;&nbsp;<input
                    type="button" onclick="AutomateExcel('88');" name="exportBtn"
                    class="btn btn82 btn_export" value="导出"></div>
        </form>
        <!-- 订单列表 -->
        <div id="table" class="mt10">
            <div id="tableDiv">
                <table id="data" width="100%" border="0" cellpadding="0"
                       cellspacing="0" class="list_table1">
                    <tr>
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
                        <th width="5%">查看详情</th>
                        <th width="5%">操作</th>
                    </tr>
                    <c:if test="${not empty pageList.list }">
                        <c:forEach var="list" items="${pageList.list }">
                            <tr>
                                <th width="5%">${list.NAME }</th>
                                <th width="8%">${list.ORDER_NUMBER }</th>
                                <th width="10%">${list.TRANS_NO }</th>
                                <th width="11%">${list.POLICY_NO }</th>
                                <c:choose>
                                    <c:when test="${not empty list.POLICY_START_DATE}">
                                        <th width="8%">${list.POLICY_START_DATE }</th>
                                    </c:when>
                                    <c:otherwise>
                                        <th width="8%">${list.FLIGHT_DATE }</th>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${not empty list.POLICY_END_DATE}">
                                        <th width="8%">${list.POLICY_END_DATE }</th>
                                    </c:when>
                                    <c:otherwise>
                                        <th width="8%">${list.FLIGHT_NUMBER }</th>
                                    </c:otherwise>
                                </c:choose>
                                <th width="14%">${list.PRODUCT_TITLE }</th>
                                <th width="8%">${list.AMOUNT }</th>
                                <th width="10%">${list.CREATE_DATE }</th>
                                <th width="8%"><c:if test="${list.ORDER_TYPE=='5' }">PC端</c:if><c:if
                                        test="${list.ORDER_TYPE=='6' }">H5端</c:if>
                                    <c:if test="${list.ORDER_TYPE=='7' }">北部湾</c:if>
                                    <c:if test="${list.ORDER_TYPE=='9' }">西部航空</c:if>
                                </th>
                                <th width="8%">
                                    <c:if test="${list.STATE=='100' }">未支付</c:if>
                                    <c:if test="${list.STATE=='110' }">已支付</c:if>
                                    <c:if test="${list.STATE=='120' }">投保失败</c:if>
                                    <c:if test="${list.STATE=='130' }">已承保</c:if>
                                    <c:if test="${list.STATE=='140' }">已退款</c:if>
                                    <c:if test="${list.STATE=='150' }">已退保</c:if>
                                </th>
                                <th width="6%"><input type="button" onclick="CheckTheDetail('${list.TRANS_NO}')"
                                                      class="ext_btn ext_btn_success" value="订单详情"></th>
                                <th width="6%">
                                    <c:if test="${list.STATE=='120' || list.STATE=='150' }"><input type="button"
                                                                                                   onclick="Dialog.confirm('警告：您确认要将该订单退款吗？',function(){drawback('${list.TRANS_NO}');return false;});"
                                                                                                   class="ext_btn ext_btn_error"
                                                                                                   value="退款"></c:if>
                                    <c:if test="${list.STATE=='130' }"><input type="button"
                                                                              onclick="Dialog.confirm('警告：您确认要将该订单退保吗？',function(){surrender('${list.TRANS_NO}');return false;});"
                                                                              class="ext_btn ext_btn_success"
                                                                              value="退保"></c:if>
                                </th>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <tbody id="billContent"></tbody>
                </table>
            </div>

            <c:if test="${pageList.totalRow>0}">
                <div class="page mt10">
                    <div class="pagination">
                        <c:set var="pageNumber" scope="request" value="${pageList.pageNumber}"/>
                        <c:set var="pageSize" scope="request" value="${pageList.pageSize}"/>
                        <c:set var="totalPage" scope="request" value="${pageList.totalPage}"/>
                        <c:set var="totalRow" scope="request" value="${pageList.totalRow}"/>
                        <c:set var="formName" scope="request" value="muSearch"/>
                        <c:set var="pageUrl" scope="request" value="admin/adminOrderSearch/MuSearch.json?pageIndex="/>
                        <jsp:include page="/page.jsp"/>
                        <!-- <div style="float:right;margin-top:5px;margin-right:15px;">共${counts}条</div> -->
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <div id="HiddenInsurancePolicyDetail"
         style="position: fixed;width: 100%;height: 100%;top: 0;left: 0;z-index: 1000;background:white;display: none;overflow: auto">
        <button type="button" onclick="hideTheDetail()" style="position: fixed;right: 50px;top: 100px;">返回查询界面</button>
        <div style="clear: both;"></div>
        <h1 align="center" style="margin: 20px">订单详情</h1>
        <table id="InsurancePolicyDetail" style="margin: 0 auto;">
        </table>
    </div>
</div>
</body>
</html>