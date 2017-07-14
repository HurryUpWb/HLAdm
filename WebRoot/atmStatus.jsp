<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>ATM状态列表</title>
   <link rel="stylesheet" href="<%=path %>/css/common.css">
   <link rel="stylesheet" href="<%=path %>/css/main.css">
   <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
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
 <c:set var="pageList" scope="page" value="${list}"/>
 <body>
   <c:if test="${err == 9}">
      <script type="text/javascript">
     Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});   
     </script>
   </c:if>
  <div class="container">
  <div id="button" class="mt10">
	<form action="admin/adminATM/atmStatus.json" id="form1" name="form1" method="post">

				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="search_table">
					<tr>
						<td width="10%">ATM编号:</td>
						<td width="20%"><input type="text" name="ATM_NUMBER"
							class="input-text lh20" size="20" value="${ATM_NUMBER}">
						</td>
						<td width="10%">ATM名称:</td>
						<td width="20%"><input type="text" name="ATM_NAME"
							class="input-text lh20" size="20" value="${ATM_NAME}">
						</td>
					</tr>

					<tr>
						<td colspan="4"><input type="button" name="button"
							onclick="atmStatusQuery();" class="btn btn82 btn_search"
							value="查询">
						</td>
					</tr>
				</table>
		</div>
     <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                   <th width="16%">ATM编号</th>
                   <th width="10%">ATM名称</th>
                   <th width="8%">卡纸状态</th>
                   <th width="8%">钱箱状态</th>
                   <th width="8%">收款箱状态</th>
                   <th width="10%">打印状态</th>
                   <th width="10%">网络/电源状态</th>
                   <th width="10%">机器状态</th>
                   <th width="13%">一号钱箱数（张）</th>
                   <th width="13%">二号钱箱数（张）</th>
                   <th width="14%">收款钱箱数（张）</th>
                 </tr>
                 <c:if test="${!empty list }">
	                <c:forEach var="warningMsg" items="${list.list}">
	                <tr class="tr" height="36px">
	                   <td>${warningMsg.ATM_NUMBER}</td>
	                   <td>${warningMsg.ATM_NAME}</td>
	                   <td>${warningMsg.WEDGE_PAPER}</td>
	                   <td>${warningMsg.MONEY_NOT_ENOUGH}</td>
	                   <td>${warningMsg.MONEY_FULL}</td>
	                   <td>${warningMsg.PRINT_ERROR}</td>
	                   <td>${warningMsg.UNPLUGGING}</td>
	                   <td>${warningMsg.MACHINE_ERROR}</td>
	                   <td>${warningMsg.ONE_MONEY}</td>
	                   <td>${warningMsg.TWO_MONEY}</td>
	                   <td>${warningMsg.CASH_REGISTER}</td>
	                 </tr>
	               </c:forEach>
               </c:if>
              </table>
              </form>
              
             <c:if test="${pageList.totalRow>0}">
              <div class="page mt10">
                <div class="pagination">
				            <c:set var="pageNumber" scope="request" value="${pageList.pageNumber}" />
				            <c:set var="pageSize" scope="request" value="${pageList.pageSize}" />
				            <c:set var="totalPage" scope="request" value="${pageList.totalPage}" />
				            <c:set var="totalRow" scope="request" value="${pageList.totalRow}" />
				            <c:set var="formName" scope="request" value="form1" />
				            <c:set var="pageUrl" scope="request" value="admin/adminATM/atmStatus.json?pageIndex=" />
				            <jsp:include page="/page.jsp"/>
                </div>
              </div>
               </c:if>
        </div>
     </div>
   </div> 
 </body>
 </html>