// 删除
function mstDelete(M_CODE) {
	$("#M_CODE").val(M_CODE);
	callSvr("masertInfo/mstDelete", $("#form1").formToJson(), function(data) {
		if (null != data.err && data.err == 9) {
			Dialog.alert("提示：您没有登录或登录已超时！", function() {
				location.href = "/Admin/login.html";
			});
		} else {
			var url = getLocationUrl()
					+ "/admin/masertInfo/mstTypeGetByCode.json";
			var form = document.getElementById("mstTypeAddForm");
			form.action = url;
			form.submit();
		}
	});
}

// 属性类型新增跳转
function mstTypeToAdd() {
	var url = getLocationUrl() + "/admin/masertInfo/mstTypeTiao.json";
	var form = document.getElementById("mstInfoForm");
	form.action = url;
	form.submit();
}

// 新增修改
function mstAddOrUpdate() {
	var M_NAME = $("#M_NAME").val();
	var M_DISP_ORDER = $("#M_DISP_ORDER").val();
	var M_TYPE = $("#M_TYPE").val();
	if (M_NAME == "" || M_NAME == null) {
		Dialog.alert("提示：基础属性名称不能为空！");
		return false;
	}
	if (M_DISP_ORDER == "" || M_DISP_ORDER == null) {
		Dialog.alert("提示：属性表示顺序不能为空！");
		return false;
	}
	callSvr(
			"masertInfo/mstAddOrUpdate",
			$("#mstAddForm").formToJson(),
			function(data) {
				if (null != data.err && data.err == 9) {
					Dialog
							.alert(
									"提示：您没有登录或登录已超时！",
									function() {
										window.parent.parent.location.href = "/Admin/login.html";
									});
				} else {
					var form = document.createElement("form");
					document.body.appendChild(form);
					form.action = "admin/masertInfo/mstTypeGetByCode.json?id="
							+ data.id;
					form.target = 'right';
					var input = document.createElement("INPUT");
					input.name = "id";
					input.value = data.id;
					input.type = "hidden";
					form.appendChild(input);
					form.submit();
					Dialog.close();

				}
			});
}

// 修改跳转
function mstToUpdate(M_CODE) {
	var id = $("#id").val();
	var diag = new Dialog();
	diag.Width = 600;
	diag.Height = 450;
	diag.Title = "基础属性修改";
	diag.URL = "mstGetByCode.json?M_CODE=" + M_CODE + "&id=" + id;
	diag.show();
}

// 属性类型页面返回操作
function backMstType() {
	var form = document.createElement("form");
	document.body.appendChild(form);
	form.action = "admin/masertInfo/mstTypeList.json";
	form.target = 'right';
	form.submit();
}

// 属性类型添加
function mstTypeAdd() {
	var M_TYPE_CODE = $("#M_TYPE_CODE").val();
	if (M_TYPE_CODE == null || M_TYPE_CODE == "") {
		Dialog.alert("提示：属性类型编码不能为空！");
		return false;
	}
	var M_TYPE_NAME = $("#M_TYPE_NAME").val();
	if (M_TYPE_NAME == null || M_TYPE_NAME == "") {
		Dialog.alert("提示：属性类型名称不能为空！");
		return false;
	}
	callSvr("masertInfo/mstTypeAdd", $("#mstTypeAddForm").formToJson(),
			function(data) {
				if (null != data.err && data.err == 9) {
					Dialog.alert("提示：您没有登录或登录已超时！", function() {
						location.href = "/Admin/login.html";
					});
				} else {
					if (data.id != null && data.id != "") {
						Dialog.alert("提示:属性类型编辑成功！", function() {
							$("#M_TYPE_CODE").val(data.m_type_code);
							$("#M_TYPE_NAME").val(data.m_type_name);
							$("#id").val(data.id);
						});
					} else {
						Dialog.alert("提示：已有该属性编码，请重新填写！");
					}
				}
			});
}

function mstAddButton() {
	var id = $("#id").val();
	if (id == null || id == "") {
		Dialog.alert("提示：请先添加基础属性类型！");
		return false;
	}
	var M_TYPE_CODE = $("#M_TYPE_CODE").val();
	var diag = new Dialog();
	diag.Width = 600;
	diag.Height = 450;
	diag.Title = "基础属性添加";
	diag.URL = "mstAddButton.json?M_TYPE_CODE=" + M_TYPE_CODE + "&id=" + id;
	diag.show();
}

function mstTypeSearch() {
	var url = getLocationUrl() + "/admin/masertInfo/mstTypeList.json";
	var form = document.getElementById("mstInfoForm");
	form.action = url;
	form.submit();
}

// 类型修改跳转
function mstTypeToUpdate(id) {
	$("#id").val(id);
	var url = getLocationUrl() + "/admin/masertInfo/mstTypeGetByCode.json";
	var form = document.getElementById("form1");
	form.action = url;
	form.submit();
}

// 属性类型删除
function mstTypeDalete(id) {
	$("#id").val(id);
	Dialog.confirm('警告：您确认要删除该属性类型吗？', function() {
		callSvr("masertInfo/mstTypePan", $("#form1").formToJson(),
				function(data) {
					if (null != data.err && data.err == 9) {
						Dialog.alert("提示：您没有登录或登录已超时！", function() {
							location.href = "/Admin/login.html";
						});
					} else {
						var m = data.res;
						if (m == 0) {
							var url = getLocationUrl()
									+ "/admin/masertInfo/mstTypeDelete.json";
							var form = document.getElementById("form1");
							form.action = url;
							form.submit();
						}else{
							Dialog.alert("提示：该项目类型下有基础属性不能删除！");
						}

					}
				});
	});
}
