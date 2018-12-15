package in.gov.rera.master.stateut.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;



public interface IStateUtDAO<E,PK> {
  public List<E> getStateUtList(DetachedCriteria dt) throws Exception;

   public E getStateById(PK pk)throws Exception;
}
