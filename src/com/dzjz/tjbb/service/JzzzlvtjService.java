/**
 * 
 */
package com.dzjz.tjbb.service;

import java.util.Map;

/**
 * @author Administrator
 *
 */
public interface JzzzlvtjService {
	
		//统计查询卷宗制作率
		public Map<String, ?> casegroupbyunit(Map<String, ?> map);
		//案件类别制作率
		public Map<String, ?> casegroupbyunityw(Map<String, ?> map);


}
