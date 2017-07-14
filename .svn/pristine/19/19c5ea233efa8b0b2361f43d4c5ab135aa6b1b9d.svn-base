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
    <title>产品新增</title>
   <link rel="stylesheet" href="<%=path %>/css/common.css">
   <link rel="stylesheet" href="<%=path %>/css/main.css">
   <link rel="stylesheet" href="<%=path %>/css/jquery-ui.css">
   <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
   <script type="text/javascript" src="<%=path %>/js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="<%=path %>/js/common.js"></script>
   <script type="text/javascript" src="<%=path %>/js/main.js"></script>
   <script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>
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
           var spinner = $( "#spinner" ).spinner();
        for(var i=0;i<41;i++){
           var spinner = $( "#spinner"+i ).spinner();
        }
      });
      
     $(function() { 
		$("#CheckAll").click(function() { 
		    var flag = $(this).prop("checked"); 
			$("[name=POLICY_INFO]:checkbox").each(function() { 
			   $(this).prop("checked", flag); 
			}) 
		}) 
      })
      
      $(function() { 
		$("#CheckAll1").click(function() { 
		    var flag = $(this).prop("checked");
			$("[name=POLICY_INFO1]:checkbox").each(function() { 
			   $(this).prop("checked", flag); 
			}) 
		}) 
      })
      
      $(function() { 
		$("#CheckAll2").click(function() { 
		    var flag = $(this).prop("checked");
			$("[name=POLICY_INFO2]:checkbox").each(function() { 
			   $(this).prop("checked", flag); 
			}) 
		}) 
      })
    </script>
  </head>
  
  <body>
    <div class="container">
         <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">产品详细信息添加</b></div>
            <div class="box_center">
              <form action="admin/adminProduct/savePolicyInfo.json"  name="savePolicyInfoForm" id="savePolicyInfoForm"  method="post">
               <input type="hidden" value="<%=request.getParameter("ID") %>" name="PRODUCT_ID" />
               <table id="table" class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
               
                 <TR height="30px"><td colspan=4>&nbsp;</td></TR>
                 
                 <TR style="background: url('images/box_top.png') 0px 0px repeat-x;">
                 <td class="" width="10%">
                    &nbsp;
                  </td>
                  <td align="left" width="20%"><b class="pl15">产品销售属性</b></td>
                  <td class="" width="20%"> 
                         &nbsp;                                                
                  </td>
                  <td> 
                    &nbsp;
                    </td></TR>
                    
                 <tr>
                  <td class="" width="10%"> 
                    &nbsp;&nbsp;
                  </td>
                  <td class="td_right" width="20%">
                                                                  属性名称：<input type="text" id="ATTRIBUTE_TYPE" name="ATTRIBUTE_TYPE" class="input-text lh30" size="15">
                  </td>
                  <td align="center" width="20%"> 
                                                                     属性值:<input type="text" id="SALES_ATTRIBUTE" name="SALES_ATTRIBUTE" class="input-text lh30" size="15">
                  </td>
                  <td align="center" width="20%"> 
                                                                     商家编码:<input type="text" id="MERCHANT_CODE" name="MERCHANT_CODE" class="input-text lh30" size="15">
                  </td>
                  <td> 
                                                                   附属价格:<input type="text" id="SUBSIDIARY_PRICE" value=0 name="SUBSIDIARY_PRICE" class="input-text lh30" size="10">元
                  </td>
                </tr>
                
                <tr id="attribute">
                <td>&nbsp;</td>
                <td align="center">
                <input type="button" name="addAttribute" id="addAttribute" class="btn btn82 btn_add" onclick="add();return false;" value="新增"></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                </tr>
                
               <TR style="background: url('images/box_top.png') 0px 0px repeat-x;">
                 <td class="" width="10%">
                    &nbsp;
                  </td>
                  <td align="left" width="20%"><b class="pl15">产品保障内容</b></td>
                  <td class="" width="20%"> 
                         &nbsp;                                                
                  </td>
                  <td> 
                    &nbsp;
                    </td></TR>
                    
                <tr>
                <td>&nbsp;</td>
                <td align="center">
                                                              保障类型
                </td>
                <td align="center">责任描述</td>
                <td>保障额度</td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td class="td_right">
                  <input type="text" id="INSURE_ALLOWED" name="INSURE_ALLOWED" class="input-text lh30" size="30">
                </td>
                <td align="center"><input type="text" id="INSURE_INFO" name="INSURE_INFO" class="input-text lh30" size="30"></td>
                <td ><input type="text" id="GUARANTEE_AMOUNT" name="GUARANTEE_AMOUNT" class="input-text lh30" size="30"></td>
                </tr>
                
                <tr id="INSURE">
                <td>&nbsp;</td>
                <td align="center">
                <input type="button" name="addAttribute" id="addAttribute" class="btn btn82 btn_add" onclick="insertSpareEpt();return false;" value="新增"></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                </tr>
                
                
                <TR style="background: url('images/box_top.png') 0px 0px repeat-x;">
                 <td class="" width="10%">
                    &nbsp;
                  </td>
                  <td align="left" width="20%"><b class="pl15">产品投保信息</b></td>
                  <td class="" width="20%"> 
                         &nbsp;                                                
                  </td>
                  <td> 
                    &nbsp;
                    </td></TR>
                    
                    <tr>
                <td>&nbsp;</td>
                <td align="center">
                  <input type="checkbox" id="CheckAll">  投保人模块
                </td>
                <td align="center">注释</td>
                <td >优先级(数字越小越排前)</td>
                </tr>
                    
                    <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="通讯地址" >  通讯地址
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner" name="INFO_LEVEL" value=5 size=8 readonly></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="姓名" >  姓名
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner1" name="INFO_LEVEL" value=5 size=8 readonly></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="电子邮件">  电子邮件
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner2" name="INFO_LEVEL" value=5 size=8 readonly></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="证件号码">  证件号码
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner3" name="INFO_LEVEL" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="出生日期">  出生日期
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner4" name="INFO_LEVEL" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="性别">  性别
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner5" name="INFO_LEVEL" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="常住地区">  常住地区
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner6" name="INFO_LEVEL" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="固定电话">  因定电话
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner7" name="INFO_LEVEL" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="手机号码">  手机号码
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner8" name="INFO_LEVEL" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="地址">  地址
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner9" name="INFO_LEVEL" value=5 size=8></td>
                </tr>
                
                 <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO" value="邮编">  邮编
                </td>
                <td align="center"><input type="text" id="INFO" name="INFO" class="input-text lh30" size="30"></td>
                <td ><input id="spinner10" name="INFO_LEVEL" value=5 size=8></td>
                </tr>
                
                <tR height="30px"><td colspan="4"></td></tR>
                
                 <tr>
                <td>&nbsp;</td>
                <td align="center">
                  <input type="checkbox" id="CheckAll1" >  被保人模块
                </td>
                <td align="center">注释</td>
                <td >优先级(数字越小越排前)</td>
                </tr>
                    
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="通讯地址" >  通讯地址
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner11" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="姓名" >  姓名
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner12" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="电子邮件">  电子邮件
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner13" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="证件号码">  证件号码
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner14" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="出生日期">  出生日期
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner15" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="性别">  性别
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner16" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="常住地区">  常住地区
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner17" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="固定电话">  因定电话
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner18" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="手机号码">  手机号码
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner19" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="地址">  地址
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner20" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                 <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO1" value="邮编">  邮编
                </td>
                <td align="center"><input type="text" id="INFO1" name="INFO1" class="input-text lh30" size="30"></td>
                <td ><input id="spinner21" name="INFO_LEVEL1" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td align="center">
                  <input type="checkbox" id="CheckAll2" >  其它信息
                </td>
                <td align="center">注释</td>
                <td >优先级(数字越小越排前)</td>
                </tr>
                    
                    <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="车主生日">  车主生日
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner22" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="房屋结构类型">  房屋结构类型
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner23" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="车主姓名">  车主姓名
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner24" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="车主证件号码">  车主证件号码
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner25" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="被保房屋用途">  被保房屋用途
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner26" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="邮政编码">  邮政编码
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner27" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="银行名称">  银行名称
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner28" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="是否邮寄保单">  是否邮寄保单
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner29" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="车牌号">  车牌号
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner30" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="是否邮寄发票">  是否邮寄发票
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner31" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                 <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="第三方支付公司名称">  第三方支付公司名称
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner32" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="房屋详细地址">  房屋详细地址
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner33" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="车主性别">  车主性别
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner34" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="借记卡/信用卡号">  借记卡/信用卡号
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner35" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="保障类型">  保障类型
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner36" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="网银帐户名">  网银帐户名
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner37" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="第三方支付帐户名">  第三方支付帐户名
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner38" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="邮寄地址">  邮寄地址
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner39" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                
                <tr>
                <td>&nbsp;</td>
                <td>
                  <input type="checkbox" name="POLICY_INFO2" value="邮寄编码">  邮寄编码
                </td>
                <td align="center"><input type="text" id="INFO2" name="INFO2" class="input-text lh30" size="30"></td>
                <td ><input id="spinner40" name="INFO_LEVEL2" value=5 size=8></td>
                </tr>
                    
                 <tr>
                 <td class="" width="10%"> 
                    &nbsp;&nbsp;
                  </td>
                   <td class="td_right">&nbsp;</td>
                   <td align="center" width="5%"> 
                    <input type="button" name="button" class="btn btn82 btn_save2" onclick="savePolicy()" value="保存">
                  </td>
                   <td class="">
                     &nbsp;
                   </td>
                 </tr>
               </table>
               </form>
            </div>
          </div>
        </div>
     </div>
     </div>
  </body>
</html>