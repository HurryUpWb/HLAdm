/*
*插件作者:周祥
*发布时间:2014年12月12日
*插件介绍:图片上传本地预览插件 兼容浏览器(IE 谷歌 火狐) 不支持safari 当然如果是使用这些内核的浏览器基本都兼容
*插件网站:http://jquery.decadework.com
*作  者QQ:200592114
*使用方法:
*界面构造(IMG标签外必须拥有DIV 而且必须给予DIV控件ID)
* <div id="imgdiv"><img id="imgShow" width="120" height="120" /></div>
* <input type="file" id="up_img" />
*调用代码:
* new uploadPreview({ UpBtn: "up_img", DivShow: "imgdiv", ImgShow: "imgShow" });
*参数说明:
*UpBtn:选择文件控件ID;
*DivShow:DIV控件ID;
*ImgShow:图片控件ID;
*Width:预览宽度;
*Height:预览高度;
*FileType:支持文件类型 格式:["jpg","png"];
*callback:选择文件后回调方法;

*版本:v1.4
更新内容如下:
1.修复回调.

*版本:v1.3
更新内容如下:
1.修复多层级框架获取路径BUG.
2.去除对jquery插件的依赖.
*/

/*
*author:周祥
*date:2014年12月12日
*work:图片预览插件
*/
var uploadFilePreview = function(setting) {
    /*
    *author:周祥
    *date:2014年12月11日
    *work:this(当前对象)
    */
    var _self = this;
    /*
    *author:周祥
    *date:2014年12月11日
    *work:判断为null或者空值
    */
    _self.IsNull = function(value) {
        if (typeof (value) == "function") { return false; }
        if (value == undefined || value == null || value == "" || value.length == 0) {
            return true;
        }
        return false;
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:默认配置
    */
    _self.DefautlSetting = {
        UpBtn: "",
        DivShow: "",
        Width: 100,
        Height: 100,
        FileType: ["pdf"],
        ErrMsg: "选择文件错误,文件类型必须是pdf文件",
        callback: function() { }
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:读取配置
    */
    _self.Setting = {
        UpBtn: _self.IsNull(setting.UpBtn) ? _self.DefautlSetting.UpBtn : setting.UpBtn,
        DivShow: _self.IsNull(setting.DivShow) ? _self.DefautlSetting.DivShow : setting.DivShow,
        Width: _self.IsNull(setting.Width) ? _self.DefautlSetting.Width : setting.Width,
        Height: _self.IsNull(setting.Height) ? _self.DefautlSetting.Height : setting.Height,
        FileType: _self.IsNull(setting.FileType) ? _self.DefautlSetting.FileType : setting.FileType,
        ErrMsg: _self.IsNull(setting.ErrMsg) ? _self.DefautlSetting.ErrMsg : setting.ErrMsg,
        callback: _self.IsNull(setting.callback) ? _self.DefautlSetting.callback : setting.callback
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:获取文本控件URL
    */
    _self.getObjectURL = function(file) {
        var url = null;
        if (window.createObjectURL != undefined) {
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:绑定事件
    */
    _self.Bind = function() {
        document.getElementById(_self.Setting.UpBtn).onchange = function() {
            if (this.value) {
                if (!RegExp("\.(" + _self.Setting.FileType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
                    alert(_self.Setting.ErrMsg);
                    this.value = "";
                    return false;
                }
                var fileName = getFileName(this.value);
                var div = document.getElementById(_self.Setting.DivShow);
                if(div == undefined) {
                	addFile(new Date().getMilliseconds(), fileName);
                } else{
                	deleteFile(_self.Setting.DivShow);
                	addFile(_self.Setting.DivShow, fileName);
                }
                _self.Setting.callback();
            }
        };
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:执行绑定事件
    */
    _self.Bind();
};


/*
*author:周祥
*date:2014年12月12日
*work:图片预览插件
*/
var uploadFilePreview1 = function(setting) {
    /*
    *author:周祥
    *date:2014年12月11日
    *work:this(当前对象)
    */
    var _self = this;
    /*
    *author:周祥
    *date:2014年12月11日
    *work:判断为null或者空值
    */
    _self.IsNull = function(value) {
        if (typeof (value) == "function") { return false; }
        if (value == undefined || value == null || value == "" || value.length == 0) {
            return true;
        }
        return false;
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:默认配置
    */
    _self.DefautlSetting = {
        UpBtn: "",
        DivShow: "",
        Width: 100,
        Height: 100,
        FileType: ["pdf"],
        ErrMsg: "选择文件错误,文件类型必须是pdf文件",
        callback: function() { }
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:读取配置
    */
    _self.Setting = {
        UpBtn: _self.IsNull(setting.UpBtn) ? _self.DefautlSetting.UpBtn : setting.UpBtn,
        DivShow: _self.IsNull(setting.DivShow) ? _self.DefautlSetting.DivShow : setting.DivShow,
        Width: _self.IsNull(setting.Width) ? _self.DefautlSetting.Width : setting.Width,
        Height: _self.IsNull(setting.Height) ? _self.DefautlSetting.Height : setting.Height,
        FileType: _self.IsNull(setting.FileType) ? _self.DefautlSetting.FileType : setting.FileType,
        ErrMsg: _self.IsNull(setting.ErrMsg) ? _self.DefautlSetting.ErrMsg : setting.ErrMsg,
        callback: _self.IsNull(setting.callback) ? _self.DefautlSetting.callback : setting.callback
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:获取文本控件URL
    */
    _self.getObjectURL = function(file) {
        var url = null;
        if (window.createObjectURL != undefined) {
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:绑定事件
    */
    _self.Bind = function() {
        document.getElementById(_self.Setting.UpBtn).onchange = function() {
            if (this.value) {
                if (!RegExp("\.(" + _self.Setting.FileType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
                    alert(_self.Setting.ErrMsg);
                    this.value = "";
                    return false;
                }
                var fileName = getFileName(this.value);
                var div = document.getElementById(_self.Setting.DivShow);
                if(div == undefined) {
                	addFile1(new Date().getMilliseconds(), fileName);
                } else{
                	deleteFile1(_self.Setting.DivShow);
                	addFile1(_self.Setting.DivShow, fileName);
                }
                _self.Setting.callback();
            }
        };
    };
    /*
    *author:周祥
    *date:2014年12月11日
    *work:执行绑定事件
    */
    _self.Bind();
};



/**
 * 取得文件名
 * @param path
 * @returns
 */
function getFileName(path){ 
	var pos1 = path.lastIndexOf('/'); 
	var pos2 = path.lastIndexOf('\\'); 
	var pos = Math.max(pos1, pos2);
	if( pos<0 ) 
		return path; 
	else 
		return path.substring(pos+1); 
} 

/**
 * 删除文件节点
 * @param fileId
 */
function deleteFile(fileId, isClearFile){
    var div = document.getElementById(fileId);
	div.parentNode.removeChild(div);
	document.getElementById("fileDelFlg").value = "1";
	
	if(isClearFile != undefined && isClearFile == true) {
		document.getElementById("INSURANCE_CLAUSE").value = "";
	}
}

/**
 * 删除文件节点
 * @param fileId
 */
function deleteFile1(fileId, isClearFile){
    var div = document.getElementById(fileId);
	div.parentNode.removeChild(div);
	document.getElementById("fileDelFlg1").value = "1";
	
	if(isClearFile != undefined && isClearFile == true) {
		document.getElementById("INSURANCE_").value = "";
	}
}

/**
 * 追加文件节点
 * @param fileName
 */
function addFile(fileId, fileName){
    var div = document.createElement('div'); // 新增元素
	div.id = fileId;
	div.className="token";
	div.innerHTML="<span class=\"token-label\" style=\"max-width: 661px;\">"+fileName+"</span><a href=\"javascript:deleteFile('"+fileId+"', true);\" class=\"close\" tabindex=\"-1\">×</a>";
	var uploadFileDiv = document.getElementById('uploadFileDiv');
	uploadFileDiv.value = "";
	uploadFileDiv.parentNode.insertBefore(div, uploadFileDiv);
}

/**
 * 追加文件节点
 * @param fileName
 */
function addFile1(fileId, fileName){
    var div = document.createElement('div'); // 新增元素
	div.id = fileId;
	div.className="token1";
	div.innerHTML="<span class=\"token-label1\" style=\"max-width: 661px;\">"+fileName+"</span><a href=\"javascript:deleteFile1('"+fileId+"', true);\" class=\"close\" tabindex=\"-1\">×</a>";
	var uploadFileDiv = document.getElementById('uploadFileDiv1');
	uploadFileDiv.value = "";
	uploadFileDiv.parentNode.insertBefore(div, uploadFileDiv);
}




