package in.gov.rera.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "TokenModel")
@Table(name = "TM_TOKEN")
public class TokenModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 467623201L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TOKEN_ID")
	private long tokenId;
	
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private UserModel userId;
	
	private String signingName;

	public long getTokenId() {
		return tokenId;
	}

	public void setTokenId(long tokenId) {
		this.tokenId = tokenId;
	}

	public UserModel getUserId() {
		return userId;
	}

	public void setUserId(UserModel userId) {
		this.userId = userId;
	}

	public String getSigningName() {
		return signingName;
	}

	public void setSigningName(String signingName) {
		this.signingName = signingName;
	}

	
	
	
	
	
	
}
