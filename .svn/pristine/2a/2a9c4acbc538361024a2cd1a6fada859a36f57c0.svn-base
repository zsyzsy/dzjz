/**
 * 
 */
package com.dzjz.xtpz.qx.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.common.Md5;
import com.dzjz.xtpz.qx.dao.YhDao;
import com.dzjz.xtpz.qx.po.Yh;
import com.dzjz.xtpz.qx.service.YhService;

/**
 * @author Administrator
 *
 */
public class YhServiceImpl implements YhService{
	
	private YhDao yhDao;

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Yh> findAll() {
		// TODO Auto-generated method stub
		return yhDao.findAll();
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Yh findAllByMap(Yh t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Yh t) {
		// TODO Auto-generated method stub
		t.setSfsc("N");
		yhDao.add(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Yh t) {
		// TODO Auto-generated method stub
		t.setSfsc("Y");
		yhDao.delete(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Yh t) {
		// TODO Auto-generated method stub
		yhDao.update(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Yh> queryByMap(Yh t) {
		// TODO Auto-generated method stub
		return yhDao.queryByMap(t);
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#newId(java.lang.String)
	 */
	@Override
	public String newId(String param) {
		// TODO Auto-generated method stub
		List<Yh> list=(List<Yh>) maxId(param);
		String newId1=list.get(0).getGh();
		//将字符串转为数字+1生成最新唯一id
		int newId2=Integer.parseInt(newId1.trim())+1;
		//将最新id转换成字符串
		String newId=""+newId2;
		return newId;
	}


	/* (non-Javadoc)
	 * @see com.common.CommInterface#maxId(java.lang.String)
	 */
	@Override
	public Collection<Yh> maxId(String param) {
		// TODO Auto-generated method stub
		return yhDao.maxId(param);
	}

	/**
	 * @return the yhDao
	 */
	public YhDao getYhDao() {
		return yhDao;
	}

	/**
	 * @param yhDao the yhDao to set
	 */
	public void setYhDao(YhDao yhDao) {
		this.yhDao = yhDao;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.YhService#ryinfo(java.util.Map)
	 */
	@Override
	public Collection ryinfo(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return yhDao.ryinfo(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.YhService#resetMm(com.dzjz.xtpz.qx.po.Yh)
	 */
	@Override
	public void resetMm(Yh yh) {
		// TODO Auto-generated method stub
		Md5 md5=new Md5();
		//重置密码设定为11111111
		yh.setKl(md5.string2MD5("11111111"));
		yhDao.resetMm(yh);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.YhService#ryjs(java.util.Map)
	 */
	@Override
	public Collection ryjs(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return yhDao.ryjs(map);
	}

}
