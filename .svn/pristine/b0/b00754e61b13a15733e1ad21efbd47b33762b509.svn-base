/**
 * 
 */
package com.dzjz.xtpz.cspz.action;

import java.util.List;

import com.common.JsonListResult;
import com.common.StatusFormatBean;
import com.dzjz.xtpz.cspz.po.Cspz;
import com.dzjz.xtpz.cspz.service.CspzService;

/**
 * @author change
 *
 */
public class CspzAction {
	
private CspzService cspzService;
	
	private Cspz cspz;
	
	private List<Cspz> cspzs;
	
	private JsonListResult jsonListResult;
	
	private StatusFormatBean[] pzbs;
	
	private int configid;
	
	private String configname;
	
	private String configvalue;
	
	private String pzbm;
	
	public String input(){
		
		return "input";
	}
	
	public String queryList1(){
		
		pzbs=cspz.PZBS_ARRAYS;
		return "queryList1";
	}
	
	public String queryList(){
		jsonListResult=new JsonListResult(cspzs);
		return "queryList";
	}
	public String add(){
		cspz=new Cspz();
		cspz.setConfigid(configid);
		cspz.setConfigname(configname);
		cspz.setConfigvalue(configvalue);
		cspzService.add(cspz);
		return "add";
	}
	
	
	
	public String update(){
		cspz=new Cspz();
		cspz.setPzbm(pzbm);
		cspzs=(List<Cspz>) cspzService.queryByMap(cspz);
		cspz=cspzs.get(0);
		cspz.setConfigid(configid);
		cspz.setConfigname(configname);
		cspz.setConfigvalue(configvalue);
		cspzService.update(cspz);
		return "update";
	}
	
	public String delete(){
		cspz=new Cspz();
		cspz.setPzbm(pzbm);
		cspzs=(List<Cspz>) cspzService.queryByMap(cspz);
		cspz=cspzs.get(0);
		cspzService.delete(cspz);
			return "delete";
	}

	public String queryByMap(){
		cspz=new Cspz();
		cspz.setPzbm(pzbm);
		cspzs=(List<Cspz>) cspzService.queryByMap(cspz);
		jsonListResult=new JsonListResult(cspzs);
		
		return "queryByMap";
	}
	
	
	/**
	 * @return the cspzService
	 */
	public CspzService getCspzService() {
		return cspzService;
	}

	/**
	 * @param cspzService the cspzService to set
	 */
	public void setCspzService(CspzService cspzService) {
		this.cspzService = cspzService;
	}

	/**
	 * @return the cspz
	 */
	public Cspz getCspz() {
		return cspz;
	}

	/**
	 * @param cspz the cspz to set
	 */
	public void setCspz(Cspz cspz) {
		this.cspz = cspz;
	}

	/**
	 * @return the cspzs
	 */
	public List<Cspz> getCspzs() {
		return cspzs;
	}

	/**
	 * @param cspzs the cspzs to set
	 */
	public void setCspzs(List<Cspz> cspzs) {
		this.cspzs = cspzs;
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
	 * @return the pzbs
	 */
	public StatusFormatBean[] getPzbs() {
		return pzbs;
	}

	/**
	 * @param pzbs the pzbs to set
	 */
	public void setPzbs(StatusFormatBean[] pzbs) {
		this.pzbs = pzbs;
	}

	/**
	 * @return the configid
	 */
	public int getConfigid() {
		return configid;
	}

	/**
	 * @param configid the configid to set
	 */
	public void setConfigid(int configid) {
		this.configid = configid;
	}

	/**
	 * @return the configname
	 */
	public String getConfigname() {
		return configname;
	}

	/**
	 * @param configname the configname to set
	 */
	public void setConfigname(String configname) {
		this.configname = configname;
	}

	/**
	 * @return the configvalue
	 */
	public String getConfigvalue() {
		return configvalue;
	}

	/**
	 * @param configvalue the configvalue to set
	 */
	public void setConfigvalue(String configvalue) {
		this.configvalue = configvalue;
	}

	/**
	 * @return the pzbm
	 */
	public String getPzbm() {
		return pzbm;
	}

	/**
	 * @param pzbm the pzbm to set
	 */
	public void setPzbm(String pzbm) {
		this.pzbm = pzbm;
	}
	

}

