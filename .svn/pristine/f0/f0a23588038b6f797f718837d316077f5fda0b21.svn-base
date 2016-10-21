/**
 * 
 */
package com.common.dao;

import java.util.Collection;
import java.util.Map;

import com.common.CommInterface;
import com.common.po.AjCspz;
import com.common.po.Ajjbxx;
import com.dzjz.jzzz.ajjzzz.po.Jzjbxx;

/**
 * @author Administrator
 *
 */
public interface AjjbxxDao extends CommInterface<Ajjbxx>{
	public Collection<Ajjbxx> queryByMap(Map<String, ?> map);
	
	public Collection queryByMapBmsahId(Map<String, ?> map);
	
	public Collection queryByMapTysahId(Map<String, ?> map);
	
	public Collection jzjbxxByBmsahAndTysah(Map<String, ?> map);
	
	public Collection ajjbxxByBmsahAndTysah(Map<String, ?> map);
	
	//添加案件制作
	public void add_ajzz(Map<String, ?> map);
	//添加案件基本信息
	public void add_ajjbxx(Map<String, ?> map);
	public void updateajjbxx(Ajjbxx ajjbxx);
	public void updatejzjbxx(Jzjbxx jzjbxx);
	//案件制作时XT_DZJZ_ZZCS添加数据
	public void add(AjCspz ajCspz );
}
