/**
 * 
 */
package com.dzjz.xtpz.cspz.service.impl;

import java.util.Collection;

import com.dzjz.xtpz.cspz.dao.CspzDao;
import com.dzjz.xtpz.cspz.po.Cspz;
import com.dzjz.xtpz.cspz.service.CspzService;

/**
 * @author change
 *
 */
public class CspzServiceImpl implements CspzService{
	private CspzDao cspzDao;

	/**
	 * @return the cspzDao
	 */
	public CspzDao getCspzDao() {
		return cspzDao;
	}

	/**
	 * @param cspzDao the cspzDao to set
	 */
	public void setCspzDao(CspzDao cspzDao) {
		this.cspzDao = cspzDao;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Cspz> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Cspz findAllByMap(Cspz t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Cspz t) {
		// TODO Auto-generated method stub
		cspzDao.add(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Cspz t) {
		// TODO Auto-generated method stub
		
		cspzDao.delete(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Cspz t) {
		// TODO Auto-generated method stub
		cspzDao.update(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Cspz> queryByMap(Cspz t) {
		// TODO Auto-generated method stub
		return cspzDao.queryByMap(t);
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
	public Collection<Cspz> maxId(String param) {
		// TODO Auto-generated method stub
		return null;
	}

}
