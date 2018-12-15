package in.gov.rera.search;

import in.gov.rera.common.util.TecPaginator;

import java.util.List;

public class SearchResult {
	
	private String name;
	private String type;
	private String registrationType;
	private int currentPage;
	private int maxRecords;
	private int totalRecords;
	private TecPaginator pagging;
	private int startFrom;
	private int lastIndex;
	
	
	

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getStartFrom() {
		return startFrom;
	}

	public void setStartFrom(int startFrom) {
		this.startFrom = startFrom;
	}

	public void setPagging(TecPaginator pagging) {
		this.pagging = pagging;
	}

	public TecPaginator getPagging() {
		return pagging;
	}

	public void setPagging() {
		this.pagging = new TecPaginator(totalRecords, maxRecords, startFrom);
		
	}

	public String getRegistrationType() {
		return registrationType;
	}

	public void setRegistrationType(String registrationType) {
		this.registrationType = registrationType;
	}

	private List<SearchObject> recordList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(int maxRecords) {
		this.maxRecords = maxRecords;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<SearchObject> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<SearchObject> recordList) {
		this.recordList = recordList;
	}
	
	
}
