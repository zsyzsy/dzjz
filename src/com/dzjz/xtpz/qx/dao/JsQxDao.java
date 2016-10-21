/**
 * 
 */
package com.dzjz.xtpz.qx.dao;

import java.util.Collection;
import java.util.Map;

import com.dzjz.xtpz.qx.po.Js;

/**
 * @author Administrator
 *
 */
public interface JsQxDao {
	//获取单位部门角色
	public Map<String , ?> getSearchList(Map<String, ?> map);
	//通过单位编码获取单位信息
	public Map<String , ?> dwinfo(Map<String, ?> map);
	//通过单位编码部门编码获取单位信息
	public Map<String , ?> bminfo(Map<String, ?> map);
	//通过单位编码部门编码获取角色信息
	public Map<String , ?> jsinfo(Map<String, ?> map);
	//通过单位编码部门编码角色获取人员信息
	public Collection ryBydwjsbm(Map<String, ?> map);
	
	public Map<String, Object> ryBydwjsbm1(Map<String, ?> map);
	//通过单位编码部门编码角色编码获取分配案件类型情况
	public Collection ajlbqx(Map<String, ?> map);
	//通过单位编码部门编码角色编码获取分配案件类型情况
	public Collection ryjsBydwjsbm(Map<String, ?> map);
	//通过单位编码部门编码角色编码查询是否存在该数据
	public Collection queryQxByDwBmJs(Map<String, ?> map);
	
	//添加部门
	public void add_bminfo(Map<String, ?> map);
	//添加角色
	public void add_jsinfo(Map<String, ?> map);
	//添加角色功能权限
	public void add_jsgnqx(Map<String, ?> map);
	//添加角色案件类别权限
	public void add_ajlbqx(Map<String, ?> map);
	//添加角色单位权限
	public void add_dwqx(Map<String, ?> map);
	//添加角色人员权限
	public void add_ryqx(Map<String, ?> map);
	//编辑角色
	public void update(Js js);
	//删除角色
	public void delete(Map<String, ?> map);
	//删除角色功能权限
	public void delete_jsgnqx(Map<String, ?> map);
	//删除角色功能权限
	public void delete_ajlbqx(Map<String, ?> map);
	//删除角色单位权限
	public void delete_dwqx(Map<String, ?> map);
	//删除角色人员权限
	public void delete_ryqx(Map<String, ?> map);
	//根据角色查询未分配权限
	public Collection wfpGndyByJs(Map<String, ?> map);
	//根据角色查询未分配权限
	public Collection yfpGndyByJs(Map<String, ?> map);
	//根据角色编码单位编码查询单位权限
	public Collection dwqx(Map<String, ?> map);
	
}
