/**
 * 
 */
package com.dzjz.jzyj.service;

import java.util.Collection;
import java.util.Map;

import com.dzjz.jzyj.po.Lsajbd;
import com.dzjz.jzyj.po.Lsajwjfp;

/**
 * @author Administrator
 *
 */
public interface LsajbdService {
	
		//阅卷分配列表
		public Collection<Lsajbd> queryList(Map<String, ?> map);
		//阅卷分配列表案件绑定
		public Collection queryListaj(Map<String, ?> map);
		//左侧树型结构
		public Collection queryListleftTree(Map<String, ?> map);
		//分配人员绑定
		public Collection getPeople(Map<String, ?> map);
		//逻辑删除
		public void delete(Map<String, ?> map);
		//添加分配案件
		public void add_lsajbd(Lsajbd lsajbd);
		//添加分配案件文件
		public void add_lsajbdwj(Lsajwjfp lsajwjfp);

}
