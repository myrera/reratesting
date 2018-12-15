package in.gov.rera.transaction.projectregistration.dao;

public interface IBlackListDao<E,PK> {

	public E getBlackListById(PK pk);
}
