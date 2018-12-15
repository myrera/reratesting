package in.gov.rera.transaction.agentregistration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity(name = "AgentNumber")
@Table(name = "TM_AGENT_NUMBER")
public class AgentNumber {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "LAST_NUMBER")
	private int lastNumber;
	@Column(name = "FIRST_DIGIT")
	private int firstDigit;
	@Column(name = "SEC_DIGIT")
	private int secondDigit;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getLastNumber() {
		return lastNumber;
	}
	public void setLastNumber(int lastNumber) {
		this.lastNumber = lastNumber;
	}
	public int getFirstDigit() {
		return firstDigit;
	}
	public void setFirstDigit(int firstDigit) {
		this.firstDigit = firstDigit;
	}
	public int getSecondDigit() {
		return secondDigit;
	}
	public void setSecondDigit(int secondDigit) {
		this.secondDigit = secondDigit;
	}
	
	
	
	public void increementByOne(){
		lastNumber=lastNumber+1;
		if(lastNumber>99999){
			lastNumber=1;
			secondDigit=secondDigit+1;
		}
		if(secondDigit>25){
			firstDigit=firstDigit+1;
			secondDigit=0;
		}
	}
	
	public   String generateNumber(){
		StringBuffer sb=new StringBuffer();
		sb.append(digit[firstDigit]).append(digit[secondDigit]);
		String str=lastNumber+"";
		while(str.length()<5){
			str="0"+str;
		}
		sb.append(str);
		return sb.toString();
	}
	
	
	private static char digit[]={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
}
