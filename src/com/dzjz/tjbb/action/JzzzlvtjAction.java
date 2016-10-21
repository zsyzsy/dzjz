/**
 * 
 */
package com.dzjz.tjbb.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.common.BaseAction;
import com.common.JsonListResult;
import com.dzjz.tjbb.service.JzzzlvtjService;
import com.google.common.collect.Maps;

/**
 * @author Administrator
 *
 */
public class JzzzlvtjAction extends BaseAction{
	
	private JzzzlvtjService jzzzlvtjService;
	
	private String dwbm;
	
	private String gh;
	//获取页面得到的条件
	private String get_where;
	
	private JsonListResult jsonListResult;
	
	public String input(){
		
		return "input";
	}
	
	public String casegroupbyunit(){
		String where ="";
		Map< String, Object> map =Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		map.put("get_where", get_where);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		//判断时间是否为空
		String [] data=get_where.split(",");
		if(data.length==3){
			String dwbm1=data[0];
			String cjrq1=data[1];
			String cjrq2=data[2];
			if(cjrq1.trim()!=null&&cjrq1.trim()!=""){
				where+=" and AJ.slrq >= to_date('"+cjrq1+"','yyyy-mm-dd')";
			}
			if(cjrq2.trim()!=null&&cjrq2.trim()!=""){
				where+=" and AJ.slrq <= to_date('"+cjrq2+"','yyyy-mm-dd')";
			}
			if(dwbm1.trim()!=null&&dwbm1.trim()!=""){
				where+=" and AJ.CBDW_BM="+dwbm1;
			}
			map.put("get_where", where);
		}
		jzzzlvtjService.casegroupbyunit(map);
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		try {
			addLog("卷宗制作率统计");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	//案件类别制作率
	public String casegroupbyunityw(){
		String where="";
		Map< String, Object> map =Maps.newHashMap();
		map.put("dwbm", dwbm);
		map.put("gh", gh);
		String [] data=get_where.split(",");
		String cjrq1=data[1];
		String cjrq2=data[2];
		where +=data[0]+" and yw.ywbm is not null ";
		if(cjrq1.trim()!=null&&cjrq1.trim()!=""){
			where+=" and aj.CJSJ >= to_date('"+cjrq1+"','yyyy-mm-dd')";
		}
		if(cjrq2.trim()!=null&&cjrq2.trim()!=""){
			where+=" and aj.CJSJ <= to_date('"+cjrq2+"','yyyy-mm-dd')";
		}
		map.put("get_where", where);
		map.put("p_cursor", new ArrayList<Map<String, Object>>());
		map.put("p_errmsg", "sss");
		jzzzlvtjService.casegroupbyunityw(map);
		List list=(List) map.get("p_cursor");
		jsonListResult=new JsonListResult(list);
		return "success";
	}

	/**
	 * @return the jzzzlvtjService
	 */
	public JzzzlvtjService getJzzzlvtjService() {
		return jzzzlvtjService;
	}

	/**
	 * @param jzzzlvtjService the jzzzlvtjService to set
	 */
	public void setJzzzlvtjService(JzzzlvtjService jzzzlvtjService) {
		this.jzzzlvtjService = jzzzlvtjService;
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

	

}
