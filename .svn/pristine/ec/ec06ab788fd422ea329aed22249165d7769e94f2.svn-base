/**
 * 获取所有转盘摇奖中奖记录 
 */
function getAllZPRewardRec(){
	$("#current_func").text("转盘中奖记录查询");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\""+getLocationUrl()+"/reward/zpreward.jsp\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
}

function getATMDataRec(){
	$("#current_func").text("ATM月账单查询");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\""+getLocationUrl()+"/atmExport.jsp\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
}

/**
 * 查询所有中奖记录 
 */
function searchRewardRec ()
{
	document.getElementById("rewardRecSearchForm").submit();
}

/**
 * 查询所有摇奖配置
 */
function searchRewardConfig ()
{
	document.getElementById("rewardConfigSearchForm").submit();
}

/**
 * 返回摇奖设置一览
 */
function gotoList() {
	var form = document.getElementById("queryForm");
	form.action = "admin/adminReward/getAllRewardConfigRec.json?pageNum=0";
	/*var input = document.createElement("INPUT");
	input.name="activityId";
	input.value = id;
	input.type = "hidden";
	form.appendChild(input);*/
	form.submit();
}

function editRewardConfig(id) {
	var form = document.getElementById("rewardRecForm");
	form.action = "admin/adminReward/redirectToConfig.json";
	var input = document.createElement("INPUT");
	input.name="activityId";
	input.value = id;
	input.type = "hidden";
	form.appendChild(input);
	form.submit();
}

function copyUrl(id){
	var url = getLocationUrl()+"reward/rewardIndex.html?p="+id;
	copyToClipBoard(url);
	Dialog.alert("活动链接已经复制到剪贴板。" + url, function() {
	});
}
/**
 * 转盘摇奖配置界面 
 */
function getAllZPRewardConfig ()
{
	$("#current_func").text("转盘摇奖配置");
	document.getElementById("main").innerHTML="<iframe name=\"right\" id=\"rightMain\" src=\""+getLocationUrl()+"/admin/adminReward/getAllRewardConfigRec.json?pageNum=0\" frameborder=\"no\" scrolling=\"auto\" width=\"100%\" height=\"auto\" allowtransparency=\"true\"></iframe>";
}

/**
 * 添加奖项 
 */
function addRewardConfig ()
{
	var activityId = $("#ACTIVITY_ID").val();
	layer.open({
	    type: 1,
	    skin: 'layui-layer-rim', //加上边框
	    area: ['420px', '340px'], //宽高
	    content: '<br/>&nbsp;&nbsp;<label style="font-weight:bold; font-size:15px; ">奖项配置：</label><br/>'+
	    	'<form id="mainForm" name="mainForm" method="post" action="">'+
	    	'<input type="hidden" name="REWARD_ID" id="REWARD_ID"/>'+
	    	'<input type="hidden" name="ACTIVITY_ID" id="ACTIVITY_ID" value="'+activityId+'"/>'+
	    	'<table style="margin-left:70px;" border="0" cellpadding="0" cellspacing="0">' +
	    	'<tboyd>'+
	    	'<tr style="height:40px;">'+
	    	'<td style="width:100px;">奖项等级：</td><td><select style="width:180px;" id="REWARD_LEVEL" name="REWARD_LEVEL"><option value="1">一等奖</option><option value="2">二等奖</option><option value="3">三等奖</option><option value="4">四等奖</option><option value="5">五等奖</option><option value="6">六等奖</option></select></td>'+
	    	'</tr>'+
	    	'<tr style="height:40px;">'+
	    	'<td>中奖条件：</td><td><select style="width:180px;" id="REWARD_CONDITION" name="REWARD_CONDITION"><option value="0">无限制</option><option value="1">活动期间购买过保险</option></select></td>'+
	    	'</tr>'+
	    	'<tr style="height:40px;">'+
	    	'<td>奖项内容：</td><td><input type="text" name="REWARD_NAME" id="REWARD_NAME" class="input-text lh30" style="width:180px;"/></td>'+
	    	'</tr>'+
	    	'<tr style="height:40px;">'+
	    	'<td>奖品数量：</td><td><input type="text" name="REWARD_NUM" id="REWARD_NUM" class="input-text lh30" style="width:180px;"/></td>'+
	    	'</tr>'+
	    	'<tr style="height:40px;">'+
	    	'<td>中奖概率：</td><td><input type="text" name="REWARD_RATE" id="REWARD_RATE" class="input-text lh30" style="width:180px;"/></td>'+
	    	'</tr>'+
	    	'<tr style="height:40px;">'+
	    	'<td colspan="2" style="text-align:center;"><input type="button" class="btn btn82 btn_search" onclick="saveRewardConfig()" value="保存"/></td>'+
	    	'</tr>'+
	    	'</tbody></table>'
	});
}

