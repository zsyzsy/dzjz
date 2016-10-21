/**
 * 
 */
package com.dzjz.tjbb.service.impl;

import java.util.Map;

import com.dzjz.tjbb.dao.JzcctjDao;
import com.dzjz.tjbb.service.JzcctjService;

/**
 * @author Administrator
 *
 */
public class JzcctjServiceImpl implements JzcctjService{
	
	private JzcctjDao jzcctjDao;

	/**
	 * @return the jzcctjDao
	 */
	public JzcctjDao getJzcctjDao() {
		return jzcctjDao;
	}

	/**
	 * @param jzcctjDao the jzcctjDao to set
	 */
	public void setJzcctjDao(JzcctjDao jzcctjDao) {
		this.jzcctjDao = jzcctjDao;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.tjbb.service.JzcctjService#jznumber(java.util.Map)
	 */
	@Override
	public Map<String, ?> jznumber(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jzcctjDao.jznumber(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.tjbb.service.JzcctjService#dwjznumber(java.util.Map)
	 */
	@Override
	public Map<String, ?> dwjznumber(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jzcctjDao.dwjznumber(map);
	}
	

}
