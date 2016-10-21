/**
 * 
 */
package com.dzjz.xtpz.mbpz.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.mbpz.dao.MbpzDao;
import com.dzjz.xtpz.mbpz.po.Jzmbpz;
import com.dzjz.xtpz.mbpz.service.MbpzService;
import com.dzjz.xtpz.qx.dao.JsQxDao;
import com.dzjz.xtpz.qx.po.Qx;
import com.dzjz.xtpz.qx.po.YhModel;
import com.google.common.collect.Maps;

/**
 * @author change
 *
 */
public class MbpzServiceImpl implements MbpzService{
	private MbpzDao mbpzDao;
	private JsQxDao mjsQxDao;
	
	
	/**
	 * @return the mjsQxDao
	 */
	public JsQxDao getMjsQxDao() {
		return mjsQxDao;
	}

	/**
	 * @param mjsQxDao the mjsQxDao to set
	 */
	public void setMjsQxDao(JsQxDao mjsQxDao) {
		this.mjsQxDao = mjsQxDao;
	}

	/**
	 * @return the mbpzDao
	 */
	public MbpzDao getMbpzDao() {
		return mbpzDao;
	}

	/**
	 * @param mbpzDao the mbpzDao to set
	 */
	public void setMbpzDao(MbpzDao mbpzDao) {
		this.mbpzDao = mbpzDao;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.mbpz.service.MbpzService#queryByMap(java.util.Map)
	 */
	@Override
	public Collection queryByMap(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return mbpzDao.queryByMap(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.mbpz.service.MbpzService#maxSortindex()
	 */
	//生成新排序号
	@Override
	public int maxSortindex() {
		// TODO Auto-generated method stub
		List<Jzmbpz> jzmbpzs=(List<Jzmbpz>) mbpzDao.maxSortindex();
		int maxSortindex=jzmbpzs.get(0).getSortindex();
		return maxSortindex+1;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.mbpz.service.MbpzService#maxDossiertypevaluemember()
	 */
	//生成新配置编码
	@Override
	public String maxDossiertypevaluemember() {
		// TODO Auto-generated method stub
		List<Jzmbpz> jzmbpzs1=(List<Jzmbpz>) mbpzDao.maxDossiertypevaluemember();
		String maxDossiertypevaluemember=jzmbpzs1.get(0).getDossiertypevaluemember();
		String max1=Integer.parseInt(maxDossiertypevaluemember)+1+"";
		if(max1.length()!=8){
	    	String b="0";
	    	for (int i = 0; i < 8-max1.length()-1; i++) {
				b=b+"0";
			}
	    	max1=b+max1;
	    }else{
	    	max1=max1;
	    }
		return max1;
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.mbpz.service.MbpzService#add(com.dzjz.xtpz.mbpz.po.Jzmbpz)
	 */
	@Override
	public void add(Map<String, ?> map) {
		// TODO Auto-generated method stub
		//首次添加时父模板编码为空
		String dossiertypevaluemember="";
		String sslbbm=(String) map.get("sslbbm");
		String []sslbbm1=sslbbm.split(",");
		String sslbmc=(String) map.get("sslbmc");
		String []sslbmc1=sslbmc.split(",");
		
		Dw unitid=new Dw();
		unitid.setDwbm((String)map.get("dwbm"));
		for (int i = 0; i < sslbbm1.length; i++) {
			Jzmbpz jzmbpz=new Jzmbpz();
			//配置编码
			jzmbpz.setDossiertypevaluemember(maxDossiertypevaluemember());
			jzmbpz.setCaseinfotypeid((String)map.get("ajlbbm"));
			jzmbpz.setCaseinfotypename((String)map.get("ajlbmc"));
			//单位编码
			jzmbpz.setUnitid(unitid);
			//模板名称
			jzmbpz.setDossiertypedisplaymember((String)map.get("sslb_mc_bm"));
			//父配置编码
			if(i==0){
				
				//添加pid
//				dossiertypevaluemember=maxDossiertypevaluemember();
				jzmbpz.setDossierparentmember(dossiertypevaluemember);
				//为节点设定父配置编码
				dossiertypevaluemember=maxDossiertypevaluemember();
				//模板
				jzmbpz.setCategory("J");
			}else{
				jzmbpz.setDossierparentmember(dossiertypevaluemember);
				jzmbpz.setCategory("W");
			}
			jzmbpz.setDossierevidencevaluemember("");
			//排序
			jzmbpz.setSortindex(i+1);
			
			jzmbpz.setSslbbm(sslbbm1[i]);
			jzmbpz.setSfsc("N");
			jzmbpz.setSslbmc(sslbmc1[i]);
			jzmbpz.setAuto("Y");
			
			mbpzDao.add(jzmbpz);
		}
		//权限表中添加权限
		Map< String, Object> map2=Maps.newHashMap();
		YhModel list=(YhModel) map.get("yh");
		//判断该用户是不是多角色
		String[] jsbm=list.getJsbm().split(",");
		for (int i = 0; i < jsbm.length; i++) {
			
			map2.put("dwbm",list.getDwbm());
			map2.put("bmbm",list.getBmbm());
			map2.put("jsbm",jsbm[i]);
			//权限添加对应k-v
			map2.put("ajlbbm",list.getDwbm());
			map2.put("ajlbmc",(String) map.get("dwmc"));
			List list2=(List) mjsQxDao.queryQxByDwBmJs(map2);
			//判断权限表中是否存在该条数据,不存在添加,反之不添加
			if (list2.size()>0) {
				
			} else {
				mjsQxDao.add_dwqx(map2);

			}
		}
		
		
		
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.mbpz.service.MbpzService#queryByMb(java.util.Map)
	 */
	@Override
	public Collection queryByMb(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return mbpzDao.queryByMb(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.mbpz.service.MbpzService#delete_sslb(java.util.Map)
	 */
	@Override
	public void delete_sslb(Map<String, ?> map) {
		// TODO Auto-generated method stub
		mbpzDao.delete_sslb(map);
	}

	/* (non-Javadoc)
	 * @see com.dzjz.xtpz.mbpz.service.MbpzService#delete_Mb(java.util.Map)
	 */
	@Override
	public void delete_Mb(Map<String, ?> map) {
		// TODO Auto-generated method stub
		mbpzDao.delete_Mb(map);
	}

	
	

}
