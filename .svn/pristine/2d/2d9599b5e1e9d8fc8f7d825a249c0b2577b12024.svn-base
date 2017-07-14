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
    <title>产品目录编辑</title>
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
   <c:if test="${err == 9}">
      <script type="text/javascript">
     Dialog.alert("提示：您没有登录或登录已超时！",function(){parent.location.href = "/Admin/login.html";});   
     </script>
   </c:if>
  <div class="container">
     <div id="button" class="mt10">
<form name="productCatalog" id="productCatalog" method="post">
       <input type="hidden" name="PLATFORM" id="PLATFORM" value="${catalogModel.USE_PLATFORM }">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="search_table">
        <tr>
          <td colspan="2" bgcolor="#eeeeee"><label style="font-weight:bold; font-size:14px;">产品目录信息编辑</label></td>
        </tr>
         <tr>
          <td width="170" align="right">产品目录名称</td>
          <td><input type="text" id="CATALOG_NAME" name="CATALOG_NAME" value="${catalogModel.CATALOG_NAME }" class="input-text lh30" size="45" />&nbsp;&nbsp;<font color="red">*</font></td>
        </tr>
        <tr>
          <td width="170" align="right">排序号</td>
          <td><input type="text" id="DISP_NUM" name="DISP_NUM" value="${catalogModel.DISP_NUM }" maxlength="2" class="input-text lh30" size="45" />&nbsp;&nbsp;<font color="red">*&nbsp;数字越小越排在前面</font></td>
        </tr>
        <tr>
          <td width="170" align="right">是否显示</td>
          <td>
            <select id="SHOW" name="SHOW" class="input-text lh30" style="width:200px;">
			  <option value ="1" <c:if test="${catalogModel.SHOW ==1 }">selected</c:if> >显示</option>
			  <option value ="0" <c:if test="${catalogModel.SHOW ==0 }">selected</c:if> >不显示</option>
			</select>
			&nbsp;&nbsp;<font color="red">*</font>
          </td>
        </tr>
        <tr>
          <td width="170" align="right">使用平台</td>
          <td>
		  <select style="width : 100px;" class="select" name="USE_PLATFORM" id="USE_PLATFORM">
		  			<option value="11" <c:if test="${catalogModel.USE_PLATFORM == '11' }">selected</c:if> >全部</option>
		 			<c:forEach items="${mastDate}" var="item">
						<option value="${item.M_CODE}" <c:if test="${catalogModel.USE_PLATFORM == item.M_CODE }">selected</c:if> >${item.M_NAME}</option>
        			</c:forEach>
			</select>        			
          &nbsp;&nbsp;<font color="red">*</font></td>
        </tr>
        
        <tr>
          <td width="170" align="right">备注</td>
          <td><textarea id="REMARKS" name="REMARKS" cols="35" rows="7">${catalogModel.REMARKS }</textarea></td>
        </tr>
         <input type="hidden" name="id" id="id" value="${catalogModel.ID }" >
        <tr>
          <td colspan="2" align="left" style="padding-left:200px;">
          <input type="button" name="button"
							onclick="configCatalog();return false;" class="btn btn82 btn_save2"
							value="保存">
          </td>
        </tr>
      </table>
</form>
</div>

<br /><label style="font-weight:bold; font-size:14px;">目录产品配置：</label>
<br />
<div id="button" class="mt10">
  <input type="button" name="button" class="btn btn82 btn_add" onclick="queryProductList();return false;" value="添加">
</div>
   <div id="table" class="mt10">
        <div class="box span10 oh">
        <form action="admin/adminProduct/productCatalog.json" id="form1" name="form1" method="post">
             
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
		          <th width="15%">产品名称</th>
		          <th width="20%">产品简介</th>
		          <th width="10%">产品类型</th>
		          <th width="10%">产品价格</th>
		          <th width="10%">保险公司</th>
		          <th width="10%">产品平台</th>
		          <th width="5%">排序号</th>
		          <th width="10%">操作</th>
		        </tr>
                <c:if test="${!empty list }">
		             <c:forEach var="list" items="${list}">
		                <TR>
					          <td>&nbsp;&nbsp;${list.PRODUCT_TITLE}</td>
					          <td>&nbsp;&nbsp;${list.PRODUCT_EXPLAN}</td>
					          <td>&nbsp;&nbsp;${list.PRODUCT_TYPE }</td>
					          <td>&nbsp;&nbsp;${list.PRODUCT_PRICE }</td>
					          <td>&nbsp;&nbsp;${list.INSURANCE_COMPANY }</td>
					          <td>
							   <c:if test="${list.CLIENT_TYPE ==null }">
							     &nbsp;
					             <c:if test="${list.PRODUCT_SALES_TYPE =='0' }">ATM端</c:if>
					             <c:if test="${list.PRODUCT_SALES_TYPE =='1' }">其它</c:if>
					             <c:if test="${list.PRODUCT_SALES_TYPE =='2' }">微信端</c:if>
					             <c:if test="${list.PRODUCT_SALES_TYPE =='3' }">移动端</c:if>
					             <c:if test="${list.PRODUCT_SALES_TYPE =='4' }">国航E平台</c:if>
							   </c:if>
							   <c:if test="${list.CLIENT_TYPE !=null }">
							   		<c:forEach items="${mastDate}" var="item">
										<c:if test="${fn:contains(list.CLIENT_TYPE,item.M_CODE)}"><text type="text">&nbsp;&nbsp;${item.M_NAME}<br></c:if>
		        					</c:forEach>
		        				</c:if>					             
					          </td>
					          <td>&nbsp;&nbsp;${list.DISP_NUM }</td>
					          <td align="center">
					          <input type="button" id="dispNum" name="dispNum" onclick="addDispNum('${list.ID }');return false;" class="ext_btn ext_btn_error" value="序号">
					          &nbsp;&nbsp;
					          <input type="button" id="del" name="del" onclick="Dialog.confirm('警告：您确认要将该产品从目录中移除吗？',function(){rmProduct('${list.ID }');return false;});" class="ext_btn ext_btn_success" value="移除"></td>
					      </TR>
		             </c:forEach>
	             </c:if>
              </table>
              </form>

        </div>
     </div>
     <br /> 
		<input type="button" name="btnBack" id="btnBack" onclick="backCatalog();return false;" class="btn btn_back btn82" value="返回"/>
     </div>
</body>
</html>