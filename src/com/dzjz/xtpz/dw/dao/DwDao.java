/**
 * 
 */
package com.dzjz.xtpz.dw.dao;

import java.util.List;
import java.util.Map;

import com.common.CommInterface;
import com.dzjz.xtpz.dw.po.Dw;

/**
 * @author Administrator
 *
 */
public interface DwDao extends CommInterface<Dw>{
	
	public List<Dw> queryDw(Map<String, Object> map);
	
	public void add(Dw dw);
	
	public List<Dw> IdQueryMax(String fdwbm);

	public void delete(Dw dw);
	
	public void updata(Dw dw);

}
