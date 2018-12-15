package in.gov.rera.admin.service.inpl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.gov.rera.admin.service.DashboardService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.ReraConstants;
import org.apache.log4j.Logger;

@Service(value = "DashBoardServiceImpl")
public class DashBoardServiceImpl implements DashboardService {
	static Logger log= Logger.getLogger(DashBoardServiceImpl.class);

	@Autowired
	private CommonDao<Object, Long> dao;

	@Override
	public Map<String, String> getPieChartData() {
		int cheque = 0, dd = 0, online = 0;
		Map<String, String> data = new HashMap<String, String>();
		try {
			String str = "Select count(p) from ProjectRegistrationModel p  where p.paymentDetailsModel.paymentMode=:mode";
			Query query = dao.getQuery(str);
			query.setString("mode", "Banker's Cheque");
			List<Object> ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				cheque += ((int) (long) (Long) ls.get(0));
			}

			str = "Select count(p) from AgentRegistrationModel p  where p.agentDetailsModel.regPaymentDetailsModel.paymentMode=:mode";
			query = dao.getQuery(str);
			query.setString("mode", "Banker's Cheque");
			ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				cheque += ((int) (long) (Long) ls.get(0));
			}

			str = "Select count(p) from ComplaintModel p  where p.complaintPaymentDetailsModel.paymentMode=:mode";
			query = dao.getQuery(str);
			query.setString("mode", "Banker's Cheque");
			ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				cheque += ((int) (long) (Long) ls.get(0));
			}

			str = "Select count(p) from ProjectRegistrationModel p  where p.paymentDetailsModel.paymentMode=:mode";
			query = dao.getQuery(str);
			query.setString("mode", "Payment Gateway");
			ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				online += ((int) (long) (Long) ls.get(0));
			}

			str = "Select count(p) from AgentRegistrationModel p  where p.agentDetailsModel.regPaymentDetailsModel.paymentMode=:mode";
			query = dao.getQuery(str);
			query.setString("mode", "Payment Gateway");
			ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				online += ((int) (long) (Long) ls.get(0));
			}

			str = "Select count(p) from ComplaintModel p  where p.complaintPaymentDetailsModel.paymentMode=:mode";
			query = dao.getQuery(str);
			query.setString("mode", "Payment Gateway");
			ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				online += ((int) (long) (Long) ls.get(0));
			}

			str = "Select count(p) from ProjectRegistrationModel p  where p.paymentDetailsModel.paymentMode=:mode";
			query = dao.getQuery(str);
			query.setString("mode", "Demand Draft");
			ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				dd += ((int) (long) (Long) ls.get(0));
			}

			str = "Select count(p) from AgentRegistrationModel p  where p.agentDetailsModel.regPaymentDetailsModel.paymentMode=:mode";
			query = dao.getQuery(str);
			query.setString("mode", "Demand Draft");
			ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				dd += ((int) (long) (Long) ls.get(0));
			}

			str = "Select count(p) from ComplaintModel p  where p.complaintPaymentDetailsModel.paymentMode=:mode";
			query = dao.getQuery(str);
			query.setString("mode", "Demand Draft");
			ls = query.list();
			if (ls != null && ls.size() > 0 && ls.get(0) != null) {
				dd += ((int) (long) (Long) ls.get(0));
			}

			data.put("online", online + "");

			data.put("cheque", cheque + "");

			data.put("dd", dd + "");

		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}

		return data;
	}

	@Override
	public List<Object> getLineChartData() {
		int xx = 0;

		List<Object> lst = new ArrayList<Object>();
		Map<String, String> data = null;
		try {
			while (xx < 6) {
				data = new HashMap<String, String>();
				Calendar cl = Calendar.getInstance();
				cl.add(Calendar.MONTH, -xx);
				int year = cl.get(Calendar.YEAR);
				int mnth = cl.get(Calendar.MONTH) + 1;
				if (mnth < 10) {
					data.put("mYear", year + "-0" + mnth);
				} else {
					data.put("mYear", year + "-" + mnth);
				}

				String str = "Select count(p.projectRegId) from ProjectRegistrationModel p where MONTH(p.createdOn) =:emonth and YEAR(p.createdOn) =:eyear and status!=:sts";
				Query query = dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				query.setString("sts", ReraConstants.SAVE_AS_DRAFT);
				List<Object> ls = query.list();
				if (ls != null && ls.size() > 0) {
					data.put("project", ls.get(0).toString());
				} else {
					data.put("project", "0");
				}

				str = "Select count(p.agentRegistrationID) from AgentRegistrationModel p where MONTH(p.createdOn) =:emonth and YEAR(p.createdOn) =:eyear and status!=:sts";
				query = dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				query.setString("sts", ReraConstants.SAVE_AS_DRAFT);

				ls = query.list();
				if (ls != null && ls.size() > 0) {
					data.put("agent", ls.get(0).toString());
				} else {
					data.put("agent", "0");
				}

				str = "Select count(p.compId) from ComplaintModel p where MONTH(p.complaintDate) =:emonth and YEAR(p.complaintDate) =:eyear";
				query = dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				ls = query.list();
				if (ls != null && ls.size() > 0) {
					data.put("complaint", ls.get(0).toString());
				} else {
					data.put("complaint", "0");
				}

				lst.add(data);
				xx++;

			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return lst;
	}

	@Override
	public List<Object> getBarChartData() {
		int xx = 0;

		List<Object> lst = new ArrayList<Object>();
		Map<String, String> data = null;
		try {
			while (xx < 6) {
				data = new HashMap<String, String>();
				Calendar cl = Calendar.getInstance();
				cl.add(Calendar.MONTH, -xx);
				int year = cl.get(Calendar.YEAR);
				int mnth = cl.get(Calendar.MONTH) + 1;

				if (mnth < 10) {
					data.put("mYear", year + "-0" + mnth);
				} else {
					data.put("mYear", year + "-" + mnth);
				}

				String str = "Select sum(p.paymentDetailsModel.amount) from ProjectRegistrationModel p where MONTH(p.createdOn) =:emonth and YEAR(p.createdOn) =:eyear";
				Query query = dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				List<Object> ls = query.list();
				if (ls != null && ls.size() > 0 && ls.get(0) != null) {
					data.put("project", ls.get(0).toString());
				} else {
					data.put("project", "0.0");
				}

				str = "Select sum(p.agentDetailsModel.regPaymentDetailsModel.amount) from AgentRegistrationModel p where MONTH(p.createdOn) =:emonth and YEAR(p.createdOn) =:eyear";
				query = dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				ls = query.list();
				if (ls != null && ls.size() > 0 && ls.get(0) != null) {
					data.put("agent", ls.get(0).toString());
				} else {
					data.put("agent", "0.0");
				}

				str = "Select sum(p.complaintPaymentDetailsModel.amount) from ComplaintModel p where MONTH(p.complaintDate) =:emonth and YEAR(p.complaintDate) =:eyear";
				query = dao.getQuery(str);
				query.setInteger("emonth", mnth);
				query.setInteger("eyear", year);
				ls = query.list();
				if (ls != null && ls.size() > 0 && ls.get(0) != null) {
					data.put("complaint", ls.get(0).toString());
				} else {
					data.put("complaint", "0.0");
				}

				lst.add(data);
				xx++;
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return lst;
	}

	@Override
	public Integer getOperatorsTotalsByDate(String operator, Date startDate, Date endDate) {

		String str = "";
		if (ReraConstants.OP_ACCOUNTS_USER.equals(operator)) {
			str = "Select count(distinct p) from ProjectRegistrationModel p inner join p.projectRemarks as rm inner join rm.remarksList as urm where  (p.status <> :status1 and p.status <> :status2) and rm.accountsStatus='OK' and urm.oprAccRemarkDate between :startDate and :endDate";
		} else if (ReraConstants.OP_TCP_USER.equals(operator)) {
			str = "Select count(distinct p) from ProjectRegistrationModel p inner join p.projectRemarks as rm inner join rm.remarksList as urm where  (p.status <> :status1 and p.status <> :status2) and rm.tcpStatus='OK' and urm.oprTcpRemarkDate between :startDate and :endDate";
		} else if (ReraConstants.OP_REVENUE_USER.equals(operator)) {
			str = "Select count(distinct p) from ProjectRegistrationModel p inner join p.projectRemarks as rm inner join rm.remarksList as urm where  (p.status <> :status1 and p.status <> :status2) and rm.revenueStatus='OK' and urm.oprRevRemarkDate between :startDate and :endDate";
		} else if (ReraConstants.OP_ENGG_USER.equals(operator)) {
			str = "Select count(distinct p) from ProjectRegistrationModel p inner join p.projectRemarks as rm inner join rm.remarksList as urm where  (p.status <> :status1 and p.status <> :status2) and rm.enggStatus='OK' and urm.oprEnggRemarkDate between :startDate and :endDate";
		}

		Query query = null;
		try {
			query = dao.getQuery(str);
			query.setString("status1", ReraConstants.SAVE_AS_DRAFT);
			query.setString("status2", ReraConstants.REVOKED);
			query.setDate("startDate", startDate);
			query.setDate("endDate", endDate);

		} catch (Exception e) {

			log.error(e.getMessage(),e);
		}

		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public Map<String, Integer> getApplicationsTotalsByDate(Date startDate, Date endDate) {

		Map<String, Integer> data = new HashMap<String, Integer>();

		String str = "Select count(distinct p) from ProjectRegistrationModel p   where  (p.status <> :status1 and p.status <> :status2) and p.createdOn between :startDate and :endDate";

		Query query = null;
		try {
			query = dao.getQuery(str);

			query.setString("status1", ReraConstants.SAVE_AS_DRAFT);
			query.setString("status2", ReraConstants.REVOKED);
			query.setDate("startDate", startDate);
			query.setDate("endDate", endDate);

			data.put("projects", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(a) from AgentRegistrationModel a  where   (a.status <> :status1 and a.status <> :status2) and a.createdOn between :startDate and :endDate";
			query = dao.getQuery(str);
			query.setString("status1", ReraConstants.SAVE_AS_DRAFT);
			query.setString("status2", ReraConstants.REVOKED);
			query.setDate("startDate", startDate);
			query.setDate("endDate", endDate);

			data.put("agents", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(c) from ComplaintModel c where c.complaintDate between :startDate and :endDate";
			query = dao.getQuery(str);
			query.setDate("startDate", startDate);
			query.setDate("endDate", endDate);
			data.put("complaints", Integer.parseInt(query.uniqueResult().toString()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage(),e);
		}
		return data;
	}

	@Override
	public Map<String, Integer> getDashboardTotals() {

		Map<String, Integer> data = new HashMap<String, Integer>();
		try {
			String str = "Select count(distinct p) from ProjectRegistrationModel p  where p.status <> '"
					+ ReraConstants.SAVE_AS_DRAFT + "' and p.status <> '" + ReraConstants.REVOKED + "'";
			Query query = dao.getQuery(str);

			data.put("totalProjects", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(p) from AgentRegistrationModel p  where p.status <> '" + ReraConstants.SAVE_AS_DRAFT
					+ "' and p.status <> '" + ReraConstants.REVOKED + "'";

			query = dao.getQuery(str);
			data.put("totalAgents", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(p) from ComplaintModel p";
			query = dao.getQuery(str);
			data.put("totalComplaints", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(p) from ProjectRegistrationModel p inner join p.enquiryList as eq where eq is not null and p.updatedFlag is null and (p.status <> :revoked and p.status <> :approved and p.status <> :saveAsDraft)";
			query = dao.getQuery(str);
			query.setString("saveAsDraft", ReraConstants.SAVE_AS_DRAFT);
			query.setString("revoked", ReraConstants.REVOKED);
			query.setString("approved", ReraConstants.APPROVED);
			data.put("totalEnquiry", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(p) from ProjectRegistrationModel p where p.status='" + ReraConstants.APPROVED + "'";
			query = dao.getQuery(str);
			data.put("totalApproved", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(p) from ProjectRegistrationModel p inner join p.projectRemarks as rm where  p.status =:pendingOperator and (rm.accountsStatus='OK' or rm.enggStatus='OK' or rm.revenueStatus='OK' or rm.tcpStatus='OK'))";
			query = dao.getQuery(str);
			query.setString("pendingOperator", ReraConstants.PENDING_OPRATOR);

			int pendingOperator = Integer.parseInt(query.uniqueResult().toString());

			str = "Select count(p) from ProjectRegistrationModel p  where p.status =:pendingAuthority or p.status =:pendingHeadOffice";
			query = dao.getQuery(str);
			query.setString("pendingAuthority", ReraConstants.PENDING_AUTHORITY);
			query.setString("pendingHeadOffice", ReraConstants.PENDING_HEADOFFICE);

			data.put("totalProcessed", Integer.parseInt(query.uniqueResult().toString()) + pendingOperator);
			data.put("totalProcessedApplications", data.get("totalProcessed")+data.get("totalApproved")+data.get("totalEnquiry"));

			str = "Select count(p) from ProjectRegistrationModel p inner join p.projectRemarks as rm where  (p.status <> :status1 and p.status <> :status2) and rm.accountsStatus='OK' ";
			query = dao.getQuery(str);
			query.setString("status1", ReraConstants.SAVE_AS_DRAFT);
			query.setString("status2", ReraConstants.REVOKED);

			data.put("totalAccountsProcessed", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(distinct p.projectRegId) from ProjectRegistrationModel p inner join p.projectRemarks as rm where  (p.status <> :status1 and p.status <> :status2) and rm.tcpStatus='OK' ";
			query = dao.getQuery(str);
			query.setString("status1", ReraConstants.SAVE_AS_DRAFT);
			query.setString("status2", ReraConstants.REVOKED);

			data.put("totalTcpProcessed", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(p) from ProjectRegistrationModel p inner join p.projectRemarks as rm where  (p.status <> :status1 and p.status <> :status2) and rm.enggStatus='OK' ";
			query = dao.getQuery(str);
			query.setString("status1", ReraConstants.SAVE_AS_DRAFT);
			query.setString("status2", ReraConstants.REVOKED);

			data.put("totalEnggProcessed", Integer.parseInt(query.uniqueResult().toString()));

			str = "Select count(p) from ProjectRegistrationModel p inner join p.projectRemarks as rm where (p.status <> :status1 and p.status <> :status2) and rm.revenueStatus='OK' ";
			query = dao.getQuery(str);
			query.setString("status1", ReraConstants.SAVE_AS_DRAFT);
			query.setString("status2", ReraConstants.REVOKED);

			data.put("totalRevenueProcessed", Integer.parseInt(query.uniqueResult().toString()));

		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}

		return data;
	}

	public static void main(String[] args) {
		Calendar c = Calendar.getInstance();
		log.info(c.get(Calendar.MONTH));
		log.info(c.get(Calendar.YEAR));
	}
}
