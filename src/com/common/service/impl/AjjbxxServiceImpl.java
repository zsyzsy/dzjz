/**
 * 
 */
package com.common.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.common.YhGetSession;
import com.common.dao.AjjbxxDao;
import com.common.po.AjCspz;
import com.common.po.Ajjbxx;
import com.common.service.AjjbxxService;
import com.dzjz.jzzz.ajjzzz.po.Jzjbxx;
import com.dzjz.xtpz.ajlbbm.dao.AjlbbmDao;
import com.dzjz.xtpz.ajlbbm.po.Ajlbbm;
import com.dzjz.xtpz.cspz.dao.CspzDao;
import com.dzjz.xtpz.cspz.po.Cspz;
import com.dzjz.xtpz.qx.po.Yh;
import com.dzjz.xtpz.qx.po.YhModel;
import com.google.common.collect.Maps;

import Yy.SliceTransferInterface.TransferPrx;
import Yy.SliceTransferInterface.TransferPrxHelper;

/**
 * @author Administrator
 *
 */
public class AjjbxxServiceImpl  implements AjjbxxService{
 private AjjbxxDao ajjbxxDao;
 private AjlbbmDao ajlbbmDao1;
 private CspzDao cspzDao;
 
 
 
	/**
 * @return the cspzDao
 */
public CspzDao getCspzDao() {
	return cspzDao;
}

/**
 * @param cspzDao the cspzDao to set
 */
public void setCspzDao(CspzDao cspzDao) {
	this.cspzDao = cspzDao;
}

	/**
 * @return the ajlbbmDao1
 */
public AjlbbmDao getAjlbbmDao1() {
	return ajlbbmDao1;
}

/**
 * @param ajlbbmDao1 the ajlbbmDao1 to set
 */
public void setAjlbbmDao1(AjlbbmDao ajlbbmDao1) {
	this.ajlbbmDao1 = ajlbbmDao1;
}

