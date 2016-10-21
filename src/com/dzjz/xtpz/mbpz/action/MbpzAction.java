/**
 * 
 */
package com.dzjz.xtpz.mbpz.action;

import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.xtpz.mbpz.po.Jzmbpz;
import com.dzjz.xtpz.mbpz.service.MbpzService;
import com.dzjz.xtpz.qx.po.Yh;
import com.dzjz.xtpz.qx.po.YhModel;
import com.google.common.collect.Maps;

/**
 * @author change
 *
 */
public class MbpzAction extends BaseAction{
	
		private MbpzService MbpzService;
		
		private Jzmbpz jzmbpz;
		
		private List<Jzmbpz> jzmbpzs;
		
		private String dwbm;
		
		private String dwmc;
		
		private String bmbm;
		
		private String jsbm;
		
		private String ajlbbm;
		
		private String ajlbmc;
		
		private String sslbbm;
		
		private String sslbmc;
		
		private String pzbm;
		//所属模板名称
		private String sslb_mc_bm;
		
		//首页
		String about;
		//配置编码
		String dossiertypevaluemember;
	
		private JsonListResult jsonListResult;
		
		public String input(){
			
			return "input";
		}
		//模板列表
		public  String queryList(){
			YhModel yh=YhSession();
			try {
				addLog("sss");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Map<String, Object> map=Maps.newHashMap();
			map.put("dwbm", yh.getDwbm());
			map.put("bmbm", yh.getBmbm());
			map.put("jsbm", yh.getJsbm().split(","));
			map.put("about", about);
			map.put("dossiertypevaluemember", dossiertypevaluemember);
			jzmbpzs=(List<Jzmbpz>) MbpzService.queryByMap(map);
			jsonListResult=new JsonListResult(jzmbpzs);
			return "success";
		}
		//添加
		public  String add(){
			Yh yhn=YhSession1();
			YhModel yh=YhSession();
			Map<String, Object> map=Maps.newHashMap();
			map.put("yh", yh);
			map.put("dwbm", yh.getDwbm());
			map.put("dwmc",yh.getDwmc() );
			map.put("ajlbbm", ajlbbm);
			map.put("ajlbmc", ajlbmc);
			map.put("sslbmc", sslbmc);
			map.put("sslbbm", sslbbm);
			map.put("sslb_mc_bm", sslb_mc_bm);
			MbpzService.add(map);
			return "add";
				}
		public String queryByMb(){
			Map<String, Object> map=Maps.newHashMap();
			map.put("ajlbbm", ajlbbm);
			map.put("dwbm",dwbm);
			List list=(List) MbpzService.queryByMb(map);
			jsonListResult=new JsonListResult(list);
			return "success";
		}
		//删除sslb
		public String delete_sslb(){
			Map<String, Object> map=Maps.newHashMap();
			map.put("sslb", pzbm);
			MbpzService.delete_sslb(map);
			return  "delete";
		} 
		//删除模板
		public String delete_Mb(){
			Map<String, Object> map=Maps.newHashMap();
			map.put("dossiertypevaluemember", dossiertypevaluemember);
			MbpzService.delete_Mb(map);
			return  "delete";
		} 


		/**
		 * @return the mbpzService
		 */
		public MbpzService getMbpzService() {
			return MbpzService;
		}




		/**
		 * @param mbpzService the mbpzService to set
		 */
		public void setMbpzService(MbpzService mbpzService) {
			MbpzService = mbpzService;
		}




		/**
		 * @return the jzmbpz
		 */
		public Jzmbpz getJzmbpz() {
			return jzmbpz;
		}

		/**
		 * @param jzmbpz the jzmbpz to set
		 */
		public void setJzmbpz(Jzmbpz jzmbpz) {
			this.jzmbpz = jzmbpz;
		}

		/**
		 * @return the jzmbpzs
		 */
		public List<Jzmbpz> getJzmbpzs() {
			return jzmbpzs;
		}

		/**
		 * @param jzmbpzs the jzmbpzs to set
		 */
		public void setJzmbpzs(List<Jzmbpz> jzmbpzs) {
			this.jzmbpzs = jzmbpzs;
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
		 * @return the sslb_mc_bm
		 */
		public String getSslb_mc_bm() {
			return sslb_mc_bm;
		}
		/**
		 * @param sslb_mc_bm the sslb_mc_bm to set
		 */
		public void setSslb_mc_bm(String sslb_mc_bm) {
			this.sslb_mc_bm = sslb_mc_bm;
		}
		/**
		 * @return the ajlbbm
		 */
		public String getAjlbbm() {
			return ajlbbm;
		}
		/**
		 * @param ajlbbm the ajlbbm to set
		 */
		public void setAjlbbm(String ajlbbm) {
			this.ajlbbm = ajlbbm;
		}
		/**
		 * @return the ajlbmc
		 */
		public String getAjlbmc() {
			return ajlbmc;
		}
		/**
		 * @param ajlbmc the ajlbmc to set
		 */
		public void setAjlbmc(String ajlbmc) {
			this.ajlbmc = ajlbmc;
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
		 * @return the sslbmc
		 */
		public String getSslbmc() {
			return sslbmc;
		}
		/**
		 * @param sslbmc the sslbmc to set
		 */
		public void setSslbmc(String sslbmc) {
			this.sslbmc = sslbmc;
		}
		/**
		 * @return the dwmc
		 */
		public String getDwmc() {
			return dwmc;
		}
		/**
		 * @param dwmc the dwmc to set
		 */
		public void setDwmc(String dwmc) {
			this.dwmc = dwmc;
		}
		/**
		 * @return the pzbm
		 */
		public String getPzbm() {
			return pzbm;
		}
		/**
		 * @param pzbm the pzbm to set
		 */
		public void setPzbm(String pzbm) {
			this.pzbm = pzbm;
		}
		/**
		 * @return the about
		 */
		public String getAbout() {
			return about;
		}
		/**
		 * @param about the about to set
		 */
		public void setAbout(String about) {
			this.about = about;
		}
		/**
		 * @return the dossiertypevaluemember
		 */
		public String getDossiertypevaluemember() {
			return dossiertypevaluemember;
		}
		/**
		 * @param dossiertypevaluemember the dossiertypevaluemember to set
		 */
		public void setDossiertypevaluemember(String dossiertypevaluemember) {
			this.dossiertypevaluemember = dossiertypevaluemember;
		}
		
		

}
