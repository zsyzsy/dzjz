/**
 * 
 */
package com.common;

import java.util.List;

import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.qx.po.Yh;
import com.dzjz.xtpz.qx.service.YhService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author change
 *
 */
public class YhGetSession extends ActionSupport{
	
	private YhService yhService;
	private Yh yh;
	/**
	 * 
	 * 
	 * @return 用户信息
	 */
	public Yh YhSession(){
		//获取登陆后的session值
		String dwbm= (String) ActionContext.getContext().getSession().get("dwbm");
		String dlbm= (String) ActionContext.getContext().getSession().get("dlbm");
		Yh t=new Yh();
		Dw dw=new Dw();
		dw.setDwbm(dwbm);
		t.setDlbm(dlbm);
		t.setDwbm(dw);
		//查询用户
		yhService.queryByMap(t);
		List<Yh> list=(List<Yh>) yhService.queryByMap(t);
		yh=list.get(0);
		return yh;
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
	

}
