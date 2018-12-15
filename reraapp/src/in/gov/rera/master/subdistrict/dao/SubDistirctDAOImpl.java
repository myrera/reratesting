package in.gov.rera.master.subdistrict.dao;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;


@Repository(value="SubDistirctDAOImpl")
@Scope("request")
public class SubDistirctDAOImpl<E,PK> extends GenericDAOImpl<SubDistrictModel, Long> implements ISubDistrictDAO<SubDistrictModel,Long>{

	@Override
	public SubDistrictModel getSubDistirctById(Long pk) {
		return super.findOne(pk);
	}

}
