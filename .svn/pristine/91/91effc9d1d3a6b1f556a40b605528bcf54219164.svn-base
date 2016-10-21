/**
 * 
 */
package com.dzjz.tjbb.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.tjbb.service.JzydtjService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class JzydtjAction extends BaseAction{
	
	private JzydtjService jzydtjService;
	
	private String dwbm;
	
	private String jsbm;
	
	private String bmbm;
	
	private String gh;
	
	private String rq1;
	
	private String rq2;
	
	private String get_where;
	
	private JsonListResult jsonListResult;
	
	public String input(){
		
		
		return "input";
	}
	
	//
	public String casegroupmouth(){
		Map< String , Object> map =Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("jsbm", jsbm);
		map.put("bmbm", bmbm);
		map.put("gh", gh);
		map.put("rq1", rq1);
		map.put("rq2", rq2);
		map.put("get_where", get_where);
		
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		jzydtjService.casegroupmouth(map);
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		try {
			addLog("卷宗月度统计查询");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}

	/**
	 * @return the jzydtjService
	 */
	public JzydtjService getJzydtjService() {
		return jzydtjService;
	}

	/**
	 * @param jzydtjService the jzydtjService to set
	 */
	public void setJzydtjService(JzydtjService jzydtjService) {
		this.jzydtjService = jzydtjService;
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
	 * @return the jsbm
	 */
	public String getJsbm() {
		return jsbm;
	}

	/**
	 * @param jsbm the jsbm to set
	 */
	public void setJsbm(String jsbm) {
		this.jsbm = jsbm;
	}

	/**
	 * @return the bmbm
	 */
	public String getBmbm() {
		return bmbm;
	}

	/**
	 * @param bmbm the bmbm to set
	 */
	public void setBmbm(String bmbm) {
		this.bmbm = bmbm;
	}

	/**
	 * @return the get_where
	 */
	public String getGet_where() {
		return get_where;
	}

	/**
	 * @param get_where the get_where to set
	 */
	public void setGet_where(String get_where) {
		this.get_where = get_where;
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
	 * @return the rq1
	 */
	public String getRq1() {
		return rq1;
	}

	/**
	 * @param rq1 the rq1 to set
	 */
	public void setRq1(String rq1) {
		this.rq1 = rq1;
	}

	/**
	 * @return the rq2
	 */
	public String getRq2() {
		return rq2;
	}

	/**
	 * @param rq2 the rq2 to set
	 */
	public void setRq2(String rq2) {
		this.rq2 = rq2;
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
	
	
	

}
