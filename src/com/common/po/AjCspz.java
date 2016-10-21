/**
 * 
 */
package com.common.po;

import java.util.Date;

/**
 * @author Administrator
 *
 */
public class AjCspz {
	private String csbh; 
	private String cskey; 
	private String csvalue; 
	private Date dysj; 
	private String fzbs;
	/**
	 * @return the csbh
	 */
	public String getCsbh() {
		return csbh;
	}
	/**
	 * @param csbh the csbh to set
	 */
	public void setCsbh(String csbh) {
		this.csbh = csbh;
	}
	/**
	 * @return the cskey
	 */
	public String getCskey() {
		return cskey;
	}
	/**
	 * @param cskey the cskey to set
	 */
	public void setCskey(String cskey) {
		this.cskey = cskey;
	}
	/**
	 * @return the csvalue
	 */
	public String getCsvalue() {
		return csvalue;
	}
	/**
	 * @param csvalue the csvalue to set
	 */
	public void setCsvalue(String csvalue) {
		this.csvalue = csvalue;
	}
	/**
	 * @return the dysj
	 */
	public Date getDysj() {
		return dysj;
	}
	/**
	 * @param dysj the dysj to set
	 */
	public void setDysj(Date dysj) {
		this.dysj = dysj;
	}
	/**
	 * @return the fzbs
	 */
	public String getFzbs() {
		return fzbs;
	}
	/**
	 * @param fzbs the fzbs to set
	 */
	public void setFzbs(String fzbs) {
		this.fzbs = fzbs;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "AjCspzService [csbh=" + csbh + ", cskey=" + cskey + ", csvalue=" + csvalue + ", dysj=" + dysj + ", fzbs="
				+ fzbs + "]";
	}
	

}
