<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8" />
    <title>卷宗制作情况查询</title>
    <link rel="stylesheet" type="text/css" href="js/easyUi/themes/easyui.css"/>
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
     <script type="text/javascript" src="js/easyUi/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.mobile.js"></script>
    <script src="js/easyUi/newdata.js"></script>
        <style>
        
        /*重置已定义的css样式 */
        .l-tree .l-tree-icon-folder-open {
            background-position: -87px -238px;
        }
        .l-tree .l-tree-icon-leaf {
            background-position: -87px -238px;
        }
        .l-tree .l-tree-icon-folder {
            background-position:-87px -238px;
        }
        .l-text {
          margin-left: 2px;
            width: 105px;
        }
        .l-text-field {
            width: 102px;
        }

        .l-text.l-text-combobox {
          margin-top: 4px;
          margin-left: 3px;
        }
        /********  表格部分超过，自动隐藏 ***********/
        .l-grid-row-cell-inner {
		     white-space: nowrap; 
		     overflow: hidden; 
		     text-overflow: ellipsis;
			}
        
        input {
            height: 20px;
            line-height: 20px;
            outline: none;
            margin-left: 3px;
            padding-left: 3px;
            border: 1px solid #AECAF0;
        }
        .l-text-wrapper {
            width: 100px;
            position: relative;
            float: left;
        }
    
        .l-textarea{
          width: 460px; height: 100px;margin-left: 2px;border: 1px solid #AECAF0;outline: none;
        }
        input.l-text,.add_text {
          width: 163px;
        }
.textbox {
    border: 1px solid #AECAF0;
  
}
.textbox-focused{
box-shadow:none;
}


.table {
	    min-width: 1300px;
	    line-height: 28px;
	    padding-bottom: 5px;
	    overflow: auto;
	    zoom: 1;
		}
.table	td {
    width: 200px;
}
td.td1 {
    width: 140px;
}
.table .td {
	width: 63px;
	text-align: right;
}
td.time {
    width: 100px;
}
td.cx {
    width: 70px;
}
	
        .table img{
            vertical-align: middle;
            margin-top: -3px;
            padding-left: 5px;
        }
        .cx{
            height: 20px;
            margin-top: 3px;
            line-height: 20px;
            border: 1px solid #AECAF0;
            background: #E0EDFF url('images/header-bg.gif') repeat-x center;
            float: left;overflow: hidden;margin-left: 10px;
        }
        .cx span{
            padding-left:10px;
            letter-spacing:5px;
        }
        .cx:hover{
            cursor: pointer;
            background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
            border-color: #D6A886;
        }
    </style>
    <script>
   
    
//     var result1=eval("("+result+")");
            var manager ;	
        $(function (){
        	ajinfo();
        })
            function ajinfo(){

        	$("#dwbm").val('${sessionScope.yh.dwbm.dwbm}');
        	$("#gh").val('${sessionScope.yh.gh}');
            $("#rq1,#rq2").ligerDateEditor();
            var dwbm=$("#dwbm").val();
            var gh=$("#gh").val();
            var rq1=$("#rq1").val();
//            表格
            	 jQuery.post("cxAjjzzzlAction!dwjzzzcx?dwbm="+dwbm+"&&gh="+gh,function(data){
									console.log("---");
									console.log(data);
									console.log("------");
            	manager = $("#maingrid").ligerGrid({
                    height: '99%',
                    width: '99%',
                    columns: [
                              { display: '案件名称', name: 'AJMC', minWidth: 50 },
                              { display: '部门受案号', name: 'BMSAH', minWidth: 300 },
                              { display: '案件类别', name: 'AJLB_MC', minWidth: 50 },
                              { display: '承办单位', name: 'CBDW_MC', minWidth: 50 },
                              { display: '承办部门', name: 'CBBM_MC', minWidth: 50 },
                              { display: '承办人', name: 'CBR', minWidth: 50 },
                              { display: '卷数', name: 'JNUM', minWidth: 50 },
                              {  display: '文件数', name: 'WJNUM', minWidth: 50},
                              {  display: '文件页数', name: 'WJYNUM', minWidth: 50}
                          ],pageSizeOptions:[50, 100, 150, 200, 250], pageSize:50,rownumbers: true,where : f_getWhere(),
                          data:data
                });

            	 })
                $("#pageloading").hide();
                }
    </script>