	/**
 * @return the ajjbxxDao
 */
public AjjbxxDao getAjjbxxDao() {
	return ajjbxxDao;
}

/**
 * @param ajjbxxDao the ajjbxxDao to set
 */
public void setAjjbxxDao(AjjbxxDao ajjbxxDao) {
	this.ajjbxxDao = ajjbxxDao;
}


	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAll()
	 */
	@Override
	public Collection<Ajjbxx> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#findAllByMap(java.lang.Object)
	 */
	@Override
	public Ajjbxx findAllByMap(Ajjbxx t) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#add(java.lang.Object)
	 */
	@Override
	public void add(Ajjbxx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#delete(java.lang.Object)
	 */
	@Override
	public void delete(Ajjbxx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#update(java.lang.Object)
	 */
	@Override
	public void update(Ajjbxx t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.common.CommInterface#queryByMap(java.lang.Object)
	 */
	@Override
	public Collection<Ajjbxx> queryByMap(Ajjbxx t) {
		// TODO Auto-generated method stub
		return ajjbxxDao.queryByMap(t);
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
	public Collection<Ajjbxx> maxId(String param) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.common.service.AjjbxxService#queryByMap(java.util.Map)
	 */
	@Override
	public Collection<Ajjbxx> queryByMap(Map<String, ?> map) {
		// TODO Auto-generated method stub
		return ajjbxxDao.queryByMap(map);
	}

	/* (non-Javadoc)
	 * @see com.common.service.AjjbxxService#add_ajzz(com.dzjz.jzzz.ajjzzz.po.Jzjbxx)
	 */
	@Override
	public void add_ajzz(Map<String, Object> map) {
		// TODO Auto-generated method stub
		//获取当前用户信息
		Yh yh=(Yh) map.get("yh");
		//当前时间
		Date date=new Date();
		SimpleDateFormat sim=new SimpleDateFormat("yyyyMMddhhmmss");
		SimpleDateFormat sim2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String jzbh=sim.format(date);
		String newDate=sim2.format(date);
		map.put("jzbh", jzbh);
		map.put("sfsc", "N");
		map.put("cjsj", newDate);
		map.put("zhxgsj", newDate);
		map.put("fqdwbm", 0);
		map.put("fql", "");
		map.put("dwbm", yh.getDwbm().getDwbm());
		//获取选中类别简称
		Ajlbbm ajlbbm=new Ajlbbm();
		ajlbbm.setAjlbbm((String) map.get("ajmb_bm"));
		List<Ajlbbm> list=(List<Ajlbbm>) ajlbbmDao1.queryByMap(ajlbbm);
		//获取bmsah最大值
		Map<String, Object> map2=Maps.newHashMap();
		//拼接部门受案号----当前单位名称+案件类别简称+[+当前年份]+当前单位编码+当前用户工号+文件自增
		String bmsah=""+yh.getDwbm().getDwmc()+list.get(0).getAjsljc()+"["+jzbh.substring(0, 4)+"]"+yh.getDwbm().getDwbm()+yh.getGh();
		map2.put("bmsah", bmsah+"%");
		map2.put("dwbm", yh.getDwbm().getDwbm());
		map2.put("gh", yh.getGh());
		List list2= (List) ajjbxxDao.queryByMapBmsahId(map2);
		//判断是否第一次添加
		if(list2.size()==0){
			map.put("bmsah", bmsah+"01");
		}else{
		String maxBmsahinfo=list2.get(0).toString();
        String maxBmsah=maxBmsahinfo.substring(1, maxBmsahinfo.length()-1);
		String max=Integer.parseInt(maxBmsah.substring(maxBmsah.length()-2))+1+"";
			if(max.length()!=2){
				String newBmsah=bmsah+"0"+max;
				map.put("bmsah", newBmsah);
			}else{
				map.put("bmsah",bmsah+max);
			}
		}
		//拼接统一受案号
		String tysah=yh.getDwbm().getDwbm()+jzbh.substring(0, 6);
		Map<String, Object> map3=Maps.newHashMap();
		map3.put("dwbm", yh.getDwbm().getDwbm());
		map3.put("gh", yh.getGh());
		map3.put("tysah", tysah+"%");
		List list3= (List) ajjbxxDao.queryByMapTysahId(map3);
		//判断本月是否第一次添加	//获取tysah最大值//拼接
		if(list3.size()==0){
			map.put("tysah",tysah+"10000");
		}else{
			String maxTysah=(String) list3.get(0);
			String max3=Integer.parseInt(maxTysah.substring(11))+1+"";
			map.put("tysah",maxTysah.substring(0, 12)+max3);
		}
		map.put("jzlj", null);
		map.put("jzscsj", newDate);
		map.put("jzscrgh", yh.getGh());
		map.put("jzscrxm", yh.getMc());
		map.put("jzms", null);
		map.put("jzxgh", 0);
		map.put("sfkygx", null);
		map.put("gxywbmjh", null);
		map.put("mrsfgkpz", null);
		
		map.put("idnumber", null);
		map.put("isrecord", 0);
		map.put("suspectname", null);
		map.put("wsbh", null);
		map.put("ajbh", null);
		map.put("zzzt", 0);
		
		//向卷宗制作添加
		ajjbxxDao.add_ajzz(map);
		//向案件基本信息表中添加
		Map<String , Object> map4=Maps.newHashMap();
			map4.put("bmsah",map.get("bmsah")); 
			map4.put("tysah",map.get("tysah")); 
			map4.put("sfsc","N");
			map4.put("sfygxtsj","N");
			map4.put("cbdw_bm",map.get("dwbm"));
			map4.put("cbdw_mc",yh.getDwbm().getDwmc());
			map4.put("fqdwbm",(String)map.get("dwbm").toString().substring(0,4));
			map4.put("fql",newDate.substring(0, 4));
			map4.put("cjsj",newDate);
			map4.put("zhxgsj",newDate);
			map4.put("slrq",newDate);
			map4.put("ajmc",map.get("jzmc"));
			map4.put("ajlb_bm",map.get("ajmb_bm"));
			map4.put("ajlb_mc",map.get("ajmb_mc")); 
			map4.put("zcjg_dwdm","");
			map4.put("zcjg_dwmc",""); 
			map4.put("ysdw_dwdm","");
			map4.put("ysdw_dwmc","");
			map4.put("yswswh","");
			map4.put("ysay_aydm","");
			map4.put("ysay_aymc",""); 
			map4.put("ysqtay_aydms","");
			map4.put("ysqtay_aymcs","");
			map4.put("cbrgh","");
			map4.put("cbr","");
			map4.put("cbbm_bm","");
			map4.put("cbbm_mc","");
			map4.put("ajzt",0); 
			map4.put("sfswaj","N"); 
			map4.put("sfdbaj","N"); 
			map4.put("zxhd_mc",""); 
			map4.put("wcrq",""); 
			map4.put("gdrq",""); 
			map4.put("gdrgh",null); 
			map4.put("gdr",""); 
			map4.put("aqzy",""); 
			map4.put("dqjd",""); 
			map4.put("blksrq",""); 
			map4.put("blts",null);
			map4.put("dqrq",""); 
			map4.put("bjrq","");
			map4.put("yjzt",0); 
			map4.put("jyyjzt",0); 
			map4.put("jyyjhcqxyrgs",0);
			map4.put("lcslbh",""); 
			map4.put("fxdj",""); 
			map4.put("sfgzaj","N"); 
			map4.put("fz",""); 
			map4.put("ysyj_dm",""); 
			map4.put("ysyj_mc",""); 
			map4.put("sfjbaj","N"); 
			map4.put("zxhd_dm",""); 
			map4.put("dqyjjd",""); 
			map4.put("yascssjd_dm",""); 
			map4.put("yascssjd_mc",""); 
			map4.put("ysrjdh",""); 
			map4.put("ajly_dm",""); 
			map4.put("ajly_mc",""); 
			map4.put("xyr",""); 
			map4.put("sfzh",""); 
			map4.put("taryxx",map.get("accomplices")); 
			map4.put("shr",""); 
			map4.put("shsj",""); 
			map4.put("zjs",0); 
			map4.put("djj",""); 
			map4.put("zys",0);
			ajjbxxDao.add_ajjbxx(map4);
			
		
	}

	/* (non-Javadoc)
	 * @see com.common.service.AjjbxxService#update_ajzz(java.util.Map)
	 */
	@Override
	public void update_ajzz(Map<String, ?> map) {
		// TODO Auto-generated method stub
		Date date=new Date();
		SimpleDateFormat sim2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String newdate=sim2.format(date);
		Jzjbxx jzjbxx=new Jzjbxx();
		Ajjbxx ajjbxx=new Ajjbxx();
		//获取jzjbxx案件信息
		List<Jzjbxx> listjzs= (List<Jzjbxx>) ajjbxxDao.jzjbxxByBmsahAndTysah(map);
		//获取修改对象
		jzjbxx=listjzs.get(0);
		jzjbxx.setAccomplices((String)map.get("accomplices"));
		jzjbxx.setJzmc((String)map.get("jzmc"));
		jzjbxx.setAjmb_bm((String)map.get("ajmb_bm"));
		jzjbxx.setAjmb_mc((String)map.get("ajmb_mc"));
		jzjbxx.setZhxgsj(newdate);
//		//获取jajjbxx案件信息
		List<Ajjbxx> listajs= (List<Ajjbxx>) ajjbxxDao.ajjbxxByBmsahAndTysah(map);
		ajjbxx=listajs.get(0);
		ajjbxx.setAjlb_bm((String)map.get("ajmb_bm"));
		ajjbxx.setAjlb_mc((String)map.get("ajmb_mc"));
		ajjbxx.setAjmc((String)map.get("jzmc"));
		ajjbxx.setTaryxx((String)map.get("accomplices"));
		ajjbxx.setZhxgsj(date);
		ajjbxxDao.updateajjbxx(ajjbxx);
		ajjbxxDao.updatejzjbxx(jzjbxx);
	}

	/* (non-Javadoc)
	 * @see com.common.service.AjCspzService#add(com.sun.javafx.collections.MappingChange.Map)
	 */
	@Override
	public String add(Map<String, Object> map) {
		// TODO Auto-generated method stub
		String url="";
		String ljlx="";
		String dz1="";
		String dz2="";
		
		String[] zks = new String[] { "BMSAH", "SFDC", "DWBM", "MC", "GH", "DWMC", "BMBM", "BMMC", "LJLX", "DZ1", "DZ2", "AJBH", "WSBH" };
		YhModel model=(YhModel) map.get("yh");
		Cspz t=new Cspz();
		Date date =new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date1=formatter.format(date);
		UUID uuid = UUID.randomUUID();
		try {
			Date date2=formatter.parse(date1);
			System.out.println(date2);
			AjCspz ajCspz=new AjCspz();
			List<Cspz> cspzs=null;
			for (int i = 0; i < zks.length; i++) {
				ajCspz.setCskey(zks[i]);
				ajCspz.setDysj(date);
				ajCspz.setFzbs(""+uuid);
				switch (zks[i])
				{
				case "BMSAH":
					ajCspz.setCsvalue((String)map.get(zks[i]));
					break;
				case "SFDC":
					ajCspz.setCsvalue((String)map.get(zks[i]));
					break;
				case "DWBM":
					ajCspz.setCsvalue(model.getDwbm());
					break;
				case "MC":
					ajCspz.setCsvalue(model.getMc());
					break;
				case "DWMC":
					ajCspz.setCsvalue(model.getDwmc());
					break;
				case "BMBM":
					ajCspz.setCsvalue(model.getBmbm());
					break;
				case "BMMC":
					ajCspz.setCsvalue(model.getBmmc());
					break;
				case "LJLX":
					t.setConfigname("连接类型");
					cspzs=(List<Cspz>) cspzDao.queryByMapByMc(t);
					ljlx=cspzs.get(0).getConfigvalue();
					ajCspz.setCsvalue(ljlx);
					break;
				case "DZ1":
					t.setConfigname("卷宗文件上传地址");
					cspzs=(List<Cspz>) cspzDao.queryByMapByMc(t);
					dz1=cspzs.get(0).getConfigvalue();
					ajCspz.setCsvalue(dz1);
					break;
////	         case "AJBH":
////	        	 ajCspz.setCsvalue(model.getDwbm());
////	        	 ajCspzDao.add(ajCspz);
////	        	 break;
				case "DZ2":
					t.setConfigname("路由映射地址");
					cspzs=(List<Cspz>) cspzDao.queryByMapByMc(t);
					dz2=cspzs.get(0).getConfigvalue();
					ajCspz.setCsvalue(dz2);
					break;
//	         case "WSBH":
//	        	 ajCspz.setCsvalue(model.getDwbm());
//	        	 ajCspzDao.add(ajCspz);
//	        	 break;
				default : 
					break;
				}
				
				ajjbxxDao.add(ajCspz);
				
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Cspz> list=(List<Cspz>) cspzDao.queryByMap(t);
		url=dz1+"@"+ljlx+"@"+dz2+"@"+uuid+"@"+(String)map.get("SFDC");
		return url;
	}

	
}
