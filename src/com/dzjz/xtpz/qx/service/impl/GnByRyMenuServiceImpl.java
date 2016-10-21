/**
 * 
 */
package com.dzjz.xtpz.qx.service.impl;

import java.util.Collection;
import java.util.Map;

import javax.annotation.Resource;

import com.dzjz.xtpz.qx.dao.GnByRyMenuDao;
import com.dzjz.xtpz.qx.service.GnByRyMenuService;

/**
 * @author Administrator
 *
 */
public class GnByRyMenuServiceImpl implements GnByRyMenuService {
	@Resource
	private GnByRyMenuDao gnByRyMenuDao ;
	

	/**
	 * @return the gnByRyMenuDao
	 */
	public GnByRyMenuDao getGnByRyMenuDao() {
		return gnByRyMenuDao;
	}


	/**
	 * @param gnByRyMenuDao the gnByRyMenuDao to set
	 */
	public void setGnByRyMenuDao(GnByRyMenuDao gnByRyMenuDao) {
		this.gnByRyMenuDao = gnByRyMenuDao;
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.GnByRyMenuService#gnbyry(java.util.Map)
	 */
	@Override
	public Collection gnbyry(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return gnByRyMenuDao.gnbyry(map);
	}

}
