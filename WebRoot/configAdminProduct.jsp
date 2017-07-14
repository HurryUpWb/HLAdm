<%@ page language="java" import="java.util.*,com.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>产品修改页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="航联出行,航延险,旅游险">
<meta http-equiv="description" content="产品新增页面">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/core.js"></script>
<link rel="stylesheet" href="<%=path%>/css/admin.css">
<link rel="stylesheet" href="<%=path%>/css/button.css">
<script type="text/javascript" src="<%=path%>/js/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDrag.js"></script>
<script type="text/javascript" src="<%=path%>/js/zDialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/uploadPreview.js"></script>
<script type="text/javascript" src="<%=path%>/js/uploadFileView.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-ui.js"></script>
<link rel="stylesheet" href="<%=path%>/css/jquery-ui.css">
<script type="text/javascript">

      $(function(){  
        $(".list_table").colResizable({
          liveDrag:true,
          gripInnerHtml:"<div class='grip'></div>", 
          draggingClass:"dragging", 
          minWidth:30
        }); //CLIENT_TYPE
        });
        
      window.onload = function () {
               new uploadPreview({ UpBtn: "PRODUCT_IMG1", DivShow: "imgdiv1", ImgShow: "imgShow1" });
               new uploadPreview({ UpBtn: "PRODUCT_IMG2", DivShow: "imgdiv2", ImgShow: "imgShow2" });
               new uploadPreview({ UpBtn: "PRODUCT_IMG3", DivShow: "imgdiv3", ImgShow: "imgShow3" });
               new uploadPreview({ UpBtn: "PRODUCT_IMG4", DivShow: "imgdiv4", ImgShow: "imgShow4" });
               new uploadPreview({ UpBtn: "PRODUCT_IMG5", DivShow: "imgdiv5", ImgShow: "imgShow5" });
	     };
	     
	  $(function() {
        for(var i=0;i<50;i++){
           var spinner = $( "#spinner"+i ).spinner();
        }
        $("#PRODUCT_DISP_NUM").spinner();
      });
      
    $(function() { 
	$("#checkAll").click(function() { 
	    var flag = $(this).prop("checked");
		$("[id=POLICY_INFO]:checkbox").each(function() { 
		   $(this).prop("checked", flag); 
		}); 
	}); 
  });
  
  $(function() { 
	$("#checkAll1").click(function() { 
	    var flag = $(this).prop("checked");
		$("[id=POLICY_INFO1]:checkbox").each(function() { 
		   $(this).prop("checked", flag); 
		}); 
	}); 
  });
  
  $(function() { 
	$("#checkAll2").click(function() { 
	    var flag = $(this).prop("checked");
		$("[id=POLICY_INFO2]:checkbox").each(function() { 
		   $(this).prop("checked", flag); 
		}); 
	}); 
  });

	function deleteImg (id){
		Dialog.confirm('您确认要删除所选产品图片吗？',function(){
		 var imgid = "imgShow"+id;
		 var deleteid = "PRODUCT_IMG"+id;
		 var delflg = "imgDelFlg"+id;
		 document.getElementById(imgid).src="images/nopic.jpg";
		 document.getElementById(deleteid).value="";
		 document.getElementById(delflg).value="1";
		});
	}
	
	function func(){
 	//获取被选中的option标签
 	var vs = $('select  option:selected').val();
 	if(vs==3){
 		$("#BAGGAGE").show();
 	}
 	if(vs!=3){
 		$("#BAGGAGE").hide();
 		$("#BAGGAGE_NUMBER").val(0);
 	}
 	
	}
		$(document).ready(function (){
		var a=${productModel.PRODUCT_ELEMENT};
		if(a!=3){
 		$("#BAGGAGE").hide();
 		$("#BAGGAGE_NUMBER").val("");
 	}
	});

   </script>
</head>

