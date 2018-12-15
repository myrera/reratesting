package in.gov.rera.common.security;

import java.util.Date;

public class Token {

	String key;
	String value;
	Date createdOn;
	
	public Token(String s1,String s2){
		this.key=s1;
		this.value=s2;
		createdOn=new Date();
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	
	@Override
	public boolean equals(Object obj) {
		
		return obj instanceof Token?(((Token)obj).getValue().equals(this.value)):false;
	}
	
	public boolean isExpired(){
		
		return createdOn.getTime()>(new Date().getTime()-(1000*60*10));
	}
}
