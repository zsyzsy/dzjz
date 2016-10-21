/**
 * 
 */
package com.dzjz.xtpz.gndy.service.impl;

import java.util.Collection;
import java.util.List;

import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.gndy.dao.GndyDao;
import com.dzjz.xtpz.gndy.po.Gndy;
import com.dzjz.xtpz.gndy.service.GndyService;

/**
 * @author change
 *
 */
public class GndyServiceImpl implements GndyService{
	private GndyDao gndyDao;
	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Gndy> findAll() {
		// TODO Auto-generated method stub
		return gndyDao.findAll();
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Gndy findAllByMap(Gndy t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Gndy t) {
		// TODO Auto-generated method stub
		Dw dw =new Dw();
		dw.setDwbm("370000");
		t.setDwbm(dw);
		t.setSfsc("N");
		t.setSfmtck("N");
		t.setSfsysy("Y");
		t.setSfsjysy("Y");
		t.setSfgjysy("Y");
		t.setSfqysy("Y");
		t.setSfdjy("N");
		gndyDao.add(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Gndy t) {
		// TODO Auto-generated method stub
		t.setSfsc("Y");
		gndyDao.delete(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Gndy t) {
		// TODO Auto-generated method stub
		gndyDao.update(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Gndy> queryByMap(Gndy t) {
		// TODO Auto-generated method stub
		return gndyDao.queryByMap(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#newId(java.lang.String)
	 */
	@Override
	public String newId(String param) {
		// TODO Auto-generated method stub
		List<Gndy> list =(List<Gndy>) maxId(param);
		String newId1=list.get(0).getGnbm();
		//将字符串转为数字+1生成最新唯一id
		long newId2=Long.parseLong(newId1)+1;
		//将最新id转换成字符串
		String newId=""+newId2;
		return newId;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#maxId(java.lang.String)
	 */
	@Override
	public Collection<Gndy> maxId(String param) {
		// TODO Auto-generated method stub
		return gndyDao.maxId(param);
	}

	/**
	 * @return the gndyDao
	 */
	public GndyDao getGndyDao() {
		return gndyDao;
	}

	/**
	 * @param gndyDao the gndyDao to set
	 */
	public void setGndyDao(GndyDao gndyDao) {
		this.gndyDao = gndyDao;
	}
	

}
