/**
 * 
 */
package com.dzjz.xtpz.dw.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.dzjz.xtpz.dw.dao.DwDao;
import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.dw.service.DwService;

/**
 * @author Administrator
 *
 */
public class DwServiceImpl implements DwService{
	
	private DwDao dwDao;

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.dw.service.DwService#queryUsers()
	 */
	@Override
	public List<Dw> queryDw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dwDao.queryDw(map);
	}

	/**
	 * @return the dwDao
	 */
	public DwDao getDwDao() {
		return dwDao;
	}

	/**
	 * @param dwDao the dwDao to set
	 */
	public void setDwDao(DwDao dwDao) {
		this.dwDao = dwDao;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Dw> findAll() {
		// TODO Auto-generated method stub
		return null;
	}



	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Dw t) {
		// TODO Auto-generated method stub
		dwDao.add(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Dw t) {
		// TODO Auto-generated method stub
		t.setSfsc("Y");
		dwDao.delete(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Dw t) {
		// TODO Auto-generated method stub
		dwDao.updata(t);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.dw.service.DwService#IdQueryMax()
	 */
	@Override
	public String IdQueryMax(String fdwbm) {
		// TODO Auto-generated method stub
		List<Dw> dws=dwDao.IdQueryMax(fdwbm);
		int  dwId=Integer.parseInt(dws.get(0).getDwbm())+1;
		String newiId=""+dwId;
		return newiId;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Dw findAllByMap(Dw t) {
		// TODO Auto-generated method stub
		return dwDao.findAllByMap(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Dw> queryByMap(Dw t) {
		// TODO Auto-generated method stub
		return dwDao.queryByMap(t);
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
	public Collection<Dw> maxId(String param) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
