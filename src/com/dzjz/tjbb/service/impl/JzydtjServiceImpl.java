/**
 * 
 */
package com.dzjz.tjbb.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.dzjz.tjbb.dao.JzydtjDao;
import com.dzjz.tjbb.service.JzydtjService;
import com.dzjz.xtpz.qx.po.Ryjsfp;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class JzydtjServiceImpl implements JzydtjService{
	
	private JzydtjDao jzydtjDao;
	
	

	/**
	 * @return the jzydtjDao
	 */
	public JzydtjDao getJzydtjDao() {
		return jzydtjDao;
	}


	/**
	 * @param jzydtjDao the jzydtjDao to set
	 */
	public void setJzydtjDao(JzydtjDao jzydtjDao) {
		this.jzydtjDao = jzydtjDao;
	}


	/* (non-Javadoc)
	 * @see com.dzjz.tjbb.service.JzydtjService#casegroupmouth(java.util.Map)
	 */
	@Override
	public Map<String, ?> casegroupmouth(Map<String, Object> map) {
		// TODO Auto-generated method stub
//		StringBuffer get_where=new StringBuffer();
		String get_where="";
		Map< String, Object> map1=Maps.newHashMap();
		map1.put("dwbm", map.get("dwbm"));
		map1.put("gh", map.get("gh"));
		//获取登录用户的部们编码与角色编码
		List<Ryjsfp> list= (List<Ryjsfp>) ryjsBydwgh(map1);
		get_where=(" and CBDW_BM in "
				+ "(select distinct QXBM FROM XT_DM_QX  where 1=1 AND  JSBM IN ('"+list.get(0).getJsbm()+"') "
				+ "AND QXLX=0 AND trim(DWBM) = '"+list.get(0).getDwbm()+"' AND BMBM in ('"+list.get(0).getBmbm()+"') ) "
				+ "and SLRQ >= to_date('"+ map.get("rq1")+"','yyyy-mm-dd') "
				+ "and SLRQ < to_date('"+ map.get("rq2")+"','yyyy-mm-dd') "
				+ "and CBDW_BM='"+map.get("get_where")+"'"
				+ "and trim(aj.ajlb_bm) in "
				+ "(select distinct QXBM FROM XT_DM_QX  where 1=1 "
				+ "AND  JSBM IN ('"+list.get(0).getJsbm()+"') AND QXLX=1 AND trim(DWBM) = '"+list.get(0).getDwbm() +"' "
				+ "AND BMBM in ('"+list.get(0).getBmbm()+"') )");
		map.put("get_where", get_where);
//		map.put("get_where", " and CBDW_BM in (select distinct QXBM FROM XT_DM_QX  where 1=1 AND  JSBM IN ('000') AND QXLX=0 AND trim(DWBM) = '370000' AND BMBM in ('0000') ) and SLRQ >= to_date('2016/1/1','yyyy-mm-dd') and SLRQ < to_date('2017/1/1','yyyy-mm-dd') and trim(aj.ajlb_bm) in (select distinct QXBM FROM XT_DM_QX  where 1=1 AND  JSBM IN ('000') AND QXLX=1 AND trim(DWBM) = '370000' AND BMBM in ('0000') )");
		return jzydtjDao.casegroupmouth(map);
	}


	/* (non-Javadoc)
	 * @see com.dzjz.tjbb.service.JzydtjService#ryjsBydwgh(java.util.Map)
	 */
	@Override
	public Collection ryjsBydwgh(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return jzydtjDao.ryjsBydwgh(map);
	}

}
