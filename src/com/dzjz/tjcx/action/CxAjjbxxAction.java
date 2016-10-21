/**
 * 
 */
package com.dzjz.tjcx.action;

import com.common.BaseAction;
import com.common.service.AjjbxxService;

/**
 * @author Administrator
 *
 */
public class CxAjjbxxAction extends BaseAction{
	
	private AjjbxxService ajjbxxService;
	
	public String input(){
		try {
			addLog("案件基本情况查询列表");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "input";
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
	

}
