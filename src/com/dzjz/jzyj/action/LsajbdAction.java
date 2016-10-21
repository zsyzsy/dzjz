/**
 * 
 */
package com.dzjz.jzyj.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.jzyj.po.Lsajbd;
import com.dzjz.jzyj.po.Lsajwjfp;
import com.dzjz.jzyj.service.LsajbdService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public class LsajbdAction extends BaseAction{
	
	private LsajbdService lsajbdService;
	
	private List<Lsajbd> lsajbds;
	
	private Lsajwjfp lsajwjfp;
	
	private Lsajbd lsajbd;
	
	private String dwbm;
	
	private String gh;
	
	private String bmsah;
	
	private String jddwbm;
	
	private String jdrgh;
	
	private String yjxh;
	
	private String mc;
	
	private String ajmc;
	
	private String ajlbbm;
	
	private String ajlbmc;
	
	private String yjkssj;
	
	private String yjjssj;
	
	private String yjzh;
	
	private String yjmm;
	
	private String jdsj;
	
	private String jdr;
	
	private String jdbmbm;
	
	private String jdbmmc;
	
	private String jddwmc;
	
	private String yjsqdh;
	
	private String getCheckeddata;
	
	private JsonListResult jsonListResult;
	//menu
	public String input(){
		
		return "input";
	}
	//分配加载页面
	public String inputaj(){
		
		return "inputaj";
	}
	//阅卷分配列表
	public String  queryList(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("jddwbm", jddwbm);
		map.put("jdrgh", jdrgh);
		lsajbds=(List<Lsajbd>) lsajbdService.queryList(map);
		jsonListResult=new JsonListResult(lsajbds);
//		try {
			addLog("查看卷宗分配列表");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		return "success";
	}
	//阅卷分配列表案件绑定
	public String  queryListaj(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		List list= (List) lsajbdService.queryListaj(map);
		jsonListResult=new JsonListResult(list);
		
		return "success";
	}
	//左侧树型结构
	public String  queryListleftTree(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("bmsah", bmsah);
		List list= (List) lsajbdService.queryListleftTree(map);
		jsonListResult=new JsonListResult(list);
		
		return "success";
	}
	//分配人员绑定
	public String  getPeople(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("dwbm", dwbm);
		List list= (List) lsajbdService.getPeople(map);
		jsonListResult=new JsonListResult(list);
		
		return "success";
	}
	//逻辑删除
	public String delete(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("yjxh", yjxh);
		lsajbdService.delete(map);
		addLog("删除阅卷序号为_"+yjxh+"阅卷信息");
		return "delete";
	}
	//添加分配案件
	public String add_lsajbd(){
		
//			SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
			lsajbd=new Lsajbd();
			lsajwjfp=new Lsajwjfp();
			//当前时间
			Date date =new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date1=formatter.format(date);
			try {
				Date date2=formatter.parse(date1);
				if(yjkssj!=null&&yjkssj!=""&&yjjssj!=null&&yjjssj!=""&&jdsj!=null&&jdsj!=""){
					Date stryjkssj = formatter.parse(yjkssj);
					Date stryjjssj= formatter.parse(yjjssj);
//					Date strjdsj= sim.parse(sim.format(new Date()));
					lsajbd.setYjkssj(stryjkssj);
					lsajbd.setYjjssj(stryjjssj);
					lsajbd.setJdsj(date2);
				}else{
					return "error1";
					
				}
				lsajbd.setGh(gh);
				lsajbd.setBmsah(bmsah);
				lsajbd.setMc(mc);
				lsajbd.setAjmc(ajmc);
				lsajbd.setAjlbbm(ajlbbm);
				lsajbd.setAjlbmc(ajlbmc);
				
				lsajbd.setYjzh(yjzh);
				lsajbd.setYjmm(yjmm);
				
				lsajbd.setJdr(jdr);
				lsajbd.setJdrgh(jdrgh);
				lsajbd.setJdbmbm(jdbmbm);
				lsajbd.setJdbmmc(jdbmmc);
				lsajbd.setJddwbm(jddwbm);
				lsajbd.setJddwmc(jddwmc);
				lsajbd.setSfsc("N");
				lsajbd.setYjsqdh(yjsqdh);
				lsajbd.setYjxh(yjxh);
				lsajbd.setDwbm(dwbm);
				
				lsajbdService.add_lsajbd(lsajbd);
				//文件
				System.out.println(getCheckeddata);
				if(getCheckeddata==null||getCheckeddata.equals("")){
					
				}else{
					
					lsajwjfp.setWjxh(getCheckeddata);
					lsajwjfp.setSfsc("N");
					lsajwjfp.setAddtime(date2);
					lsajwjfp.setYjxh(lsajbd.getYjxh());
					lsajbdService.add_lsajbdwj(lsajwjfp);
				}
				addLog(jdr+"分配卷宗_"+ajmc+"给"+mc);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "add";
	}

	/**
	 * @return the lsajbdService
	 */
	public LsajbdService getLsajbdService() {
		return lsajbdService;
	}

	/**
	 * @param lsajbdService the lsajbdService to set
	 */
	public void setLsajbdService(LsajbdService lsajbdService) {
		this.lsajbdService = lsajbdService;
	}

	/**
	 * @return the dwbm
	 */
	public String getDwbm() {
		return dwbm;
	}

	/**
	 * @param dwbm the dwbm to set
	 */
	public void setDwbm(String dwbm) {
		this.dwbm = dwbm;
	}

	/**
	 * @return the gh
	 */
	public String getGh() {
		return gh;
	}

	/**
	 * @param gh the gh to set
	 */
	public void setGh(String gh) {
		this.gh = gh;
	}
	/**
	 * @return the lsajbds
	 */
	public List<Lsajbd> getLsajbds() {
		return lsajbds;
	}
	/**
	 * @param lsajbds the lsajbds to set
	 */
	public void setLsajbds(List<Lsajbd> lsajbds) {
		this.lsajbds = lsajbds;
	}
	/**
	 * @return the jsonListResult
	 */
	public JsonListResult getJsonListResult() {
		return jsonListResult;
	}
	/**
	 * @param jsonListResult the jsonListResult to set
	 */
	public void setJsonListResult(JsonListResult jsonListResult) {
		this.jsonListResult = jsonListResult;
	}
	/**
	 * @return the jddwbm
	 */
	public String getJddwbm() {
		return jddwbm;
	}
	/**
	 * @param jddwbm the jddwbm to set
	 */
	public void setJddwbm(String jddwbm) {
		this.jddwbm = jddwbm;
	}
	/**
	 * @return the jdrgh
	 */
	public String getJdrgh() {
		return jdrgh;
	}
	/**
	 * @param jdrgh the jdrgh to set
	 */
	public void setJdrgh(String jdrgh) {
		this.jdrgh = jdrgh;
	}
	/**
	 * @return the bmsah
	 */
	public String getBmsah() {
		return bmsah;
	}
	/**
	 * @param bmsah the bmsah to set
	 */
	public void setBmsah(String bmsah) {
		this.bmsah = bmsah;
	}
	/**
	 * @return the yjxh
	 */
	public String getYjxh() {
		return yjxh;
	}
	/**
	 * @param yjxh the yjxh to set
	 */
	public void setYjxh(String yjxh) {
		this.yjxh = yjxh;
	}
	/**
	 * @return the lsajbd
	 */
	public Lsajbd getLsajbd() {
		return lsajbd;
	}
	/**
	 * @param lsajbd the lsajbd to set
	 */
	public void setLsajbd(Lsajbd lsajbd) {
		this.lsajbd = lsajbd;
	}
	/**
	 * @return the mc
	 */
	public String getMc() {
		return mc;
	}
	/**
	 * @param mc the mc to set
	 */
	public void setMc(String mc) {
		this.mc = mc;
	}
	/**
	 * @return the ajmc
	 */
	public String getAjmc() {
		return ajmc;
	}
	/**
	 * @param ajmc the ajmc to set
	 */
	public void setAjmc(String ajmc) {
		this.ajmc = ajmc;
	}
	/**
	 * @return the ajlbbm
	 */
	public String getAjlbbm() {
		return ajlbbm;
	}
	/**
	 * @param ajlbbm the ajlbbm to set
	 */
	public void setAjlbbm(String ajlbbm) {
		this.ajlbbm = ajlbbm;
	}
	/**
	 * @return the ajlbmc
	 */
	public String getAjlbmc() {
		return ajlbmc;
	}
	/**
	 * @param ajlbmc the ajlbmc to set
	 */
	public void setAjlbmc(String ajlbmc) {
		this.ajlbmc = ajlbmc;
	}
	/**
	 * @return the yjkssj
	 */
	public String getYjkssj() {
		return yjkssj;
	}
	/**
	 * @param yjkssj the yjkssj to set
	 */
	public void setYjkssj(String yjkssj) {
		this.yjkssj = yjkssj;
	}
	/**
	 * @return the yjjssj
	 */
	public String getYjjssj() {
		return yjjssj;
	}
	/**
	 * @param yjjssj the yjjssj to set
	 */
	public void setYjjssj(String yjjssj) {
		this.yjjssj = yjjssj;
	}
	/**
	 * @return the yjzh
	 */
	public String getYjzh() {
		return yjzh;
	}
	/**
	 * @param yjzh the yjzh to set
	 */
	public void setYjzh(String yjzh) {
		this.yjzh = yjzh;
	}
	/**
	 * @return the yjmm
	 */
	public String getYjmm() {
		return yjmm;
	}
	/**
	 * @param yjmm the yjmm to set
	 */
	public void setYjmm(String yjmm) {
		this.yjmm = yjmm;
	}
	/**
	 * @return the jdsj
	 */
	public String getJdsj() {
		return jdsj;
	}
	/**
	 * @param jdsj the jdsj to set
	 */
	public void setJdsj(String jdsj) {
		this.jdsj = jdsj;
	}
	/**
	 * @return the jdr
	 */
	public String getJdr() {
		return jdr;
	}
	/**
	 * @param jdr the jdr to set
	 */
	public void setJdr(String jdr) {
		this.jdr = jdr;
	}
	/**
	 * @return the jdbmbm
	 */
	public String getJdbmbm() {
		return jdbmbm;
	}
	/**
	 * @param jdbmbm the jdbmbm to set
	 */
	public void setJdbmbm(String jdbmbm) {
		this.jdbmbm = jdbmbm;
	}
	/**
	 * @return the jdbmmc
	 */
	public String getJdbmmc() {
		return jdbmmc;
	}
	/**
	 * @param jdbmmc the jdbmmc to set
	 */
	public void setJdbmmc(String jdbmmc) {
		this.jdbmmc = jdbmmc;
	}
	/**
	 * @return the jddwmc
	 */
	public String getJddwmc() {
		return jddwmc;
	}
	/**
	 * @param jddwmc the jddwmc to set
	 */
	public void setJddwmc(String jddwmc) {
		this.jddwmc = jddwmc;
	}
	/**
	 * @return the yjsqdh
	 */
	public String getYjsqdh() {
		return yjsqdh;
	}
	/**
	 * @param yjsqdh the yjsqdh to set
	 */
	public void setYjsqdh(String yjsqdh) {
		this.yjsqdh = yjsqdh;
	}
	/**
	 * @return the getCheckeddata
	 */
	public String getGetCheckeddata() {
		return getCheckeddata;
	}
	/**
	 * @param getCheckeddata the getCheckeddata to set
	 */
	public void setGetCheckeddata(String getCheckeddata) {
		this.getCheckeddata = getCheckeddata;
	}
	/**
	 * @return the lsajwjfp
	 */
	public Lsajwjfp getLsajwjfp() {
		return lsajwjfp;
	}
	/**
	 * @param lsajwjfp the lsajwjfp to set
	 */
	public void setLsajwjfp(Lsajwjfp lsajwjfp) {
		this.lsajwjfp = lsajwjfp;
	}
	
	

}