<body>

	<div class="form_congtainer">
		<form action="admin/adminProduct/saveConfigAdminProduct.json"id="productForm" name="productForm" enctype="multipart/form-data" method="post">
			<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${productModel.PRODUCT_ID }" />
			<div id="itemtitle" class="fieldset">
				<label for="TitleID" class="formname">宝贝标题：</label> <input
					class="form-control" maxlength=40 name="PRODUCT_TITLE"
					id="PRODUCT_TITLE" value="${productModel.PRODUCT_TITLE }"
					onkeyup="javascript:setShowLength(this, 40, 'textSize');">
				<span class="tips">还能输入&nbsp;&nbsp;<span id="textSize" style="color:#F00;">40个字</span> </span>
			</div>
			<div class="fieldset">
				<label class="formname">一口价：</label> <input class="form-control"
					name="PRODUCT_PRICE" id="PRODUCT_PRICE"
					value="${productModel.PRODUCT_PRICE }">元 <span class="tips">产品最低定价。如有销售属性项则录入销售属性项中的最低价</span>
			</div>

			<div class="fieldset">
				<label class="formname">保险简介：</label>
				<textarea class="text-input" name="PRODUCT_EXPLAN"
					id="PRODUCT_EXPLAN" rows="3" cols="45">${productModel.PRODUCT_EXPLAN }</textarea>
				<span class="tips"></span>
			</div>

			<div class="fieldset">
				<label class="formname">投保份数：</label> <input class="form-control"
					name="INSURANCE_NUMBER" value="${productModel.INSURANCE_NUMBER }">份
				<span class="tips">设为0时，本产品投保份数为无限制</span>
			</div>

			<div class="fieldset">
				<label class="formname">保障期间：</label> <input name="INSURANCE_PERIOD"
					type="text" class="form-control"
					value="${productModel.INSURANCE_PERIOD }">天 <span
					class="tips">如产品销售属性项中有保障期间这个维度，则此处无需录入。</span>
			</div>
			
		<div class="fieldset">
				<label class="formname">产品要素：</label>
				<select name="PRODUCT_ELEMENT" class="select-control" onchange="func()">
					<option value="0"
						<c:if test="${productModel.PRODUCT_ELEMENT !='1'}">selected</c:if>>保障时间</option>
					<option value="1" <c:if test="${productModel.PRODUCT_ELEMENT =='1'}">selected</c:if>>航班号码</option>
					<option value="2" <c:if test="${productModel.PRODUCT_ELEMENT =='2'}">selected</c:if>>拒签险</option>
					<option value="3" <c:if test="${productModel.PRODUCT_ELEMENT =='3'}">selected</c:if>>行李号</option>
				</select>
				<span class="tips">默认产品要素为保障时间。</span>

			</div>
			<div class="fieldset" id="BAGGAGE" name ="BAGGAGE" type="hidden">
				<label class="formname">允许行李号数：</label>
				<select id="BAGGAGE_NUMBER" name="BAGGAGE_NUMBER" class="select-control">
				<c:choose>	
					<c:when test="${empty productModel.BAGGAGE_NUMBER}">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option style="display: none;"  value="0">0</option>
					</c:when>
					<c:otherwise>
						<option value="1" <c:if test="${productModel.BAGGAGE_NUMBER =='1'}">selected</c:if>>1</option>
						<option value="2" <c:if test="${productModel.BAGGAGE_NUMBER =='2'}">selected</c:if>>2</option>
						<option value="3" <c:if test="${productModel.BAGGAGE_NUMBER =='3'}">selected</c:if>>3</option>
						<option value="4" <c:if test="${productModel.BAGGAGE_NUMBER =='4'}">selected</c:if>>4</option>
					</c:otherwise>
				</c:choose>
				</select>
			</div>
						<div class="fieldset">
				<label class="formname">产品是否允许票号投保：</label>
				<select name="ISALLOWTICKET" id="ISALLOWTICKET" class="select-control">
					<option value="0"
						<c:if test="${productModel.ISALLOWTICKET ==0 }">selected</c:if>>否</option>
					<option value="1"
						<c:if test="${productModel.ISALLOWTICKET ==1 }">selected</c:if>>是</option>
				</select>
				<span class="tips"></span>
			</div>
			<div class="fieldset">
				<label class="formname">犹豫期：</label> <input class="form-control"
					name="PROBATIONARY_PERIOD"
					value="${productModel.PROBATIONARY_PERIOD }">天 <span
					class="tips">保险公司提供给投保人的试用期，试用期内可全额退保。设为0时，本产品无犹豫期。</span>
			</div>

			<div class="fieldset">
				<label class="formname">产品代码：</label> <input class="form-control"
					name="MERCHANT_CODES" value="${productModel.MERCHANT_CODE }">
				<span class="tips">录入一个销售属性中的产品代码项。如无销售属性项，则录入该产品对应保险公司系统中的编码</span>
			</div>

			<div class="fieldset">
				<label class="formname">用户类型：</label>
				<select name="USER_TYPE" class="select-control">

					<option value="0" 
						<c:if test="${productModel.USER_TYPE =='0' }">selected</c:if>>普通用户</option>

					<option value="1"
						<c:if test="${productModel.USER_TYPE =='1' }">selected</c:if>>航班用户</option>

				</select>
				<span class="tips">如果是航班用户，则可直接输入机票号进行投保。</span>
			</div>
			<div class="fieldset">
				<label class="formname">产品是否生效：</label> <select name="PRODUCT_FLAG"
					class="select-control">

					<option value="1"
						<c:if test="${productModel.PRODUCT_FLAG =='1' }">selected</c:if>>立即生效</option>

					<option value="0"
						<c:if test="${productModel.PRODUCT_FLAG =='0' }">selected</c:if>>未生效</option>

				</select> <span class="tips">产品是否生效标记。</span>
			</div>

			<!-- 产品表示顺序 -->
			<div class="fieldset">
				<label class="formname">表示顺序：</label>
				<c:choose>
					<c:when test="${empty productModel.PRODUCT_DISP_NUM}">
						<input type="text" id="PRODUCT_DISP_NUM" name="PRODUCT_DISP_NUM" value="5" size=4 readonly/>
					</c:when>
					<c:otherwise>
						<input type="text" id="PRODUCT_DISP_NUM" name="PRODUCT_DISP_NUM" value="${productModel.PRODUCT_DISP_NUM }" size=4 readonly/>
					</c:otherwise>
				</c:choose>
				<span class="tips">前台产品表示顺序(数字越小越排前)</span>
			</div>
			<div class="fieldset">
				<label class="formname">产品推荐：</label> <select name="PRODUCT_LEVEL"
					class="select-control">

					<option value="1"
						<c:if test="${productModel.PRODUCT_LEVEL ==1 }">selected</c:if>>1星推荐</option>

					<option value="2"
						<c:if test="${productModel.PRODUCT_LEVEL ==2 }">selected</c:if>>2星推荐</option>

					<option value="3"
						<c:if test="${productModel.PRODUCT_LEVEL ==3 }">selected</c:if>>3星推荐</option>

					<option value="4"
						<c:if test="${productModel.PRODUCT_LEVEL ==4 }">selected</c:if>>4星推荐</option>

					<option value="5"
						<c:if test="${productModel.PRODUCT_LEVEL ==5 }">selected</c:if>>5星推荐</option>
				</select> <span class="tips"></span>
			</div>

			<div class="fieldset">
				<label class="formname">保险类型：</label> <select name="PRODUCT_TYPE"
					class="select-control">
					<c:forEach items="${mastDate1}" var="item">
						<option value="${item.M_NAME}" <c:if test="${productModel.PRODUCT_TYPE == item.M_NAME }">selected</c:if> >${item.M_NAME}</option>
 					</c:forEach>						
				</select> <span class="tips"></span>
			</div>

			<div class="fieldset">
				<label class="formname">产品标记：</label> <select name="PRODUCT_MARK"
					class="select-control">

					<option value="0"
						<c:if test="${productModel.PRODUCT_MARK ==0 }">selected</c:if>>普通产品</option>

					<option value="1"
						<c:if test="${productModel.PRODUCT_MARK ==1 }">selected</c:if>>独家产品</option>

					<option value="2"
						<c:if test="${productModel.PRODUCT_MARK ==2 }">selected</c:if>>热销产品</option>

				</select> <span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">产品是否允许批量投保：</label>
				<select name="BATCHINSURED" class="select-control">
					<option value="0"
						<c:if test="${productModel.ISBATCHINSURED ==0 }">selected</c:if>>否</option>

					<option value="1"
						<c:if test="${productModel.ISBATCHINSURED ==1 }">selected</c:if>>是</option>


				</select>
				<span class="tips"></span>
			</div>
			<div class="fieldset">
				<label class="formname">浦发银行卡用户产品：</label>
				<select name="ISPFCARD" class="select-control">
					
					<option value="0"
						<c:if test="${productModel.ISPFCARD ==0}">selected</c:if>>否</option>

					<option value="0"
						<c:if test="${productModel.ISBATCHINSURED ==0 }">selected</c:if>>否</option>

					<option value="1"
						<c:if test="${productModel.ISBATCHINSURED ==1 }">selected</c:if>>是</option>

				</select> <span class="tips"></span>
			</div>

				<span class="tips">是否针对浦发银行卡用户销售的产品</span>

			<div class="fieldset">
				<label class="formname">是否送里程：</label> <input class="form-control"
					name="SEND_MILEAGE" value="${productModel.SEND_MILEAGE}">
				<ul class="ul-radio">
					<li><input type="radio" class="radio"
						<c:if test="${productModel.MILEAGE_TYPE ==0 }">checked</c:if>
						name="MILEAGE_TYPE" value="0"> <label>里程数</label></li>
					<li><input type="radio" class="radio"
						<c:if test="${productModel.MILEAGE_TYPE ==1 }">checked</c:if>
						name="MILEAGE_TYPE" value="1"> <label>倍里程</label></li>
				</ul>
				<span class="tips">默认选择里程数，如为倍数请点选‘倍里程’</span>
			</div>

			<div class="fieldset">
				<label class="formname">保险公司：</label> <input class="form-control"
					name="INSURANCE_COMPANY" value="${productModel.INSURANCE_COMPANY }">
				<!-- 
				<select name="INSURANCE_COMPANY" class="select-control">

					<option value="太平保险" <c:if test="${productModel.INSURANCE_COMPANY =='太平保险' }">selected</c:if>>太平保险</option>
					<option value="国华人寿" <c:if test="${productModel.INSURANCE_COMPANY =='国华人寿' }">selected</c:if>>国华人寿</option>
					<option value="合众人寿" <c:if test="${productModel.INSURANCE_COMPANY =='合众人寿' }">selected</c:if>>合众人寿</option>
					<option value="嘉禾人寿" <c:if test="${productModel.INSURANCE_COMPANY =='嘉禾人寿' }">selected</c:if>>嘉禾人寿</option>
					<option value="人保健康" <c:if test="${productModel.INSURANCE_COMPANY =='人保健康' }">selected</c:if> >人保健康</option>
					<option value="泰康" <c:if test="${productModel.INSURANCE_COMPANY =='泰康' }">selected</c:if>>泰康</option>
					<option value="幸福人寿" <c:if test="${productModel.INSURANCE_COMPANY =='幸福人寿' }">selected</c:if>>幸福人寿</option>
					<option value="阳光保险" <c:if test="${productModel.INSURANCE_COMPANY =='阳光保险' }">selected</c:if>>阳光保险</option>
					<option value="中国人寿" <c:if test="${productModel.INSURANCE_COMPANY =='中国人寿' }">selected</c:if>>中国人寿</option>
					<option value="生命人寿" <c:if test="${productModel.INSURANCE_COMPANY =='生命人寿' }">selected</c:if>>生命人寿</option>
					<option value="平安人寿" <c:if test="${productModel.INSURANCE_COMPANY =='平安人寿' }">selected</c:if>>平安人寿</option>
					<option value="太平财险" <c:if test="${productModel.INSURANCE_COMPANY =='太平财险' }">selected</c:if>>太平财险</option>
					<option value="新华人寿" <c:if test="${productModel.INSURANCE_COMPANY =='新华人寿' }">selected</c:if>>新华人寿</option>

				</select>
				 -->
				<span class="tips"></span>
			</div>
			<div class="fieldset">
				<label class="formname">产品投保方式：</label> <select
					name="INSURANCE_MODE" class="select-control">
					<option value="0"
						<c:if test="${productModel.INSURANCE_MODE =='0' }">selected</c:if>>实时投保</option>
					<option value="1"
						<c:if test="${productModel.INSURANCE_MODE =='1' }">selected</c:if>>自动投保</option>
				</select> <span class="tips"></span>
			</div>

			<div class="fieldset">
				<label class="formname">保险公司代码：</label> <input class="form-control"
					name="COMPANY_CODE" value="${productModel.COMPANY_CODE}"> <span
					class="tips">保险公司四字代码（一般都是4个字符，也有个别的有点差别）</span>
			</div>

			<div class="fieldset">
				<label class="formname">保险产品类型代码：</label> <input
					class="form-control" name="INSURANCE_PRODUCT_CODE"
					value="${productModel.INSURANCE_PRODUCT_CODE}"> <span
					class="tips">保险产品类型代码 一般是7位数的纯数字组合，比如1000000</span>
			</div>

			<div class="fieldset">
				<label class="formname">保险产品类型ID：</label> <input
					class="form-control" name="INSURANCE_PRODUCT_ID"
					value="${productModel.INSURANCE_PRODUCT_ID}"> <span
					class="tips">保险产品类型ID 一般是32位数的数字+字母组合，格式其实和UUID相同</span>
			</div>

			<div class="fieldset">
				<label class="formname">协议产品代码：</label> <input class="form-control"
					name="PROTOCOL_CODE" value="${productModel.PROTOCOL_CODE}">
				<span class="tips"></span>
			</div>

			<div class="fieldset">
				<label class="formname">产品销售类型：</label>
				<c:if test="${productTypeModel.CLIENT_TYPE == null }">
					<c:forEach items="${mastDate}" var="item">
						<input type="checkbox" name="CLIENT_TYPE" id="CLIENT_TYPE"   <c:if test="${fn:contains(productModel.PRODUCT_SALES_TYPE, item.M_CODE)}">checked</c:if> value="${item.M_CODE}">${item.M_NAME}&nbsp;
        			</c:forEach>
