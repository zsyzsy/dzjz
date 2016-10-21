/**
 * 
 */
package com.dzjz.jzzz.ajjzzz.action;

import java.util.List;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.jzzz.ajjzzz.po.Jzjbxx;
import com.dzjz.jzzz.ajjzzz.service.JzjbxxService;

/**
 * @author Administrator
 *
 */
public class JzjbxxAction extends BaseAction{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5416479133125113780L;

	private JzjbxxService jzjbxxService;
	
	private List<Jzjbxx> jzjbxxs;
	
	private Jzjbxx jzjbxx;
	
	private JsonListResult jsonListResult;
	
	private String jzbh;
	
	public String input(){
		
		return "input";
	}
	
	public String queryByMap(){
		jzjbxx=new Jzjbxx();
		jzjbxx.setJzbh(jzbh);
		jzjbxxs=(List<Jzjbxx>) jzjbxxService.queryByMap(jzjbxx);
		try {
			this.addLog("查看卷宗锁定解除列表");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jsonListResult=new JsonListResult(jzjbxxs);
		return "queryByMap";
	}
	public String delete(){
		Jzjbxx jzjbxx1=new Jzjbxx();
		jzjbxx1.setJzbh(jzbh);
		 jzjbxxService.delete(jzjbxx1);
		try {
			this.addLog("解锁卷宗编号为_"+jzbh+"_的案件");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "delete";
	}
	/**
	 * @return the jzjbxxService
	 */
	public JzjbxxService getJzjbxxService() {
		return jzjbxxService;
	}

	/**
	 * @param jzjbxxService the jzjbxxService to set
	 */
	public void setJzjbxxService(JzjbxxService jzjbxxService) {
		this.jzjbxxService = jzjbxxService;
	}

	/**
	 * @return the jzjbxxs
	 */
	public List<Jzjbxx> getJzjbxxs() {
		return jzjbxxs;
	}

	/**
	 * @param jzjbxxs the jzjbxxs to set
	 */
	public void setJzjbxxs(List<Jzjbxx> jzjbxxs) {
		this.jzjbxxs = jzjbxxs;
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
	 * @return the jzbh
	 */
	public String getJzbh() {
		return jzbh;
	}

	/**
	 * @param jzbh the jzbh to set
	 */
	public void setJzbh(String jzbh) {
		this.jzbh = jzbh;
	}
	
	
}
