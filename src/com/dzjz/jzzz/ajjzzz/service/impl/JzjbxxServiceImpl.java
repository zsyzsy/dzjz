/**
 * 
 */
package com.dzjz.jzzz.ajjzzz.service.impl;

import java.util.Collection;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.dzjz.jzzz.ajjzzz.dao.JzjbxxDao;
import com.dzjz.jzzz.ajjzzz.po.Jzjbxx;
import com.dzjz.jzzz.ajjzzz.service.JzjbxxService;

/**
 * @author Administrator
 *
 */
@Component
public class JzjbxxServiceImpl implements JzjbxxService{
	@Resource
	private JzjbxxDao jzjbxxDao;

	/**
	 * @return the jzjbxxDao
	 */
	public JzjbxxDao getJzjbxxDao() {
		return jzjbxxDao;
	}

	/**
	 * @param jzjbxxDao the jzjbxxDao to set
	 */
	public void setJzjbxxDao(JzjbxxDao jzjbxxDao) {
		this.jzjbxxDao = jzjbxxDao;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Jzjbxx> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Jzjbxx findAllByMap(Jzjbxx t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Jzjbxx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Jzjbxx t) {
		// TODO Auto-generated method stub
		String jzbh=t.getJzbh();
		String[] jzbh1=jzbh.split(",");
		for (int i = 0; i < jzbh1.length; i++) {
			t.setJzxgh(" ");
			t.setJzbh(jzbh1[i]);
			jzjbxxDao.delete(t);
		}
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Jzjbxx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Jzjbxx> queryByMap(Jzjbxx t) {
		// TODO Auto-generated method stub
		
		return jzjbxxDao.queryByMap(t);
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
	public Collection<Jzjbxx> maxId(String param) {
		// TODO Auto-generated method stub
		return null;
	}

}
