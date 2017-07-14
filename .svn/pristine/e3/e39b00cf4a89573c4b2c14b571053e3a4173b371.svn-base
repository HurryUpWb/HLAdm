<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="css/main.css">
<c:set var="page" scope="page" value="${page}"/>
<c:set var="pageUrl" scope="page" value="${pageUrl}" />
<c:set var="pageNumber" scope="page" value="${page.pageNumber}" /> 
<c:set var="pageSize" scope="page" value="${page.pageSize}" /> 
<c:set var="totalPage" scope="page" value="${page.totalPage}" /> 
<c:set var="totalRow" scope="page" value="${page.totalRow}" /> 
<c:set var="formName" scope="page" value="${formName}" /> 

<script>
function pageClick(url) {
	if(document.getElementById("${formName}") == undefined){
		location.href = url;
	} else{
		document.getElementById("${formName}").action = url;
		document.getElementById("${formName}").submit();
	}
}
</script>

<!-- 分页逻辑 -->
<!-- 上一页标签 -->
<ul>
<li class="disabled"><span>共${totalPage }页</span></li>
<c:choose>
    <c:when test="${pageNumber<=1}">
        <li class="disabled"><span>上一页</span><li>
    </c:when>
    <c:otherwise>
        <li><a href="${pageUrl}${pageNumber-1}" onclick="pageClick('${pageUrl}${pageNumber-1}');return false;">上一页</a></li>
    </c:otherwise>
</c:choose>
<li class="disabled"><span>
当前第
<c:choose>
    <c:when test="${totalPage==0}">
        ${totalPage}
    </c:when>
    <c:otherwise>
        ${pageNumber}
    </c:otherwise>
</c:choose>
页
</span></li>
<c:choose>
    <c:when test="${pageNumber==totalPage || totalPage==0}">
       <li class="disabled"> <span>下一页</span></li>
    </c:when>
    <c:when test="${pageNumber<totalPage}">
        <li><a href="${pageUrl}${pageNumber+1}" onclick="pageClick('${pageUrl}${pageNumber+1}');return false;">下一页</a></li>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${pageNumber<=1 || totalPage==0}">
       <li class="disabled"> <span>首页</span></li>
    </c:when>
    <c:when test="${pageNumber>1}">
        <li><a href="${pageUrl}1" onclick="pageClick('${pageUrl}1');return false;">首页</a></li>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<!--  
<li class="disabled">
<span>选择:
<select name="pageSelect"  onchange="window.location.href=this.options[selectedIndex].value" style="border:1px solid #bac7d2;font-size:12px; height:20px; ">
    <c:forEach var="i" begin="1" end="${totalPage}" step="1">
        <c:choose>
            <c:when test="${i==pageNumber}">
                <option value="${pageUrl}${i}" selected>${i}</option>
            </c:when>
            <c:when test="${i!=pageNumber}">
                <option value="${pageUrl}${i}">${i}</option>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</select>
</span>
</li>
-->
</ul>