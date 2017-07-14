package com.auis.auib.admin.quartz;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.SortedMap;
import java.util.TreeMap;
import javax.net.ssl.SSLContext;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alipay.sign.MD5;
import com.auis.auib.cmn.CommonUtil;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 投保不成功用户微信退款
 * @author wangb
 *
 */
public class DrawBackJob implements Job {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		StringBuffer sql = new StringBuffer();
		sql.append("select ma.name username,mem.wechatid wechatid ,orders.order_number ordernum,orders.amount amount " +
				"from t_policy_err t " +
				"left join t_order orders  " +
				"on t.order_num=orders.order_number " +
				"left join t_main_policy ma " +
				"on orders.trans_no=ma.serial_num " +
				"left join t_member mem  " +
				"on mem.mobileno=orders.mobile_no " +
				"where  orders.pay_date is not null " +
				"and t.isdrawback<>1 and t.isdrawback<>2 " +
				"and orders.state='110' " +
				" and mem.wechatid is not null ");

		log.info("微信退款操作：");
		java.util.Date a=new Date();
		java.sql.Timestamp time=new Timestamp(a.getTime());
		
		String ReturnData = "";
		List<Record> list = Db.find(sql.toString());
		String WechatID = "";
		String name = "";
		String orderNum = "";
		String amount ="";
		
		StringBuffer info=new StringBuffer();
		
