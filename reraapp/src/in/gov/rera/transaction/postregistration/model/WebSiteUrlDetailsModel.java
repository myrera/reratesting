package in.gov.rera.transaction.postregistration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "WebSiteUrlDetailsModel")
@Table(name = "TL_POSTREG_WEBSITE_DETAILS")
public class WebSiteUrlDetailsModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "POSTREG_WEBSITE_URL_ID")
	private Long webSiteUrlId;

	@Column(name = "WEBSITE_URL")
	private String webSiteUrl;

	public Long getWebSiteUrlId() {
		return webSiteUrlId;
	}

	public void setWebSiteUrlId(Long webSiteUrlId) {
		this.webSiteUrlId = webSiteUrlId;
	}

	public String getWebSiteUrl() {
		return webSiteUrl;
	}

	public void setWebSiteUrl(String webSiteUrl) {
		this.webSiteUrl = webSiteUrl;
	}
	
	
	


}
