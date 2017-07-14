function queryProductExport() {
	var url = getLocationUrl() + "/admin/adminProduct/probuctExportList.json";
	var form = document.getElementById("queryForm");
	form.action = url;
	document.getElementById("queryForm").submit();
}

function exportZip() {
	if ($("input[type='checkbox']:checked").length == 0) {
		Dialog.alert("提示：请选择要导出的产品");
	} else {
		Dialog.confirm('提示：您确认要导出所选产品吗？', function() {
			var url = getLocationUrl() + "/admin/adminProduct/getResult.json";
			var form = document.getElementById("form1");
			form.action = url;
			form.method = "post";
			form.submit();
		});
	}

}