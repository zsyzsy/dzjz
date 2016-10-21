/**
 * 
 */
package com.dzjz.xtpz.sslb.action;

import java.util.List;
import java.util.Map;

import com.common.JsonListResult;
import com.dzjz.xtpz.sslb.po.Sslb;
import com.dzjz.xtpz.sslb.service.SslbService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class SslbAction {
	
	private SslbService sslbService;
	
	private List<Sslb> sslbs;
	
	private Sslb sslb;
	
	private String sslbbm;
	
	private String sslblx;
	
	
	private JsonListResult jsonListResult;
	
	
	public String queryList(){
		sslbs=(List<Sslb>) sslbService.findAll();
		
		jsonListResult=new JsonListResult(sslbs);
		
		return "success";
	}
	//添加模板所属类别
	public  String queryByWhereMap(){
//				YhModel yh=YhSession();
		Map<String, Object> map=Maps.newHashMap();
				//所属类别属性 字段sslblx==1
		map.put("sslblx", sslblx);
		map.put("sslbbm", sslbbm);
		sslbs=(List<Sslb>) sslbService.queryByWhereMap(map);
		jsonListResult=new JsonListResult(sslbs);
		return "success";
	}
			
	/**
	 * @return the sslbService
	 */
	public SslbService getSslbService() {
		return sslbService;
	}

	/**
	 * @param sslbService the sslbService to set
	 */
	public void setSslbService(SslbService sslbService) {
		this.sslbService = sslbService;
	}

	/**
	 * @return the sslbs
	 */
	public List<Sslb> getSslbs() {
		return sslbs;
	}

	/**
	 * @param sslbs the sslbs to set
	 */
	public void setSslbs(List<Sslb> sslbs) {
		this.sslbs = sslbs;
	}

	/**
	 * @return the sslb
	 */
	public Sslb getSslb() {
		return sslb;
	}

	/**
	 * @param sslb the sslb to set
	 */
	public void setSslb(Sslb sslb) {
		this.sslb = sslb;
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
	 * @return the sslbbm
	 */
	public String getSslbbm() {
		return sslbbm;
	}
	/**
	 * @param sslbbm the sslbbm to set
	 */
	public void setSslbbm(String sslbbm) {
		this.sslbbm = sslbbm;
	}
	/**
	 * @return the sslblx
	 */
	public String getSslblx() {
		return sslblx;
	}
	/**
	 * @param sslblx the sslblx to set
	 */
	public void setSslblx(String sslblx) {
		this.sslblx = sslblx;
	}
	
	

}