/**
 * 保存奖项配置 
 */
function saveRewardConfig()
{
	// 奖项内容
	var rewardName = $("#REWARD_NAME").val();
	// 奖品数量
	var rewardNum = $("#REWARD_NUM").val();
	// 中奖概率
	var rewardRate = $("#REWARD_RATE").val();
	// 活动ID
	var activityId = $("#ACTIVITY_ID").val();
	
	// 活动ID判断
	if(isEmpty(activityId)){
		alert("请先保存活动基本信息！");
		return;
	}
	
	// 奖项内容判断
	if (isEmpty(rewardName)) {
		alert("请输入奖项内容");
		return;
	}
	
	// 奖品数量判断
//	if (isEmpty(rewardNum)) {
//		alert("请输入奖品数量");
//		return;
//	}
	
	// 中奖概率判断
	if (isEmpty(rewardRate)) {
		alert("请输入中奖概率");
		return;
	}
	// 保存
	callSvr("adminReward/saveRewardConfig", $("#mainForm").formToJson(), function(data){
		
		if(data!=null && typeof(data)!="undefined"){
			if (data.err == 0) {
				location.href=getLocationUrl()+"/admin/adminReward/redirectToConfig.json?activityId=" + activityId;
			}
		}
	});
}

/**
 * 活动基本信息保存 
 */
function saveRewardBasicInfo ()
{
	// 活动名称
	var activityName = $("#ACTIVITY_NAME").val();
	
	// 活动名称输入check
	if (isEmpty(activityName)) {
		alert("请输入活动名称");
		return;
	}
	
	// 活动开始时间
	var startTime = $("#START_TIME").val();
	
	// 活动开始时间check
	if (isEmpty(startTime)) {
		alert("请输入活动开始时间");
		return;
	}
	
	// 活动结束时间
	var endTime = $("#END_TIME").val();
	
	if (isEmpty(endTime)) {
		alert("请输入活动结束时间");
		return;
	}
	
	// 保存
	callSvr("adminReward/saveRewardBasicInfo", $("#queryForm").formToJson(), function(data){
		
		if(data!=null && typeof(data)!="undefined"){
			if (data.err == 0) {
				alert("保存成功！");
				location.href=getLocationUrl()+"/admin/adminReward/redirectToConfig.json?activityId=" + data.activityId;
			}
		}
	});
}

/**
 * 编辑转盘奖项 
 * @param id 奖项ID
 */
