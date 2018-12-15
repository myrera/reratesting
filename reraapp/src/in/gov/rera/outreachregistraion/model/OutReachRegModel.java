package in.gov.rera.outreachregistraion.model;

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

import in.gov.rera.master.district.model.DistrictModel;

@Entity(name = "OutReachRegModel")
@Table(name = "TT_OUT_REACH_REG")
public class OutReachRegModel implements Serializable  {
	
	
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "OUT_REACH_REG_ID")
		private Long id;
		
// 	@OneToOne(cascade = CascadeType.ALL)
//		@JoinColumn(name = "DISTRICT_ID")
//		private DistrictModel district; 
	
	@Column(name = "DIST_NAME")
	private String distName;
		
		
		@Column(name = "PARTICIPANT_NAME")
		private String participant;
		
		@Column(name = "MOBILE")
		private String mobile;
		
		@Column(name = "EMAIL")
		private String email;
		
		@Column(name = "CATEGORY")
		private String category;
		
		@Column(name = "CATEGORY_OTHER")
		private String ifOther;
		
		@Column(name = "BUILDER_NAME")
		private String builderName;
		
		@Column(name = "EVENT")
		private String event;
		
		@Column(name = "ADDRESS")
		private String address;
		
		@Column(name = "PIN_CODE")
		private String pinCode;

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

 		
		public String getDistName() {
			return distName;
		}

		public void setDistName(String distName) {
			this.distName = distName;
		}

		public String getParticipant() {
			return participant;
		}

		public void setParticipant(String participant) {
			this.participant = participant;
		}

		public String getMobile() {
			return mobile;
		}

		public void setMobile(String mobile) {
			this.mobile = mobile;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public String getIfOther() {
			return ifOther;
		}

		public void setIfOther(String ifOther) {
			this.ifOther = ifOther;
		}

		

		public String getBuilderName() {
			return builderName;
		}

		public void setBuilderName(String builderName) {
			this.builderName = builderName;
		}

		public String getEvent() {
			return event;
		}

		public void setEvent(String event) {
			this.event = event;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getPinCode() {
			return pinCode;
		}

		public void setPinCode(String pinCode) {
			this.pinCode = pinCode;
		}
		
		
	
	}

