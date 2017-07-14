<%@ page language="java" import="java.util.*,com.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
long PRODUCT_ID = System.currentTimeMillis();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>产品新增页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="航联出行,航延险,旅游险">
	<meta http-equiv="description" content="产品新增页面">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/core.js"></script>
	<link rel="stylesheet" href="<%=path %>/css/admin.css">
	<link rel="stylesheet" href="<%=path %>/css/button.css">
	<script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/common.js"></script>
    <script type="text/javascript" src="<%=path %>/js/main.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDrag.js"></script>
    <script type="text/javascript" src="<%=path %>/js/zDialog.js"></script>
    <script type="text/javascript" src="<%=path %>/js/uploadPreview.js"></script>
    <script type="text/javascript" src="<%=path %>/js/uploadFileView.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>
    <link rel="stylesheet" href="<%=path %>/css/jquery-ui.css">
    <script type="text/javascript">
      $(function(){  
        $(".list_table").colResizable({
          liveDrag:true,
          gripInnerHtml:"<div class='grip'></div>", 
          draggingClass:"dragging", 
          minWidth:30
        });
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
  });  $(function(){
	  $("#CLIENT_TYPE").attr("checked", true);
  });
  $(function(){
	  $("#DOCUMENTS_TYPE").attr("checked", true);
  });

	function deleteImg (id){
	     Dialog.confirm('您确认要删除所选产品图片吗？',function(){
			 var imgid = "imgShow"+id;
			 var deleteid = "PRODUCT_IMG"+id;
			 document.getElementById(imgid).src="images/nopic.jpg";
			 document.getElementById(deleteid).value="";
		 });
	}
	   </script>
  </head>
  
  <body>
		<div class="form_congtainer">
          <form action="admin/adminProduct/saveAdminProduct.json" id="productForm" name="productForm" enctype="multipart/form-data" method="post">
			<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="<%=PRODUCT_ID %>"/>
			<div id="itemtitle" class="fieldset">
				<label for="TitleID" class="formname">宝贝标题：</label>
				<input data-autogen="true" class="form-control" maxlength=40 name="PRODUCT_TITLE"  id="PRODUCT_TITLE"  onkeyup="javascript:setShowLength(this, 40, 'textSize');">
				<span class="tips">还能输入&nbsp;&nbsp;<span id="textSize" style="color:#F00;">40个字</span></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">一口价：</label>
				<input class="form-control" name="PRODUCT_PRICE" id="PRODUCT_PRICE">元
				<span class="tips">产品最低定价。如有销售属性项则录入销售属性项中的最低价</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">保险简介：</label>
				<textarea class="text-input" name="PRODUCT_EXPLAN" id="PRODUCT_EXPLAN" rows="3" cols="45"></textarea>
				<span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">投保份数：</label>
				<input class="form-control" name="INSURANCE_NUMBER" value=0>份
				<span class="tips">设为0时，本产品投保份数为无限制</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">保障期间：</label>
				<input name="INSURANCE_PERIOD" type="text" class="form-control" >天
				<span class="tips">如产品销售属性项中有保障期间这个维度，则此处无需录入。</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">产品要素：</label>
				<select name="PRODUCT_ELEMENT" class="select-control">
					<option value="0">保障时间</option>
					<option value="1">航班号码</option>
					<option value="2">拒签险</option>
				</select>
				<span class="tips">默认产品要素为保障时间。</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">犹豫期：</label>
				<input class="form-control" name="PROBATIONARY_PERIOD" value="0">天
				<span class="tips">保险公司提供给投保人的试用期，试用期内可全额退保。设为0时，本产品无犹豫期。</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">商家编码：</label>
				<input class="form-control" name="MERCHANT_CODES">
				<span class="tips">录入一个销售属性中的商家编码项。如无销售属性项，则录入该产品对应保险公司系统中的编码</span>
			</div>
			<div class="fieldset">
				<label class="formname">用户类型：</label>
				<select name="USER_TYPE" class="select-control">

					<option value="0">普通用户</option>

					<option value="1">航班用户</option>

				</select>
				<span class="tips">如果是航班用户，则可直接输入机票号进行投保。</span>
			</div>
			<div class="fieldset">
				<label class="formname">产品是否生效：</label>
				<select name="PRODUCT_FLAG" class="select-control">

					<option value="1">立即生效</option>

					<option value="0">未生效</option>

				</select>
				<span class="tips">产品是否生效标记。</span>
			</div>
			
			<!-- 产品表示顺序 -->
			<div class="fieldset">
				<label class="formname">表示顺序：</label>
				<input type="text" id="PRODUCT_DISP_NUM" name="PRODUCT_DISP_NUM" value=5 size=4 readonly/>
				<span class="tips">前台产品表示顺序(数字越小越排前)</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">产品推荐：</label>
				<select name="PRODUCT_LEVEL" class="select-control">

					<option value="1">1星推荐</option>

					<option value="2">2星推荐</option>

					<option value="3">3星推荐</option>

					<option value="4">4星推荐</option>

					<option value="5">5星推荐</option>
				</select>
				<span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">保险类型：</label>
				<select name="PRODUCT_TYPE" class="select-control">
					<c:forEach items="${mastDate1}" var="item" varStatus="status">
						<option value="${item.M_NAME}" >${item.M_NAME}</option>
     				</c:forEach>					
				</select>
				<span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">产品标记：</label>
				<select name="PRODUCT_MARK" class="select-control">

					<option value="0">普通产品</option>

					<option value="1">独家产品</option>

					<option value="2">热销产品</option>

				</select>
				<span class="tips"></span>
			</div>
			<div class="fieldset">
				<label class="formname">产品是否允许批量投保：</label>
				<select name="BATCHINSURED" class="select-control">

					<option value="1">是</option>

					<option value="0">否</option>

				</select>
				<span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">浦发银行卡用户产品：</label>
				<select name="ISPFCARD" class="select-control">

					<option value="0">否</option>

					<option value="1">是</option>
				</select>
				<span class="tips">是否针对浦发银行卡用户销售的产品</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">是否送里程：</label>
				<input class="form-control" name="SEND_MILEAGE">
				<ul class="ul-radio">
					<li>
						<input type="radio" class="radio" checked name="MILEAGE_TYPE" value="0">
						<label>里程数</label>
					</li>
					<li>
						<input type="radio" class="radio" name="MILEAGE_TYPE" value="1">
						<label>倍里程</label>
					</li>
				</ul>
				<span class="tips">默认选择里程数，如为倍数请点选‘倍里程’</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">保险公司：</label>
				<input class="form-control" name="INSURANCE_COMPANY">
				<span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">产品投保方式：</label>
				<select name="INSURANCE_MODE" class="select-control">
					<option value="0">实时投保</option>
					<option value="1">自动投保</option>
					</select>
				<span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">保险公司代码：</label>
				<input class="form-control" name="COMPANY_CODE">
				<span class="tips">保险公司四字代码（一般都是4个字符，也有个别的有点差别）</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">保险产品类型代码：</label>
				<input class="form-control" name="INSURANCE_PRODUCT_CODE">
				<span class="tips">保险产品类型代码 一般是7位数的纯数字组合，比如1000000</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">保险产品类型ID：</label>
				<input class="form-control" name="INSURANCE_PRODUCT_ID">
				<span class="tips">保险产品类型ID 一般是32位数的数字+字母组合，格式其实和UUID相同</span>
			</div>
			
			<div class="fieldset">
				<label class="formname">协议产品代码：</label>
				<input class="form-control" name="PROTOCOL_CODE">
				<span class="tips"></span>
			</div>
			
			<div class="fieldset">
				<label class="formname">产品销售类型：</label>
					<c:forEach items="${mastDate}" var="item">
						<input type="checkbox" name="CLIENT_TYPE" id="CLIENT_TYPE" <c:if test="${fn:contains(productTypeModel.CLIENT_TYPE, item.M_CODE)}">checked</c:if> value="${item.M_CODE}">${item.M_NAME}&nbsp;
        			</c:forEach>
				<span class="tips"></span>
			</div>
			<div class="fieldset">
				<label class="formname">产品证件类型：</label>
					<c:forEach items="${mastDate2}" var="item">
						<input type="checkbox" name="DOCUMENTS_TYPE" id="DOCUMENTS_TYPE" <c:if test="${fn:contains(productTypeModel.DOCUMENTS_TYPE, item.M_CODE)}">checked</c:if> value="${item.M_CODE}">${item.M_NAME}&nbsp;
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
				<label class="formname">产品保障额度：</label>
				<input class="form-control" name="PRODUCT_LINE">
				<span class="tips">ATM机销售产品必填项，其它销售类型产品不须填写</span>
			  </div>
			
			<div class="fieldset" style="display:none">
				<label class="formname">出行目的：</label>
				<select name="TRIP_PURPOSE" class="select-control">

					<option value="旅游">旅游</option>

					<option value="探亲">探亲</option>

					<option value="公务">公务</option>

					<option value="长住">长住</option>

				</select>
				<span class="tips"></span>
			</div>
			
			<div class="fieldset" style="display:none">
				<label class="formname">出行天数：</label>
				<input class="form-control" name="TRAVEL_TIME" >天
				<span class="tips"></span>

			</div>
			<div class="fieldset" style="display:none">
				<label class="formname">特色保障：</label>
				<ul class="ul-radio">
					<li>
						<input type="radio" class="radio" checked="checked" value="紧急救援" name="CHARACTERISTIC_SAFEGUARD">
						<label for="1">紧急救援</label>
					</li>
					<li>
						<input type="radio" class="radio" value="高风险运动" name="CHARACTERISTIC_SAFEGUARD">
						<label for="2">高风险运动</label>
					</li>
					<li>
						<input type="radio" class="radio" value="危险地区国家" name="CHARACTERISTIC_SAFEGUARD">
						<label for="3">危险地区国家</label>
					</li>
					<li>
						<input type="radio" class="radio" value="申根签证专用" name="CHARACTERISTIC_SAFEGUARD">
						<label for="4">申根签证专用</label>
					</li>
					<li>
						<input type="radio" class="radio" value="境外停留180天以上" name="CHARACTERISTIC_SAFEGUARD">
						<label for="5">境外停留180天以上</label>
					</li>
				</ul>

			</div>
			<div class="fieldset" style="display:none">
				<label class="formname">出行地区：</label>
				<select name="TRAVEL_AREA" class="select-control">

					<option value="国外（非申根地区）">国外（非申根地区）</option>

					<option value="国外（申根地区）">国外（申根地区）</option>

					<option value="国内">国内</option>

				</select>

			</div>
			<div class="fieldset">
				<label class="formname">宝贝图片：</label>

				<div class="multimage-gallery listfr">

					<ul>
						<li>
							<div id="imgdiv1" class="examp">
                                 <img id="imgShow1" src="images/nopic.jpg" width="100" height="100" />
                            </div>
							<div class="info mt_5">
							   <a href="javascript:;" class="a-upload">选择图片
                                      <input type="file" name="PRODUCT_IMG1" id="PRODUCT_IMG1">
                               </a>
							</div>
						</li>
						
						<li>
							<div id="imgdiv2" class="examp">
								<img id="imgShow2" src="images/nopic.jpg" width="100" height="100">
                             </div>
							 <div class="info mt_5">
							 <a href="javascript:;" class="a-upload">选择图片
                                      <input type="file" name="PRODUCT_IMG2" id="PRODUCT_IMG2">
                               </a>
							 </div>
						</li>
						<li>

							<div id="imgdiv3" class="examp">
								<img id="imgShow3" src="images/nopic.jpg" width="100" height="100">
                             </div>
							 <div class="info mt_5">
									<a href="javascript:;" class="a-upload">选择图片
                                      <input type="file" name="PRODUCT_IMG3" id="PRODUCT_IMG3">
                               </a>
							 </div>
						</li>
						<li>
							<div id="imgdiv4" class="examp">
								<img id="imgShow4" src="images/nopic.jpg" width="100" height="100">
                             </div>
							 <div class="info mt_5">
									<a href="javascript:;" class="a-upload">选择图片
                                      <input type="file" name="PRODUCT_IMG4" id="PRODUCT_IMG4">
                               </a>
							 </div>
						</li>
						<li>

							<div id="imgdiv5" class="examp">
								<img id="imgShow5" src="images/nopic.jpg" width="100" height="100">
                             </div>
							 <div class="info mt_5">
									<a href="javascript:;" class="a-upload">选择图片
                                      <input type="file" name="PRODUCT_IMG5" id="PRODUCT_IMG5">
                                  </a>
							 </div>
						</li>

					</ul>
					<div class="pt_15 "> 图片至少上传一张,图片大小不能超过500K。</div>
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
						   <script type="text/plain" id="PRODUCT_INFO" name="PRODUCT_INFO" style="width:600px;height:300px;"></script>	
						</div>
				</div>
		
			     	<script type="text/javascript"> var ue = UE.getEditor('PRODUCT_INFO');</script>
					
			<div class="fieldset">
				<label class="formname">添加销售属性：</label>

				<div class="listfr">				
					<h4 class="fs14">投保年龄：</h4>
					<div class="tokenfield form-control" style="width: 600px;">
						<input type="text" class="form-control" id="inputTokenfieldSuccess" value="red,green,blue" tabindex="-1" style="position: absolute; left: -10000px;">
						<input type="text" tabindex="-1" style="position: absolute; left: -10000px;">
						<input type="text" name="inputToken" class="token-input" id="inputToken" tabindex="0" style="min-width: 60px; width: 120px;">
						<input type="hidden" name="INSURANCE_SALES_AGE" id="INSURANCE_SALES_AGE" >
		            </div>
		            <input type="button" class="btn_com" onclick="addInsuranceAge();return false;" value="添加">
		           
					<h4 class="fs14">保障期限：</h4>
					<div class="tokenfield form-control" style="width: 600px;">
						<input type="text" class="form-control" id="inputTokenfieldSuccess" value="red,green,blue" tabindex="-1" style="position: absolute; left: -10000px;">
						<input type="text" tabindex="-1" style="position: absolute; left: -10000px;">
						<input type="text" class="token-input" id="inputToken1" tabindex="0" style="min-width: 60px; width: 120px;">
						<input type="hidden" name="GUARANTEE_SALES_PERIOD" id="GUARANTEE_SALES_PERIOD">
		            </div>
		            <input type="button" class="btn_com" onclick="addGuaranteePeriod();return false;" value="添加">
					
					<h4 class="fs14">保障计划：</h4>
                     <div class="tokenfield form-control" style="width: 600px;">
						<input type="text" class="form-control" id="inputTokenfieldSuccess" value="red,green,blue" tabindex="-1" style="position: absolute; left: -10000px;">
						<input type="text" tabindex="-1" style="position: absolute; left: -10000px;">
						<input type="text" class="token-input" id="inputToken2" tabindex="0" style="min-width: 60px; width: 120px;">
						<input type="hidden" name="SAFEGUARD_SALES_PLAN"  id="SAFEGUARD_SALES_PLAN" >
		            </div>
		            <input type="button" class="btn_com" onclick="addSafeguardPlan();return false;" value="添加">
		            
		            <h4 class="fs14">飞行次数：</h4>
                     <div class="tokenfield form-control" style="width: 600px;">
						<input type="text" class="form-control" id="inputTokenfieldSuccess" value="red,green,blue" tabindex="-1" style="position: absolute; left: -10000px;">
						<input type="text" tabindex="-1" style="position: absolute; left: -10000px;">
						<input type="text" class="token-input" id="inputToken3" tabindex="0" style="min-width: 60px; width: 120px;">
						<input type="hidden" name="FLIGHT_NUMBER"  id="FLIGHT_NUMBER" >
		            </div>
		            <input type="button" class="btn_com" onclick="addFlightNumber();return false;" value="添加">
				</div>
				
			<div class="fieldset">
				<label class="formname">属性组合：</label>
				<div class="listfr">
					<table class="table_numb" id="table1">
						<tr>
							<th width="60"></th>
							<th>投保年龄</th>
							<th>保障期限</th>
							<th>保障计划</th>								
							<th>商家编码</th>
							<th>一口价</th>
							<th width="80">保险简介</th>
						</tr>
						
					</table>
				</div>
			</div>
		</div>
		
					<div class="fieldset">
							<label class="formname">保障显示方式：</label>
							<div class="listfr">
								     <input name="SAFEGUARD_MARK" id="SAFEGUARD_MARK" checked type="radio" value="0" onchange = "change();" />使用产品详情&nbsp;&nbsp;&nbsp;<input name="SAFEGUARD_MARK" id="SAFEGUARD_MARK" type="radio" value="1" onchange = "change();" />自定义内容
							</div>
					</div>
					
					<div class="fieldset" style="display:none" id="INSURE">
						<label class="formname">保障权益：</label>  
						<div class="listfr">
							<table class="table_numb" id="table_numb">
								<tr >
									<th>关联属性</th>
									<th>保障类型<span class="fs12 clgrey">(最多支持20个中文)</span></th>
									<th>保障额度<span class="fs12 clgrey">(最多支持10个中文)</span></th>
									<th>责任描述<span class="fs12 clgrey">(最多支持200个中文)</span></th>
								</tr>
							</table>
							<input type="button" class="btn_com" value="增加保障权益" onclick="addSales();" />
						</div>
					</div>

				    <div class="fieldset">
						<label class="formname">保险条款：</label>
							<div class="multimage-gallery listfr">
							<div id="fileDiv" class="tokenfield">
								<c:if test="${fileRecord != null }">
								<div class="token" id="${fileRecord.ID}"><span class="token-label" style="max-width: 661px;">${fileRecord.FILE_NAME}</span><a href="javascript:deleteFile('${fileRecord.ID}', true);" class="close" tabindex="-1">×</a>
								</div>
								</c:if>
								<div class="info mt_5" id="uploadFileDiv">
									<a href="javascript:;" class="a-upload">选择文件<input type="file" name="INSURANCE_CLAUSE" id="INSURANCE_CLAUSE"/></a>
								</div>
                            </div>
							<input type="hidden" name="insFile" id="insFile" value="${fileRecord.ID }">
							<input type="hidden" name="fileDelFlg" id="fileDelFlg" value="0"/>
							<script type="text/javascript">new uploadFilePreview({ UpBtn: "INSURANCE_CLAUSE", DivShow: "${fileRecord.ID}"});</script>
						</div>
					</div>
					
					
					<div class="fieldset">
						<label class="formname">投保提示：</label>
							<div class="multimage-gallery listfr">
							<div id="fileDiv" class="tokenfield">
								<c:if test="${fileRe != null }">
								<div class="token1" id="${fileRe.ID}"><span class="token-label1" style="max-width: 661px;">${fileRe.FILE_NAME}</span><a href="javascript:deleteFile('${fileRe.ID}', true);" class="close" tabindex="-1">×</a>
								</div>
								</c:if>
								<div class="info mt_5" id="uploadFileDiv1">
									<a href="javascript:;" class="a-upload">选择文件<input type="file" name="INSURANCE_" id="INSURANCE_"/></a>
								</div>
                            </div>
							<input type="hidden" name="insFile1" id="insFile1" value="${fileRe.ID }">
							<input type="hidden" name="fileDelFlg1" id="fileDelFlg1" value="0"/>
							<script type="text/javascript">new uploadFilePreview1({ UpBtn: "INSURANCE_", DivShow: "${fileRe.ID}"});</script>
						</div>
					</div>
					
					<div class="fieldset">
						<label class="formname">投保信息：</label>
						<div class="listfr">
							<table class="table_about" id="table_about1">
								<tr>
									<th width="20">
										<input type="checkbox" name="checkAll" id="checkAll">
									</th>
									<th>投保人模块</th>
									<th>注释</th>
									<th width="160">优先级<span class="fs12 clgrey">(数字越小越排前)</span></th>
									<th ><span id="policy1"><a href="javascript:close('1');">收起列表</a></span></th>
								</tr>
								
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO" name="POLICY_INFO0" value="通讯地址">
									</td>
									<td>通讯地址</td>									
									<td>
										<input class="form_mid" name="INFO0" >
									</td>
									<td><input id="spinner1" type="text" name="INFO_LEVEL0" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO" name="POLICY_INFO1" value="姓名">
									</td>
									<td>姓名</td>
									<td><input class="form_mid" name="INFO1" >
									</td>
									<td><input id="spinner2" type="text" name="INFO_LEVEL1" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox"  id="POLICY_INFO" name="POLICY_INFO2" value="电子邮件">
									</td>
									<td>电子邮件</td>
									<td><input class="form_mid" name="INFO2" >
									</td>
									<td><input id="spinner3" type="text" name="INFO_LEVEL2" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO" name="POLICY_INFO3" value="证件号码">
									</td>
									<td>证件号码</td>
									<td><input class="form_mid" name="INFO3" >
									</td>
									<td><input id="spinner4" type="text" name="INFO_LEVEL3" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO" name="POLICY_INFO4" value="出生日期">
									</td>
									<td>出生日期</td>
									<td><input class="form_mid" name="INFO4" >
									</td>
									<td><input type="text" id="spinner5" name="INFO_LEVEL4" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO" name="POLICY_INFO5" value="性别">
									</td>
									<td>性别</td>
									<td><input class="form_mid" name="INFO5" >
									</td>
									<td><input type="text" id="spinner6" name="INFO_LEVEL5" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox"  id="POLICY_INFO" name="POLICY_INFO6" value="常住地区">
									</td>
									<td>常住地区</td>
									<td><input class="form_mid" name="INFO6" >
									</td>
									<td><input type="text" id="spinner7" name="INFO_LEVEL6" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO" name="POLICY_INFO7" value="固定电话">
									</td>
									<td>固定电话</td>
									<td><input class="form_mid" name="INFO7" >
									</td>
									<td><input type="text" id="spinner8" name="INFO_LEVEL7" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox"  id="POLICY_INFO" name="POLICY_INFO8" value="手机号码">
									</td>
									<td>手机号码</td>
									<td><input class="form_mid" name="INFO8" >
									</td>
									<td><input type="text" id="spinner9" name="INFO_LEVEL8" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox"  id="POLICY_INFO" name="POLICY_INFO9" value="地址">
									</td>
									<td>地址</td>
									<td><input class="form_mid" name="INFO9" >
									</td>
									<td><input type="text" id="spinner10" name="INFO_LEVEL9" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO" name="POLICY_INFO10" value="邮编">
									</td>
									<td>邮编</td>
									<td><input class="form_mid" name="INFO10" >
									</td>
									<td><input type="text" id="spinner11" name="INFO_LEVEL10" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
							</table>
							
							<table class="table_about" id="table_about2">
								<tr>
									<th width="20">
										<input type="checkbox" name="checkAll1" id="checkAll1">
									</th>
									<th>被保人模块</th>
									<th>注释</th>
									<th width="160">优先级<span class="fs12 clgrey fwn">(数字越小越排前)</span></th>
									<th ><span id="policy2"><a href="javascript:close('2');">收起列表</a></span></th>
								</tr>

								<tr>
									<td>
										<input type="checkbox"  id="POLICY_INFO1" name="POLICY_INFO11" value="通讯地址">
									</td>
									<td>通讯地址</td>									
									<td>
										<input class="form_mid" name="INFO11" >
									</td>
									<td><input id="spinner12" type="text" name="INFO_LEVEL11" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO12" value="姓名">
									</td>
									<td>姓名</td>
									<td><input class="form_mid" name="INFO12" >
									</td>
									<td><input id="spinner13" type="text" name="INFO_LEVEL12" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO13" value="电子邮件">
									</td>
									<td>电子邮件</td>
									<td><input class="form_mid" name="INFO13" >
									</td>
									<td><input id="spinner14" type="text" name="INFO_LEVEL13" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO14" value="证件号码">
									</td>
									<td>证件号码</td>
									<td><input class="form_mid" name="INFO14" >
									</td>
									<td><input id="spinner15" type="text" name="INFO_LEVEL14" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox"  id="POLICY_INFO1" name="POLICY_INFO15" value="出生日期">
									</td>
									<td>出生日期</td>
									<td><input class="form_mid" name="INFO15" >
									</td>
									<td><input type="text" id="spinner16" name="INFO_LEVEL15" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO16" value="性别">
									</td>
									<td>性别</td>
									<td><input class="form_mid" name="INFO16" >
									</td>
									<td><input type="text" id="spinner17" name="INFO_LEVEL16" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO17" value="常住地区">
									</td>
									<td>常住地区</td>
									<td><input class="form_mid" name="INFO17" >
									</td>
									<td><input type="text" id="spinner18" name="INFO_LEVEL17" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO18" value="固定电话">
									</td>
									<td>固定电话</td>
									<td><input class="form_mid" name="INFO18" >
									</td>
									<td><input type="text" id="spinner19" name="INFO_LEVEL18" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO19" value="手机号码">
									</td>
									<td>手机号码</td>
									<td><input class="form_mid" name="INFO19" >
									</td>
									<td><input type="text" id="spinner20" name="INFO_LEVEL19" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO20" value="地址">
									</td>
									<td>地址</td>
									<td><input class="form_mid" name="INFO20" >
									</td>
									<td><input type="text" id="spinner21" name="INFO_LEVEL20" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO1" name="POLICY_INFO21" value="邮编">
									</td>
									<td>邮编</td>
									<td><input class="form_mid" name="INFO21" >
									</td>
									<td><input type="text" id="spinner22" name="INFO_LEVEL21" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								
							</table>
							<table class="table_about" id="table_about3">
								<tr>
									<th width="20">
										<input type="checkbox" name="checkAll2" id="checkAll2">
									</th>
									<th>其他信息</th>
									<th>注释</th>
									<th width="160">优先级<span class="fs12 clgrey fwn">(数字越小越排前)</span></th>
									<th ><span id="policy3"><a href="javascript:close('3');">收起列表</a></span></th>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO22" value="车主生日">
									</td>
									<td>车主生日</td>
									<td><input class="form_mid" name="INFO22" >
									</td>
									<td><input type="text" id="spinner23" name="INFO_LEVEL22" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO23" value="房屋结构类型">
									</td>
									<td>房屋结构类型</td>
									<td><input class="form_mid" name="INFO23" >
									</td>
									<td><input type="text" id="spinner24" name="INFO_LEVEL23" value=5 size=4 readonly>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO24" value="车主姓名">
									</td>
									<td>车主姓名</td>
									<td><input class="form_mid" name="INFO24" >
									</td>
									<td><input type="text" id="spinner25" name="INFO_LEVEL24" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO25" value="车主证件号码">
									</td>
									<td>车主证件号码</td>
									<td><input class="form_mid" name="INFO25" >
									</td>
									<td><input type="text" id="spinner26" name="INFO_LEVEL25" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO26" value="被保房屋用途">
									</td>
									<td>被保房屋用途</td>
									<td><input class="form_mid" name="INFO26" >
									</td>
									<td><input type="text" id="spinner27" name="INFO_LEVEL26" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO27" value="邮政编码">
									</td>
									<td>邮政编码</td>
									<td><input class="form_mid" name="INFO27" >
									</td>
									<td><input type="text" id="spinner28" name="INFO_LEVEL27" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO28" value="银行名称">
									</td>
									<td>银行名称</td>
									<td><input class="form_mid" name="INFO28" >
									</td>
									<td><input type="text" id="spinner29" name="INFO_LEVEL28" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO29" value="是否邮寄保单">
									</td>
									<td>是否邮寄保单</td>
									<td><input class="form_mid" name="INFO29" >
									</td>
									<td><input type="text" id="spinner30" name="INFO_LEVEL29" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO30" value="车牌号">
									</td>
									<td>车牌号</td>
									<td><input class="form_mid" name="INFO30" >
									</td>
									<td><input type="text" id="spinner31" name="INFO_LEVEL30" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO31" value="是否邮寄发票">
									</td>
									<td>是否邮寄发票</td>
									<td><input class="form_mid" name="INFO31" >
									</td>
									<td><input type="text" id="spinner32" name="INFO_LEVEL31" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO32" value="第三方支付公司名称">
									</td>
									<td>第三方支付公司名称</td>
									<td><input class="form_mid" name="INFO32" >
									</td>
									<td><input type="text" id="spinner33" name="INFO_LEVEL32" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO33" value="房屋详细地址">
									</td>
									<td>房屋详细地址</td>
									<td><input class="form_mid" name="INFO33" >
									</td>
									<td><input type="text" id="spinner34" name="INFO_LEVEL33" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO34" value="车主性别">
									</td>
									<td>车主性别</td>
									<td><input class="form_mid" name="INFO34" >
									</td>
									<td><input type="text" id="spinner35" name="INFO_LEVEL34" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO35" value="借记卡/信用卡号">
									</td>
									<td>借记卡/信用卡号</td>
									<td><input class="form_mid" name="INFO35" >
									</td>
									<td><input type="text" id="spinner36" name="INFO_LEVEL35" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO36" value="保障类型">
									</td>
									<td>保障类型</td>
									<td><input class="form_mid" name="INFO36" >
									</td>
									<td><input type="text" id="spinner37" name="INFO_LEVEL36" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO37" value="网银账户名">
									</td>
									<td>网银账户名</td>
									<td><input class="form_mid" name="INFO37" >
									</td>
									<td><input type="text" id="spinner38" name="INFO_LEVEL37" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO38" value="第三方支付账户名">
									</td>
									<td>第三方支付账户名</td>
									<td><input class="form_mid" name="INFO38" >
									</td>
									<td><input type="text" id="spinner39" name="INFO_LEVEL38" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO39" value="邮寄地址">
									</td>
									<td>邮寄地址</td>
									<td><input class="form_mid" name="INFO39" >
									</td>
									<td><input type="text" id="spinner40" name="INFO_LEVEL39" value=5 size=4 readonly>
									</td><td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox" id="POLICY_INFO2" name="POLICY_INFO40" value="邮寄邮编">
									</td>
									<td>邮寄邮编</td>
									<td>
									<input class="form_mid" name="INFO40" >
									</td>
									<td><input type="text" id="spinner41" name="INFO_LEVEL40" value=5 size=4 readonly>
									</td><td></td>
								</tr>
							</table>
							<table class="table_about">
								<tr>
									<th colspan="3">受益人模块</th>

								</tr>
								<tr>
									<td colspan="3">
										<input type="radio" class="radio" checked value="0" name="BENEFICIARY" >
										<label>法定受益人</label>
										<input type="radio" class="radio" value="1" name="BENEFICIARY" >
										<label>指定受益人</label>
									</td>

								</tr>
								

							</table>
							<table class="table_about" style="display:none">
								<tr>
									<th colspan="3">保险生效日期</th>

								</tr>
								<tr>
									<td colspan="3">
										<input type="radio" class="radio" checked value="0" name="TAKE_EFFECT_TYPE" id="time1">
										<label>投保后第<input type="text" class="form_mini" name="TAKE_EFFECT_DATE" value=""> 天零时生效</label>
									</td>

								</tr>
								<tr>
									<td colspan="3">
										<input type="radio" class="radio" value="1" name="TAKE_EFFECT_TYPE" id="time2">
										<label>用户自定义生效时间 最早可生效<input type="text" class="form_mini" name="TAKE_EFFECT_DATE_USER" value=""/>天 至最迟生效 <input type="text" class="form_mini" name="TAKE_EFFECT_DATE_USER" value=""/>天
										<label>
									</td>

								</tr>

							</table>
							<!-- 
							<table class="table_about">
								<tr>
									<th colspan="3">健康告知页</th>

								</tr>
								<tr>
									<td colspan="3">每行为一个问题<span class="fs12 clgrey"> 样例：“您是否……”</span>

									</td>

								</tr>
								<tr>
									<td colspan="3">
										<textarea id="SubheadingID" class="text-input" name="subTitle" value="" maxlength="150" rows="5" style="width:100%;"></textarea>
									</td>

								</tr>

							</table>
							 -->
						</div>

					</div>
					
					<div class="fieldset" id="PRODUCT_FEATURE">
						<label class="formname">产品特色：</label>

						<div class="listfr" style="width: 600px;">
								<script type="text/plain" id="PRODUCT_CHARACTERISTIC" name="PRODUCT_CHARACTERISTIC" style="width:600px;height:300px;">
						            
		                        </script>				
						</div>
					</div>

					      <script type="text/javascript">var ue = UE.getEditor('PRODUCT_CHARACTERISTIC');</script>

					<div class="fieldset">
						<label class="formname">投保提示：</label>

						<div class="listfr" style="width:600px;">
                                <script type="text/plain" id="INSURANCE_TIPS" name="INSURANCE_TIPS" style="width:600px;height:300px;">
						            
		                        </script>
						</div>
					</div>
                          <script type="text/javascript">var ue = UE.getEditor('INSURANCE_TIPS');</script>
                          
                    <div class="fieldset">
						<label class="formname">理赔流程：</label>

						<div class="listfr" style="width:600px;">
                                <script type="text/plain" id="CLAIM_PROCESS" name="CLAIM_PROCESS" style="width:600px;height:300px;">
						            
		                        </script>
						</div>
					</div>
                          <script type="text/javascript">var ue = UE.getEditor('CLAIM_PROCESS');</script>
                          
                          
                     <div class="fieldset">
						<label class="formname">常见问题：</label>

						<div class="listfr" style="width:600px;">
                                <script type="text/plain" id="COMMON_PROBLEM" name="COMMON_PROBLEM" style="width:600px;height:300px;">
						            
		                        </script>
						</div>
					</div>
                          <script type="text/javascript">var ue = UE.getEditor('COMMON_PROBLEM');</script>
						  
					<div class="fieldset">
						<label class="formname">签约险种：</label>
						<select name="SIGN_INSURANCE_TYPE" class="select-control">

							<option value="Domestic">境内险</option>
							<option value="Overseas">境外险</option>
							<option value="BoatIdea">航意险(20元纸质单证)</option>
							<option value="BoatIdea2">航意险(4元用于接口传数据)</option>
							<option value="BoatIdea3">航意险(30元纸质单证)</option>
							<option value="BoatIdea4">电子航意险4元（赠保）</option>
							<option value="BoatIdea5">太平养老</option>
							
						</select>
						<span class="tips">选择该产品在协议中的险种名称</span>
					</div>
					
					<div id="" class="fieldset" style="display:none">
						<label for="" class="formname">新签约险种：</label>
						<div class="listfr">平台险</div>
						<span class="tips">（商品已审核通过，该项不能修改）</span>
					</div>
					
					<div class="fieldset">
						<label class="formname">公司险种ID：</label>
						<input type="text" class="form_min" name="COMPANY_INSURANCE_ID" >
						<span class="tips"></span>
					</div>
					
					<div class="fieldset" style="display:none">
						<label class="formname">在线退保：</label>

						<label>
							<input type="checkbox" name="ONLINE_SURRENDER" id="ONLINE_SURRENDER" value="1"> 勾选后用户可以在订单详情页发起退保申请，没有接入淘宝退保接口的不要勾选。
						</label>
					</div>
					
					<div class="fieldset" style="display:none">
						<label class="formname">实名购买：</label>
						<label>
							<input type="checkbox" id="BUY_REAL_NAME" name="BUY_REAL_NAME" value="1"> 勾选后,用户必须为实名认证的用户才能购买。
						</label>
					</div>
					
					<div id="" class="fieldset">
						<a onclick="adminProduct();return false;" style="cursor:pointer" class="btn_blue">发布</a>
					</div>
					</form>
				</div>

<div style="position:fixed;bottom:350px;right:40px;" ><button type="button" onclick="back();return false;" class="button green larrow">返回产品一览</button></div>
  </body>
</html>
