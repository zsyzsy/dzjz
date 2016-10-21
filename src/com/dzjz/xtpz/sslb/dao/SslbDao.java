/**
 * 
 */
package com.dzjz.xtpz.sslb.dao;

import java.util.Collection;
import java.util.Map;

import com.common.CommInterface;
import com.dzjz.xtpz.sslb.po.Sslb;

/**
 * @author Administrator
 *
 */
public interface SslbDao extends CommInterface<Sslb> {
	
	//获取添加模板所属类别列表
		public Collection queryByWhereMap(Map<String, ?> map);

}
