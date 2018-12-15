package in.gov.rera.outreachregister.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.stateut.service.IStateUtService;
import in.gov.rera.master.subdistrict.dao.ISubDistrictDAO;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.notification.service.SmsService;
import in.gov.rera.outreachregister.dao.IOutReachRegistrationDAO;
import in.gov.rera.outreachregistraion.model.OutReachEventModel;
import in.gov.rera.outreachregistraion.model.OutReachRegModel;
import in.gov.rera.outreachregistraion.model.OutReachRegistrationModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.controller.ProjectRegController;
import in.gov.rera.transaction.projectregistration.dao.EnquiryDetailsDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Controller(value = "OutReachRegController")
@Scope("request")
public class OutReachRegController {
	
	static Logger log = Logger.getLogger(OutReachRegController.class);	
	
	@Autowired
	HttpSession httpSession;

	@Autowired
	IDistrictDAO<DistrictModel, Long> districtDAO;
	
	@Autowired
	IOutReachRegistrationDAO<OutReachRegistrationModel, Long> iOutReachRegistrationDAO;
	
	@Autowired
	MailService mailService;

	@Autowired
	SmsService smsService;
	
	
	
	@RequestMapping(value = "outReachRegister")
	public ModelAndView outReachRegister() {
		ModelAndView mv = new ModelAndView("outReachRegister");
		
	//	List<OutReachEventModel> eventList = new ArrayList<OutReachEventModel>();
		
	//	OutReachEventModel eventModel = new OutReachEventModel();
//		eventModel.setEventLocation("Mangalore");
//		eventModel.setEventAddress("address");
//		eventModel.setDate("22 oct 2017");
//		eventModel.setTime("11 : 30 PM");
//		
//		OutReachEventModel eventModel1 = new OutReachEventModel();
//		eventModel1.setEventLocation("Hubli");
//		eventModel1.setEventAddress("address-1");
//		eventModel1.setDate("11 oct 2017");
//		eventModel1.setTime("02 : 30 PM");
//		
//		eventList.add(eventModel1);
//		eventList.add(eventModel);
		
		List<Object> eventList = iOutReachRegistrationDAO.getEventList();
		
		List<Object> distList = iOutReachRegistrationDAO.getDistrictList(117L);
		
		mv.addObject("eventList", eventList);
		mv.addObject("distList", distList);
		
		return mv;
	}
	
	
	@RequestMapping(value = "saveOutReachRegDetails", method=RequestMethod.POST)
	public ModelAndView saveOutReachRegDetails(
			HttpServletRequest request,@RequestParam("participantName") String participantName, @RequestParam("phnNo") String phnNo, @RequestParam("emailId") String emailId ,
			@RequestParam("categoryName") String categoryName,@RequestParam("builderName") String builderName, 
			@RequestParam("eventName") String eventName,	@RequestParam("isOther") String isOther,
			@RequestParam("distName") String distName,@RequestParam("address") String address,@RequestParam("pinCode") String pinCode  ) {
		ModelAndView mv = null;
		try {
			
			
			//String str = request.getParameter("emailId");
			OutReachRegModel outReachRegistrationModel = new OutReachRegModel();
			outReachRegistrationModel.setParticipant(request.getParameter("participantName"));
			outReachRegistrationModel.setBuilderName(builderName);
			outReachRegistrationModel.setMobile(phnNo);
			outReachRegistrationModel.setEmail(emailId);
			outReachRegistrationModel.setCategory(categoryName);
			outReachRegistrationModel.setEvent(eventName);
			outReachRegistrationModel.setDistName(distName);
			outReachRegistrationModel.setAddress(address);
			outReachRegistrationModel.setPinCode(pinCode);
			outReachRegistrationModel.setIfOther(isOther);
			
			iOutReachRegistrationDAO.saveOutReachRegModel(outReachRegistrationModel);
			
			List<Object> eventList = iOutReachRegistrationDAO.getEventList(eventName);
			OutReachEventModel event = null;
			for(Object data: eventList ){
				OutReachEventModel eventObj = (OutReachEventModel)data;
				if(eventObj.getEventLocation().equals(eventName)){
					event = eventObj;
				}
			}
			
			EnquiryModel enq = new EnquiryModel();
			enq.setEmailId(emailId);
			enq.setSubject("Outreach Registration");
			enq.setEnquiryText("Dear "+participantName+".\nYour registration for the Outreach program at " +event.getEventLocation()+" has been submitted successfully."
					+ "\n\n\t The details of the event are  as below:\n"
					+ "Date: "+event.getDate()+" \n"
					+ "Time: "+event.getTime()+"\n"
					+ "Venue: "+event.getEventAddress()+"\n\n"+"Note: Please carry a valid ID prrof to the center\n\n"
					+"Thankyou,\nRera Karnataka Team.");
			
			mailService.sendMail(enq);
			smsService.sendSMS(phnNo, "Dear "+participantName+","+ "\n Your registration for the rera Outreach program is sucessful.\nPlease see your registered email address for more info.");
			
			mv = new ModelAndView("home");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
		}
		return mv;
	}

}
	
	
	

	
