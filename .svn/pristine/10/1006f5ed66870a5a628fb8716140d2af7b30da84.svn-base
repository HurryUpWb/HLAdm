//投保管理JS

/**
 * 投保推送
 */
function insurePush(){
   // 当前位置设定
	$("#current_func").text("投保推送");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\"" + getLocationUrl()+"/insure/insurePush.jsp\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";	
}

function push(){
	var orderNo = document.getElementById("orderNo").value;
	if("" !=orderNo){
		var pushForm = document.getElementById("pushForm");
		pushForm.submit();
	}else{
		Dialog.alert("提示：请输入要投保推送的订单号！");
		return false;
	}
}