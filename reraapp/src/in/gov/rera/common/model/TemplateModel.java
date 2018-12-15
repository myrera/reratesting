package in.gov.rera.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;


@Entity(name = "TemplateModel")
@Table(name = "tt_template")
public class TemplateModel implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TEMPLATE_ID")
	private Long templateId;

	  @Lob
	  @Column(name="TEMPLATE_TEXT" , length = 1000000 )
	  private String templateText;
	
	  @Lob
	  @Column(name="TEMPLATE_CONTENT" , length = 1000000 )
	  private String templateContent;
	  
	  @Column(name="TEMPLATE_TYPE")
	  private String type;
	  
	  

	public Long getTemplateId() {
		return templateId;
	}

	public void setTemplateId(Long templateId) {
		this.templateId = templateId;
	}

	public String getTemplateText() {
		return templateText;
	}

	public void setTemplateText(String templateText) {
		this.templateText = templateText;
	}

	public String getTemplateContent() {
		return templateContent;
	}

	public void setTemplateContent(String templateContent) {
		this.templateContent = templateContent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	  
	  
}
