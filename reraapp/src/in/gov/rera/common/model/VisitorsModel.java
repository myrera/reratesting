package in.gov.rera.common.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity(name = "VisitorsModel")
@Table(name = "TT_VISITORS_COUNT")
public class VisitorsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_ID")
	private Long id;
	
	@Column(name = "V_DATE")
	@Temporal(TemporalType.DATE)
	private Calendar vDate;
	
	@Column(name = "COUNT")
	private Integer count;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Calendar getvDate() {
		return vDate;
	}

	public void setvDate(Calendar vDate) {
		this.vDate = vDate;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	
	
	
	
}
