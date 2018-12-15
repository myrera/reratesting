package in.gov.rera.transaction.thirdparty;

import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;
public class PaymentParameter {
	static Logger log= Logger.getLogger(PaymentParameter.class);

	private String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2";
	
	private String key;
	private String txnid;
	private String amount;
	private String productinfo;
	private String firstname;
	private String email;
	private String udf1;
	private String udf2;
	private String hash;
	
	private String surl;
	private String furl;
	private String curl;
	private String phone;
	private String action;
	
	
	
	
	
	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHashSequence() {
		return hashSequence;
	}
	
	public void setHashSequence(String hashSequence) {
		this.hashSequence = hashSequence;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getTxnid() {
		return txnid;
	}
	public void setTxnid(String txnid) {
		this.txnid = txnid;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getProductinfo() {
		return productinfo;
	}
	public void setProductinfo(String productinfo) {
		this.productinfo = productinfo;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUdf1() {
		return udf1;
	}
	public void setUdf1(String udf1) {
		this.udf1 = udf1;
	}
	public String getUdf2() {
		return udf2;
	}
	public void setUdf2(String udf2) {
		this.udf2 = udf2;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public String getSurl() {
		return surl;
	}
	public void setSurl(String surl) {
		this.surl = surl;
	}
	public String getFurl() {
		return furl;
	}
	public void setFurl(String furl) {
		this.furl = furl;
	}
	public String getCurl() {
		return curl;
	}
	public void setCurl(String curl) {
		this.curl = curl;
	}
	
	
	public OnlineTransactionModel getTrxObject(){
		OnlineTransactionModel model=new OnlineTransactionModel();
		
		model.setAmount(Double.parseDouble(amount));
		model.setTransactionNo(this.txnid);
		model.setServiceId(this.productinfo);
		model.setUserId(Long.parseLong(this.udf1));
		model.setCreatedOn(Calendar.getInstance());
		
		return model;
	}
	
	public static void main(String[] args) {
		log.info(new Date().getTime());
	}
}
