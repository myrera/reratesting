package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.master.stateut.model.StateUtModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "PromoterBlacklistDetailsModel")
@Table(name = "TL_PROMOTER_BALCKLIST_DETAILS")

public class PromoterBlacklistDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BALACK_LIST_ID")
	private Long prmBacklistId;
	
	@Column(name = "IS_BALACK_LIST")
	private String isBalckList;

	@Column(name = "CERTIFICATT_NO")
	private String certificateNo;
	
	@Column(name = "BALCK_LIST_REASON",length=1500)
	private String blacklistReason;


	
	@ManyToOne
	@JoinColumn(name="STATE_UT_ID")
	private StateUtModel stateUtModel;
	
	
	
	public Long getPrmBacklistId() {
		return prmBacklistId;
	}

	public void setPrmBacklistId(Long prmBacklistId) {
		this.prmBacklistId = prmBacklistId;
	}

	public String getIsBalckList() {
		return isBalckList;
	}

	public void setIsBalckList(String isBalckList) {
		this.isBalckList = isBalckList;
	}

	public String getCertificateNo() {
		return certificateNo;
	}

	public StateUtModel getStateUtModel() {
		return stateUtModel;
	}

	public void setStateUtModel(StateUtModel stateUtModel) {
		this.stateUtModel = stateUtModel;
	}

	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}

	public String getBlacklistReason() {
		return blacklistReason;
	}

	public void setBlacklistReason(String blacklistReason) {
		this.blacklistReason = blacklistReason;
	}



}
