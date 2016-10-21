/**
 * 
 */
package com.dzjz.tjbb.service;

import java.util.Map;

/**
 * @author Administrator
 *
 */
public interface JzzzgzltjService {
		//条件查询人员卷宗月制作量
		public Map<String, ?> getcasebyperson(Map<String, Object> map);
		//条件查询人员卷宗月制作量详情
		public Map<String, ?> getcasebypersonb(Map<String, Object> map);

}
