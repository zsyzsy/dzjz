/**
 * 
 */
package com.dzjz.xtpz.ajlbbm.action;

import java.util.List;

import javax.annotation.Resource;

import com.common.JsonListResult;
import com.dzjz.xtpz.ajlbbm.po.Ajlbbm;
import com.dzjz.xtpz.ajlbbm.service.AjlbbmService;

/**
 * @author Administrator
 *
 */
public class AjlbbmAction {
	@Resource
	private AjlbbmService ajlbbmService;
	
	private Ajlbbm ajlbbm;
	
	private String ajlbbm1;
	
	private List<Ajlbbm> ajlbbms;
	
	private String ajlbmc;
	
	private JsonListResult jsonListResult;
	
	public  String  queryList(){
		ajlbbm=new Ajlbbm();
		ajlbbm.setAjlbbm(ajlbbm1);
		
		ajlbbms=(List<Ajlbbm>) ajlbbmService.queryByMap(ajlbbm);
		jsonListResult=new JsonListResult(ajlbbms);
		return "success";
	}
	public  String  ajlbbmsList(){
		ajlbbm=new Ajlbbm();
		ajlbbm.setAjlbbm(ajlbbm1);
		
		ajlbbms=(List<Ajlbbm>) ajlbbmService.queryByMap(ajlbbm);
		return "ajlbbmsList";
	}

	/**
	 * @return the ajlbbmService
	 */
	public AjlbbmService getAjlbbmService() {
		return ajlbbmService;
	}

	/**
	 * @param ajlbbmService the ajlbbmService to set
	 */
	public void setAjlbbmService(AjlbbmService ajlbbmService) {
		this.ajlbbmService = ajlbbmService;
	}

	/**
	 * @return the ajlbbm
	 */
	public Ajlbbm getAjlbbm() {
		return ajlbbm;
	}

	/**
	 * @param ajlbbm the ajlbbm to set
	 */
	public void setAjlbbm(Ajlbbm ajlbbm) {
		this.ajlbbm = ajlbbm;
	}

	/**
	 * @return the ajlbbms
	 */
	public List<Ajlbbm> getAjlbbms() {
		return ajlbbms;
	}

	/**
	 * @param ajlbbms the ajlbbms to set
	 */
	public void setAjlbbms(List<Ajlbbm> ajlbbms) {
		this.ajlbbms = ajlbbms;
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
	 * @return the ajlbbm1
	 */
	public String getAjlbbm1() {
		return ajlbbm1;
	}

	/**
	 * @param ajlbbm1 the ajlbbm1 to set
	 */
	public void setAjlbbm1(String ajlbbm1) {
		this.ajlbbm1 = ajlbbm1;
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

	
	
	
	
}
