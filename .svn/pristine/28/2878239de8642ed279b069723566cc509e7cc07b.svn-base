<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单查询</title>
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
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/main.css">
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
      $(function(){  
        $(".list_table1").colResizable({
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
		
		<div id="search_bar" class="mt10">
			<form id="orderSearch" name="orderSearch" method="post">
				<!-- 查询条件 -->
				<table class="search_table" width="100%" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>开始时间：</td>
						<td><input type="text" name="START_TIME" class="laydate-icon"
							onclick="laydate()" value=""></td>
						<td>结束时间：</td>
						<td><input type="text" name="END_TIME" class="laydate-icon"
							onclick="laydate()" value=""></td>
						<td>订单状态：</td>
						<td><select id="BILL_STATUS" name="BILL_STATUS" class="select">
						<option value="">全部</option>
						<option value="100">未支付</option>
						<option value="110">已支付</option>
						<option value="130">已承保</option>
						<option value="120">投保失败</option>
						<option value="140">已退款</option>
						<option value="150">已退保</option>
						</select></td>
					</tr>
					<tr>
						<td>手机号：</td>
						<td><input type="text" name="MOBILE_NO"
							class="input-text lh30" value="" size="30"></td>
						<td>身份证：</td>
						<td><input type="text" name="CER_NO"
							class="input-text lh30" value="" size="30"></td>
						<td>姓名：</td>
						<td><input type="text" name="NAME"
							class="input-text lh30" value="" size="30"></td>
					</tr>
					<tr>
						<td>产品名称：</td>
						<td><input type="text" name="PRODUCT_NAME"
							class="input-text lh30" value="" size="30"></td>
						<td>订单来源：</td>
						<td colspan="3"><select id="ORDER_TYPE" name="ORDER_TYPE" class="select">
							<option value="">全部</option>
							<option value="1">微信</option>
							<option value="0">移动端</option>
							<option value="3">ATM机</option>
							<option value="5">东航PC端</option>
							<option value="6">东航H5端</option>
							<option value="8">批量投保</option>
							<option value="7">北部湾</option>
							<option value="9">积友之家</option>
						</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="type" value="4">
				<div id="button" class="mt10"><input type="button"
							onclick="billSearch();" name="searchBtn"
							class="btn btn82 btn_search" value="查询"> &nbsp;&nbsp;<input
							type="button" onclick="AutomateExcel('99');" name="exportBtn"
							class="btn btn82 btn_export" value="导出"></div>
			</form>
			<!-- 订单列表 -->
			<div id="table" class="mt10">
				<div id="tableDiv">
					<table id="data" width="100%" border="0" cellpadding="0"
						cellspacing="0" class="list_table1">
						<tr>
							<th width="8%">姓名</th>
							<th width="10%">身份证号</th>
							<th width="8%">手机号</th>
							<th width="8%">商户订单号</th>
							<th width="10%">支付流水号</th>
							<th width="8%">保单号</th>
							<th width="8%">保单开始时间</th>
							<th width="8%">保单结束时间</th>
							<th width="14%">订单商品</th>
							<th width="8%">保费(元)</th>
							<th width="10%">下单时间</th>
							<th width="8%">订单来源</th>
							<th width="8%">查看详情</th>
							<th width="8%">状态</th>
						</tr>
						<tbody id="billContent"></tbody>
					</table>
				</div>
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