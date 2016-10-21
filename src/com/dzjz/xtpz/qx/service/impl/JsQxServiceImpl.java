/**
 * 
 */
package com.dzjz.xtpz.qx.service.impl;

import java.util.Collection;
import java.util.Map;

import com.dzjz.xtpz.qx.dao.JsQxDao;
import com.dzjz.xtpz.qx.po.Js;
import com.dzjz.xtpz.qx.po.YhModel;
import com.dzjz.xtpz.qx.service.JsQxService;

/**
 * @author Administrator
 *
 */
public class JsQxServiceImpl implements JsQxService{
	
	private JsQxDao jsQxDao;
	

	/**
	 * @return the jsQxDao
	 */
	public JsQxDao getJsQxDao() {
		return jsQxDao;
	}


	/**
	 * @param jsQxDao the jsQxDao to set
	 */
	public void setJsQxDao(JsQxDao jsQxDao) {
		this.jsQxDao = jsQxDao;
	}


	/* (non-Javadoc)
	 * @see com.common.CommMapInterface#getSearchList(java.util.Map)
	 */
	@Override
	public Map getSearchList(Map map) {
		// TODO Auto-generated method stub
		return jsQxDao.getSearchList(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#dwinfo(java.util.Map)
	 */
	@Override
	public Map<String, ?> dwinfo(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.dwinfo(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#add_bminfo(java.util.Map)
	 */
	@Override
	public void add_bminfo(Map<String, ?> map) {
		// TODO Auto-generated method stub
		jsQxDao.add_bminfo(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#bminfo(java.util.Map)
	 */
	@Override
	public Map<String, ?> bminfo(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.bminfo(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#jsinfo(java.util.Map)
	 */
	@Override
	public Map<String, ?> jsinfo(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.jsinfo(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#add_jsinfo(java.util.Map)
	 */
	@Override
	public void add_jsinfo(Map<String, ?> map) {
		// TODO Auto-generated method stub
		jsQxDao.add_jsinfo(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#update(com.dzjz.xtpz.qx.po.Js)
	 */
	@Override
	public void update(Js js) {
		// TODO Auto-generated method stub
		jsQxDao.update(js);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#delete(com.dzjz.xtpz.qx.po.Js)
	 */
	@Override
	public void delete(Map<String, ?> map) {
		// TODO Auto-generated method stub
		jsQxDao.delete(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#wfpGndyByJs(java.util.Map)
	 */
	@Override
	public Collection wfpGndyByJs(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.wfpGndyByJs(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#yfpGndyByJs(java.util.Map)
	 */
	@Override
	public Collection yfpGndyByJs(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.yfpGndyByJs(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#add_jsgnqx(java.util.Map)
	 */
	@Override
	public void add_jsgnqx(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String [] gnbm=((String)map.get("gnbm")).split(",");
		for (int i = 0; i < gnbm.length; i++) {
			map.put("gnbm", gnbm[i]);
			jsQxDao.add_jsgnqx(map);
		}
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#delete_jsgnqx(java.util.Map)
	 */
	@Override
	public void delete_jsgnqx(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String [] gnbm=((String)map.get("gnbm")).split(",");
		for (int i = 0; i < gnbm.length; i++) {
			map.put("gnbm", gnbm[i]);
		jsQxDao.delete_jsgnqx(map);
		}
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#ajlbqx(java.util.Map)
	 */
	@Override
	public Collection ajlbqx(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.ajlbqx(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#add_ajlbqx(java.util.Map)
	 */
	@Override
	public void add_ajlbqx(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String[] ajlbbm=((String)map.get("ajlbbm")).split(",");
		String[] ajlbmc=((String)map.get("ajlbmc")).split(",");
		for (int i = 0; i < ajlbbm.length; i++) {
			map.put("ajlbbm", ajlbbm[i]);
			map.put("ajlbmc", ajlbmc[i]);
			jsQxDao.add_ajlbqx(map);
		}
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#delete_ajlbqx(java.util.Map)
	 */
	@Override
	public void delete_ajlbqx(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String[] ajlbbm=((String)map.get("ajlbbm")).split(",");
		for (int i = 0; i < ajlbbm.length; i++) {
			map.put("ajlbbm", ajlbbm[i]);
			jsQxDao.delete_ajlbqx(map);
		}
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#dwqx(java.util.Map)
	 */
	@Override
	public Collection dwqx(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.dwqx(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#add_dwqx(java.util.Map)
	 */
	@Override
	public void add_dwqx(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String[] ajlbbm=((String)map.get("ajlbbm")).split(",");
		String[] ajlbmc=((String)map.get("ajlbmc")).split(",");
		for (int i = 0; i < ajlbbm.length; i++) {
			map.put("ajlbbm", ajlbbm[i]);
			map.put("ajlbmc", ajlbmc[i]);
			jsQxDao.add_dwqx(map);
		}
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#delete_dwqx(java.util.Map)
	 */
	@Override
	public void delete_dwqx(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String[] ajlbbm=((String)map.get("ajlbbm")).split(",");
		for (int i = 0; i < ajlbbm.length; i++) {
			map.put("ajlbbm", ajlbbm[i]);
		jsQxDao.delete_dwqx(map);
		}
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#ryBydwjsbm(java.util.Map)
	 */
	@Override
	public Collection ryBydwjsbm(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.ryBydwjsbm(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#add_ryqx(java.util.Map)
	 */
	@Override
	public void add_ryqx(Map<String, ?> map) {
		// TODO Auto-generated method stub
		jsQxDao.add_ryqx(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#delete_ryqx(java.util.Map)
	 */
	@Override
	public void delete_ryqx(Map<String, Object> map) {
		// TODO Auto-generated method stub
		YhModel yhModel=(YhModel) map.get("yh");
		String bmbm=(String) map.get("bmbm");
		//页面未确定用户部门
		if(bmbm==null||bmbm.equals("")){
			bmbm=yhModel.getBmbm();
			map.put("bmbm", yhModel.getBmbm());
		}
		String jsbm=(String) map.get("jsbm");
		//判断页面是否确定用户jsbm
		if(jsbm==null||jsbm.equals("")){
			jsbm=yhModel.getJsbm();
			String [] arrayJsbm1=jsbm.split(",");
			for(int i=0;i<arrayJsbm1.length;i++){
				map.put("jsbm", arrayJsbm1[i]);
				jsQxDao.delete_ryqx(map);
			}
		}else{
			jsQxDao.delete_ryqx(map);
		}
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#ryjsBydwjsbm(java.util.Map)
	 */
	@Override
	public Collection ryjsBydwjsbm(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jsQxDao.ryjsBydwjsbm(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.qx.service.JsQxService#ryBydwjsbm1(java.util.Map)
	 */
	@Override
	public Map<String, Object> ryBydwjsbm1(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return   jsQxDao.ryBydwjsbm1(map);
	}


	
}
