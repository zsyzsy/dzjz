/**
 * 
 */
package com.dzjz.xtpz.qx.dao;

import java.util.Collection;

import com.common.CommInterface;
import com.dzjz.xtpz.qx.po.Js;
import com.dzjz.xtpz.qx.po.Yh;

/**
 * @author Administrator
 *
 */
public interface JsDao extends CommInterface<Js>{
	
	public Collection<Yh> yhid(String dwbm,String gh);
	

}
