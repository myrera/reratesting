package in.gov.rera.transaction.projectregistration.dao;

public interface IPrevoiuProjectDao<E,PK> {

	E getPerviousProjectDetailsModelById(PK pk);
	
}
