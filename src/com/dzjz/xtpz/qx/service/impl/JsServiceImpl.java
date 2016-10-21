/**
 * 
 */
package com.dzjz.xtpz.qx.service.impl;

import java.util.Collection;

import com.dzjz.xtpz.qx.dao.JsDao;
import com.dzjz.xtpz.qx.po.Js;
import com.dzjz.xtpz.qx.service.JsService;

/**
 * @author Administrator
 *
 */
public class JsServiceImpl implements JsService{
		private JsDao jsDao;

		/* (non-Javadoc)
		 * @see com.common.CommInterface#findAll()
		 */
		@Override
		public Collection<Js> findAll() {
			// TODO Auto-generated method stub
			return jsDao.findAll();
		}

		/* (non-Javadoc)
		 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
		 */
		@Override
		public Js findAllByMap(Js t) {
			// TODO Auto-generated method stub
			return jsDao.findAllByMap(t);
		}

		/* (non-Javadoc)
		 * @see com.common.CommInterface#add(java.lang.Object)
		 */
		@Override
		public void add(Js t) {
			// TODO Auto-generated method stub
			jsDao.add(t);
		}

		/* (non-Javadoc)
		 * @see com.common.CommInterface#delete(java.lang.Object)
		 */
		@Override
		public void delete(Js t) {
			// TODO Auto-generated method stub
			jsDao.delete(t);
		}

		/* (non-Javadoc)
		 * @see com.common.CommInterface#update(java.lang.Object)
		 */
		@Override
		public void update(Js t) {
			// TODO Auto-generated method stub
			jsDao.update(t);
		}

		/* (non-Javadoc)
		 * @see com.common.CommInterface#queryByMap(java.lang.Object)
		 */
		@Override
		public Collection<Js> queryByMap(Js t) {
			// TODO Auto-generated method stub
			return jsDao.queryByMap(t);
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
		public Collection<Js> maxId(String param) {
			// TODO Auto-generated method stub
			return null;
		}

		/**
		 * @return the jsDao
		 */
		public JsDao getJsDao() {
			return jsDao;
		}

		/**
		 * @param jsDao the jsDao to set
		 */
		public void setJsDao(JsDao jsDao) {
			this.jsDao = jsDao;
		}

}
