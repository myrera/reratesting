package in.gov.rera.master.stateut.service;

import java.util.List;

public interface IStateUtService <E,PK>{
   List<E>  getStateUtList() throws Exception;
   E getStateByID(PK pk) throws Exception;
}
