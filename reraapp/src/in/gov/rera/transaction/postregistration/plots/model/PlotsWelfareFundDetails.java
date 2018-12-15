package in.gov.rera.transaction.postregistration.plots.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;

@Entity(name = "PlotWelfareFundDetails")
@Table(name = "TL_PLOT_WELFARE_FUND_DETAILS")
public class PlotsWelfareFundDetails implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PLOT_WELFARE_FUND_DETAILS_ID")
	private Long plotWelfareFundDetailsId;
	
	@Column(name = "PLOT_WELFARE_FUND_REGISTRATION_NO")
	private String plotWelfareFundRegNo;
	
	@Column(name = "IS_WELFARE_FUND_APPLECABLE")
	private String isWelfareFundApplicable;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="registeredDocId") 
	private Document welfareFundregisteredDoc;

	public Long getPlotWelfareFundDetailsId() {
		return plotWelfareFundDetailsId;
	}

	public void setPlotWelfareFundDetailsId(Long plotWelfareFundDetailsId) {
		this.plotWelfareFundDetailsId = plotWelfareFundDetailsId;
	}

	public String getPlotWelfareFundRegNo() {
		return plotWelfareFundRegNo;
	}

	public void setPlotWelfareFundRegNo(String plotWelfareFundRegNo) {
		this.plotWelfareFundRegNo = plotWelfareFundRegNo;
	}

	public String getIsWelfareFundApplicable() {
		return isWelfareFundApplicable;
	}

	public void setIsWelfareFundApplicable(String isWelfareFundApplicable) {
		this.isWelfareFundApplicable = isWelfareFundApplicable;
	}

	

	public Document getWelfareFundregisteredDoc() {
		return welfareFundregisteredDoc;
	}

	public void setWelfareFundregisteredDoc(Document welfareFundregisteredDoc) {
		this.welfareFundregisteredDoc = welfareFundregisteredDoc;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	

}
