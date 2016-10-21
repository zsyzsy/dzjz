/**
 * 
 */
package com.dzjz.jzyj.service.impl;


import java.util.Collection;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dzjz.jzyj.dao.LsajbdDao;
import com.dzjz.jzyj.po.Lsajbd;
import com.dzjz.jzyj.po.Lsajwjfp;
import com.dzjz.jzyj.service.LsajbdService;

/**
 * @author Administrator
 *
 */
public class LsajbdServiceImpl implements LsajbdService{
	private SqlSessionFactory sf;
	private LsajbdDao lsajbdDao;

	/**
	 * @return the lsajbdDao
	 */
	public LsajbdDao getLsajbdDao() {
		return lsajbdDao;
	}

	/**
	 * @param lsajbdDao the lsajbdDao to set
	 */
	public void setLsajbdDao(LsajbdDao lsajbdDao) {
		this.lsajbdDao = lsajbdDao;
	}

	/**
	 * @return the sf
	 */
	public SqlSessionFactory getSf() {
		return sf;
	}

	/**
	 * @param sf the sf to set
	 */
	public void setSf(SqlSessionFactory sf) {
		this.sf = sf;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.jzyj.service.LsajbdService#queryList(java.util.Map)
	 */
	@Override
	public Collection<Lsajbd> queryList(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return lsajbdDao.queryList(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.jzyj.service.LsajbdService#queryListaj(java.util.Map)
	 */
	@Override
	public Collection queryListaj(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return lsajbdDao.queryListaj(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.jzyj.service.LsajbdService#queryListleftTree(java.util.Map)
	 */
	@Override
	public Collection queryListleftTree(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return lsajbdDao.queryListleftTree(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.jzyj.service.LsajbdService#delete(java.util.Map)
	 */
	@Override
	public void delete(Map<String, ?> map) {
		// TODO Auto-generated method stub
		lsajbdDao.delete(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.jzyj.service.LsajbdService#getPeople(java.util.Map)
	 */
	@Override
	public Collection getPeople(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return lsajbdDao.getPeople(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.jzyj.service.LsajbdService#add_lsajbd(java.util.Map)
	 */
	@Override
	public void add_lsajbd(Lsajbd lsajbd) {
		// TODO Auto-generated method stub
//		SqlSession session=sf.openSession();
//		LsajbdDao dao=(LsajbdDao) session.getMapper(LsajbdDao.class);
//		dao.add_lsajbd(lsajbd);
		lsajbdDao.add_lsajbd(lsajbd);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.jzyj.service.LsajbdService#add_lsajbdwj(com.dzjz.jzyj.po.Lsajwjfp)
	 */
	@Override
	public void add_lsajbdwj(Lsajwjfp lsajwjfp) {
		// TODO Auto-generated method stub
		String wjxh=lsajwjfp.getWjxh();
		String[] wjxh1=wjxh.split(",");
		for (int i = 0; i < wjxh1.length; i++) {
			lsajwjfp.setWjxh(wjxh1[i]);
			lsajbdDao.add_lsajbdwj(lsajwjfp);
		}
	}
	

}
