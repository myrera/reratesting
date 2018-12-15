package in.gov.rera.outreachregistraion.model;
	
	import java.io.Serializable;

import javax.persistence.Column;
	import javax.persistence.Entity;
	import javax.persistence.GeneratedValue;
	import javax.persistence.GenerationType;
	import javax.persistence.Id;
	import javax.persistence.Table;

	@Entity(name = "OutReachEvent")
	@Table(name = "TM_EVENT_DETAILS")
	public class OutReachEventModel implements Serializable  {
		
		private static final long serialVersionUID = 1L;
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "OUT_REACH_EVENT_ID")
		private Long eventId;
		
		@Column(name = "DATE")
		private String date;
		
		@Column(name = "TIME")
		private String time;
		
		@Column(name = "EVENT_LOCATION")
		private String eventLocation;
		
		@Column(name = "EVENT_ADDRESS")
		private String eventAddress;

		public Long getEventId() {
			return eventId;
		}

		public void setEventId(Long eventId) {
			this.eventId = eventId;
		}

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public String getTime() {
			return time;
		}

		public void setTime(String time) {
			this.time = time;
		}

		public String getEventLocation() {
			return eventLocation;
		}

		public void setEventLocation(String eventLocation) {
			this.eventLocation = eventLocation;
		}

		public String getEventAddress() {
			return eventAddress;
		}

		public void setEventAddress(String eventAddress) {
			this.eventAddress = eventAddress;
		}
		
		
		

}
