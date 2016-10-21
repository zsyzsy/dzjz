/**
 * 
 */
package com.dzjz.xtpz.rzcx.service.impl;

import java.util.Collection;
import java.util.Date;

import com.dzjz.xtpz.rzcx.dao.RzcxDao;
import com.dzjz.xtpz.rzcx.po.Rzcx;
import com.dzjz.xtpz.rzcx.service.RzcxService;

/**
 * @author Administrator
 *
 */
public class RzcxServiceImpl implements RzcxService{
	
	private RzcxDao rzcxDao;
	

	/**
	 * @return the rzcxDao
	 */
	public RzcxDao getRzcxDao() {
		return rzcxDao;
	}

	/**
	 * @param rzcxDao the rzcxDao to set
	 */
	public void setRzcxDao(RzcxDao rzcxDao) {
		this.rzcxDao = rzcxDao;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Rzcx> findAll() {
		// TODO Auto-generated method stub
		return rzcxDao.findAll();
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Rzcx findAllByMap(Rzcx t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Rzcx t) {
		// TODO Auto-generated method stub
		rzcxDao.add(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Rzcx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Rzcx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Rzcx> queryByMap(Rzcx t) {
		// TODO Auto-generated method stub
		//单位编码根据登录用户信息获取
		t.setDwbm("370000");
		return rzcxDao.queryByMap(t);
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
	public Collection<Rzcx> maxId(String param) {
		// TODO Auto-generated method stub
		return null;
	}

}
