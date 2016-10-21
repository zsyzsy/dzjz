/**
 * 
 */
package com.dzjz.xtpz.rzcx.action;

import java.util.List;

import com.common.JsonListResult;
import com.common.ListToJson;
import com.dzjz.xtpz.rzcx.po.Rzcx;
import com.dzjz.xtpz.rzcx.service.RzcxService;

/**
 * @author Administrator
 *
 */
public class RzcxAction {
	private RzcxService rzcxService;
	
	private List<Rzcx> rzcxs;
	
	private Rzcx rzcx;

	private JsonListResult jsonListResult;
	
	public String input(){
		
		
		return "input";
	}
	//查询
	public String queryList(){
		rzcx =new Rzcx();
		
		rzcxs=(List<Rzcx>) rzcxService.queryByMap(rzcx);
		jsonListResult=new JsonListResult(rzcxs);
		ListToJson json=new ListToJson();
		return "queryList";
	}
	//测试
	public String add(){
		rzcxService.add(rzcx);
		
		return "add" ;
	
	}
	/**
	 * @return the rzcxService
	 */
	public RzcxService getRzcxService() {
		return rzcxService;
	}

	/**
	 * @param rzcxService the rzcxService to set
	 */
	public void setRzcxService(RzcxService rzcxService) {
		this.rzcxService = rzcxService;
	}

	/**
	 * @return the rzcxs
	 */
	public List<Rzcx> getRzcxs() {
		return rzcxs;
	}

	/**
	 * @param rzcxs the rzcxs to set
	 */
	public void setRzcxs(List<Rzcx> rzcxs) {
		this.rzcxs = rzcxs;
	}

	/**
	 * @return the rzcx
	 */
	public Rzcx getRzcx() {
		return rzcx;
	}

	/**
	 * @param rzcx the rzcx to set
	 */
	public void setRzcx(Rzcx rzcx) {
		this.rzcx = rzcx;
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
	
	
}
