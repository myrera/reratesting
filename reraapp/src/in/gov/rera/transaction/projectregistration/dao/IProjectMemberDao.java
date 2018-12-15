package in.gov.rera.transaction.projectregistration.dao;

public interface IProjectMemberDao<E,PK> {

	E getProjectMemberById(PK pk);
}
