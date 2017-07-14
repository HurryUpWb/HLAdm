package com.auis.auib.admin.quartz;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
/**
 * 	退款失败返回的XML对象
 * @author wangb
 *	
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="xml")
public class DrawBackErr {
	@XmlElement
	private String return_code;
	@XmlElement
	private String return_msg;
	@XmlElement
	private String result_code;
	@XmlElement
	private String err_code;
	@XmlElement
	private String err_code_des;
	
	public String getReturn_code() {
		return return_code;
	}
	public void setReturn_code(String return_code) {
		this.return_code = return_code;
	}
	public String getReturn_msg() {
		return return_msg;
	}
	public void setReturn_msg(String return_msg) {
		this.return_msg = return_msg;
	}
	public String getResult_code() {
		return result_code;
	}
	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}
	public String getErr_code() {
		return err_code;
	}
	public void setErr_code(String err_code) {
		this.err_code = err_code;
	}
	public String getErr_code_des() {
		return err_code_des;
	}
	public void setErr_code_des(String err_code_des) {
		this.err_code_des = err_code_des;
	}
	@Override
	public String toString() {
		return "DrawBackErr [return_code=" + return_code + ", return_msg="
				+ return_msg + ", result_code=" + result_code + ", err_code="
				+ err_code + ", err_code_des=" + err_code_des + "]";
	}
	
}
