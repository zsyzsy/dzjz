/**
 * 
 */
package com.dzjz.xtpz.qx.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.common.JsonListResult;
import com.common.ListToJson;
import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.qx.po.Yh;
import com.dzjz.xtpz.qx.service.YhService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class YhAction {
	
	private YhService yhService;
	
	private Yh yh;
	
	private List<Yh> yhs;
	
	private JsonListResult jsonListResult;
	
	private String gh;
	
	private String dwbm;
	
	private  String mc;
	private  String gzzh;
	private  String caid;
	private  String xb;
	private  String yddhhm;
	private  String dzyj;
	private  String sflsry;
	private  String sftz;
	
	public String input(){
		
		return "input";
	}
	public String queryList(){
		yhs=(List<Yh>) yhService.findAll();
		jsonListResult=new JsonListResult(yhs);
		return "success";
	}
	//通过单位工号获取用户角色信息
	public String ryjs(){
		Map<String, Object> map=Maps.newHashMap(); 
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		yhService.ryjs(map);
		List list=(List) yhService.ryjs(map);
		jsonListResult=new JsonListResult(list);
		return "success";
	}
	public String add(){
		//获取新工号
		String newGh=yhService.newId("370000");
		
		yh=new Yh();
		//通过登录信息获取到的数据字段
		Dw dw=new Dw();
		dw.setDwbm("370000");
		yh.setDwbm(dw);
		yh.setGh(newGh);
		//从页面获取到的字段
		yh.setMc(mc);
		yh.setGzzh(gzzh);
		yh.setCaid(caid);
		yh.setXb(xb);
		yh.setYddhhm(yddhhm);
		yh.setDzyj(dzyj);
		yh.setSflsry(sflsry);
		yh.setSftz(sftz);
		
		yhService.add(yh);
		return "add";
	}
	
	public String update(){
		Dw dw1=new Dw();
		dw1.setDwbm(dwbm);
		Yh yh1=new Yh();
		yh1.setDwbm(dw1);
		yh1.setGh(gh);
		yhs=(List<Yh>) yhService.queryByMap(yh1);
		yh=yhs.get(0);
		//需修改字段set
		yh.setMc(mc);
		yh.setCaid(caid);
		yh.setXb(xb);
		yh.setYddhhm(yddhhm);
		yh.setDzyj(dzyj);
		yh.setSflsry(sflsry);
		yh.setSftz(sftz);
		
		yhService.update(yh);
		return "update";
	}
	//
	public String resetMm(){
		Dw dw1=new Dw();
		dw1.setDwbm(dwbm);
		Yh yh1=new Yh();
		yh1.setDwbm(dw1);
		yh1.setGh(gh);
		yhs=(List<Yh>) yhService.queryByMap(yh1);
		yh=yhs.get(0);
		
		yhService.resetMm(yh);
		return "update";
	}
	public String delete(){
		Dw dw1=new Dw();
		dw1.setDwbm(dwbm);
		Yh yh1=new Yh();
		yh1.setDwbm(dw1);
		yh1.setGh(gh);
		yhs=(List<Yh>) yhService.queryByMap(yh1);
		yhService.delete(yhs.get(0));
		return "delete";
	}
	/**
	 * @return the yhService
	 */
	public YhService getYhService() {
		return yhService;
	}
	/**
	 * @param yhService the yhService to set
	 */
	public void setYhService(YhService yhService) {
		this.yhService = yhService;
	}
	/**
	 * @return the yh
	 */
	public Yh getYh() {
		return yh;
	}
	/**
	 * @param yh the yh to set
	 */
	public void setYh(Yh yh) {
		this.yh = yh;
	}
	/**
	 * @return the yhs
	 */
	public List<Yh> getYhs() {
		return yhs;
	}
	/**
	 * @param yhs the yhs to set
	 */
	public void setYhs(List<Yh> yhs) {
		this.yhs = yhs;
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
	 * @return the mc
	 */
	public String getMc() {
		return mc;
	}
	/**
	 * @param mc the mc to set
	 */
	public void setMc(String mc) {
		this.mc = mc;
	}
	/**
	 * @return the gzzh
	 */
	public String getGzzh() {
		return gzzh;
	}
	/**
	 * @param gzzh the gzzh to set
	 */
	public void setGzzh(String gzzh) {
		this.gzzh = gzzh;
	}
	/**
	 * @return the caid
	 */
	public String getCaid() {
		return caid;
	}
	/**
	 * @param caid the caid to set
	 */
	public void setCaid(String caid) {
		this.caid = caid;
	}
	/**
	 * @return the xb
	 */
	public String getXb() {
		return xb;
	}
	/**
	 * @param xb the xb to set
	 */
	public void setXb(String xb) {
		this.xb = xb;
	}
	/**
	 * @return the yddhhm
	 */
	public String getYddhhm() {
		return yddhhm;
	}
	/**
	 * @param yddhhm the yddhhm to set
	 */
	public void setYddhhm(String yddhhm) {
		this.yddhhm = yddhhm;
	}
	/**
	 * @return the dzyj
	 */
	public String getDzyj() {
		return dzyj;
	}
	/**
	 * @param dzyj the dzyj to set
	 */
	public void setDzyj(String dzyj) {
		this.dzyj = dzyj;
	}
	/**
	 * @return the sflsry
	 */
	public String getSflsry() {
		return sflsry;
	}
	/**
	 * @param sflsry the sflsry to set
	 */
	public void setSflsry(String sflsry) {
		this.sflsry = sflsry;
	}
	/**
	 * @return the sftz
	 */
	public String getSftz() {
		return sftz;
	}
	/**
	 * @param sftz the sftz to set
	 */
	public void setSftz(String sftz) {
		this.sftz = sftz;
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
