/**
 * 
 */
package com.dzjz.tjbb.dao;

import java.util.Map;

/**
 * @author Administrator
 *
 */
public interface JzzzlvtjDao {
	
	//统计查询卷宗制作率
	public Map<String, ?> casegroupbyunit(Map<String, ?> map);
	//案件类别制作率
	public Map<String, ?> casegroupbyunityw(Map<String, ?> map);

}
