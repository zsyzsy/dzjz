/**
 * 
 */
package com.dzjz.tjbb.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.tjbb.service.JzzzgzltjService;
import com.dzjz.xtpz.qx.po.YhModel;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class JzzzgzltjAction extends BaseAction{
	
	private JzzzgzltjService jzzzgzltjService;
	
	private String dwbm;
	
	private String jsbm;
	
	private String bmbm;
	
	private String zzr;
	
	private String dlbm;
	
	private String gh;
	
	private String rq1;
	
	private String rq2;
	
	private String get_where;
	
	private JsonListResult jsonListResult;

	/**
	 * @return the jzzzgzltjService
	 */
	public JzzzgzltjService getJzzzgzltjService() {
		return jzzzgzltjService;
	}

	/**
	 * @param jzzzgzltjService the jzzzgzltjService to set
	 */
	public void setJzzzgzltjService(JzzzgzltjService jzzzgzltjService) {
		this.jzzzgzltjService = jzzzgzltjService;
	}
	
	public String input(){
		
		
		return "input";
	}
	//卷宗制作量
	public String getcasebyperson(){
		YhModel yhModel=YhSession();
		Map< String, Object> map=Maps.newHashMap();
		map.put("yhModel", yhModel);
		map.put("get_where", get_where);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		jzzzgzltjService.getcasebyperson(map);
		List list=(List) map.get("p_cursor"); 
		jsonListResult=new JsonListResult(list);
		try {
			addLog("卷宗制作工作量统计");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	//详情
	public String getcasebypersonb(){
		YhModel yhModel=YhSession();
		Map< String, Object> map=Maps.newHashMap();
		map.put("yhModel", yhModel);
		map.put("get_where", get_where);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		jzzzgzltjService.getcasebypersonb(map);
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
	 * @return the zzr
	 */
	public String getZzr() {
		return zzr;
	}

	/**
	 * @param zzr the zzr to set
	 */
	public void setZzr(String zzr) {
		this.zzr = zzr;
	}

	/**
	 * @return the dlbm
	 */
	public String getDlbm() {
		return dlbm;
	}

	/**
	 * @param dlbm the dlbm to set
	 */
	public void setDlbm(String dlbm) {
		this.dlbm = dlbm;
	}

}
