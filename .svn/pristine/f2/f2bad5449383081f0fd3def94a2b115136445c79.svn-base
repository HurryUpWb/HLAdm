/*******************************************************************
       对应模块/BUGID：航联新增航班号产品    阳林峰          更新日期：2016-08-08
*******************************************************************/
---增加产品表产品标记：0普通产品，1航班产品
alter table T_PRODUCT_INFO  add  (USER_TYPE VARCHAR2(20));
comment on column T_PRODUCT_INFO.USER_TYPE IS '产品销售类型标记';


/*******************************************************************
       对应模块/BUGID：航联保障内容    黄博          更新日期：2016-08-18
*******************************************************************/
---增加产品表保障内容
alter table T_PRODUCT_INFO  add  (INSURANCE_CONTENT CLOB);
comment on column T_PRODUCT_INFO.INSURANCE_CONTENT IS '保障内容';

/*******************************************************************
       对应模块/BUGID：微信端 浦发专区   王波        更新日期：2016-09-20
*******************************************************************/
--增加浦发专区产品标志
alter table T_PRODUCT_INFO add ispfcard number(21);
comment on column T_PRODUCT_INFO.ispfcard IS '浦发专区产品标志';
--增加绑定表
create table pfcard(mobileno varchar2(255),wechatid varchar2(50));

-- Add comments to the columns 
comment on column PFCARD.MOBILENO
  is '浦发用户手机号';
comment on column PFCARD.WECHATID
  is '手机号绑定的微信号';
  
  --测试数据
  insert into pfcard(mobileno) values('18373125609');


/*******************************************************************
       对应模块/BUGID：航联保障内容    黄博          更新日期：2016-08-18
*******************************************************************/
---增加产品表保障内容
alter table T_PRODUCT_INFO  add  (INSURANCE_CONTENT CLOB);
comment on column T_PRODUCT_INFO.INSURANCE_CONTENT IS '保障内容';

/*******************************************************************
       对应模块：东航退款通知 AUIS_REFUND_NOTIFICATION    黄博          更新日期：2016-08-18
*******************************************************************/
---增加东航退款通知表
CREATE TABLE AUIS_REFUND_NOTIFICATION
(
    SERIALNUMBER VARCHAR2(32) PRIMARY KEY NOT NULL,
    FOMERORDERID VARCHAR2(45) NOT NULL,
    PAYMENTCODE VARCHAR2(32) NOT NULL,
    PAYMENTSERIALNUMBER VARCHAR2(32) NOT NULL,
    OPERATOR VARCHAR2(24) NOT NULL,
    OPERATIONDATE DATE NOT NULL,
    REFUNDSERIALNUMBER VARCHAR2(32) NOT NULL,
    REFUNDAMOUNT NUMBER(*) NOT NULL,
    REFUNDTIME DATE NOT NULL,
    REFUNDCODE VARCHAR2(5) NOT NULL,
    REFUNDMESSAGE VARCHAR2(1024)
);
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.SERIALNUMBER IS '序列号';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.FOMERORDERID IS '订单号';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.PAYMENTCODE IS '支付平台代码';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.PAYMENTSERIALNUMBER IS '支付流水号';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.OPERATOR IS '操作人';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.OPERATIONDATE IS '操作日期';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.REFUNDSERIALNUMBER IS '退款流水号';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.REFUNDAMOUNT IS '退款金额';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.REFUNDTIME IS '退款时间';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.REFUNDCODE IS '处理返回代码';
COMMENT ON COLUMN AUIS_REFUND_NOTIFICATION.REFUNDMESSAGE IS '处理返回消息';

/*******************************************************************
       对应模块：新增ATM管理用户    王波         更新日期：2016-10-14
*******************************************************************/
--添加新用户ATM管理员
insert into t_user(user_name,pass_word,create_date,last_login_time,active,delete_flag,access_flag) 
values('hlatm','123456',sysdate,sysdate,1,0,3)

/*******************************************************************
       对应模块：新增产品批量投保标记    阳林峰         更新日期：2016-11-10
*******************************************************************/
--新增产品批量投保标记
alter table t_product_info  add ISBATCHINSURED varchar(20);
comment on column T_PRODUCT_INFO.ISBATCHINSURED IS '是否允许批量投保：0 否，1 是';
