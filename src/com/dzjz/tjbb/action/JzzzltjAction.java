/**
 * 
 */
package com.dzjz.tjbb.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.tjbb.service.JzzzltjService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class JzzzltjAction extends BaseAction{
	
	private JzzzltjService jzzzltjService;
	
	private String dwbm;
	
	private String gh;
	//获取页面得到的条件
	private String get_where;
	
	private JsonListResult jsonListResult;
	
	public String input(){
		
		return "input";
	}
	
	public String dwjzzztj(){
		String where="";
		Map< String, Object> map =Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		//判断时间是否为空
		if(get_where.trim()==","){
			map.put("get_where", where);
		}else{
			String [] data=get_where.split(",");
			String cjrq1=data[0];
			String cjrq2=data[1];
			if(cjrq1.trim()!=null&&cjrq1.trim()!=""){
				where+=" and jz.CJSJ >= to_date('"+cjrq1+"','yyyy-mm-dd')";
			}
			if(cjrq2.trim()!=null&&cjrq2.trim()!=""){
				where+=" and jz.CJSJ <= to_date('"+cjrq2+"','yyyy-mm-dd')";
			}
			map.put("get_where", where);
		}
		
		jzzzltjService.dwjzzztj(map);
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		try {
			addLog("卷宗工作量统计查询");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(map);
		return "success";
	}
	//卷宗制作情况业务类型统计
	public String dwjzzzyw(){
		String where="";
		Map< String, Object> map =Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		String [] data=get_where.split(",");
		String cjrq1=data[1];
		String cjrq2=data[2];
		where +=data[0];
		if(cjrq1.trim()!=null&&cjrq1.trim()!=""){
			where+=" and tj.CJSJ >= to_date('"+cjrq1+"','yyyy-mm-dd')";
		}
		if(cjrq2.trim()!=null&&cjrq2.trim()!=""){
			where+=" and tj.CJSJ <= to_date('"+cjrq2+"','yyyy-mm-dd')";
		}
		map.put("get_where", where);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		jzzzltjService.dwjzzzyw(map);
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		return "success";
	}

	/**
	 * @return the jzzzltjService
	 */
	public JzzzltjService getJzzzltjService() {
		return jzzzltjService;
	}

	/**
	 * @param jzzzltjService the jzzzltjService to set
	 */
	public void setJzzzltjService(JzzzltjService jzzzltjService) {
		this.jzzzltjService = jzzzltjService;
	}

	/**
	 * @return the dwbm
	 */
	public String getDwbm() {
		return dwbm;
	}

	/**
	 * @param dwbm the dwbm to set
	 */
	public void setDwbm(String dwbm) {
		this.dwbm = dwbm;
	}

	/**
	 * @return the gh
	 */
	public String getGh() {
		return gh;
	}

	/**
	 * @param gh the gh to set
	 */
	public void setGh(String gh) {
		this.gh = gh;
	}

	/**
	 * @return the jsonListResult
	 */
	public JsonListResult getJsonListResult() {
		return jsonListResult;
	}

	/**
	 * @param jsonListResult the jsonListResult to set
	 */
	public void setJsonListResult(JsonListResult jsonListResult) {
		this.jsonListResult = jsonListResult;
	}

	/**
	 * @return the get_where
	 */
	public String getGet_where() {
		return get_where;
	}

	/**
	 * @param get_where the get_where to set
	 */
	public void setGet_where(String get_where) {
		this.get_where = get_where;
	}
	
	
	

}
