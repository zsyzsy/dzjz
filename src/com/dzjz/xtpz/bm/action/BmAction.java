/**
 * 
 */
package com.dzjz.xtpz.bm.action;

import java.util.List;

import com.common.JsonListResult;
import com.dzjz.xtpz.bm.po.Bm;
import com.dzjz.xtpz.bm.service.BmService;
import com.dzjz.xtpz.dw.po.Dw;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author change
 *
 */
public class BmAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8827113824622302896L;

	private BmService bmService;
	
	private List<Bm> bms;
	
	private Bm bm;
	
	private Dw dw;
	
	private JsonListResult jsonListResult;
	
	private String dwbm;
	
	private String bmbm;
	private String fbmbm;
	private String bmmc;
	private String bmjc;
	private String bz;
	
	public String input(){
		
		return "input";
	} 
	
	public String queryByMap(){
		bm=new Bm();
		dw=new Dw();
//		if(dwbm.trim()==null){
//			bms=(List<Bm>) bmService.findAll();
//		}else{
			dw.setDwbm(dwbm);
			bm.setBmbm(bmbm);
			bm.setBmmc(bmmc);
			bm.setDwbm(dw);
			bms=(List<Bm>) bmService.queryByMap(bm);
//		}
		jsonListResult=new JsonListResult(bms);
		return "queryByMap";
	}
	
	public String add(){
		//获取bmbm
		String newBmbm=bmService.newId(dwbm);
		bm=new Bm();
		bm.setBmbm(newBmbm);
		if(null!=fbmbm){
			bm.setFbmbm(fbmbm);
		}
		if(bz!=null){
			bm.setBz(bz);
		}
		bm.setBmmc(bmmc);
		bm.setBmjc(bmjc);
		bm.setSfsc("N");
		dw=new Dw();
		dw.setDwbm(dwbm);
		bm.setDwbm(dw);
		bmService.add(bm);
		return "add";
		
	}
	public String update(){
		Bm bm1=new Bm();
		dw=new Dw();
		dw.setDwbm(dwbm);
		bm1.setDwbm(dw);
		bm1.setBmbm(bmbm);
		bms=(List<Bm>) bmService.queryByMap(bm1);
		bm=bms.get(0);
		bm.setBmmc(bmmc);
		bm.setBmjc(bmjc);
		bm.setBz(bz);
		bmService.update(bm);
		return "update";
	}
	public String delete(){
		Bm bm1=new Bm();
		dw=new Dw();
		dw.setDwbm(dwbm);
		bm1.setDwbm(dw);
		bm1.setBmbm(bmbm);
		bms=(List<Bm>) bmService.queryByMap(bm1);
		bm=bms.get(0);
		bmService.delete(bm);
		return "delete";
	}

	/**
	 * @return the bmService
	 */
	public BmService getBmService() {
		return bmService;
	}

	/**
	 * @param bmService the bmService to set
	 */
	public void setBmService(BmService bmService) {
		this.bmService = bmService;
	}

	/**
	 * @return the bms
	 */
	public List<Bm> getBms() {
		return bms;
	}

	/**
	 * @param bms the bms to set
	 */
	public void setBms(List<Bm> bms) {
		this.bms = bms;
	}

	/**
	 * @return the bm
	 */
	public Bm getBm() {
		return bm;
	}

	/**
	 * @param bm the bm to set
	 */
	public void setBm(Bm bm) {
		this.bm = bm;
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
	 * @return the fbmbm
	 */
	public String getFbmbm() {
		return fbmbm;
	}

	/**
	 * @param fbmbm the fbmbm to set
	 */
	public void setFbmbm(String fbmbm) {
		this.fbmbm = fbmbm;
	}

	/**
	 * @return the bmmc
	 */
	public String getBmmc() {
		return bmmc;
	}

	/**
	 * @param bmmc the bmmc to set
	 */
	public void setBmmc(String bmmc) {
		this.bmmc = bmmc;
	}

	/**
	 * @return the bmjc
	 */
	public String getBmjc() {
		return bmjc;
	}

	/**
	 * @param bmjc the bmjc to set
	 */
	public void setBmjc(String bmjc) {
		this.bmjc = bmjc;
	}

	/**
	 * @return the bz
	 */
	public String getBz() {
		return bz;
	}

	/**
	 * @param bz the bz to set
	 */
	public void setBz(String bz) {
		this.bz = bz;
	}

	
	

}
