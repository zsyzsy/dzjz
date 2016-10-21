/**
 * 
 */
package com.dzjz.tjcx.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.common.service.AjjbxxService;
import com.dzjz.tjcx.service.CxAjjzzzlService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class CxAjjzzzlAction extends BaseAction{
	
	private AjjbxxService ajjbxxService;
	
	private CxAjjzzzlService cxAjjzzzlService;
	
	private JsonListResult jsonListResult;
	
	private String dwbm;
	
	private String gh;
	
	
	public String input(){
		
		return "input";
	}
	
	//t统计查询案件卷宗制作量
	public String dwjzzzcx(){
		Map< String, Object> map=Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		cxAjjzzzlService.dwjzzzcx(map);
		List list=(List) map.get("p_cursor");
		List list1=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		try {
			addLog("卷宗制作情况查询");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}

	/**
	 * @return the ajjbxxService
	 */
	public AjjbxxService getAjjbxxService() {
		return ajjbxxService;
	}

	/**
	 * @param ajjbxxService the ajjbxxService to set
	 */
	public void setAjjbxxService(AjjbxxService ajjbxxService) {
		this.ajjbxxService = ajjbxxService;
	}

	/**
	 * @return the cxAjjzzzlService
	 */
	public CxAjjzzzlService getCxAjjzzzlService() {
		return cxAjjzzzlService;
	}

	/**
	 * @param cxAjjzzzlService the cxAjjzzzlService to set
	 */
	public void setCxAjjzzzlService(CxAjjzzzlService cxAjjzzzlService) {
		this.cxAjjzzzlService = cxAjjzzzlService;
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
	

	
}
