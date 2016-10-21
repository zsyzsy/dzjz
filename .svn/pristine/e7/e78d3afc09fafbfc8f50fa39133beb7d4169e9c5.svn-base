/**
 * 
 */
package com.dzjz.tjbb.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.tjbb.service.JzcctjService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class JzcctjAction extends BaseAction{
	
	private JzcctjService jzcctjService;
	
	private String dwbm;
	
	private String gh;
	
	
	private JsonListResult jsonListResult;

	/**
	 * @return the jzcctjService
	 */
	public JzcctjService getJzcctjService() {
		return jzcctjService;
	}

	/**
	 * @param jzcctjService the jzcctjService to set
	 */
	public void setJzcctjService(JzcctjService jzcctjService) {
		this.jzcctjService = jzcctjService;
	}
	
	public String input(){
		
		return "input";
		
	}
	//卷宗存储空间
	public String jmapznumber(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		jzcctjService.jznumber(map);
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		try {
			addLog("卷宗存储空间查看");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	//单位卷宗存储空间
	public String dwjznumber(){
		Map<String, Object> map=Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		jzcctjService.dwjznumber(map);
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		return "success";
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
