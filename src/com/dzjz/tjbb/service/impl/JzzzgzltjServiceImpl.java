/**
 * 
 */
package com.dzjz.tjbb.service.impl;

import java.util.List;
import java.util.Map;

import com.dzjz.tjbb.dao.JzydtjDao;
import com.dzjz.tjbb.dao.JzzzgzltjDao;
import com.dzjz.tjbb.service.JzzzgzltjService;
import com.dzjz.xtpz.qx.po.Ryjsfp;
import com.dzjz.xtpz.qx.po.YhModel;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class JzzzgzltjServiceImpl implements JzzzgzltjService{
	
	private JzzzgzltjDao jzzzgzltjDao;
	private JzydtjDao jzydtjDao1;
	

	/**
	 * @return the jzydtjDao
	 */
	public JzydtjDao getJzydtjDao1() {
		return jzydtjDao1;
	}

	/**
	 * @param jzydtjDao the jzydtjDao to set
	 */
	public void setJzydtjDao1(JzydtjDao jzydtjDao1) {
		this.jzydtjDao1 = jzydtjDao1;
	}

	/**
	 * @return the jzzzgzltjDao
	 */
	public JzzzgzltjDao getJzzzgzltjDao() {
		return jzzzgzltjDao;
	}

	/**
	 * @param jzzzgzltjDao the jzzzgzltjDao to set
	 */
	public void setJzzzgzltjDao(JzzzgzltjDao jzzzgzltjDao) {
		this.jzzzgzltjDao = jzzzgzltjDao;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.tjbb.service.JzzzgzltjService#getcasebyperson()
	 */
	@Override
	public Map<String, ?> getcasebyperson(Map<String, Object> map) {
		// TODO Auto-generated method stub
		YhModel yhModel=(YhModel) map.get("yhModel");
		String getwhere=(String) map.get("get_where");
		String get_where="";
		String [] data=getwhere.split(",");
		
		get_where=" and CBDW_BM in ("+data[0]+")"
				+"  and JZ.Cjsj >= to_date('"+data[1]+"','yyyy-mm-dd') "
				+ " and JZ.Cjsj <= to_date('"+data[2]+"','yyyy-mm-dd') ";
		if(data.length==4){
			get_where+= " and jz.jzscrxm like '%"+data[3]+"%'";
		}else {
			get_where+= " and jz.jzscrxm  is not null";
		}
		String get_rwhere="";	
		get_rwhere=" AND DWBM = '"+yhModel.getDwbm()+"' AND JSBM in ('"+yhModel.getJsbm()+"') AND BMBM in ('"+yhModel.getBmbm()+"') AND QXLX = 0";
		map.put("get_where",get_where);
		map.put("get_rwhere",get_rwhere);
		System.out.println(get_where);
		return jzzzgzltjDao.getcasebyperson(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.tjbb.service.JzzzgzltjService#getcasebypersonb(java.util.Map)
	 */
	@Override
	public Map<String, ?> getcasebypersonb(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String where="";
		YhModel yhModel=(YhModel) map.get("yhModel");
//		StringBuffer get_where=new StringBuffer();
		String get_where="";
		String get_rwhere="";
		
		String getwhere=(String) map.get("get_where");
		String [] data=getwhere.split(",");
		String cjrq1=data[1];
		String cjrq2=data[2];
		
		where +=data[0];
		if(cjrq1.trim()!=null&&cjrq1.trim()!=""){
			where+=" and jz.CJSJ >= to_date('"+cjrq1+"','yyyy-mm-dd')";
		}
		if(cjrq2.trim()!=null&&cjrq2.trim()!=""){
			where+=" and jz.CJSJ <= to_date('"+cjrq2+"','yyyy-mm-dd')";
		}
		if(data.length==4){
			String zzr=data[3];
			where+="and JZ.JZSCRXM ='"+data[3]+"'";
		}
		
		map.put("get_where", where);
//		map.put("bmbm", ryjsfps.get(0).getBmbm());
//		map.put("jsbm",ryjsfps.get(0).getJsbm());
//		get_where= " and JZ.Cjsj >= to_date('2015/12/26','yyyy-mm-dd') and JZ.JZSCRXM ='"+map.get("dlbm")+"' and CBDW_BM = '"+map.get("dwbm")+"' ";
		get_rwhere= "  AND trim(DWBM) = '"+yhModel.getDwbm()+"' AND JSBM in ('"+yhModel.getJsbm()+"') AND BMBM in ('"+yhModel.getBmbm()+"') AND QXLX = 0 ";

		
//		map.put("get_where",get_where);
		map.put("get_rwhere",get_rwhere);
		
		return jzzzgzltjDao.getcasebypersonb(map);
	}


	

}