		if (StrKit.notNull(list) && list.size()>0) {
			for (Record record : list) {
				name = record.getStr("USERNAME");
				WechatID = record.getStr("WECHATID");
				orderNum = record.getStr("ORDERNUM");
				amount = record.getBigDecimal("AMOUNT").toString();
				//取出t_drawback中的数据与当前需退款的记录对比
				List<Record> reconfirm=Db.find("select wechatid,ordernum,amount from t_drawback where ordernum=?", orderNum);
				String ReconfimWechatId="";
				String ReconfirmOrderNum="";
				String  ReconfirmAmount="";
				if(StrKit.notNull(reconfirm) && reconfirm.size()>0){
					for(Record rec:reconfirm){
						ReconfimWechatId=rec.getStr("WECHATID");
						ReconfirmOrderNum=rec.getStr("ORDERNUM");
						ReconfirmAmount=rec.getBigDecimal("AMOUNT").toString();
					}
				}
				//如果这条记录已经在t_drawback表中出现，则不再去退款
				if(WechatID.equals(ReconfimWechatId) && orderNum.equals(ReconfirmOrderNum) && amount.equals(ReconfirmAmount)){
						log.info("订单号： "+orderNum+"  已经进行过退款操作，请确认是否退款成功！");
						continue;
				}else{//否则进行退款
					log.info("开始为 微信号:---"+WechatID+"---,姓名：---"+name+"--- 的用户退款,时间："+time+"");
					int flag=Db.update("insert into t_drawback(wechatid,username,ordernum,amount,state,drawback_time) values(?,?,?,?,?,?)",WechatID,name,orderNum,amount,0,time);
					if (StrKit.notBlank(WechatID) && StrKit.notBlank(name) && StrKit.notBlank(orderNum) && StrKit.notBlank(amount)) {
						if(flag>0){ //判断是否将记录插入t_drawback，是，进行退款，考虑出现数据库连接异常
							ReturnData=SendInfo(getData(WechatID, orderNum, name,amount, "投保失败退款").toString().trim());
							System.out.println("返回的消息：=========》》》"+ReturnData);
						}else{
							continue;
						}
					}else{
						info.append("退款失败：");
						if(StrKit.isBlank(WechatID)){
							info.append("微信号为空");
						}
						if(StrKit.isBlank(name)){
							info.append(" 姓名为空");
						}
						if(StrKit.isBlank(name)){
							info.append(" 退款金额为空");
						}
						Db.update("update t_policy_err set state=2 where ordernum=?",orderNum);
						Db.update("update t_drawback set state=2,state_desc=? where ordernum=?",info.toString(),orderNum);
						log.info(info.toString());
						continue;
					}
				}
				DrawBackSuccess success=null;
				DrawBackErr error=null;
				//将返回的XML转换成对象
				if(StrKit.notBlank(ReturnData)){
					if(!ReturnData.contains("err_code")){
						DrawBackSuccess dw=new DrawBackSuccess();
						success=(DrawBackSuccess) XmlUtil.WriteToObj(dw, ReturnData);
					}else{
						DrawBackErr err=new DrawBackErr();
						error=(DrawBackErr) XmlUtil.WriteToObj(err, ReturnData);
					}
				String returncode="";
				String resultcode="";
				if(StrKit.notNull(success)){
					returncode=success.getReturn_code();
					resultcode=success.getResult_code();
				}
				if(StrKit.notBlank(returncode) && returncode.equals("SUCCESS") && StrKit.notBlank(resultcode) && resultcode.equals("SUCCESS")){
					log.info("退款成功！");
				    int i=Db.update("update t_policy_err set isdrawback=1 where order_num=?",orderNum);
					int j=Db.update("update t_drawback set state=?,state_desc='退款成功' where ordernum=?",1,orderNum);
					if(i>0){
						log.info("t_policy_err表更新成功!");
					}else{
						log.info("t_policy_err表更新失败!");
					}
					if(j>0){
						log.info("t_drawback表更新成功！");
					}else{
						log.info("t_drawback表更新失败！");
					}
				}else{
					log.info("退款失败！");
					int i=Db.update("update t_policy_err set isdrawback=2 where order_num=?",orderNum);
					int j=Db.update("update t_drawback set state=2,state_desc='退款失败,"+error.getErr_code_des()+"' where ordernum=? ",orderNum);
					if(i>0){
						log.info("t_policy_err表更新成功!");
					}else{
						log.info("t_policy_err表更新失败!");
					}
					if(j>0){
						log.info("t_drawback表更新成功！");
					}else{
						log.info("t_drawback表更新失败！微信接口返回消息："+error.getErr_code_des());
					}
				}
			}
		}
			
	}
} 	
	
	
	/**
	 * 
	 * @param xml
	 * @return
	 * 向微信接口发送请求
	 */
	private String SendInfo(String xml){
		SSLContext sslcontext=CreateSSLContext();
		String res="";
		//指定TLS版本
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext,new String[] { "TLSv1" },null,	SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
		//设置httpclient的SSLSocketFactory
		CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();
		HttpPost httpPost=new HttpPost("https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers");
		System.out.println("executing request" + httpPost.getRequestLine());
		CloseableHttpResponse response=null;
		StringEntity entity = null;
		try {
			entity = new StringEntity(xml);
			entity.setContentType("application/x-www-form-urlencoded");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		httpPost.setEntity(entity);
		try {
			response=httpclient.execute(httpPost);
		} catch (ClientProtocolException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try {  
            HttpEntity entitys = response.getEntity();  
            System.out.println("----------------------------------------");  
            System.out.println(response.getStatusLine());  
            if (entitys != null) {  
                System.out.println("Response content length: " + entitys.getContentLength());  
                res=EntityUtils.toString(entitys);
                EntityUtils.consume(entitys);  
            }  
        } catch (IOException e) {
			e.printStackTrace();
		} finally {  
            try {
				response.close();
			} catch (IOException e) {
				e.printStackTrace();
			}  
        } 
		return res;
	}
	
	/**
	 * 
	 * @return
	 * 创建SSL链接
	 */
	private SSLContext CreateSSLContext(){
		SSLContext sslcontext = null;
		FileInputStream instream=null;
			//指定读取证书格式为PKCS12
			try {
				KeyStore keyStore = KeyStore.getInstance("PKCS12");
				//读取本机存放的PKCS12证书文件
				instream= new FileInputStream(new File("C:\\Users\\Administrator\\Desktop\\HL\\cert-CTDW\\apiclient_cert.p12"));
				//指定PKCS12的密码(商户ID)
				keyStore.load(instream, "1312777401".toCharArray());
				sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, "1312777401".toCharArray()).build();
			} catch (KeyManagementException e) {
				e.printStackTrace();
			} catch (KeyStoreException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (CertificateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (UnrecoverableKeyException e) {
				e.printStackTrace();
			}
			return sslcontext;
	}


	/**
	 * 
	 * @param wechatid
	 * @param orderid
	 * @param name
	 * @param account
	 * @param desc
	 * @return
	 *  生成接口所需XML
	 */
	private StringBuffer getData(String wechatid, String orderid, String name,String account, String desc) {
		String mch_appid = "wxb5efdc024c13efa8"; // 公众账号
		String mchid = "1220563101"; // 商户号
		//String key = "d1066ff41f9aa5fd858fea115539f567"; // key设置路径：微信商户平台(pay.weixin.qq.com)-->账户设置-->API安全-->密钥设置
		InetAddress local = null;
		try {   
			local = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		String adress = local.getHostAddress();
		String nocestr=genNonceStr();
		StringBuffer data = new StringBuffer();
		data.append("<xml>");
		data.append("<mch_appid>"+mch_appid+"</mch_appid>");			// 公众账号
		data.append("<mchid>"+mchid+"</mchid>");						// 商户号
		data.append("<nonce_str>"+nocestr+"</nonce_str>");				// 随机字符串
		data.append("<openid>"+wechatid +"</openid>");					// 用户openID
		data.append("<partner_trade_no>"+orderid+"</partner_trade_no>");// 商户订单号
		data.append("<check_name>FORCE_CHECK</check_name>");			// 校验用户名选项
		data.append("<re_user_name>"+name+"</re_user_name>");			// 用户名
		data.append("<amount>"+account+"</amount>");					// 金额
		data.append("<desc>"+desc+"</desc>");							// 描述
		data.append("<sign>"+getSign(mch_appid, mchid,nocestr, wechatid,orderid,"FORCE_CHECK", name, account, desc,adress) + "</sign>");// 签名
		data.append("<spbill_create_ip>"+adress+"</spbill_create_ip>"); // 调用接口机器的ip
		data.append("</xml>");
		return data;
	}


	/**
	 * 
	 * @return
	 * 生成随机字符串
	 */
	private  String genNonceStr() {  
        Random random = new Random();  
        return CommonUtil.ecodeByMD5(String.valueOf(random.nextInt(10000)), "UTF-8");  
    }

	/**
	 * 
	 * @param mch_appid
	 * @param mchid
	 * @param nonce_str
	 * @param openid
	 * @param partner_trade_no
	 * @param check_name
	 * @param re_user_name
	 * @param amount
	 * @param desc
	 * @param adress
	 * @return Sign
	 * 生成签名
	 */
	private  String getSign(String mch_appid, String mchid,
			String nonce_str, String openid, String partner_trade_no,
			String check_name, String re_user_name, String amount, String desc, String adress) {
		
		SortedMap<String,String>  map=new TreeMap<String, String>();
		
		if (StrKit.notBlank(amount)) {
			map.put("amount", amount.trim());
		}
		if (StrKit.notBlank(check_name)) {
			map.put("check_name",check_name.trim());
		}
		if (StrKit.notBlank(desc)) {
			map.put("desc",desc.trim());
		}
		if (StrKit.notBlank(mchid)) {
			map.put("mchid", mchid.trim());
		}
		if (StrKit.notBlank(mch_appid)) {
			map.put("mch_appid", mch_appid.trim());
		}
		if (StrKit.notBlank(nonce_str)) {
			map.put("nonce_str",nonce_str.trim());
		}
		if (!openid.equals("")) {
			map.put("openid", openid.trim());
		}
		if (!partner_trade_no.equals("")) {
			map.put("partner_trade_no", partner_trade_no.trim());
		}
		if (!re_user_name.equals("")) {
			map.put("re_user_name", re_user_name.trim());
		}
		if (!adress.equals("")) {
			map.put("spbill_create_ip",adress.trim());
		}
		
		String sign=buildRequestMysign(map);
		return sign;
	}
	
	 /**
     * 生成签名结果
     * @param sPara 要签名的数组
     * @return 签名结果字符串
     */
	private  String buildRequestMysign(SortedMap<String, String> sPara) {
		
		// 对所有传入参数按照字段名的 ASCII 码从小到大排序（字典序）后，使用 URL 键值对的
		// 格式（即 key1=value1&key2=value2…）拼接成字符串 string1
    	String prestr = createLinkString(sPara);
    	
    	// 在 string1 最后拼接上 key=Key(商户支付密钥)得到 stringSignTemp 字符串
    	prestr = prestr + "&key=d1066ff41f9aa5fd858fea115539f567";
    	
    	// 对stringSignTemp 进行 md5 运算，再将得到的字符串所有字符转换为大写，得到 sign 值
    	String mysign= MD5.sign(prestr, "", "UTF-8").toUpperCase();
        return mysign;
    }

    /** 
     * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
     * @param params 需要排序并参与字符拼接的参数组
     * @return 拼接后字符串
     */
    private  String createLinkString(SortedMap<String, String> params) {

        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);

        String prestr = "";

        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            Object value = params.get(key);

            if (i == keys.size() - 1) {//拼接时，不包括最后一个&字符
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }

        return prestr;
    }
}
