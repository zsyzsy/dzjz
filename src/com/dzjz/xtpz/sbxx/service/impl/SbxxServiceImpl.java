/**
 * 
 */
package com.dzjz.xtpz.sbxx.service.impl;

import java.util.Collection;

import com.dzjz.xtpz.sbxx.dao.SbxxDao;
import com.dzjz.xtpz.sbxx.po.Sbxx;
import com.dzjz.xtpz.sbxx.service.SbxxService;

/**
 * @author change
 *
 */
public class SbxxServiceImpl implements SbxxService{
	private SbxxDao sbxxDao;

	/**
	 * @return the sbxxDao
	 */
	public SbxxDao getSbxxDao() {
		return sbxxDao;
	}

	/**
	 * @param sbxxDao the sbxxDao to set
	 */
	public void setSbxxDao(SbxxDao sbxxDao) {
		this.sbxxDao = sbxxDao;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Sbxx> findAll() {
		// TODO Auto-generated method stub
		return sbxxDao.findAll();
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Sbxx findAllByMap(Sbxx t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Sbxx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Sbxx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Sbxx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Sbxx> queryByMap(Sbxx t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#newId(java.lang.String)
	 */
	@Override
	public String newId(String param) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#maxId(java.lang.String)
	 */
	@Override
	public Collection<Sbxx> maxId(String param) {
		// TODO Auto-generated method stub
		return null;
	}

}