function editReward (id)
{
	var activityId = $("#ACTIVITY_ID").val();
	callSvr("adminReward/getRewardInfoById", {id: id, "ACTIVITY_ID": activityId}, function(data){
		if(data!=null && typeof(data)!="undefined"){
			layer.open({
			    type: 1,
			    skin: 'layui-layer-rim', //加上边框
			    area: ['420px', '340px'], //宽高
			    content: '<br/>&nbsp;&nbsp;<label style="font-weight:bold; font-size:15px; ">奖项配置：</label><br/>'+
			    	'<form id="mainForm" name="mainForm" method="post" action="">'+
			    	'<input type="hidden" name="REWARD_ID" id="REWARD_ID" value="'+data.rewardId+'"/>'+
			    	'<input type="hidden" name="ACTIVITY_ID" id="ACTIVITY_ID" value="'+activityId+'"/>'+
			    	'<table style="margin-left:70px;" border="0" cellpadding="0" cellspacing="0">' +
			    	'<tboyd>'+
			    	'<tr style="height:40px;">'+
			    	'<td style="width:100px;">奖项等级：</td><td><select style="width:180px;" id="REWARD_LEVEL" name="REWARD_LEVEL"><option value="1">一等奖</option><option value="2">二等奖</option><option value="3">三等奖</option><option value="4">四等奖</option><option value="5">五等奖</option><option value="6">六等奖</option></select></td>'+
			    	'</tr>'+
			    	'<tr style="height:40px;">'+
			    	'<td>中奖条件：</td><td><select style="width:180px;" id="REWARD_CONDITION" name="REWARD_CONDITION"><option value="0">无限制</option><option value="1">活动期间购买过保险</option></select></td>'+
			    	'</tr>'+
			    	'<tr style="height:40px;">'+
			    	'<td>奖项内容：</td><td><input type="text" value="'+data.rewardName+'" name="REWARD_NAME" id="REWARD_NAME" class="input-text lh30" style="width:180px;"/></td>'+
			    	'</tr>'+
			    	'<tr style="height:40px;">'+
			    	'<td>奖品数量：</td><td><input type="text" value="'+data.rewardNum+'" name="REWARD_NUM" id="REWARD_NUM" class="input-text lh30" style="width:180px;"/></td>'+
			    	'</tr>'+
			    	'<tr style="height:40px;">'+
			    	'<td>中奖概率：</td><td><input type="text" value="'+data.rewardRate+'" name="REWARD_RATE" id="REWARD_RATE" class="input-text lh30" style="width:180px;"/></td>'+
			    	'</tr>'+
			    	'<tr style="height:40px;">'+
			    	'<td colspan="2" style="text-align:center;"><input type="button" class="btn btn82 btn_search" onclick="saveRewardConfig()" value="保存"/></td>'+
			    	'</tr>'+
			    	'</tbody></table>'
			});
			// 奖项等级
			var rewardLevel = data.rewardLevel;
			var options = $("#REWARD_LEVEL option");
			for (var i = 0; i < options.length; i ++) {
				if (options.eq(i).val() == rewardLevel) {
					options.eq(i).attr("selected","selected");
					break;
				}
			}
			// 中奖条件
			var rewardCondition = data.rewardCondition;
			var conditionOptions = $("#REWARD_CONDITION option");
			for (var j = 0; j < conditionOptions.length; j ++) {
				if (conditionOptions.eq(j).val() == rewardCondition) {
					conditionOptions.eq(j).attr("selected", "selected");
					break;
				}
			}
		}
	});
}

/**
 * 删除奖项配置 
 * @param 奖项ID
 */
function deleteReward (id)
{
	var activityId = $("#ACTIVITY_ID").val();
	if (window.confirm("确定要删除该奖项配置？")) {
		callSvr("adminReward/deleteRewardInfoById", {id: id, "ACTIVITY_ID": activityId}, function(data){
			if(data!=null && typeof(data)!="undefined"){
				
				if (data.deleteFlag == 1) {
					alert("删除成功！");
					location.href=getLocationUrl()+"/admin/adminReward/redirectToConfig.json?activityId=" + activityId;
				}
			}
		});
	}
}

/**
 * 查看活动对应的中奖记录
 * @param id
 */
function showRec(id){
	location.href=getLocationUrl()+"/admin/adminReward/getAllRewardRec.json?activityId=" + id;
}

/**
 * 查看摇奖活动链接
 * @param id 活动ID
 * @param path 路径
 */
function zprewardHref(id, path){
	 var url = "http://www.auib.com.cn/Wechat/reward/rewardIndex.html?p="+id;
	 var diag = new Dialog();
	 diag.Width = 600;
	 diag.Height = 150;
	 diag.Title = "摇奖活动入口地址";
	 diag.URL = path+"/reward/zprewardHref.jsp?url="+url;
	 diag.show();
}