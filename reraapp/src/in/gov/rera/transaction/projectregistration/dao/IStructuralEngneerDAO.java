package in.gov.rera.transaction.projectregistration.dao;

public interface IStructuralEngneerDAO<E,PK> {

	public E getEngineerById(PK pk);
}
