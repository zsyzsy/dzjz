/**
 * 
 */
package com.dzjz.jzyj.dao;

import java.util.Collection;
import java.util.Map;

/**
 * @author Administrator
 *
 */
public interface LsajyjDao {
	
	//案件阅卷列表
	public Collection queryListyj(Map<String, ?> map);
	//案件阅卷案件详情树型
	public Collection queryListleftTreeyj(Map<String, ?> map);
}
