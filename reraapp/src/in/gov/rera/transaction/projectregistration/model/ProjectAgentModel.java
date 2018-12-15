package in.gov.rera.transaction.projectregistration.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;


@Entity(name = "ProjectAgentModel")
@Table(name = "TL_PROJECT_AGENT_MAPPING")
public class ProjectAgentModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="AGENT_ID")
	private AgentRegistrationModel agent;
	
	@ManyToOne
	@JoinColumn(name="PROJECT_ID")
	private ProjectRegistrationModel project;
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="ADDED_ON")
	private Calendar addedOn;
	
	@Column(name="SEPARATED_ON")
	private Calendar separatedOn;

	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}



	public AgentRegistrationModel getAgent() {
		return agent;
	}

	public void setAgent(AgentRegistrationModel agent) {
		this.agent = agent;
	}

	public ProjectRegistrationModel getProject() {
		return project;
	}

	public void setProject(ProjectRegistrationModel project) {
		this.project = project;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Calendar getAddedOn() {
		return addedOn;
	}

	public void setAddedOn(Calendar addedOn) {
		this.addedOn = addedOn;
	}

	public Calendar getSeparatedOn() {
		return separatedOn;
	}

	public void setSeparatedOn(Calendar separatedOn) {
		this.separatedOn = separatedOn;
	}
	
	
	
	
}
