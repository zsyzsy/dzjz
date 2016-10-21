/**
 * 
 */
package com.dzjz.xtpz.cspz.po;

import com.common.StatusFormatBean;


/**
 * @author Administrator
 *
 */
public class Cspz {
//配置标示
	public static final StatusFormatBean[] PZBS_ARRAYS=new StatusFormatBean[]{
			
//								new StatusFormatBean(1,"定时清务"),
								new StatusFormatBean(2,"ICE消息包大小"),
								new StatusFormatBean(3,"访问统一业务ICE地址"),
//								new StatusFormatBean(4,"卷宗文件存储路径"),
								new StatusFormatBean(5,"文件存储空间大小分配"),
								new StatusFormatBean(6,"卷宗文件上传地址"),
//								new StatusFormatBean(7,"律师资质文件存储路径"),
								new StatusFormatBean(8,"卷宗文件下载地址"),
								new StatusFormatBean(9,"路由映射地址"),
								new StatusFormatBean(10,"连接类型")
								};
	private String pzbm;
	private String systemmark; 
	private int configid; 
	private String configname; 
	private String configvalue;
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
	 * @return the systemmark
	 */
	public String getSystemmark() {
		return systemmark;
	}
	/**
	 * @param systemmark the systemmark to set
	 */
	public void setSystemmark(String systemmark) {
		this.systemmark = systemmark;
	}
	/**
	 * @return the configid
	 */
	public int getConfigid() {
		return configid;
	}
	/**
	 * @param configid the configid to set
	 */
	public void setConfigid(int configid) {
		this.configid = configid;
	}
	/**
	 * @return the configname
	 */
	public String getConfigname() {
		return configname;
	}
	/**
	 * @param configname the configname to set
	 */
	public void setConfigname(String configname) {
		this.configname = configname;
	}
	/**
	 * @return the configvalue
	 */
	public String getConfigvalue() {
		return configvalue;
	}
	/**
	 * @param configvalue the configvalue to set
	 */
	public void setConfigvalue(String configvalue) {
		this.configvalue = configvalue;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Cspz [pzbm=" + pzbm + ", systemmark=" + systemmark + ", configid=" + configid + ", configname="
				+ configname + ", configvalue=" + configvalue + "]";
	}
	
	

}
