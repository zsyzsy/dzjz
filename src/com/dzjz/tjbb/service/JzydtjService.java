/**
 * 
 */
package com.dzjz.tjbb.service;

import java.util.Collection;
import java.util.Map;

import com.dzjz.xtpz.qx.po.Ryjsfp;

/**
 * @author Administrator
 *
 */
public interface JzydtjService {
	//卷宗月度统计
			public Map<String, ?> casegroupmouth(Map<String, Object> map);
			//通过单位编码工号获取人员部门编码和角色编码
			public Collection<Ryjsfp> ryjsBydwgh(Map<String, ?> map);
}
