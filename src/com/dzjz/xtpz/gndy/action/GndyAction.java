/**
 * 
 */
package com.dzjz.xtpz.gndy.action;

import java.util.List;

import com.common.JsonListResult;
import com.common.ListToJson;
import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.gndy.po.Gndy;
import com.dzjz.xtpz.gndy.service.GndyService;
import com.dzjz.xtpz.gnfl.service.GnflService;

/**
 * @author Administrator
 *
 */
public class GndyAction {
	
	private GndyService gndyService;
	
	private GnflService gnflService;
	
	private List<Gndy> gndys;
	
	private JsonListResult jsonListResult;
	private ListToJson listToJson=new ListToJson();
	private Gndy gndy;
	private Dw dw;
	private String gnbm;
	private String gnmc;
	private String flbm;
	private String gnxh;
	private String gnct;
	private String gnsm;
	private String dwbm;
	
	public String  input(){
		
		
		return "input";
	}
	public String  queryList(){
		gndys=(List<Gndy>) gndyService.findAll();
		jsonListResult=new JsonListResult(gndys);
		
		ListToJson listToJson=new ListToJson();
		return "queryList";
		
	}
	
	
	public String queryByMap(){
		Gndy gndy1=new Gndy();
		gndy1.setGnbm(gnbm);
		gndys=(List<Gndy>) gndyService.queryByMap(gndy1);
		jsonListResult=new JsonListResult(gndys);
		return "queryByMap";
	}
	public String delete(){
		Gndy gndy1=new Gndy();
		gndy1.setGnbm(gnbm);
		gndys=(List<Gndy>) gndyService.queryByMap(gndy1);
		gndy=gndys.get(0);
		gndyService.delete(gndy);
		return "delete";
	};
	
	public String update(){
		Gndy gndy1=new Gndy();
		gndy1.setGnbm(gnbm);
		gndys=(List<Gndy>) gndyService.queryByMap(gndy1);
		gndy=gndys.get(0);
		gndy.setGnmc(gnmc);
		gndy.setGnxh(Integer.parseInt(gnxh));
		gndy.setGnct(gnct);
		gndy.setGnsm(gnmc);
		gndyService.update(gndy);
		
		return "update";
		
		
	};
	
	public String add(){
		String newId=gndyService.newId("");
		gndy=new Gndy();
		gndy.setGnbm(newId);
		gndy.setGnmc(gnmc);
		gndy.setFlbm(flbm);
		gndy.setGnxh(Integer.parseInt(gnxh));
		gndy.setGnct(gnct);
		gndy.setGnsm(gnmc);
		gndyService.add(gndy);
		
		return "add";
		
		
	};
	/**
	 * @return the gndyService
	 */
	public GndyService getGndyService() {
		return gndyService;
	}

	/**
	 * @param gndyService the gndyService to set
	 */
	public void setGndyService(GndyService gndyService) {
		this.gndyService = gndyService;
	}

	/**
	 * @return the gndies
	 */
	public List<Gndy> getGndys() {
		return gndys;
	}

	/**
	 * @param gndies the gndies to set
	 */
	public void setGndye(List<Gndy> gndys) {
		this.gndys = gndys;
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
	 * @return the gndy
	 */
	public Gndy getGndy() {
		return gndy;
	}

	/**
	 * @param gndy the gndy to set
	 */
	public void setGndy(Gndy gndy) {
		this.gndy = gndy;
	}

	/**
	 * @return the listToJson
	 */
	public ListToJson getListToJson() {
		return listToJson;
	}

	/**
	 * @param listToJson the listToJson to set
	 */
	public void setListToJson(ListToJson listToJson) {
		this.listToJson = listToJson;
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
	 * @return the gnmc
	 */
	public String getGnmc() {
		return gnmc;
	}

	/**
	 * @param gnmc the gnmc to set
	 */
	public void setGnmc(String gnmc) {
		this.gnmc = gnmc;
	}

	/**
	 * @return the flbm
	 */
	public String getFlbm() {
		return flbm;
	}

	/**
	 * @param flbm the flbm to set
	 */
	public void setFlbm(String flbm) {
		this.flbm = flbm;
	}

	/**
	 * @return the gnxh
	 */
	public String getGnxh() {
		return gnxh;
	}

	/**
	 * @param gnxh the gnxh to set
	 */
	public void setGnxh(String gnxh) {
		this.gnxh = gnxh;
	}

	/**
	 * @return the gnct
	 */
	public String getGnct() {
		return gnct;
	}

	/**
	 * @param gnct the gnct to set
	 */
	public void setGnct(String gnct) {
		this.gnct = gnct;
	}

	/**
	 * @return the gnsm
	 */
	public String getGnsm() {
		return gnsm;
	}

	/**
	 * @param gnsm the gnsm to set
	 */
	public void setGnsm(String gnsm) {
		this.gnsm = gnsm;
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
	 * @return the gnbm
	 */
	public String getGnbm() {
		return gnbm;
	}

	/**
	 * @param gnbm the gnbm to set
	 */
	public void setGnbm(String gnbm) {
		this.gnbm = gnbm;
	}
	/**
	 * @return the gnflService
	 */
	public GnflService getGnflService() {
		return gnflService;
	}
	/**
	 * @param gnflService the gnflService to set
	 */
	public void setGnflService(GnflService gnflService) {
		this.gnflService = gnflService;
	}
	/**
	 * @param gndys the gndys to set
	 */
	public void setGndys(List<Gndy> gndys) {
		this.gndys = gndys;
	}
	
	

}
