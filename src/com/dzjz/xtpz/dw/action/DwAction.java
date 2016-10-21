/**
 * 
 */
package com.dzjz.xtpz.dw.action;

import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.dw.service.DwService;
import com.google.common.collect.Maps;
import com.opensymphony.xwork2.ActionContext;

/**
 * @author Administrator
 *
 */
public class DwAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3278658971896850376L;
	private DwService dwService;
	private List<Dw> dws;
	private Dw dw;
	private JsonListResult jsonListResult;
	private String dwbm;
	private String fdwbm;
	private String dwmc;
	private String dwjc;
	private String dwjb;
	private String dwsx;
	private String gjz;	

	public String input(){
		
		return "input";
	} 
	public String queryList(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("dwmc", dwmc);
		dws = dwService.queryDw(map);
		jsonListResult=new JsonListResult(dws);
		return "queryList";
	}
	public String queryList_bm(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("dwmc", dwmc);
		dws = dwService.queryDw(map);
		return "queryList_bm";
	}
	
	public String add(){
		String newDwbm= dwService.IdQueryMax(fdwbm);
			dw=new Dw();
			dw.setDwbm(newDwbm);
			dw.setDwmc(dwmc);
			dw.setFdwbm(fdwbm);
			dw.setDwjb(dwjb);
			dw.setDwjc(dwjc);
			dw.setDwsx("0");
			dw.setSfsc("N");
			dwService.add(dw);
		
		return "add";
		
	}
	public String delete1(){
		Dw dw1=new Dw();
		dw1.setDwbm(dwbm);
		dws=(List<Dw>) dwService.queryByMap(dw1);
		jsonListResult=new JsonListResult(dws);
		for (Dw dw : dws) {
			dw1=dw;
		}
//		dw=new Dw();
//		dw=dws.get(0);
		
		dwService.delete(dw1);
		return "delete";
	}
	public String update(){
		Dw dw1=new Dw();
		dw1.setDwbm(dwbm);
		dws=(List<Dw>) dwService.queryByMap(dw1);
		dw=dws.get(0);
		dw.setDwmc(dwmc);
		dw.setDwjc(dwjc);
		dw.setDwjb(dwjb);
		dwService.update(dw);
		try {
			this.addLog("tianjia11111111111111111111111111111111");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "update";
	}
	public String queryByMap(){
		dw=new Dw();
		dw.setDwbm(dwbm);
		dws=(List<Dw>) dwService.queryByMap(dw);
		jsonListResult=new JsonListResult(dws);
		return "queryByMap";
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
	 * @return the dws
	 */
	public List<Dw> getDws() {
		return dws;
	}
	/**
	 * @return the dwService
	 */
	public DwService getDwService() {
		return dwService;
	}


	/**
	 * @param dwService the dwService to set
	 */
	public void setDwService(DwService dwService) {
		this.dwService = dwService;
	}


	/**
	 * @param dws the dws to set
	 */
	public void setDws(List<Dw> dws) {
		this.dws = dws;
	}


	/**
	 * @return the dw
	 */
	public Dw getDw() {
		return dw;
	}


	/**
	 * @param dw the dw to set
	 */
	public void setDw(Dw dw) {
		this.dw = dw;
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
	 * @return the fdwbm
	 */
	public String getFdwbm() {
		return fdwbm;
	}
	/**
	 * @param fdwbm the fdwbm to set
	 */
	public void setFdwbm(String fdwbm) {
		this.fdwbm = fdwbm;
	}
	/**
	 * @return the dwmc
	 */
	public String getDwmc() {
		return dwmc;
	}
	/**
	 * @param dwmc the dwmc to set
	 */
	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
	/**
	 * @return the dwjc
	 */
	public String getDwjc() {
		return dwjc;
	}
	/**
	 * @param dwjc the dwjc to set
	 */
	public void setDwjc(String dwjc) {
		this.dwjc = dwjc;
	}
	/**
	 * @return the dwjb
	 */
	public String getDwjb() {
		return dwjb;
	}
	/**
	 * @param dwjb the dwjb to set
	 */
	public void setDwjb(String dwjb) {
		this.dwjb = dwjb;
	}
	/**
	 * @return the dwsx
	 */
	public String getDwsx() {
		return dwsx;
	}
	/**
	 * @param dwsx the dwsx to set
	 */
	public void setDwsx(String dwsx) {
		this.dwsx = dwsx;
	}
	/**
	 * @return the gjz
	 */
	public String getGjz() {
		return gjz;
	}
	/**
	 * @param gjz the gjz to set
	 */
	public void setGjz(String gjz) {
		this.gjz = gjz;
	}

}
