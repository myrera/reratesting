package in.gov.rera.transaction.postregistration.plots.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "PlotQuaterlyUpdate")
@Table(name = "TL_PLOTS_QUATERLY_UPDATE")
public class PlotsQuaterlyUpdate implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long quaterlyId;
		
		@Column(name = "UPDATE_DATE")
		@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
		@DateTimeFormat(pattern = "dd/MM/yyyy") 
		private Calendar updateDate;
		
		@Column(name = "ACTUAL_UPDATE_DATE")
		@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
		@DateTimeFormat(pattern = "dd/MM/yyyy") 
		private Calendar actualUpdateDate;
		
/*		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<PlotsWorkModel> projectWorkModel;*/
		

		@OneToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "PLOT_BANK_DETLS_ID")
		private PlotsBankDetails bankDetails;
		
				
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<PlotsCommonAreaDetails> commonAreaDetails;
	
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<PlotsLitigationDetails> litigationDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<PlotsModificationDetails> modificationDetails;
		
		@OneToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "QUATERLY_PLOTS_DETAILS_ID")
		private QuaterlyPlotsDetailsModel plotDetails;
		
		public QuaterlyPlotsDetailsModel getPlotDetails() {
			return plotDetails;
		}

		public void setPlotDetails(QuaterlyPlotsDetailsModel plotDetails) {
			this.plotDetails = plotDetails;
		}

		@OneToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "PLOT_ASSOCIATION_DETLS_ID")
		private PlotsAssociationRegistrationDetails associationDetails;
		
		@OneToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "PLOT_WELFARE_FUNDS_DETAILS_ID")
		private PlotsWelfareFundDetails welfareFundDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterlyCivilWorkModel> quarterCivilWorkList;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterPlotsConstructionCostModel> quarterPlotsConstructionCostList;


		@OneToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
		@JoinColumn(name = "PLOT_QUARTERLY_COM_AUTH_ID")
		private QuarterlyPlotsCommonAuthorityModel quarterlyPlotsCommonAuthorityModel;




		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterlyPlotCommonPurchaserModel> quarterCommonAreasPurchaserList;




		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<PlotsApprovalsAndNOCDetails> approvalsAndNOCDetails;

		public Long getQuaterlyId() {
			return quaterlyId;
		}

		public void setQuaterlyId(Long quaterlyId) {
			this.quaterlyId = quaterlyId;
		}

		public Calendar getUpdateDate() {
			return updateDate;
		}

		public void setUpdateDate(Calendar updateDate) {
			this.updateDate = updateDate;
		}

		public Calendar getActualUpdateDate() {
			return actualUpdateDate;
		}

		public void setActualUpdateDate(Calendar actualUpdateDate) {
			this.actualUpdateDate = actualUpdateDate;
		}

/*		public List<PlotsWorkModel> getProjectWorkModel() {
			return projectWorkModel;
		}

		public void setProjectWorkModel(List<PlotsWorkModel> projectWorkModel) {
			this.projectWorkModel = projectWorkModel;
		}*/

		public PlotsBankDetails getBankDetails() {
			return bankDetails;
		}

		public void setBankDetails(PlotsBankDetails bankDetails) {
			this.bankDetails = bankDetails;
		}

		public List<PlotsCommonAreaDetails> getCommonAreaDetails() {
			return commonAreaDetails;
		}

		public void setCommonAreaDetails(List<PlotsCommonAreaDetails> commonAreaDetails) {
			this.commonAreaDetails = commonAreaDetails;
		}

		public List<PlotsApprovalsAndNOCDetails> getApprovalsAndNOCDetails() {
			return approvalsAndNOCDetails;
		}

		public void setApprovalsAndNOCDetails(List<PlotsApprovalsAndNOCDetails> approvalsAndNOCDetails) {
			this.approvalsAndNOCDetails = approvalsAndNOCDetails;
		}

		public List<PlotsLitigationDetails> getLitigationDetails() {
			return litigationDetails;
		}

		public void setLitigationDetails(List<PlotsLitigationDetails> litigationDetails) {
			this.litigationDetails = litigationDetails;
		}

		public List<PlotsModificationDetails> getModificationDetails() {
			return modificationDetails;
		}

		public void setModificationDetails(List<PlotsModificationDetails> modificationDetails) {
			this.modificationDetails = modificationDetails;
		}

		public PlotsAssociationRegistrationDetails getAssociationDetails() {
			return associationDetails;
		}

		public void setAssociationDetails(PlotsAssociationRegistrationDetails associationDetails) {
			this.associationDetails = associationDetails;
		}

		public PlotsWelfareFundDetails getWelfareFundDetails() {
			return welfareFundDetails;
		}

		public void setWelfareFundDetails(PlotsWelfareFundDetails welfareFundDetails) {
			this.welfareFundDetails = welfareFundDetails;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		public List<QuarterlyCivilWorkModel> getQuarterCivilWorkList() {
			return quarterCivilWorkList;
		}

		public void setQuarterCivilWorkList(List<QuarterlyCivilWorkModel> quarterCivilWorkList) {
			this.quarterCivilWorkList = quarterCivilWorkList;
		}

		public QuarterlyPlotsCommonAuthorityModel getQuarterlyPlotsCommonAuthorityModel() {
			return quarterlyPlotsCommonAuthorityModel;
		}

		public void setQuarterlyPlotsCommonAuthorityModel(
				QuarterlyPlotsCommonAuthorityModel quarterlyPlotsCommonAuthorityModel) {
			this.quarterlyPlotsCommonAuthorityModel = quarterlyPlotsCommonAuthorityModel;
		}

		public List<QuarterlyPlotCommonPurchaserModel> getQuarterCommonAreasPurchaserList() {
			return quarterCommonAreasPurchaserList;
		}

		public void setQuarterCommonAreasPurchaserList(
				List<QuarterlyPlotCommonPurchaserModel> quarterCommonAreasPurchaserList) {
			this.quarterCommonAreasPurchaserList = quarterCommonAreasPurchaserList;
		}

		public List<QuarterPlotsConstructionCostModel> getQuarterPlotsConstructionCostList() {
			return quarterPlotsConstructionCostList;
		}

		public void setQuarterPlotsConstructionCostList(
				List<QuarterPlotsConstructionCostModel> quarterPlotsConstructionCostList) {
			this.quarterPlotsConstructionCostList = quarterPlotsConstructionCostList;
		}

		

		
		
}
