/**
 * 
 */
package com.dzjz.xtpz.qx.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.xtpz.bm.po.Bm;
import com.dzjz.xtpz.bm.service.BmService;
import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.gndy.service.GndyService;
import com.dzjz.xtpz.qx.po.Js;
import com.dzjz.xtpz.qx.service.JsQxService;
import com.dzjz.xtpz.qx.service.JsService;

/**
 * @author Administrator
 *
 */
public class JsQxAction extends BaseAction{
	
	private JsQxService jsQxService;
	
	private JsService jsService;
	
	private BmService bmService;
	
	private GndyService gndyService;
	
	private String dwbm;
	
	private String dwmc;
	
	private String bmbm;
	
	private String bmmc;
	
	private String bmjc;
	
	private String bmxh;
	
	private String bz;
	
	private String fbmbm;
	
	private String jsbm;
	
	private String jsmc;
	
	private String jsxh;
	
	private String spjsbm;
	
	private String gnbm;
	
	private String sffp;
	
	private String ajlbbm;
	
	private String ajlbmc; 
	
	private String gh;
	
	private JsonListResult jsonListResult;
	
	public String input(){
		
		return "input";
	}

	//获取单位部门角色信息
	public String getSearchList(){
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("dwbm", "370000");
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		//调用存储过程,使用map\接收
		jsQxService.getSearchList(map);
		//获取存储过程返回的集合
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		return "success";
	}
	//通过单位编码获取单位信息
	public String dwinfo(){
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("dwbm", dwbm);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		//调用存储过程,使用map\接收
		jsQxService.dwinfo(map);
		//获取存储过程返回的集合
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		return "success";
	}
	//通过单位编码部门编码获取部门信息
	public String bminfo(){
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("dwbm", dwbm);
		map.put("bmbm", bmbm);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		//调用存储过程,使用map\接收
		jsQxService.bminfo(map);
		//获取存储过程返回的集合
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		return "success";
	}
	//通过单位编码部门编码获取角色信息
	public String jsinfo(){
		Js js=new Js();
		js.setDwbm(dwbm);
		js.setBmbm(bmbm);
		js.setJsbm(jsbm);
		List<Js> list=(List<Js>) jsService.queryByMap(js);
		//获取存储过程返回的集合
		jsonListResult=new JsonListResult(list);
		return "success";
	}
	//通过单位编码部门编码获取角色信息
	public String ryBydwjsbm(){
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("dwbm",dwbm );
		map.put("bmbm",bmbm);
		map.put("jsbm", jsbm);
		List list = (List) jsQxService.ryBydwjsbm(map);
//		Map<Integer, Object> map1 =new HashMap<Integer, Object>();
//		String object = (String) jsQxService.ryBydwjsbm1(map).get("dlbm");
//		for (int i = 0; i < list.size(); i++) {
//			map1.put(i, list.get(i));
//		}
//		System.out.println(map1.get("dlbm"));
//		jsQxService.ryBydwjsbm(map).size();
		jsonListResult=new JsonListResult(list);
		return "success";
	}
	//通过单位编码部门编码获取角色信息
	public String ryjsBydwjsbm(){
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("dwbm",dwbm );
		map.put("bmbm",bmbm);
		map.put("jsbm", jsbm);
		List list = (List) jsQxService.ryjsBydwjsbm(map);
		jsonListResult=new JsonListResult(list);
		return "success";
	}
	
	//添加部门
		public String add_bminfo(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			
			map.put("bmmc",bmmc );
			map.put("bmjc",bmjc );
//			map.put("bmxh",1 );
			map.put("bz",bz );
			map.put("fbmbm",fbmbm );
			map.put("p_errmsg", "ss");
			jsQxService.add_bminfo(map);
			return "add_bminfo";
		}
		
