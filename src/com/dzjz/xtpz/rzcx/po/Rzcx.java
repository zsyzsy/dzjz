/**
 * 
 */
package com.dzjz.xtpz.rzcx.po;

import java.util.Date;

/**
 * @author Administrator
 *
 */
public class Rzcx {

	private String xh; 
	
	private String dwbm; 
	
	private String dwmc; 
	
	private String bmbm; 
	
	private String bmmc; 
	
	private String czrgh; 
	
	private String czr; 
	
	private Date czsj; 
	
	private String czip; 
	
	private String czlx; 
	
	private String rznr; 
	
	private String czajbmsah; 
	
	private String fql;
	
	
	/**
	 * @param xh
	 * @param dwbm
	 * @param dwmc
	 * @param bmbm
	 * @param bmmc
	 * @param czrgh
	 * @param czr
	 * @param czsj
	 * @param czip
	 * @param czlx
	 * @param rznr
	 * @param czajbmsah
	 * @param fql
	 */
	public Rzcx( String dwbm,  String bmmc,  String czr, Date czsj, String czip,  String rznr) {
		super();
		this.dwbm = dwbm;
		this.bmmc = bmmc;
		this.czr = czr;
		this.czsj = czsj;
		this.czip = czip;
		this.rznr = rznr;
	}
	
	/**
	 * 
	 */
	public Rzcx() {
		super();
	}

	/**
	 * @return the xh
	 */
	public String getXh() {
		return xh;
	}
	/**
	 * @param xh the xh to set
	 */
	public void setXh(String xh) {
		this.xh = xh;
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
	 * @return the czrgh
	 */
	public String getCzrgh() {
		return czrgh;
	}
	/**
	 * @param czrgh the czrgh to set
	 */
	public void setCzrgh(String czrgh) {
		this.czrgh = czrgh;
	}
	/**
	 * @return the czr
	 */
	public String getCzr() {
		return czr;
	}
	/**
	 * @param czr the czr to set
	 */
	public void setCzr(String czr) {
		this.czr = czr;
	}
	
	/**
	 * @return the czsj
	 */
	public Date getCzsj() {
		return czsj;
	}
	/**
	 * @param czsj the czsj to set
	 */
	public void setCzsj(Date czsj) {
		this.czsj = czsj;
	}
	/**
	 * @return the czip
	 */
	public String getCzip() {
		return czip;
	}
	/**
	 * @param czip the czip to set
	 */
	public void setCzip(String czip) {
		this.czip = czip;
	}
	/**
	 * @return the czlx
	 */
	public String getCzlx() {
		return czlx;
	}
	/**
	 * @param czlx the czlx to set
	 */
	public void setCzlx(String czlx) {
		this.czlx = czlx;
	}
	/**
	 * @return the rznr
	 */
	public String getRznr() {
		return rznr;
	}
	/**
	 * @param rznr the rznr to set
	 */
	public void setRznr(String rznr) {
		this.rznr = rznr;
	}
	/**
	 * @return the czajbmsah
	 */
	public String getCzajbmsah() {
		return czajbmsah;
	}
	/**
	 * @param czajbmsah the czajbmsah to set
	 */
	public void setCzajbmsah(String czajbmsah) {
		this.czajbmsah = czajbmsah;
	}
	/**
	 * @return the fql
	 */
	public String getFql() {
		return fql;
	}
	/**
	 * @param fql the fql to set
	 */
	public void setFql(String fql) {
		this.fql = fql;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Rzcx [xh=" + xh + ", dwbm=" + dwbm + ", dwmc=" + dwmc + ", bmbm=" + bmbm + ", bmmc=" + bmmc + ", czrgh="
				+ czrgh + ", czr=" + czr + ", czsj=" + czsj + ", czip=" + czip + ", czlx=" + czlx + ", rznr=" + rznr
				+ ", czajbmsah=" + czajbmsah + ", fql=" + fql + "]";
	}
	
	
}
