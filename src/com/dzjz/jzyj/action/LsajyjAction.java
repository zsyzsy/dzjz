/**
 * 
 */
package com.dzjz.jzyj.action;

import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.jzyj.service.LsajyjService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class LsajyjAction extends BaseAction{
	
	private LsajyjService lsajyjService;
	
	private String bmsah;
	
	private String gh;
	
	private String dwbm;
	
	private String yjxh;
	
	private JsonListResult jsonListResult;
	
	public String input(){
		
		return "input";
	}
	public String inputaj(){
		
		return "inputaj";
	}
	//案件阅卷列表
	public String queryListyj(){
		
		Map<String, Object> map=Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		List list=(List) lsajyjService.queryListyj(map);
		jsonListResult=new JsonListResult(list);
		try {
			addLog("查看卷宗阅卷列表");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	//案件阅卷详情树型
	public String queryListleftTreeyj(){
		
		Map<String, Object> map=Maps.newHashMap();
		map.put("bmsah", bmsah);
		map.put("yjxh", yjxh);
		List list=(List) lsajyjService.queryListleftTreeyj(map);
		jsonListResult=new JsonListResult(list);
		addLog("查看阅卷信息_"+yjxh+"卷宗信息");
		return "success";
	}

	/**
	 * @return the lsajyjService
	 */
	public LsajyjService getLsajyjService() {
		return lsajyjService;
	}

	/**
	 * @param lsajyjService the lsajyjService to set
	 */
	public void setLsajyjService(LsajyjService lsajyjService) {
		this.lsajyjService = lsajyjService;
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
	

}