		//添加角色
		public String add_jsinfo(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm", bmbm);
			map.put("jsmc",jsmc );
			map.put("jsxh",jsxh );
			map.put("p_errmsg", "ss");
			jsQxService.add_jsinfo(map);
			return "add_bminfo";
		}
		//添加角色功能权限
		public String add_jsgnqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm", bmbm);
			map.put("jsbm",jsbm );
			map.put("gnbm",gnbm );
			map.put("bz", "");
			map.put("p_errmsg", "ss");
			jsQxService.add_jsgnqx(map);
			return "add_bminfo";
		}
		//添加角色案件类别权限
		public String add_ajlbqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm", bmbm);
			map.put("jsbm",jsbm );
			map.put("ajlbbm",ajlbbm );
			map.put("ajlbmc",ajlbmc );
			jsQxService.add_ajlbqx(map);
			return "add";
		}
		//添加角色单位权限
		public String add_dwqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm", bmbm);
			map.put("jsbm",jsbm );
			map.put("ajlbbm",ajlbbm );
			map.put("ajlbmc",ajlbmc );
			jsQxService.add_dwqx(map);
			return "add";
		}
		//添加角色人员权限
		public String add_ryqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm", bmbm);
			map.put("jsbm",jsbm );
			map.put("gh",gh );
			jsQxService.add_ryqx(map);
			return "add";
		}
		//编辑部门
		public String update_bm(){
			Bm bm1=new Bm();
			Dw dw=new Dw();
			dw.setDwbm(dwbm);
			bm1.setDwbm(dw);
			bm1.setBmbm(bmbm);
			List<Bm> bms=(List<Bm>) bmService.queryByMap(bm1);
			Bm bm=bms.get(0);
			bm.setBmmc(bmmc);
			bm.setBmjc(bmjc);
			bm.setBz(bz);
			bmService.update(bm);
			
			return "update";
		}
		
		//编辑角色
		public String update_js(){
			Js js=new Js();
			js.setDwbm(dwbm);
			js.setBmbm(bmbm);
			js.setJsbm(jsbm);
			List<Js> js2=(List<Js>) jsService.queryByMap(js);
			js=new Js();
			js=js2.get(0);
			js.setJsmc(jsmc);
			js.setJsxh(jsxh);
				jsQxService.update(js);	
			return "update";
		}
		//删除角色
		public String delete_js(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm", bmbm);
			map.put("jsbm",jsbm );
			jsQxService.delete(map);
			return "delete";
		}
		//删除角色功能权限
		public String delete_jsgnqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("jsbm",jsbm );
			map.put("gnbm", gnbm);
			jsQxService.delete_jsgnqx(map);
			
			return "delete";
		}
		//删除角色案件类别权限
		public String delete_ajlbqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("jsbm",jsbm );
			map.put("bmbm", bmbm);
			map.put("ajlbbm", ajlbbm);
			jsQxService.delete_ajlbqx(map);
			
			return "delete";
		}
		//删除角色单位权限
		public String delete_dwqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("jsbm",jsbm );
			map.put("bmbm", bmbm);
			map.put("ajlbbm", ajlbbm);
			jsQxService.delete_dwqx(map);
			return "delete";
		}
		//删除角色人员权限
		public String delete_ryqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("jsbm",jsbm );
			map.put("bmbm", bmbm);
			map.put("gh", gh);
			map.put("yh", YhSessionByDwGh(dwbm, gh));
			jsQxService.delete_ryqx(map);
			return "delete";
		}
		//根据角色获取未分配权限
		public  String wfpGndyByJs(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm", bmbm);
			map.put("jsbm",jsbm );
			List list= (List) jsQxService.wfpGndyByJs(map);
			jsonListResult=new JsonListResult(list);
			return "success";
		}
		//根据角色获取未分配权限
		public  String yfpGndyByJs(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm", bmbm);
			map.put("jsbm",jsbm );
			List list= (List) jsQxService.yfpGndyByJs(map);
			jsonListResult=new JsonListResult(list);
			return "success";
		}
		//通过单位编码部门编码获取角色信息
		public String ajlbqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm",bmbm);
			map.put("jsbm",jsbm);
			//是否分配案件类别权限sffp===null未分配案件权限否则表示已分配案件权限
			map.put("sffp",sffp );
			
			System.out.println(sffp);
			List list= (List) jsQxService.ajlbqx(map);
			jsonListResult=new JsonListResult(list);
			return "success";
		}
		//通过单位编码角色编码获取单位权限
		public String dwqx(){
			Map<String, Object> map =new HashMap<String, Object>();
			map.put("dwbm",dwbm );
			map.put("bmbm",bmbm);
			map.put("jsbm",jsbm);
			map.put("sffp",sffp);
			
			List list= (List) jsQxService.dwqx(map);
			jsonListResult=new JsonListResult(list);
			return "success";
		}
	/**
	 * @return the jsService
	 */
	public JsService getJsService() {
		return jsService;
	}

	/**
	 * @param jsService the jsService to set
	 */
	public void setJsService(JsService jsService) {
		this.jsService = jsService;
	}

	/**
	 * @return the jsQxService
	 */
	public JsQxService getJsQxService() {
		return jsQxService;
	}

	/**
	 * @param jsQxService the jsQxService to set
	 */
	public void setJsQxService(JsQxService jsQxService) {
		this.jsQxService = jsQxService;
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
	 * @return the bmxh
	 */
	public String getBmxh() {
		return bmxh;
	}

	/**
	 * @param bmxh the bmxh to set
	 */
	public void setBmxh(String bmxh) {
		this.bmxh = bmxh;
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
	 * @return the jsmc
	 */
	public String getJsmc() {
		return jsmc;
	}

	/**
	 * @param jsmc the jsmc to set
	 */
	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
	}

	/**
	 * @return the jsxh
	 */
	public String getJsxh() {
		return jsxh;
	}

	/**
	 * @param jsxh the jsxh to set
	 */
	public void setJsxh(String jsxh) {
		this.jsxh = jsxh;
	}

	/**
	 * @return the spjsbm
	 */
	public String getSpjsbm() {
		return spjsbm;
	}

	/**
	 * @param spjsbm the spjsbm to set
	 */
	public void setSpjsbm(String spjsbm) {
		this.spjsbm = spjsbm;
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
	 * @return the sffp
	 */
	public String getSffp() {
		return sffp;
	}

	/**
	 * @param sffp the sffp to set
	 */
	public void setSffp(String sffp) {
		this.sffp = sffp;
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
