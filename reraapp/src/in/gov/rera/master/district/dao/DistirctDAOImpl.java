package in.gov.rera.master.district.dao;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.master.district.model.DistrictModel;


@Repository(value="DistirctDAOImpl")
@Scope("request")
public class DistirctDAOImpl<E,PK> extends GenericDAOImpl<DistrictModel, Long> implements IDistrictDAO<DistrictModel,Long>{

	@Override
	public DistrictModel getDistirctById(Long pk) {
		return super.findOne(pk);
	}

}
