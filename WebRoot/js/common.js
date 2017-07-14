$(function(){
	//表格行，鼠标放上去变色
	$(".tr:odd").css("background", "#FFFCEA");
	$(".tr:odd").each(function(){
		$(this).hover(function(){
			$(this).css("background-color", "#FFE1FF");
		}, function(){
			$(this).css("background-color", "#FFFCEA");
		});
	});
	$(".tr:even").each(function(){
		$(this).hover(function(){
			$(this).css("background-color", "#FFE1FF");
		}, function(){
			$(this).css("background-color", "#fff");
		});
	}); 

	/*ie6,7下拉框美化*/
    if ( $.browser.msie ){
    	if($.browser.version == '7.0' || $.browser.version == '6.0'){
    		$('.select').each(function(i){
			   $(this).parents('.select_border,.select_containers').width($(this).width()+5); 
			 });
    		
    	}
    }
 
});

/**
 * 返回trim后的字符串 
 */
function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
};

/**
 * 判断字符串是否为空 
 */
function isEmpty (str)
{
	if (str == null || "" == str || "" == trim(str))
	{
		return true;
	}
	else 
	{
		return false;
	}
};

/**
 * 手机号码格式验证 
 */
function isMobileNo (str)
{
	// 手机号码正则表达式
	var rpPhoneNo = /^[1][3-9]\d{9}$/;
	if (rpPhoneNo.test(str))
	{
		return true;
	}
	else 
	{
		return false;
	}
};
/**
 * 邮箱格式验证 
 */
function isMailNo (str)
{
	// 手机号码正则表达式
	var rpMailNo = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	alert(rpMailNo.test(str));
	if (rpMailNo.test(str))
	{
		return true;
	}
	else 
	{
		return false;
	}
};

/**
 * 身份证号码格式校验 
 */
function isIdCardNo (str)
{
	// 身份证号码正则表达式
    var rpIdcard = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    
    if (rpIdcard.test(str))
    {
    	return true;
    }
    else 
    {
    	return false;
    }
};

/**
 * 根据身份证号码获取出生日期 
 */
function getBirthDayByIdcardNo (idcardno)
{
	var birthday = idcardno.substr(6, 8);
	
	return birthday;
};

function dateCheck(inputDate) {
    var date = inputDate;
    var result = date.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);

    if (result == null)
        return false;
    var d = new Date(result[1], result[3] - 1, result[4]);
    return (d.getFullYear() == result[1] && (d.getMonth() + 1) == result[3] && d.getDate() == result[4]);

}

function dateCompare(a, b) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();

    var arrs = b.split("-");
    var endtime = new Date(arrs[0], arrs[1], arrs[2]);
    var endtimes = endtime.getTime();

    if (starttimes > endtimes) {
        return false;
    }
    else
        return true;

}
/**
 * 返回trim后的字符串 
 */
function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
};

/**
 * 判断字符串是否为空 
 */
function isEmpty (str)
{
	if (str == null || "" == str || "" == trim(str))
	{
		return true;
	}
	else 
	{
		return false;
	}
};

function isNum(n) {
	return !isNaN(n);
}

