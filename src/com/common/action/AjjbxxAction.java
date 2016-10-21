/**
 * 
 */
package com.common.action;

import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.common.po.Ajjbxx;
import com.common.service.AjjbxxService;
import com.dzjz.jzzz.ajjzzz.po.Jzjbxx;
import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.qx.po.Yh;
import com.dzjz.xtpz.qx.po.YhModel;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class AjjbxxAction extends BaseAction{
	
	private AjjbxxService ajjbxxService;
	
	private List<Ajjbxx> ajjbxxs;
	
	private Ajjbxx ajjbxx;
	
	private Jzjbxx jzjbxx;
	
	private String dwbm;
	
	private String gh;
	
	private String slrq;
	
	private String ajmbbm;
	
	private String ajmbmc;
	
	private String jzmc;
	
	private String accomplices;
	
	private String bmsah;
	
	private String tysah;
	//卷宗制作参数 
	private String sfdc;
	//卷宗制作调用url
	private String url;
	
	private Dw dw;
	
	private JsonListResult jsonListResult;
	
	public String input(){
		
		return "input";
	}
	
	public String queryByMap(){
		Map<String , Object> map =Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh",gh);
		map.put("slrq", slrq);
		ajjbxxs=(List<Ajjbxx>) ajjbxxService.queryByMap(map);
		//登录
		Yh yh1=YhSession1();
		jsonListResult=new JsonListResult(ajjbxxs);
//		 HttpServletRequest request = ServletActionContext.getRequest();
		try {
			this.addLog("查看卷宗制作列表");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "queryByMap";
	}
	public String add_ajjbxx(){
		Map<String , Object> map =Maps.newHashMap();
		//获取当前用户信息
		Yh yh=YhSession1();
		map.put("ajmb_bm", ajmbbm);
		map.put("ajmb_mc", ajmbmc);
		map.put("accomplices", accomplices);
		map.put("jzmc", jzmc);
		map.put("yh", yh);
		ajjbxxService.add_ajzz(map);
		this.addLog("添加案件_"+jzmc);
		return "add";
	}
	//卷宗--->制作
	public String add_jzzz(){
		Map<String , Object> map =Maps.newHashMap();
		//获取当前用户信息
		YhModel yh=YhSession();
		map.put("yh", yh);
		map.put("BMSAH", bmsah);
		map.put("SFDC", sfdc);
		String burl=ajjbxxService.add(map);
		 url=getKeyUrl("DZJZAppServer/Locator:default -h 10.1.1.23 -p 12000", burl);
		 this.addLog("制作案件_"+bmsah);
		System.out.println(url);
//		System.out.println(ajjbxxService.add(map));
		
		return "add_jzzz";
	}
	//修改案件
	public String update_ajjbxx(){
		Map<String , Object> map =Maps.newHashMap();
		Yh yh=YhSession1();
		map.put("bmsah", bmsah);
		map.put("tysah", tysah);
		map.put("ajmb_bm", ajmbbm);
		map.put("ajmb_mc", ajmbmc);
		map.put("accomplices", accomplices);
		map.put("jzmc", jzmc);
		map.put("yh", yh);
		ajjbxxService.update_ajzz(map);
		this.addLog("修改案件_"+jzmc);
		return "update";
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
	 * @return the ajjbxxs
	 */
	public List<Ajjbxx> getAjjbxxs() {
		return ajjbxxs;
	}

	/**
	 * @param ajjbxxs the ajjbxxs to set
	 */
	public void setAjjbxxs(List<Ajjbxx> ajjbxxs) {
		this.ajjbxxs = ajjbxxs;
	}

	/**
	 * @return the ajjbxx
	 */
	public Ajjbxx getAjjbxx() {
		return ajjbxx;
	}

	/**
	 * @param ajjbxx the ajjbxx to set
	 */
	public void setAjjbxx(Ajjbxx ajjbxx) {
		this.ajjbxx = ajjbxx;
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

	/**
	 * @return the dw
	 */
	public Dw getDw() {
		return dw;
	}

	/**
	 * @param dw the dw to set
	 */
	public void setDw(Dw dw) {
		this.dw = dw;
	}

	/**
	 * @return the slrq
	 */
	public String getSlrq() {
		return slrq;
	}

	/**
	 * @param slrq the slrq to set
	 */
	public void setSlrq(String slrq) {
		this.slrq = slrq;
	}

	/**
	 * @return the jzjbxx
	 */
	public Jzjbxx getJzjbxx() {
		return jzjbxx;
	}

	/**
	 * @param jzjbxx the jzjbxx to set
	 */
	public void setJzjbxx(Jzjbxx jzjbxx) {
		this.jzjbxx = jzjbxx;
	}

	/**
	 * @return the ajmbbm
	 */
	public String getAjmbbm() {
		return ajmbbm;
	}

	/**
	 * @param ajmbbm the ajmbbm to set
	 */
	public void setAjmbbm(String ajmbbm) {
		this.ajmbbm = ajmbbm;
	}

	/**
	 * @return the ajmbmc
	 */
	public String getAjmbmc() {
		return ajmbmc;
	}

	/**
	 * @param ajmbmc the ajmbmc to set
	 */
	public void setAjmbmc(String ajmbmc) {
		this.ajmbmc = ajmbmc;
	}

	/**
	 * @return the jzmc
	 */
	public String getJzmc() {
		return jzmc;
	}

	/**
	 * @param jzmc the jzmc to set
	 */
	public void setJzmc(String jzmc) {
		this.jzmc = jzmc;
	}

	/**
	 * @return the accomplices
	 */
	public String getAccomplices() {
		return accomplices;
	}

	/**
	 * @param accomplices the accomplices to set
	 */
	public void setAccomplices(String accomplices) {
		this.accomplices = accomplices;
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
	 * @return the tysah
	 */
	public String getTysah() {
		return tysah;
	}

	/**
	 * @param tysah the tysah to set
	 */
	public void setTysah(String tysah) {
		this.tysah = tysah;
	}

	/**
	 * @return the sfdc
	 */
	public String getSfdc() {
		return sfdc;
	}

	/**
	 * @param sfdc the sfdc to set
	 */
	public void setSfdc(String sfdc) {
		this.sfdc = sfdc;
	}

	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
	

}
