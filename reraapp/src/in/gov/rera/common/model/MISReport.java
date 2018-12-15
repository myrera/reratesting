package in.gov.rera.common.model;

public class MISReport {
	
	private String month;
	private int registration;
	private int approved;
	private int rejected;
	private int totalDisposed;
	private int pending;
	private int headOffice;
	private int secretary;
	private int accounts;
	private int revenue;
	private int tcp;
	private int engg;
	private int promoter;
	private int remarks;
	private int agent;
	private int withdrawn;
	
	public int getWithdrawn() {
		return withdrawn;
	}
	public void setWithdrawn(int withdrawn) {
		this.withdrawn = withdrawn;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getRegistration() {
		return registration;
	}
	public void setRegistration(int registration) {
		this.registration = registration;
	}
	public int getApproved() {
		return approved;
	}
	public void setApproved(int approved) {
		this.approved = approved;
	}
	public int getRejected() {
		return rejected;
	}
	public void setRejected(int rejected) {
		this.rejected = rejected;
	}
	public int getPending() {
		return pending;
	}
	public void setPending(int pending) {
		this.pending = pending;
	}
	public int getHeadOffice() {
		return headOffice;
	}
	public void setHeadOffice(int headOffice) {
		this.headOffice = headOffice;
	}
	public int getSecretary() {
		return secretary;
	}
	public void setSecretary(int secretary) {
		this.secretary = secretary;
	}
	public int getAccounts() {
		return accounts;
	}
	public void setAccounts(int accounts) {
		this.accounts = accounts;
	}
	public int getRevenue() {
		return revenue;
	}
	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}
	public int getTcp() {
		return tcp;
	}
	public void setTcp(int tcp) {
		this.tcp = tcp;
	}
	public int getEngg() {
		return engg;
	}
	public void setEngg(int engg) {
		this.engg = engg;
	}
	public int getPromoter() {
		return promoter;
	}
	public void setPromoter(int promoter) {
		this.promoter = promoter;
	}
	public int getRemarks() {
		return remarks;
	}
	public void setRemarks(int remarks) {
		this.remarks = remarks;
	}
	public int getAgent() {
		return agent;
	}
	public void setAgent(int agent) {
		this.agent = agent;
	}
	public int getTotalDisposed() {
		return approved+rejected+withdrawn;
	}
	public void setTotalDisposed(int totalDisposed) {
		this.totalDisposed = totalDisposed;
	}
	
	

}
