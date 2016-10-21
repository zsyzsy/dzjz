/**
 * 
 */
package com.dzjz.xtpz.qx.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.xtpz.qx.po.YhModel;
import com.dzjz.xtpz.qx.service.GnByRyMenuService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class GnByRyMenuAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -807990240865634308L;

	@Resource
	private  GnByRyMenuService gnByRyMenuService;
	
	private  JsonListResult jsonListResult;
	
	private String dwbm;
	
	private String gh;
	
	public String gnbyry(){
		YhModel yhModel=YhSession();
		String jsbm=yhModel.getJsbm();
		String[] jsbm1=jsbm.split(",");
		Map<String, Object> map=Maps.newHashMap();
		map.put("dwbm", yhModel.getDwbm());
		map.put("bmbm", yhModel.getBmbm());
		map.put("jsbm", jsbm1);
		map.put("gh", yhModel.getGh());
		List list=(List) gnByRyMenuService.gnbyry(map);
		jsonListResult=new JsonListResult(list);
		return "success";
	}

	/**
	 * @return the gnByRyMenuService
	 */
	public GnByRyMenuService getGnByRyMenuService() {
		return gnByRyMenuService;
	}

	/**
	 * @param gnByRyMenuService the gnByRyMenuService to set
	 */
	public void setGnByRyMenuService(GnByRyMenuService gnByRyMenuService) {
		this.gnByRyMenuService = gnByRyMenuService;
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