</head>
<body>
<div class="l-loading" style="display:block" id="pageloading"></div>
<div style="overflow: auto;margin:10px;">
	<s:textfield  style="display:none" id="dwbm" name="dwbm"  />
	<s:textfield  style="display:none" id="gh" name="gh"  />
	<table class="table">
	    <tr>
	        <td class="td">单位名称:</td><td><input type="text" id="txt1"/></td>
	
	        <td style="width:73px;"><span style="margin-left:10px;">部门受案号:</span></td><td class="td1"><input type="text" id="bmsah" /></td>
	        
	          <td class="td">案件名称:</td><td class="td1"><input type="text" id="ajmc" /></td>
	
<!-- 	        <td class="td">开始日期:</td><td class="time"><input type="text" id="rq1" /></td> -->
<!-- 			<td style="width: 40px;text-align: center;">-</td><td class="time"><input type="text" id="rq2" /></td> -->
	
	        <td class="td">承办人:</td><td class="td1"><input type="text" id="cbr" /><input type="hidden" id="zzzt" value=""></input></td>
	      
	
	        <td onclick="f_search()" class="cx"><img src="images/search.gif"  alt="查询" /><span>查询</span></td>
	        <td onclick="ajjzzz_PDF()" class="cx"><img src="images/Redo.png"  alt="导出PDF" /><span>导出PDF</span></td>
	    </tr>
	</table>
</div>
<!-- <div style="margin: 10px;overflow: hidden"> -->
<!-- <!-- 隐藏属性 -->
<%--         				<s:textfield  style="display:none" id="dwbm" name="dwbm"  /> --%>
<%--         				<s:textfield  style="display:none" id="gh" name="gh"  /> --%>
<!--     <p> -->
<%--         <span style="float: left;margin-top: 3px;margin-right: 2px;">单位名称:</span><input type="text" id="txt1"/> --%>
<%--         <span class="rzcx_czmc">部门受案号:</span><input type="text" id="bmsah" /> --%>
<%--         <span class="rzcx_czrxm">案件名称:</span><input type="text" id="ajmc" /> --%>
<!--     </p> -->
<!--     <p class="rzcx_ri"> -->
<%--         <span style="margin-top: 2px; margin-right: 2px;margin-left: -2px;">开始日期:</span><input type="text" id="rq1" /> --%>
<%--         <span class="sapn">-</span><input type="text" id="rq2" />  --%>
<%--         <span class="ajjz_cbr">承办人:<input type="text" id="cbr" /></span> --%>

<%-- <%--         <span class="ajjz_zzzt">制作状态:</span> --%>
<%-- <%--         <select class="select"  id="secelt"> --%> 
<!-- <!-- 	        <option value="全部">全部</option> --> 
<!-- <!-- 	        <option value="未制作">未制作</option> --> 
<!-- <!-- 	        <option value="已制作">已制作</option> --> 
<%-- <%--         </select> --%> 
<!-- 		<input type="hidden" id="zzzt" value=""></input> -->
<%--         <span class="sbxx_cx" onclick="f_search()" > --%>
<!--         	<input class="rzcx_cx" type="button" value="查询" /> -->
<!--             <img src="images/search.gif" alt=""/> -->
<%--         </span> --%>
<%--         <span class="sbxx_cx" style="margin-left: 30px;"><input class="rzcx_cx" type="button" value="导出PDF"  onclick="ajjzzz_PDF();"/> --%>
<!--             <img src="images/Redo.png" alt=""/> -->
<%--         </span> --%>

<!--     </p> -->
<!-- </div> -->

<!--表格-->
<div class="l-clear"></div>

<div id="maingrid"></div>
<div style="display:none;">

</div>
  <!------------案件类别--------------->
