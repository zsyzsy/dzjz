/**
 * 
 */
package com.dzjz.xtpz.sslb.service.impl;

import java.util.Collection;
import java.util.Map;

import com.dzjz.xtpz.sslb.dao.SslbDao;
import com.dzjz.xtpz.sslb.po.Sslb;
import com.dzjz.xtpz.sslb.service.SslbService;

/**
 * @author Administrator
 *
 */
public class SslbServiceImpl implements SslbService{
	
	private SslbDao sslbDao;


	/**
	 * @return the sslbDao
	 */
	public SslbDao getSslbDao() {
		return sslbDao;
	}

	/**
	 * @param sslbDao the sslbDao to set
	 */
	public void setSslbDao(SslbDao sslbDao) {
		this.sslbDao = sslbDao;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Sslb> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Sslb findAllByMap(Sslb t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Sslb t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Sslb t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Sslb t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Sslb> queryByMap(Sslb t) {
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
	public Collection<Sslb> maxId(String param) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.mbpz.service.MbpzService#queryByWhereMap(java.util.Map)
	 */
	@Override
	public Collection queryByWhereMap(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return sslbDao.queryByWhereMap(map);
	}

}
