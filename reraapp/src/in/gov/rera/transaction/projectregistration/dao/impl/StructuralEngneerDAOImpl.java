package in.gov.rera.transaction.projectregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.dao.IStructuralEngneerDAO;
import in.gov.rera.transaction.projectregistration.model.StructuralEngineerDetailsModel;

@Repository
public class StructuralEngneerDAOImpl extends GenericDAOImpl<StructuralEngineerDetailsModel, Long>
implements IStructuralEngneerDAO<StructuralEngineerDetailsModel, Long>
{

	@Override
	public StructuralEngineerDetailsModel getEngineerById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}

}
