package in.gov.rera.search;

public interface ISearch<E,PK> {

	public SearchResult search(SearchQuery query)throws Exception;
}
