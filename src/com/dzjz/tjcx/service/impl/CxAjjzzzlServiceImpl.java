/**
 * 
 */
package com.dzjz.tjcx.service.impl;

import java.util.Map;

import com.dzjz.tjcx.dao.CxAjjzzzlDao;
import com.dzjz.tjcx.service.CxAjjzzzlService;

/**
 * @author Administrator
 *
 */
public class CxAjjzzzlServiceImpl implements CxAjjzzzlService{
	
	private CxAjjzzzlDao cxAjjzzzlDao;

	/**
	 * @return the cxAjjzzzlDao
	 */
	public CxAjjzzzlDao getCxAjjzzzlDao() {
		return cxAjjzzzlDao;
	}

	/**
	 * @param cxAjjzzzlDao the cxAjjzzzlDao to set
	 */
	public void setCxAjjzzzlDao(CxAjjzzzlDao cxAjjzzzlDao) {
		this.cxAjjzzzlDao = cxAjjzzzlDao;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.tjcx.service.CxAjjzzzlService#dwjzzztj(java.util.Map)
	 */
	@Override
	public Map<String, ?> dwjzzzcx(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return cxAjjzzzlDao.dwjzzzcx(map);
	}

	


}
