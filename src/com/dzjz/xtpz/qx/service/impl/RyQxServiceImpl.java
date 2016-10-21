/**
 * 
 */
package com.dzjz.xtpz.qx.service.impl;

import java.util.Collection;
import java.util.Map;

import com.dzjz.xtpz.qx.dao.RyQxDao;
import com.dzjz.xtpz.qx.service.RyQxService;


/**
 * @author Administrator
 *
 */
public class RyQxServiceImpl implements RyQxService{
	
	private RyQxDao ryQxDao;
	

	/**
	 * @return the ryQxDao
	 */
	public RyQxDao getRyQxDao() {
		return ryQxDao;
	}


	/**
	 * @param ryQxDao the ryQxDao to set
	 */
	public void setRyQxDao(RyQxDao ryQxDao) {
		this.ryQxDao = ryQxDao;
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.RyQxService#queryByMap(java.util.Map)
	 */
	@Override
	public Collection queryByMap(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return ryQxDao.queryByMap(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.RyQxService#gndyfl(java.util.Map)
	 */
	@Override
	public Collection gndyfl(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return ryQxDao.gndyfl(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.RyQxService#delete_rygnqx(java.util.Map)
	 */
	@Override
	public void delete_rygnqx(Map<String, ?> map) {
		// TODO Auto-generated method stub
		ryQxDao.delete_rygnqx(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.RyQxService#rygnBygnbm(java.util.Map)
	 */
	@Override
	public Collection rygnBygnbm(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return ryQxDao.rygnBygnbm(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.RyQxService#add_rygnqx(java.util.Map)
	 */
	@Override
	public void add_rygnqx(Map<String, ?> map) {
		// TODO Auto-generated method stub
		ryQxDao.add_rygnqx(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.RyQxService#queryRyQxByDwbmGnbm(java.util.Map)
	 */
	@Override
	public Collection queryRyQxByDwbmGnbm(Map<String, ?> map) {
		// TODO Auto-generated method stub
		String gnbm=(String) map.get("gnbm");
		if(gnbm.length()==10||0==gnbm.length()){
			return ryQxDao.queryRyQxByDwbmGnbm(map);
		}else{
			return ryQxDao.queryRyQxByDwbmGnbm2(map);
			
		}
	}

}