　　				</c:if>
				<c:if test="${productTypeModel.CLIENT_TYPE != null }">
					<c:forEach items="${mastDate}" var="item">
						<input type="checkbox" name="CLIENT_TYPE" id="CLIENT_TYPE"  <c:if test="${fn:contains(productTypeModel.CLIENT_TYPE, item.M_CODE)}">checked</c:if> value="${item.M_CODE}">${item.M_NAME}
        			</c:forEach>
        		</c:if>
			<span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">产品证件类型：</label>
					<c:forEach items="${mastDate2}" var="item">
						<input type="checkbox" name="DOCUMENTS_TYPE" id="DOCUMENTS_TYPE"   <c:if test="${fn:contains(productTypeModel.DOCUMENTS_TYPE, item.M_CODE)}">checked</c:if> value="${item.M_CODE}">${item.M_NAME}&nbsp;
        			</c:forEach>
			<span class="tips"></span>
			</div>

			<div class="fieldset" id="PROXY" style="display:block;">
				<label class="formname">应收代理费费率：</label> <input id="PROXY_RATE"
					type="n" class="form-control" name="PROXY_RATE"
					onchange="if(/[^\d\.]/g.test(this.value)){Dialog.alert('提示：只能输入数字!');this.value='';}">&nbsp;&nbsp;<span
					style=" font-size: 10px;">(%)</span> <span class="tips">ATM机销售*必填项</span>
			</div>

			<div class="fieldset" id="SERVICE" style="display:block;">
				<label class="formname">机场服务费费率：</label> <input id="SERVICE_RATE"
					class="form-control" name="SERVICE_RATE"
					onchange="if(/[^\d\.]/g.test(this.value)){Dialog.alert('提示：只能输入数字!');this.value='';}">&nbsp;&nbsp;<span
					style=" font-size: 10px;">(%)</span> <span class="tips">ATM机销售*必填项</span>
			</div>

			<div class="fieldset" id="PROCEDURES" style="display:block;">
				<label class="formname">刷卡手续费费率：</label> <input id="PROCEDURES_RATE"
					class="form-control" name="PROCEDURES_RATE"
					onchange="if(/[^\d\.]/g.test(this.value)){Dialog.alert('提示：只能输入数字!');this.value='';}">&nbsp;&nbsp;<span
					style=" font-size: 10px;">(%)</span> <span class="tips">ATM机销售*必填项</span>
			</div>

			<div class="fieldset">
				<label class="formname">产品保障额度：</label> <input class="form-control"
					name="PRODUCT_LINE" value="${productModel.PRODUCT_LINE}"> <span
					class="tips">ATM机销售产品必填项，其它销售类型产品不须填写</span>
			</div>

			<div class="fieldset" style="display:none">
				<label class="formname">出行目的：</label> <select name="TRIP_PURPOSE"
					class="select-control">

					<option value="旅游"
						<c:if test="${productModel.TRIP_PURPOSE =='旅游' }">checked</c:if>>旅游</option>

					<option value="探亲"
						<c:if test="${productModel.TRIP_PURPOSE =='探亲' }">checked</c:if>>探亲</option>

					<option value="公务"
						<c:if test="${productModel.TRIP_PURPOSE =='公务' }">checked</c:if>>公务</option>

					<option value="长住"
						<c:if test="${productModel.TRIP_PURPOSE =='长住' }">checked</c:if>>长住</option>

				</select> <span class="tips"></span>

			</div>
			<div class="fieldset" style="display:none">
				<label class="formname">出行天数：</label> <input class="form-control"
					name="TRAVEL_TIME" value="${productModel.TRAVEL_TIME}">天 <span
					class="tips"></span>

			</div>
			<div class="fieldset" style="display:none">
				<label class="formname">特色保障：</label>
				<ul class="ul-radio">
					<li><input type="radio" class="radio"
						<c:if test="${productModel.CHARACTERISTIC_SAFEGUARD =='紧急救援' }">checked</c:if>
						value="紧急救援" name="CHARACTERISTIC_SAFEGUARD"> <label
						for="1">紧急救援</label></li>
					<li><input type="radio" class="radio"
						<c:if test="${productModel.CHARACTERISTIC_SAFEGUARD =='高风险运动' }">checked</c:if>
						value="高风险运动" name="CHARACTERISTIC_SAFEGUARD"> <label
						for="2">高风险运动</label></li>
					<li><input type="radio" class="radio"
						<c:if test="${productModel.CHARACTERISTIC_SAFEGUARD =='危险地区国家' }">checked</c:if>
						value="危险地区国家" name="CHARACTERISTIC_SAFEGUARD"> <label
						for="3">危险地区国家</label></li>
					<li><input type="radio" class="radio"
						<c:if test="${productModel.CHARACTERISTIC_SAFEGUARD =='申根签证专用' }">checked</c:if>
						value="申根签证专用" name="CHARACTERISTIC_SAFEGUARD"> <label
						for="4">申根签证专用</label></li>
					<li><input type="radio" class="radio"
						<c:if test="${productModel.CHARACTERISTIC_SAFEGUARD =='境外停留180天以上' }">checked</c:if>
						value="境外停留180天以上" name="CHARACTERISTIC_SAFEGUARD"> <label
						for="5">境外停留180天以上</label></li>
				</ul>

			</div>
			<div class="fieldset" style="display:none">
				<label class="formname">出行地区：</label> <select name="TRAVEL_AREA"
					class="select-control">

					<option value="国外（非申根地区）"
						<c:if test="${productModel.TRAVEL_AREA =='国外（非申根地区）' }">selected</c:if>>国外（非申根地区）</option>

					<option value="国外（申根地区）"
						<c:if test="${productModel.TRAVEL_AREA =='国外（申根地区）' }">selected</c:if>>国外（申根地区）</option>

					<option value="国内"
						<c:if test="${productModel.TRAVEL_AREA =='国内' }">selected</c:if>>国内</option>

				</select>

			</div>
			<div class="fieldset">
				<label class="formname">宝贝图片：</label>

				<div class="multimage-gallery listfr">
					<ul>
					<%
						for (int i=1;i<6;i++){
							boolean flag =true;
							if(flag){
					%>
							<c:set var="number" value="<%=i%>"/>
							<c:if test="${!empty listImgRecords}">
								<c:forEach var="imgs" items="${listImgRecords}" varStatus="status" >
								<c:if test="${imgs.IMG_NO == number}">
								<li>
									<div id="imgdiv<%=i%>" class="examp">
										<img id="imgShow<%=i%>" src="${imgs.IMG_SRC}" width="100" height="100" />
									</div>
									<div class="info mt_5">
										<a href="javascript:;" class="a-upload">选择图片 
										<input type="file" name="PRODUCT_IMG<%=i%>" id="PRODUCT_IMG<%=i%>"></a> 
										<input type="hidden" name="img<%=i%>" value="${imgs.ID }">
									</div>
									<div align="center" style="margin-top:5px">
						 				<input type="button" name="PRODUCT_IMG<%=i%>" id="PRODUCT_IMG<%=i%>" value=" 删 除 " onclick="deleteImg('<%=i%>')">
						 				<input type="hidden" name="imgDelFlg<%=i%>" id="imgDelFlg<%=i%>" value="0" />
						 			</div>
						 			<%flag=false; %>
								</li>	
								</c:if>
								</c:forEach>
							</c:if>
							<%} if (flag){ %>
								<li>
									<div id="imgdiv<%=i%>" class="examp">
										<img id="imgShow<%=i%>" src="images/nopic.jpg" width="100" height="100" />
									</div>
									<div class="info mt_5">
										<a href="javascript:;" class="a-upload">选择图片 <input type="file" name="PRODUCT_IMG<%=i%>" id="PRODUCT_IMG<%=i%>"></a>
									</div>
								</li>
							<%}}%>		
					<div class="pt_15 ">图片至少上传一张,图片大小不能超过500K。</div>
				</div>
				<span class="tips"></span>
			</div>
			<%--保障内容开始---%>
			<div class="fieldset">
				<label class="formname">保障内容：</label>

				<div class="listfr" style="width: 600px;">
					<script type="text/plain" id="INSURANCE_CONTENT" name="INSURANCE_CONTENT"
							style="width:600px;height:300px;">${productModel.INSURANCE_CONTENT}</script>
				</div>
			</div>
			<script type="text/javascript">var PRODUCT_INFO = UE.getEditor('INSURANCE_CONTENT');</script>
			<%--保障内容结束---%>
			<div class="fieldset">
				<label class="formname">产品详情：</label>

				<div class="listfr" style="width: 600px;">
					<script type="text/plain" id="PRODUCT_INFO" name="PRODUCT_INFO"
						style="width:600px;height:300px;">${productModel.PRODUCT_INFO}</script>
				</div>
			</div>

			<script type="text/javascript">var PRODUCT_INFO = UE.getEditor('PRODUCT_INFO');</script>

			<div class="fieldset">
				<label class="formname">添加销售属性：</label>

				<div class="listfr">
					<h4 class="fs14">投保年龄：</h4>
					<div id="age" class="tokenfield form-control" style="width: 600px;">
						<input type="text" class="form-control"
							id="inputTokenfieldSuccess" value="red,green,blue" tabindex="-1"
							style="position: absolute; left: -10000px;"> <input
							type="text" tabindex="-1"
							style="position: absolute; left: -10000px;">
						<%
							String ageValue = "";
						%>
						<c:if test="${!empty listSalesRecords}">
							<c:forEach var="list" items="${listSalesRecords}">
								<c:if test="${list.ATTRIBUTE_TYPE == '投保年龄'}">
									<c:set var="ageValue" value="${list.SALES_ATTRIBUTE }"
										scope="request" />
									<div class="token" id="${list.ID }">
										<span class="token-label" style="max-width: 661px;">${list.SALES_ATTRIBUTE
											}</span><a
											href="javascript:deleteInsuranceAge(${list.ID },'${list.SALES_ATTRIBUTE }');"
											class="close" tabindex="-1">×</a>
									</div>
									<%
										if ("".equals(ageValue)) {
														ageValue = request.getAttribute("ageValue")
																.toString();
													} else {
														ageValue = ageValue
																+ ","
																+ request.getAttribute("ageValue")
																		.toString();
													}
									%>
								</c:if>
							</c:forEach>
						</c:if>
						<input type="hidden" name="INSURANCE_SALES_AGE"
							id="INSURANCE_SALES_AGE" value="<%=ageValue%>"> <input
							type="text" name="inputToken" class="token-input" id="inputToken"
							tabindex="0" style="min-width: 60px; width: 120px;">
					</div>
					<input type="button" class="btn_com"
						onclick="addInsuranceAge();return false;" value="添加">

					<h4 class="fs14">保障期限：</h4>
					<div id="security" class="tokenfield form-control"
						style="width: 600px;">
						<input type="text" class="form-control"
							id="inputTokenfieldSuccess" value="red,green,blue" tabindex="-1"
							style="position: absolute; left: -10000px;"> <input
							type="text" tabindex="-1"
							style="position: absolute; left: -10000px;">
						<%
							String periodValue = "";
						%>
						<c:if test="${!empty listSalesRecords}">
							<c:forEach var="list" items="${listSalesRecords}">
								<c:if test="${list.ATTRIBUTE_TYPE == '保障期限'}">
									<c:set var="periodValue" value="${list.SALES_ATTRIBUTE }"
										scope="request" />
									<div class="token" id="${list.ID }">
										<span class="token-label" style="max-width: 661px;">${list.SALES_ATTRIBUTE
											}</span><a
											href="javascript:deleteGuaranteePeriod(${list.ID },'${list.SALES_ATTRIBUTE }');"
											class="close" tabindex="-1">×</a>
									</div>
									<%
										if ("".equals(periodValue)) {
														periodValue = request.getAttribute("periodValue")
																.toString();
													} else {
														periodValue = periodValue
																+ ","
																+ request.getAttribute("periodValue")
																		.toString();
													}
									%>
								</c:if>
							</c:forEach>
						</c:if>
						<input type="hidden" name="GUARANTEE_SALES_PERIOD"
							id="GUARANTEE_SALES_PERIOD" value="<%=periodValue%>"> <input
							type="text" class="token-input" id="inputToken1" tabindex="0"
							style="min-width: 60px; width: 120px;">
					</div>
					<input type="button" class="btn_com"
						onclick="addGuaranteePeriod();return false;" value="添加">

					<h4 class="fs14">保障计划：</h4>
					<div id="plan" class="tokenfield form-control"
						style="width: 600px;">
						<input type="text" class="form-control"
							id="inputTokenfieldSuccess" value="red,green,blue" tabindex="-1"
							style="position: absolute; left: -10000px;"> <input
							type="text" tabindex="-1"
							style="position: absolute; left: -10000px;">
						<%
							String planValue = "";
						%>
						<c:if test="${!empty listSalesRecords}">
							<c:forEach var="list" items="${listSalesRecords}">
								<c:if test="${list.ATTRIBUTE_TYPE == '保障计划'}">
									<c:set var="planValue" value="${list.SALES_ATTRIBUTE }"
										scope="request" />
									<div class="token" id="${list.ID }">
										<span class="token-label" style="max-width: 661px;">${list.SALES_ATTRIBUTE
											}</span><a
											href="javascript:deleteSageguardPlan(${list.ID },'${list.SALES_ATTRIBUTE }');"
											class="close" tabindex="-1">×</a>
									</div>
									<%
										if ("".equals(planValue)) {
														planValue = request.getAttribute("planValue")
																.toString();
													} else {
														planValue = planValue
																+ ","
																+ request.getAttribute("planValue")
																		.toString();
													}
									%>
								</c:if>
							</c:forEach>
						</c:if>
						<input type="hidden" name="SAFEGUARD_SALES_PLAN"
							id="SAFEGUARD_SALES_PLAN" value="<%=planValue%>"> <input
							type="text" class="token-input" id="inputToken2" tabindex="0"
							style="min-width: 60px; width: 120px;">
					</div>
					<input type="button" class="btn_com"
						onclick="addSafeguardPlan();return false;" value="添加">

					<h4 class="fs14">飞行次数：</h4>
					<div id="plan" class="tokenfield form-control"
						style="width: 600px;">
						<input type="text" class="form-control"
							id="inputTokenfieldSuccess" value="red,green,blue" tabindex="-1"
							style="position: absolute; left: -10000px;"> <input
							type="text" tabindex="-1"
							style="position: absolute; left: -10000px;">
						<%
							String flightValue = "";
						%>
						<c:if test="${!empty listSalesRecords}">
							<c:forEach var="list" items="${listSalesRecords}">
								<c:if test="${list.ATTRIBUTE_TYPE == '飞行次数'}">
									<c:set var="flightValue" value="${list.SALES_ATTRIBUTE }"
										scope="request" />
									<div class="token" id="${list.ID }">
										<span class="token-label" style="max-width: 661px;">${list.SALES_ATTRIBUTE
											}</span><a
											href="javascript:deleteFlightNumber(${list.ID },'${list.SALES_ATTRIBUTE }');"
											class="close" tabindex="-1">×</a>
									</div>
									<%
										if ("".equals(flightValue)) {
														flightValue = request.getAttribute("flightValue")
																.toString();
													} else {
														flightValue = flightValue
																+ ","
																+ request.getAttribute("flightValue")
																		.toString();
													}
									%>
								</c:if>
							</c:forEach>
						</c:if>
						<input type="hidden" name="FLIGHT_NUMBER" id="FLIGHT_NUMBER"
							value="<%=flightValue%>"> <input type="text"
							class="token-input" id="inputToken3" tabindex="0"
							style="min-width: 60px; width: 120px;">
					</div>
					<input type="button" class="btn_com"
						onclick="addFlightNumber();return false;" value="添加">
				</div>

				<div class="fieldset">
					<label class="formname">属性组合：</label>
					<div class="listfr">
						<table class="table_numb" id="table1">
							<tr>
								<th width="20"></th>
								<th>投保年龄</th>
								<th>保障期限</th>
								<th>保障计划</th>
								<th>飞行次数</th>
								<th>产品代码</th>
								<th>一口价</th>
								<th width="80">保险简介</th>
							</tr>
							<c:if test="${!empty listAttributeRecords}">
								<%
									int x = 1;
								%>
								<c:forEach var="list" items="${listAttributeRecords}">
									<tr>
										<th rowspan="2"><%=x%></th>
										<th>${list.SALES_ATTRIBUTE1}</th>
										<th>${list.SALES_ATTRIBUTE2}</th>
										<th>${list.SALES_ATTRIBUTE3}</th>
										<th>${list.SALES_ATTRIBUTE4}</th>
										<th><input type="text" class="form_min"
											id="MERCHANT_CODE${list.ID }" name="MERCHANT_CODE1"
											<c:if test="${not empty list.MERCHANT_CODE}">value="${list.MERCHANT_CODE},${list.GUARANTEE_PERIOD}"</c:if>
											onchange="changeCom(${list.ID },'1')">
										</th>
										<th><input type="text" class="form_min"
											id="COMBINATION_PRICE${list.ID }" name="COMBINATION_PRICE1"
											value="${list.COMBINATION_PRICE}"
											onchange="changeCom(${list.ID },'2')">
										</th>
										<th width="80"></th>
									</tr>
									<tr>
										<th colspan="6"><textarea
												id="COMBINATION_INFO${list.ID }" class="text-input"
												name="COMBINATION_INFO1" rows="2" style="width: 100%;"
												onchange="changeCom(${list.ID },'3')">
									${list.COMBINATION_INFO}
									</textarea></th>
									</tr>
									<%
										x++;
									%>
								</c:forEach>
							</c:if>
						</table>
					</div>
				</div>
			</div>


			<div class="fieldset">
				<label class="formname">保障显示方式：</label>
				<div class="listfr">
					<input name="SAFEGUARD_MARK" id="SAFEGUARD_MARK" type="radio"
						<c:if test="${productModel.SAFEGUARD_MARK=='0' }">checked</c:if>
						value="0" onchange="change();" />使用产品详情&nbsp;&nbsp;&nbsp;<input
						name="SAFEGUARD_MARK" id="SAFEGUARD_MARK" type="radio"
						<c:if test="${productModel.SAFEGUARD_MARK=='1' }">checked</c:if>
						value="1" onchange="change();" />自定义内容
				</div>
			</div>

			<div class="fieldset" id="INSURE"
				<c:if test="${productModel.SAFEGUARD_MARK=='0' }">style="display:none"</c:if>>
				<label class="formname">保障权益：</label>
				<div class="listfr">
					<table class="table_numb" id="table_numb">
						<tr id="table_tr">
							<th>关联属性</th>
							<th>保障类型<span class="fs12 clgrey">(最多支持20个中文)</span>
							</th>
							<th>保障额度<span class="fs12 clgrey">(最多支持10个中文)</span>
							</th>
							<th>责任描述<span class="fs12 clgrey">(最多支持200个中文)</span>
							</th>
						</tr>
						<c:choose>
							<c:when test="${not empty listAirlinesRecords}">
								<c:forEach var="list" items="${listAirlinesRecords}">
									<tr id="${list.SALES_ATTRIBUTE }">
										<td><select name="salesID" id="salesID">
												<option value="${list.SALES_ATTRIBUTE }">${list.SALES_ATTRIBUTE
													}</option>
										</select></td>
										<td><input type="text" value="${list.INSURE_ALLOWED }"
											class="form_mid" maxlength=20 name="INSURE_ALLOWED">
										</td>
										<td><input type="text"
											value="${list.GUARANTEE_AMOUNT },${list.DISPLAY_LEVEL }"
											class="form_min" maxlength=10 name="GUARANTEE_AMOUNT">
										</td>
										<td><input type="text" value="${list.INFO }"
											class="form_mid" maxlength=200 name="INSURE_INFO"></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:if test="${not empty listSalesRecords }">
									<c:forEach var="list" items="${listSalesRecords }">
										<tr id="${list.SALES_ATTRIBUTE }">
											<td><select name="salesID" id="salesID">
													<option value="${list.SALES_ATTRIBUTE }">${list.SALES_ATTRIBUTE
														}</option>
											</select>
											</td>
											<td><input type="text" class="form_mid" maxlength=20
												name="INSURE_ALLOWED">
											</td>
											<td><input type="text" class="form_min" maxlength=10
												name="GUARANTEE_AMOUNT">
											</td>
											<td><input type="text" class="form_mid" maxlength=200
												name="INSURE_INFO">
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</c:otherwise>
						</c:choose>
					</table>
					<input type="button" class="btn_com" value="增加保障权益" onclick="addSales();" />
				</div>
			</div>

			<div class="fieldset">
				<label class="formname">保险条款：</label>
				<div class="multimage-gallery listfr">
					<div id="fileDiv" class="tokenfield">
						<c:if test="${fileRecord != null }">
							<div class="token" id="${fileRecord.ID}">
								<span class="token-label" style="max-width: 661px;">${fileRecord.FILE_NAME}</span><a
									href="javascript:deleteFile('${fileRecord.ID}', true);"
									class="close" tabindex="-1">×</a>
							</div>
						</c:if>
						<div class="info mt_5" id="uploadFileDiv">
							<a href="javascript:;" class="a-upload">选择文件<input
								type="file" name="INSURANCE_CLAUSE" id="INSURANCE_CLAUSE" /> </a>
						</div>
					</div>
					<input type="hidden" name="insFile" id="insFile"
						value="${fileRecord.ID }"> <input type="hidden"
						name="fileDelFlg" id="fileDelFlg" value="0" />
					<script type="text/javascript">new uploadFilePreview({ UpBtn: "INSURANCE_CLAUSE", DivShow: "${fileRecord.ID}"});</script>
				</div>
			</div>
			
			<div class="fieldset">
				<label class="formname">投保提示：</label>
				<div class="multimage-gallery listfr">
					<div id="fileDiv" class="tokenfield">
						<c:if test="${fileRe != null }">
							<div class="token1" id="${fileRe.ID}">
								<span class="token-label1" style="max-width: 661px;">${fileRe.FILE_NAME}</span><a
									href="javascript:deleteFile1('${fileRe.ID}', true);"
									class="close" tabindex="-1">×</a>
							</div>
						</c:if>
						<div class="info mt_5" id="uploadFileDiv1">
							<a href="javascript:;" class="a-upload">选择文件<input
								type="file" name="INSURANCE_" id="INSURANCE_" /> </a>
						</div>
					</div>
					<input type="hidden" name="insFile1" id="insFile1"
						value="${fileRe.ID }"> <input type="hidden"
						name="fileDelFlg1" id="fileDelFlg1" value="0" />
					<script type="text/javascript">new uploadFilePreview1({ UpBtn: "INSURANCE_", DivShow: "${fileRe.ID}"});</script>
				</div>
			</div>

			<div class="fieldset">
				<label class="formname">投保信息：</label>
				<div class="listfr">
					<table class="table_about" id="table_about1">
						<tr>
							<th width="20"><input type="checkbox" name="checkAll"
								id="checkAll"></th>
							<th>投保人模块</th>
							<th>注释</th>
							<th width="160">优先级<span class="fs12 clgrey">(数字越小越排前)</span>
							</th>
							<th><span id="policy1"><a
									href="javascript:close('1');">收起列表</a> </span>
							</th>
						</tr>

						<%
							int k = 0;
						%>
						<c:choose>
							<c:when test="${!empty listPoicyRecords1}">
								<%
									String[] a = {"通讯地址", "姓名", "电子邮件", "证件号码", "出生日期", "性别",
													"常住地区", "固定电话", "手机号码", "地址", "邮编"};
											String[] b = new String[a.length];
											int h = 0;
								%>
								<c:forEach var="policyList" items="${listPoicyRecords1}">
									<c:set var="check" value="${policyList.POLICY_INFO}"
										scope="request" />
									<tr>
										<td><input type="checkbox" id="POLICY_INFO"
											name="POLICY_INFO<%=k %>" checked
											value="${policyList.POLICY_INFO }"></td>
										<td>${policyList.POLICY_INFO }</td>
										<td><input class="form_mid" value="${policyList.INFO }"
											name="INFO<%=k %>"></td>
										<td><input id="spinner<%=k %>" type="text"
											value="${policyList.INFO_LEVEL }" name="INFO_LEVEL<%=k %>"
											value=5 size=4 readonly></td>
										<td></td>
									</tr>
									<%
										b[h] = request.getAttribute("check").toString();
													h++;
													k++;
									%>
								</c:forEach>
								<%
									String[] check = UtilString.minus(a, b);
											if (null != check || check.length == 0) {
												for (int j = 0; j < check.length; j++) {
													if (check[j] != null) {
								%>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO<%=k%>" value="<%=check[j]%>"></td>
									<td><%=check[j]%></td>
									<td><input class="form_mid" name="INFO<%=k%>"></td>
									<td><input id="spinner<%=k%>" type="text"
										name="INFO_LEVEL<%=k%>" value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<%
									k++;
													}
												}
											}
								%>
							</c:when>
							<c:otherwise>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO0" value="通讯地址"></td>
									<td>通讯地址</td>
									<td><input class="form_mid" name="INFO0"></td>
									<td><input id="spinner1" type="text" name="INFO_LEVEL0"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>

								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO1" value="姓名"></td>
									<td>姓名</td>
									<td><input class="form_mid" name="INF1"></td>
									<td><input id="spinner2" type="text" name="INFO_LEVEL1"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO2" value="电子邮件"></td>
									<td>电子邮件</td>
									<td><input class="form_mid" name="INFO2"></td>
									<td><input id="spinner3" type="text" name="INFO_LEVEL2"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO3" value="证件号码"></td>
									<td>证件号码</td>
									<td><input class="form_mid" name="INFO3"></td>
									<td><input id="spinner4" type="text" name="INFO_LEVEL3"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO4" value="出生日期"></td>
									<td>出生日期</td>
									<td><input class="form_mid" name="INFO4"></td>
									<td><input type="text" id="spinner5" name="INFO_LEVEL4"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO5" value="性别"></td>
									<td>性别</td>
									<td><input class="form_mid" name="INFO5"></td>
									<td><input type="text" id="spinner6" name="INFO_LEVEL5"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO6" value="常住地区"></td>
									<td>常住地区</td>
									<td><input class="form_mid" name="INFO6"></td>
									<td><input type="text" id="spinner7" name="INFO_LEVEL6"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO7" value="固定电话"></td>
									<td>固定电话</td>
									<td><input class="form_mid" name="INFO7"></td>
									<td><input type="text" id="spinner8" name="INFO_LEVEL7"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO8" value="手机号码"></td>
									<td>手机号码</td>
									<td><input class="form_mid" name="INFO8"></td>
									<td><input type="text" id="spinner9" name="INFO_LEVEL8"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO9" value="地址"></td>
									<td>地址</td>
									<td><input class="form_mid" name="INFO9"></td>
									<td><input type="text" id="spinner10" name="INFO_LEVEL9"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO"
										name="POLICY_INFO10" value="邮编"></td>
									<td>邮编</td>
									<td><input class="form_mid" name="INFO10"></td>
									<td><input type="text" id="spinner11" name="INFO_LEVEL10"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>


					<table class="table_about" id="table_about2">
						<tr>
							<th width="20"><input type="checkbox" name="checkAll1"
								id="checkAll1"></th>
							<th>被保人模块</th>
							<th>注释</th>
							<th width="160">优先级<span class="fs12 clgrey fwn">(数字越小越排前)</span>
							</th>
							<th><span id="policy2"><a
									href="javascript:close('2');">收起列表</a> </span>
							</th>
						</tr>

						<c:choose>
							<c:when test="${!empty listPoicyRecords1}">
								<%
									String[] a = {"通讯地址", "姓名", "电子邮件", "证件号码", "出生日期", "性别",
													"常住地区", "固定电话", "手机号码", "地址", "邮编"};
											String[] b = new String[a.length];
											int h = 0;
								%>
								<c:forEach var="policyList" items="${listPoicyRecords2}">
									<c:set var="check" value="${policyList.POLICY_INFO}"
										scope="request" />
									<tr>
										<td><input type="checkbox" id="POLICY_INFO1"
											name="POLICY_INFO<%=k %>" checked
											value="${policyList.POLICY_INFO }"></td>
										<td>${policyList.POLICY_INFO }</td>
										<td><input class="form_mid" value="${policyList.INFO }"
											name="INFO<%=k %>"></td>
										<td><input id="spinner<%=k %>" type="text"
											value="${policyList.INFO_LEVEL }" name="INFO_LEVEL<%=k %>"
											value=5 size=4 readonly></td>
										<td></td>
									</tr>
									<%
										b[h] = request.getAttribute("check").toString();
													h++;
													k++;
									%>
								</c:forEach>
								<%
									String[] check = UtilString.minus(a, b);
											if (null != check || check.length == 0) {
												for (int j = 0; j < check.length; j++) {
													if (check[j] != null) {
								%>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO<%=k%>" value="<%=check[j]%>"></td>
									<td><%=check[j]%></td>
									<td><input class="form_mid" name="INFO<%=k%>"></td>
									<td><input id="spinner<%=k%>" type="text"
										name="INFO_LEVEL<%=k%>" value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<%
									k++;
													}
												}
											}
								%>
							</c:when>
							<c:otherwise>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO11" value="通讯地址"></td>
									<td>通讯地址</td>
									<td><input class="form_mid" name="INFO11"></td>
									<td><input id="spinner12" type="text" name="INFO_LEVEL11"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>

								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO12" value="姓名"></td>
									<td>姓名</td>
									<td><input class="form_mid" name="INFO12"></td>
									<td><input id="spinner13" type="text" name="INFO_LEVEL12"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO13" value="电子邮件"></td>
									<td>电子邮件</td>
									<td><input class="form_mid" name="INFO13"></td>
									<td><input id="spinner14" type="text" name="INFO_LEVEL13"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO14" value="证件号码"></td>
									<td>证件号码</td>
									<td><input class="form_mid" name="INFO14"></td>
									<td><input id="spinner15" type="text" name="INFO_LEVEL14"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO15" value="出生日期"></td>
									<td>出生日期</td>
									<td><input class="form_mid" name="INFO15"></td>
									<td><input type="text" id="spinner16" name="INFO_LEVEL15"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO16" value="性别"></td>
									<td>性别</td>
									<td><input class="form_mid" name="INFO16"></td>
									<td><input type="text" id="spinner17" name="INFO_LEVEL16"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO17" value="常住地区"></td>
									<td>常住地区</td>
									<td><input class="form_mid" name="INFO17"></td>
									<td><input type="text" id="spinner18" name="INFO_LEVEL17"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO18" value="固定电话"></td>
									<td>固定电话</td>
									<td><input class="form_mid" name="INFO18"></td>
									<td><input type="text" id="spinner19" name="INFO_LEVEL18"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO19" value="手机号码"></td>
									<td>手机号码</td>
									<td><input class="form_mid" name="INFO19"></td>
									<td><input type="text" id="spinner20" name="INFO_LEVEL19"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO20" value="地址"></td>
									<td>地址</td>
									<td><input class="form_mid" name="INFO20"></td>
									<td><input type="text" id="spinner21" name="INFO_LEVEL20"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO1"
										name="POLICY_INFO21" value="邮编"></td>
									<td>邮编</td>
									<td><input class="form_mid" name="INFO21"></td>
									<td><input type="text" id="spinner22" name="INFO_LEVEL21"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>

					<table class="table_about" id="table_about3">
						<tr>
							<th width="20"><input type="checkbox" name="checkAll2"
								id="checkAll2"></th>
							<th>其他信息</th>
							<th>注释</th>
							<th width="160">优先级<span class="fs12 clgrey fwn">(数字越小越排前)</span>
							</th>
							<th><span id="policy3"><a
									href="javascript:close('3');">收起列表</a> </span>
							</th>
						</tr>

						<c:choose>
							<c:when test="${not empty listPoicyRecords3}">
								<%
									String[] a = {"车主生日", "房屋结构类型", "车主姓名", "车主证件号码", "被保房屋用途",
													"邮政编码", "银行名称", "是否邮寄保单", "车牌号", "是否邮寄发票",
													"第三方支付公司名称", "房屋详细地址", "车主性别", "借记卡/信用卡号", "保障类型",
													"网银帐户名", "第三方支付帐号名", "邮寄地址", "邮寄邮编"};
											String[] b = new String[a.length];
											int h = 0;
								%>
								<c:forEach var="policyList" items="${listPoicyRecords3}">
									<c:set var="check2" value="${policyList.POLICY_INFO}"
										scope="request" />
									<tr>
										<td><input type="checkbox" id="POLICY_INFO2"
											name="POLICY_INFO<%=k %>" checked
											value="${policyList.POLICY_INFO}"></td>
										<td>${policyList.POLICY_INFO}</td>
										<td><input class="form_mid" name="INFO<%=k %>"
											value="${policyList.INFO}"></td>
										<td><input type="text" id="spinner<%=k %>"
											value="${policyList.INFO_LEVEL}" name="INFO_LEVEL<%=k %>"
											value=5 size=4 readonly></td>
										<td></td>
									</tr>
									<%
										b[h] = request.getAttribute("check2").toString();
													h++;
													k++;
									%>
								</c:forEach>
								<%
									String[] check = UtilString.minus(a, b);
											if (null != check || check.length == 0) {
												for (int j = 0; j < check.length; j++) {
													if (check[j] != null) {
								%>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO<%=k%>" value="<%=check[j]%>"></td>
									<td><%=check[j]%></td>
									<td><input class="form_mid" name="INFO<%=k%>"></td>
									<td><input type="text" id="spinner<%=k%>"
										name="INFO_LEVEL<%=k%>" value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<%
									k++;
													}
												}
											}
								%>
							</c:when>
							<c:otherwise>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO22" value="车主生日"></td>
									<td>车主生日</td>
									<td><input class="form_mid" name="INFO22"></td>
									<td><input type="text" id="spinner23" name="INFO_LEVEL22"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO23" value="房屋结构类型"></td>
									<td>房屋结构类型</td>
									<td><input class="form_mid" name="INFO23"></td>
									<td><input type="text" id="spinner24" name="INFO_LEVEL23"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO24" value="车主姓名"></td>
									<td>车主姓名</td>
									<td><input class="form_mid" name="INFO24"></td>
									<td><input type="text" id="spinner25" name="INFO_LEVEL24"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO25" value="车主证件号码"></td>
									<td>车主证件号码</td>
									<td><input class="form_mid" name="INFO25"></td>
									<td><input type="text" id="spinner26" name="INFO_LEVEL25"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO26" value="被保房屋用途"></td>
									<td>被保房屋用途</td>
									<td><input class="form_mid" name="INFO26"></td>
									<td><input type="text" id="spinner27" name="INFO_LEVEL26"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO27" value="邮政编码"></td>
									<td>邮政编码</td>
									<td><input class="form_mid" name="INFO27"></td>
									<td><input type="text" id="spinner28" name="INFO_LEVEL27"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO28" value="银行名称"></td>
									<td>银行名称</td>
									<td><input class="form_mid" name="INFO28"></td>
									<td><input type="text" id="spinner29" name="INFO_LEVEL28"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO29" value="是否邮寄保单"></td>
									<td>是否邮寄保单</td>
									<td><input class="form_mid" name="INFO29"></td>
									<td><input type="text" id="spinner30" name="INFO_LEVEL29"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO30" value="车牌号"></td>
									<td>车牌号</td>
									<td><input class="form_mid" name="INFO30"></td>
									<td><input type="text" id="spinner31" name="INFO_LEVEL30"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO31" value="是否邮寄发票"></td>
									<td>是否邮寄发票</td>
									<td><input class="form_mid" name="INFO31"></td>
									<td><input type="text" id="spinner32" name="INFO_LEVEL31"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO32" value="第三方支付公司名称"></td>
									<td>第三方支付公司名称</td>
									<td><input class="form_mid" name="INFO32"></td>
									<td><input type="text" id="spinner33" name="INFO_LEVEL32"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO33" value="房屋详细地址"></td>
									<td>房屋详细地址</td>
									<td><input class="form_mid" name="INFO33"></td>
									<td><input type="text" id="spinner34" name="INFO_LEVEL33"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO34" value="车主性别"></td>
									<td>车主性别</td>
									<td><input class="form_mid" name="INFO34"></td>
									<td><input type="text" id="spinner35" name="INFO_LEVEL34"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO35" value="借记卡/信用卡号"></td>
									<td>借记卡/信用卡号</td>
									<td><input class="form_mid" name="INFO35"></td>
									<td><input type="text" id="spinner36" name="INFO_LEVEL35"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO36" value="保障类型"></td>
									<td>保障类型</td>
									<td><input class="form_mid" name="INFO36"></td>
									<td><input type="text" id="spinner37" name="INFO_LEVEL36"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO37" value="网银账户名"></td>
									<td>网银账户名</td>
									<td><input class="form_mid" name="INFO37"></td>
									<td><input type="text" id="spinner38" name="INFO_LEVEL37"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO38" value="第三方支付账户名"></td>
									<td>第三方支付账户名</td>
									<td><input class="form_mid" name="INFO38"></td>
									<td><input type="text" id="spinner39" name="INFO_LEVEL38"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO39" value="邮寄地址"></td>
									<td>邮寄地址</td>
									<td><input class="form_mid" name="INFO39"></td>
									<td><input type="text" id="spinner40" name="INFO_LEVEL39"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="POLICY_INFO2"
										name="POLICY_INFO40" value="邮寄邮编"></td>
									<td>邮寄邮编</td>
									<td><input class="form_mid" name="INFO40"></td>
									<td><input type="text" id="spinner41" name="INFO_LEVEL40"
										value=5 size=4 readonly></td>
									<td></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<table class="table_about">
						<tr>
							<th colspan="3">受益人模块</th>

						</tr>
						<tr>
							<td colspan="3"><input type="radio" class="radio" checked
								value="0" name="BENEFICIARY"> <label>法定受益人</label> <input
								type="radio" class="radio" value="1" name="BENEFICIARY">
								<label>指定受益人</label></td>

						</tr>


					</table>
					<table class="table_about" style="display:none">
						<tr>
							<th colspan="3">保险生效日期</th>

						</tr>
						<c:choose>
							<c:when test="${productModel.TAKE_EFFECT_TYPE == 0 }">
								<tr>
									<td colspan="3"><input type="radio" class="radio" checked
										value="0" name="TAKE_EFFECT_TYPE" id="time1"> <label>投保后第<input
											type="text" class="form_mini" name="TAKE_EFFECT_DATE"
											value="${productModel.TAKE_EFFECT_DATE }"> 天零时生效</label></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3"><input type="radio" class="radio"
										value="0" name="TAKE_EFFECT_TYPE" id="time1"> <label>投保后第<input
											type="text" class="form_mini" name="TAKE_EFFECT_DATE"
											value=""> 天零时生效</label></td>

								</tr>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${productModel.TAKE_EFFECT_TYPE == 1 }">
								<c:set var="DATE"
									value="${fn:split(productModel.TAKE_EFFECT_DATE_USER, ',')}" />
								<tr>
									<td colspan="3"><input type="radio" class="radio" checked
										value="1" name="TAKE_EFFECT_TYPE" id="time2"> <label>用户自定义生效时间
											最早可生效<input type="text" class="form_mini"
											name="TAKE_EFFECT_DATE_USER" value="${DATE[0]}" />天 至最迟生效 <input
											type="text" class="form_mini" name="TAKE_EFFECT_DATE_USER"
											value="${DATE[1]}" />天 </label></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3"><input type="radio" class="radio"
										value="1" name="TAKE_EFFECT_TYPE" id="time2"> <label>
											用户自定义生效时间 最早可生效<input type="text" class="form_mini"
											name="TAKE_EFFECT_DATE_USER" /> 天 至最迟生效 <input type="text"
											class="form_mini" name="TAKE_EFFECT_DATE_USER" />天 </label></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>

			</div>

			<div class="fieldset" id="PRODUCT_FEATURE"  <c:if test="${productModel.SAFEGUARD_MARK=='1' }">style="display: none;"</c:if>>
				<label class="formname">产品特色：</label>
				<div class="listfr" style="width: 600px;">
					<script type="text/plain" id="PRODUCT_CHARACTERISTIC"
							name="PRODUCT_CHARACTERISTIC" style="width:600px;height:300px;">${productModel.PRODUCT_CHARACTERISTIC}</script>
				</div>
			</div>

			<script type="text/javascript">var PRODUCT_CHARACTERISTIC = UE.getEditor('PRODUCT_CHARACTERISTIC');</script>

			<div class="fieldset">
				<label class="formname">投保提示：</label>
				<div class="listfr" style="width:600px;">
					<script type="text/plain" id="INSURANCE_TIPS" name="INSURANCE_TIPS"
						style="width:600px;height:300px;">${productModel.INSURANCE_TIPS}</script>
				</div>
			</div>
			<script type="text/javascript">var INSURANCE_TIPS = UE.getEditor("INSURANCE_TIPS");</script>
			
			<div class="fieldset">
				<label class="formname">理赔流程：</label>
				<div class="listfr" style="width:600px;">
					<script type="text/plain" id="CLAIM_PROCESS" name="CLAIM_PROCESS"
						style="width:600px;height:300px;">${productModel.CLAIM_PROCESS}</script>
				</div>
			</div>
			<script type="text/javascript">var CLAIM_PROCESS = UE.getEditor("CLAIM_PROCESS");</script>
			
			<div class="fieldset">
				<label class="formname">常见问题：</label>
				<div class="listfr" style="width:600px;">
					<script type="text/plain" id="COMMON_PROBLEM" name="COMMON_PROBLEM"
						style="width:600px;height:300px;">${productModel.COMMON_PROBLEM}</script>
				</div>
			</div>
			<script type="text/javascript">var COMMON_PROBLEM = UE.getEditor("COMMON_PROBLEM");</script>
			
			<div class="fieldset">
				<label class="formname">签约险种：</label> <select
					name="SIGN_INSURANCE_TYPE" class="select-control">

					<option value="Domestic"
						<c:if test="${productModel.SIGN_INSURANCE_TYPE =='Domestic' }">selected</c:if>>境内险</option>
					<option value="Overseas"
						<c:if test="${productModel.SIGN_INSURANCE_TYPE =='Overseas' }">selected</c:if>>境外险</option>
					<option value="BoatIdea"
						<c:if test="${productModel.SIGN_INSURANCE_TYPE =='BoatIdea' }">selected</c:if>>航意险(20元纸质单证)</option>
					<option value="BoatIdea2"
						<c:if test="${productModel.SIGN_INSURANCE_TYPE =='BoatIdea2' }">selected</c:if>>航意险(4元用于接口传数据)</option>
					<option value="BoatIdea3"
						<c:if test="${productModel.SIGN_INSURANCE_TYPE =='BoatIdea3' }">selected</c:if>>航意险(30元纸质单证)</option>
					<option value="BoatIdea4"
						<c:if test="${productModel.SIGN_INSURANCE_TYPE =='BoatIdea4' }">selected</c:if>>电子航意险4元（赠保）</option>
					<option value="BoatIdea5"
						<c:if test="${productModel.SIGN_INSURANCE_TYPE =='BoatIdea5' }">selected</c:if>>太平养老</option>

				</select> <span class="tips">选择该产品在协议中的险种名称</span>
			</div>

			<div class="fieldset" style="display:none">
				<label for="" class="formname">新签约险种：</label>
				<div class="listfr">平台险</div>
				<span class="tips">（商品已审核通过，该项不能修改）</span>
			</div>

			<div class="fieldset">
				<label class="formname">计划代码：</label> <input type="text"
					class="form_min" name="COMPANY_INSURANCE_ID"
					value="${productModel.COMPANY_INSURANCE_ID}"> <span
					class="tips"></span>
			</div>

			<div class="fieldset" style="display:none">
				<label class="formname">在线退保：</label> <label> <input
					type="checkbox"
					<c:if test="${productModel.ONLINE_SURRENDER == 1 }">checked</c:if>
					name="ONLINE_SURRENDER" id="ONLINE_SURRENDER" value="1">
					勾选后用户可以在订单详情页发起退保申请，没有接入淘宝退保接口的不要勾选。 </label>
			</div>

			<div class="fieldset" style="display:none">
				<label class="formname">实名购买：</label> <label> <input
					type="checkbox" id="BUY_REAL_NAME"
					<c:if test="${productModel.BUY_REAL_NAME == 1 }">checked</c:if>
					name="BUY_REAL_NAME" value="1"> 勾选后,用户必须为实名认证的用户才能购买。 </label>
			</div>

			<div class="fieldset">
				<a class="btn_blue" onclick="adminProduct(); return false"
					style="cursor:pointer">发布</a>
			</div>
		</form>
	</div>
	<div style="position:fixed;bottom:350px;right:40px;"
		onclick="back();return false;">
		<button type="button" onclick="back();return false;" class="button green larrow">返回产品一览</button>
	</div>
</body>
</html>