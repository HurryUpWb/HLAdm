//日期验证
function yanDate() {
	var starTime = $("#starTime").val();
	var endTime = $("#endTime").val();
	if (starTime != "" && starTime != null && endTime != "" && endTime != null) {
		// 起始月份
		var starMone = starTime.substring(4, 6);
		// 截止月份
		var endMone = endTime.substring(4, 6);
		// 起始年份
		var starYear = starTime.substring(0, 4);
		// 截止年份
		var endYear = endTime.substring(0, 4);
		var starMones = parseInt(starMone);
		var endMones = parseInt(endMone);
		var starYears = parseInt(starYear);
		var endYears = parseInt(endYear);
		if (endYears > starYears) {
			var sre = 12 - starMones + endMones;
			if (sre > 3) {
				alert("间隔时间必须在三个月之内");
			}

		} else if (endYears == starYears) {
			if (endMones > starMones) {
				var stu = endMones - starMones;
				if (stu > 3) {
					alert("间隔时间必须在三个月之内");
				}
			} else {
				alert("截止年月在起始年月之后！");
			}
		} else {
			alert("截止年月在起始年月之后！");
		}
	}
}
// 月账单查询
function atmExportSearch() {
	var starTime = $("#starTime").val();
	var endTime = $("#endTime").val();
	if (starTime != "" && starTime != null && endTime != "" && endTime != null) {
		// 起始月份
		var starMone = starTime.substring(4, 6);
		// 截止月份
		var endMone = endTime.substring(4, 6);
		// 起始年份
		var starYear = starTime.substring(0, 4);
		// 截止年份
		var endYear = endTime.substring(0, 4);
		var starMones = parseInt(starMone);
		var endMones = parseInt(endMone);
		var starYears = parseInt(starYear);
		var endYears = parseInt(endYear);
		if (endYears > starYears) {
			var sre = 12 - starMones + endMones;
			if (sre > 3) {
				alert("间隔时间必须在三个月之内");
				return;
			}

		} else if (endYears == starYears) {
			if (endMones > starMones) {
				var stu = endMones - starMones;
				if (stu > 3) {
					alert("间隔时间必须在三个月之内");
					return;
				}
			} else {
				alert("截止年月在起始年月之后！");
				return;
			}
		} else {
			alert("截止年月在起始年月之后！");
			return;
		}
	}
	var url = getLocationUrl() + "/admin/adminATM/atmExportSearch.json";
	var form = document.getElementById("atmExportForm");
	form.action = url;
	document.getElementById("atmExportForm").submit();
}

// 到处报表
function exPortCell() {
	var url = getLocationUrl() + "/admin/adminATM/exPortCell.json";
	var form = document.getElementById("atmExportForm");
	form.action = url;
	form.method = "post";
	form.submit();
}