<script type="text/javascript">
//搜索下拉列表
jQuery.post("dwlist!queryList",function(data){
    var getData=data.rows;
    var newdata=[];
    for(var i=0;i<getData.length;i++){
        newdata[i]={id:getData[i].dwbm,dwmc:getData[i].dwmc,parentId:getData[i].fdwbm}
    }
    var result = convert (newdata);
    $('#txt1').combotree({
        data:result,
        valueField: "id",
        text:"text",
        width:200,
        height:22,
        lines:true,
        editable:true,
        onClick:function(data){
        	 //设置隐藏属性dwbm值
//             $("#dwbm").val(data.id);
            //设置显示单位名称
            $("#txt1").val(data.text);
        }
    });
//     $("#txt1").ligerComboBox({
//         width: 238,
//         selectBoxWidth: 238,
//         selectBoxHeight: 238,
//         textField:'dwmc',
//         valueField: 'dwmc',
//         treeLeafOnly:false,
//         valueFieldID: 'test3',
//         tree: {
//             data:getData,
//             checkbox: false,
//             textFieldName:"dwmc",
//             idFieldName:"dwbm",
//             parentIDFieldName:"fdwbm",
//             onclick:function(){
//                 getSelected();
//             }
//         }
//     });
})
     //获取选中的值
        function  getSelected(){
            $("#txt1").val($("#test3").val());
           
            }
var manager;
var g;
var kssj;
var jssj;
var bjsj;
var ccc;
var secelt;
//查询
function f_search()
{
	$("#dwbm").val('${sessionScope.yh.dwbm.dwbm}');
	$("#gh").val('${sessionScope.yh.gh}');
    $("#rq1,#rq2").ligerDateEditor();
    var dwbm=$("#dwbm").val();
    var gh=$("#gh").val();
    var rq1=$("#rq1").val();
//    表格
    	 jQuery.post("cxAjjzzzlAction!dwjzzzcx?dwbm="+dwbm+"&&gh="+gh,function(data){
  	 manager.options.data = data;
  	 manager.loadData(f_getWhere());
	 })
}
// 制作状态
$("#secelt").change(function ()
		    {  
	  		$("#zzzt").val(this.value);  //将选择的值赋给$("#zzzt")
		    });

function f_getWhere()
{
    if (!manager) return null;
    var clause = function (rowdata, rowindex)
    {
//     	var czsj = "2016-05-03"; ///没有获取到值         
//     	var czsjTime = czsj.substring(0,10);
//         var Company=get_unix_time(czsj);
//         kssj=get_unix_time($("#rq1").val());
//         jssj=get_unix_time($("#rq2").val());
//         //时间判断
//          if(Company>kssj&&Company<=jssj){
//              bjsj=Company;
//         }
        
        //获取单位名称
        var key = $("#txt1").val();
        var bmsah=$("#bmsah").val();
        var ajmc=$("#ajmc").val();
          
        
        var cbr=$("#cbr").val();
		  	 var CBR=rowdata.CBR; //  获取数据承办人姓名
		  	 if(CBR==null){
			  	 ccc=" ";
			  	 }else{
			  		ccc=CBR;
				  	 }
		  	 // &&(Company.indexOf(bjsj) > -1)
        return ((rowdata.CBDW_MC.indexOf(key) > -1)&&(rowdata.BMSAH.indexOf(bmsah) > -1)&&(rowdata.AJMC.indexOf(ajmc) > -1)&&(ccc.indexOf(cbr) > -1));
    };
    manager.changePage("first"); //重置到第一页
    return clause; 
}
 //转换成时间戳
//  function get_unix_time(dateStr)
//  {
//      var newstr = dateStr.replace(/-/g,'/');
//      var date =  new Date(newstr);
//      var time_str = date.getTime().toString();
//      return time_str.substr(0, 10);
//  }

  ////////////////////////////////
  //////////导出PDF///////////////
  ///////////////////////////////
  function  ajjzzz_PDF(){
    var manager = $("#maingrid").ligerGetGridManager();
    var row = manager.getSelectedRow();
    if(!row){
      $.ligerDialog.warn('请先选择一条数据');
    }else {
    }
  }










</script>
</body>
</html>



