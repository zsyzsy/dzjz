/**
 * 
 */
package com.dzjz.xtpz.qx.service;

import java.util.Collection;
import java.util.Map;

import com.common.CommInterface;
import com.dzjz.xtpz.qx.po.Yh;

/**
 * @author Administrator
 *
 */
public interface YhService extends CommInterface<Yh>{
	//通过单位编码及工号获取bmjs信息
		public Collection ryinfo(Map<String, ?> map);
		//通过单位编码及工号获取js信息
		public Collection ryjs(Map<String, ?> map);
	//重置密码
		public void resetMm(Yh yh);
}
