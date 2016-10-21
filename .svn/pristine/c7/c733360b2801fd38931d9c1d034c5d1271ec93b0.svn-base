/**
 * 
 */
package com.dzjz.xtpz.login.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.common.BaseAction;
import com.common.Md5;
import com.dzjz.xtpz.dw.po.Dw;
import com.dzjz.xtpz.login.service.LoginService;
import com.dzjz.xtpz.qx.po.Yh;
import com.dzjz.xtpz.qx.service.YhService;
import com.google.common.collect.Maps;
import com.opensymphony.xwork2.ActionContext;

/**
 * @author Administrator
 *
 */
public class LoginAction  extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5469474024646679145L;
	private LoginService loginService;
	private YhService yhService;
	private String dwbm;
	private String dwmc;
	private String dlbm;
	private String kl;
	//新密码
	private String xkl;
	//确认密码
	private String qkl;
	private Yh yh;
	private List<Yh> yhs;
	
	public String input(){
		
		return "input";
	}

	public String login(){
		Md5 md5=new Md5();
		Yh y1=new Yh();
		y1.setDlbm(dlbm);
		Dw d1=new Dw();
		d1.setDwbm(dwbm);
		y1.setDwbm(d1);
		yhs=(List<Yh>) yhService.queryByMap(y1);
		if(yhs.size()!=0){
			yh=yhs.get(0);
			//判断kl是否正确
			if(yh.getKl().equals(md5.string2MD5(kl.trim()))){
				//将用户信息存入session中
				ServletActionContext.getRequest().getSession().setAttribute("userName",yh);
				ActionContext.getContext().getSession().put("yh", yh);
				ActionContext.getContext().getSession().put("dwbm", dwbm);
				ActionContext.getContext().getSession().put("dlbm", dlbm);
//				ServletActionContext.getRequest().getSession().setMaxInactiveInterval(10);
				return "success";
			}else {
				this.errMsg="密码输入错误";
				ActionContext.getContext().put("errMsg", errMsg);
				return "error";
			}
		}else {
			this.errMsg="密码输入错误";
			ActionContext.getContext().getSession().put("errMsg", errMsg);
			return "error";
		}
	}
	//退出
	public String loginOut(){
		ActionContext.getContext().getSession().remove("yh");
		ActionContext.getContext().getSession().remove("dwbm");
		ActionContext.getContext().getSession().remove("dlbm");
			return "out";
	}
	//修改密码
	public String updateMm(){
		Md5 md5=new Md5();
		Map<String, Object> map=Maps.newHashMap(); 
		yh=new Yh();
		yh=(Yh) ActionContext.getContext().getSession().get("yh");
		if(yh.getKl().trim().equals(md5.string2MD5(kl.trim()))){
			map.put("kl", md5.string2MD5(xkl.trim()));
			map.put("dwbm",yh.getDwbm().getDwbm());
			map.put("gh", yh.getGh());
			loginService.updateMm(map);
//			this.success="密码修改成功请重新登录";
//			ActionContext.getContext().getSession().put("success", success);
			return "update";
		}else{
			this.errMsg="密码输入错误";
			ActionContext.getContext().getSession().put("errMsg", errMsg);
			return "error";
			
		}
	
}
	/**
	 * @param string
	 */
	private void anErrorMessage(String string) {
		// TODO Auto-generated method stub
		
	}


	/**
	 * @return the loginService
	 */
	public LoginService getLoginService() {
		return loginService;
	}


	/**
	 * @param loginService the loginService to set
	 */
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
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
	 * @return the dlbm
	 */
	public String getDlbm() {
		return dlbm;
	}


	/**
	 * @param dlbm the dlbm to set
	 */
	public void setDlbm(String dlbm) {
		this.dlbm = dlbm;
	}


	/**
	 * @return the kl
	 */
	public String getKl() {
		return kl;
	}


	/**
	 * @param kl the kl to set
	 */
	public void setKl(String kl) {
		this.kl = kl;
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
	 * @return the xkl
	 */
	public String getXkl() {
		return xkl;
	}
	/**
	 * @param xkl the xkl to set
	 */
	public void setXkl(String xkl) {
		this.xkl = xkl;
	}
	/**
	 * @return the qkl
	 */
	public String getQkl() {
		return qkl;
	}
	/**
	 * @param qkl the qkl to set
	 */
	public void setQkl(String qkl) {
		this.qkl = qkl;
	}
	
	
	

}
