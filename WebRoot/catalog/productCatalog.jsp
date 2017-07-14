<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>产品目录列表</title>
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
      
      $(function() { 
	$("#checkAll").click(function() { 
	    var flag = $(this).prop("checked"); 
		$("[id=checkId]:checkbox").each(function() { 
		   $(this).prop("checked", flag); 
		});
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
     <form action="admin/adminProduct/productCatalog.json" id="productCatalog" name="productCatalog" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="search_table">
            <tr>
          <td>目录名称：</td>
            <td><input type = "text" class="input-text lh30" size="45" name="catalogName" id="catalogName" value="${catalogName }"></td>
            <td>使用平台：</td>
			<td>
			 <select style="width : 100px;" class="select" name="usePlatform" id="usePlatform">
			      <!--<option value="" <c:if test="${usePlatform == '' }">selected</c:if> >全部</option>
			          <option value="3" <c:if test="${usePlatform == '3' }">selected</c:if> >移动端</option>
			          <option value="2" <c:if test="${usePlatform == '2' }">selected</c:if> >微信端</option>
			          <option value="0" <c:if test="${usePlatform == '0' }">selected</c:if> >ATM端</option>
			          <option value="4" <c:if test="${usePlatform == '4' }">selected</c:if> >国航E平台</option>
			          <option value="1" <c:if test="${usePlatform == '1' }">selected</c:if> >其它</option>
				   -->
					<option value="" <c:if test="${usePlatform == '' }">selected</c:if> >全部</option>
		 			<c:forEach items="${mastDate}" var="item">
						<option value="${item.M_CODE}" <c:if test="${usePlatform == item.M_CODE }">selected</c:if> >${item.M_NAME}</option>
        			</c:forEach>			          
			 </select>
                </td>
            </tr>
            
           <tr>
           <td colspan="4" class="td_right"><input type="button" name="button" onclick="searchCatalog()" class="btn btn82 btn_search" value="查询"></td>
			</tr>
        </table>
     </form>
     </div>
     
    
     <div id="button" class="mt10">
     <input type="button" name="button" class="btn btn82 btn_add" onclick="catalogConfig('');return false;" value="新增">
     <input type="button" name="button" class="btn btn82 btn_del" onclick="catalogDelete();return false;" value="删除">
     </div>
 
     <div id="table" class="mt10">
        <div class="box span10 oh">
        <form action="admin/adminProduct/productCatalog.json" id="form1" name="form1" method="post">
              <table width="100%" border="0" cellpadding="4" cellspacing="0" class="list_table">
                <tr>
                   <th width="3%"><input type="checkbox" id="checkAll" name="checkAll" /></th>
                   <th width="15%">ID</th>
                   <th width="15%">产品目录名称</th>
                   <th width="5%">排序号</th>
                   <th width="5%">是否显示</th>
                   <th width="10%">使用平台</th>
                   <th width="20%">备注</th>
                   <th width="10%">编辑</th>
                   <th width="10%">前台链接</th>
                 </tr>
                 <c:if test="${!empty list }">
	                <c:forEach var="productCatalog" items="${list.list}">
	                <tr class="tr">
	                   <td align="center"><input type="checkbox" id="checkId" name="checkId" value="${productCatalog.ID}" /></td>
	                   <td  style="padding-left:10px!important">${productCatalog.ID}</td>
	                   <td  style="padding-left:10px!important">${productCatalog.CATALOG_NAME}</td>
	                   <td  style="padding-left:10px!important">${productCatalog.DISP_NUM}</td>
	                   <td  style="padding-left:10px!important">
	                   <c:choose>
	                         <c:when test="${productCatalog.SHOW ==1}">显示</c:when>
	                         <c:otherwise>不显示</c:otherwise>
	                   </c:choose>
	                   </td>
	                   <td style="padding-left:10px!important">
		                  <c:if test="${productCatalog.USE_PLATFORM == '11' }">全部</c:if>
				          <c:if test="${productCatalog.USE_PLATFORM == '0' }">ATM端</c:if>
				          <c:if test="${productCatalog.USE_PLATFORM == '2' }">微信端</c:if>
				          <c:if test="${productCatalog.USE_PLATFORM == '3' }">移动端</c:if>
				          <c:if test="${productCatalog.USE_PLATFORM == '4' }">国航E平台</c:if>
				          <c:if test="${productCatalog.USE_PLATFORM == '1' }">其它</c:if>
	                   </td>
	                   <td  style="padding-left:10px!important">
	                   <c:choose>
	                         <c:when test="${!empty productCatalog.REMARKS}">${productCatalog.REMARKS }</c:when>
	                         <c:otherwise>无备注</c:otherwise>
	                   </c:choose>
	                   </td>
	                   <td class="td_center">&nbsp;&nbsp;
	                   <input type="button" name="button" class="btn btn82 btn_config" onclick="catalogConfig('${productCatalog.ID}');return false" value="编辑">
	                    </td>
	                   <td class="td_center">
	                       <input type="button" name="button" class="btn btn82 btn_exPort" onclick="exportHref('${productCatalog.ID}','${productCatalog.USE_PLATFORM }','<%=path %>');return false;" value="链接">
	                   </td>
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
				            <c:set var="formName" scope="request" value="queryForm" />
				            <c:set var="pageUrl" scope="request" value="admin/adminProduct/productCatalog.json?pageIndex=" />
				            <jsp:include page="/page.jsp"/>
				            <div style="float:right;margin-top:5px;margin-right:15px;">共${counts}条</div>
                </div>
              </div>
               </c:if>
        </div>
     </div>
   </div> 
 </body>
 </html>