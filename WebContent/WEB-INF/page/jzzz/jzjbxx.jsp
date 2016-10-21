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
    <title>案件卷宗制作</title>
    <link rel="stylesheet" type="text/css" href="js/easyUi/themes/easyui.css" />
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
     <script src="js/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script> 
    <script src="js/ligerUI/js/plugins/ligerDrag.js"></script>
    <script src="js/ligerUI/js/plugins/ligerDialog.js"></script>
    <script src="js/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.mobile.js"></script>
    <script src="js/easyUi/newdata.js"></script>
        <style>
        html{
        font-family: "微软雅黑", "宋体", Arial, sans-serif;
        }
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
        .rzcx_czmc {
            margin-top: 3px;
            margin-left: 18px;
        }
        .rzcx_czrxm{
            margin-top: 3px;
            margin-left: 10px;
        }
        /*  日期  */
        .rzcx_ri{
            margin-top: 10px;
            overflow: hidden;
            zoom: 1;
        }
        .rzcx_ri span{
            float: left;
        }
        .rzcx_ri .sapn{
            margin-left: 7px;
            text-align: center;
            width: 26px;
        }
        .ajjz_cbr{
            margin-left: 20px;
        }
        .select{
        	width: 137px;
            float: left;
            margin-left: 2px;
            height: 22px;
            outline: none;
            line-height: 22px;
            border: 1px solid #AECAF0;
        }
        .ajjz_zzzt{
            margin-top: 2px;
            margin-left: 43px;
        }
        /*   查询*/
        .sbxx_cx{
            margin-left: 10px;
            position: relative;
        }
        .sbxx_cx .rzcx_cx{
            width: 80px;
            padding-left: 20px;
            height: 22px;
            background: url('images/header-bg.gif');
            line-height: 22px;
            border: 1px solid #AECAF0;
        }
        .sbxx_cx img{
            position: absolute;
            left: 10px;
            top: 3px;
        }
        .sbxx_cx .rzcx_cx:hover{
            cursor: pointer;
            background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
            border-color: #D6A886;
        }
        .l-textarea{
          width: 460px; height: 100px;margin-left: 2px;border: 1px solid #AECAF0;outline: none;
        }
        input.l-text,.add_text {
          width: 164px;
        }
/*添加案件和修改案件 */
/* #add_div tr:nth-child(2) { */
/*     position: absolute; */
/*         left: 106px; */
/*     	top: 16px; */
/*     	top: 0px\9; */
/*     	 behavior: url(js/ie-css3.htc); /* 通知IE浏览器调用脚本作用于'box'类 */ */
/* } */
/* /* #add_div tr>tr{ */ */
/* /* 		border:1px solid red; */ */
/* /* 		position: absolute; */ */
/* /*         left: 106px; */ */
    	
/* /* } */ */
/* #add_div tr:nth-child(2) input,#add_div tr:nth-child(9) input{ */
/*     width: 164px; */
/* } */
/* #add_div tr:nth-child(7) { */
/*     position: absolute; */
/*     left: 106px; */
/*     top: 41px; */
/* } */
/* #add_div tr:nth-child(9) { */
/*     position: absolute; */
/*     left: 56px; */
/*     top: 74px; */
/* } */

 .textbox {
    border: 1px solid #AECAF0;
  
}
.textbox-focused{
		box-shadow:none;
}
span.textbox.combo {
    margin-left: 2px;
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
            	 jQuery.post("ajjbxxqueryList!queryByMap?dwbm="+dwbm+"&&gh="+gh+"&&slrq="+rq1,function(data){
            	manager = $("#maingrid").ligerGrid({
                    height: '99%',
                    width: '99%',
                    columns: [
                        { display: '制作状态', name: 'IsRegard', minWidth:40 ,render:function(e){
                           	if(e.IsRegard=="0"){
       							return '<span style="color: red">未制作</span>';
       						}if(e.IsRegard=="1"){
       							return "已制作";
       							}
                               }
                   		},
                        { display: '案件名称', name: 'ajmc', minWidth: 100 },
                        { display: '部门受案号', name: 'bmsah', minWidth: 300 },
                        { display: '案件类别名称', name: 'ajlb_mc', minWidth: 200 },
                        { display: '备注', name: 'TARYXX', minWidth:100 , render: function (item) {
                            if (item.TARYXX) {
                            	var TARYXX =item.TARYXX.replace(/[\r\n]/g,"");
                            	return '<a href="javascript:" onclick="showTaryxx(\'' + TARYXX + '\')">' + TARYXX + '</a>';
                              }
                            }
                        },
                        { display: '承办单位', name: 'cbdw_mc', minWidth:100 },
                        { display: '承办部门', name: 'cbbm_mc', minWidth: 100},
                        { display: '承办人', name: 'cbr', minWidth: 50},
                        { display: '当前阶段', name: 'dqjd', minWidth: 140 },
                        { display: '受理日期', name: 'slrq', minWidth: 140 ,render: function(suminf){
                            var bb=suminf.slrq;
                    		var aa=bb.replace("T"," ");
                    		return aa;
                    		}
                		},
                        { display: '案件状态', name: 'ajzt', minWidth: 50 ,render:function(e){
                           	if(e.ajzt=="0"){
       							return "受理";
       						}if(e.ajzt=="1"){
       							return "办理";
       						}if(e.ajzt=="2"){
       							return "已办";
       						}if(e.ajzt=="3"){
       							return "归档";
       						}
                          }
                   		},
                        { display: '到期日期', name: 'dqrq', minWidth: 140, render:function(e){
                           	if(e.dqrq=="1900-01-01T00:00:00"){
       							return " ";
       						}else{
       							return e.dqrq;
           						}
                          }
                   		},
                        { display: '办结日期', name: 'bjrq', minWidth: 140 , render:function(e){
                           	if(e.bjrq=="1900-01-01T00:00:00"){
       							return " ";
       						}else{
       							return e.bjrq;
       						}
                          }
                   		},
                        { display: '完成日期', name: 'wcrq', minWidth: 140 , render:function(e){
                           	if(e.wcrq=="1900-01-01T00:00:00"){
       							return " ";
       						}else{
       							return e.wcrq;
       						}
                          }
                   		},
                        { display: '归档日期', name: 'gdrq', minWidth: 140, render:function(e){
                           	if(e.gdrq=="1900-01-01T00:00:00"){
       							return " ";
       						}else{
       							return e.gdrq;
       						}
                          }
                   		}, 
                    ],pageSizeOptions:[50, 100, 150, 200, 250], data:data,pageSize:50,rownumbers: true,where : f_getWhere(),
                   		
                   		
                   		onSelectRow : function (data){
							$("#tysah_id").val(data.tysah);
							$("#bmsah_id").val(data.bmsah);
							$("#jzmc").val(data.ajmc);
							$("#accomplices").val(data.TARYXX);
							$("#ajmbmc_txt").val(data.ajlb_mc);
							$("#ajmbmc").val(data.ajlb_mc);
							$("#ajmbbm").val(data.ajlb_bm);
							
                       		}
                });

            	 })
                $("#pageloading").hide();
                }
    </script>
</head>
<body>
<div class="l-loading" style="display:block" id="pageloading"></div>
<div style="margin: 10px;overflow: hidden">
<!-- 隐藏属性 -->
        				<s:textfield  style="display:none" id="dwbm" name="dwbm"  />
        				<s:textfield  style="display:none" id="gh" name="gh"  />
    <p>
        <span style="float: left;margin-top: 3px;margin-right:2px;">单位名称:</span><input type="text" id="txt1"/>
        <span class="rzcx_czmc">部门受案号:</span><input type="text" id="bmsah" />
        <span class="rzcx_czrxm">案件名称:</span><input type="text" id="ajmc" />
        <span class="ajjz_cbr">承办人:<input type="text" id="cbr" /></span>
    </p>
    <p class="rzcx_ri">
        <span style="margin-top: 2px; margin-right: 2px;margin-left: -2px;">受理日期:</span><input type="text" id="rq1" />
        <span class="sapn">-</span><input type="text" id="rq2" />
        

        <span class="ajjz_zzzt">制作状态:</span>
        <select class="select"  id="secelt">
	        <option value="全部">全部</option>
	        <option value="未制作">未制作</option>
	        <option value="已制作">已制作</option>
        </select>
		<input type="hidden" id="zzzt" value=""></input>
        <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="查询" onclick="f_search()" />
            <img src="images/search.gif" alt=""/>
        </span>
        <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="制作"  onclick="zjjz_zz();"/>
            <img src="images/edittask.png" alt=""/>
        </span>
        <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="添加案件" onclick="ajjzzz_tjajAdd()"/>
            <img src="images/add.gif" alt=""/>
        </span>
        <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="修改案件"  onclick="ajjzzz_tjajUpdate();"/>
            <img src="images/edit.png" alt=""/>
        </span>
        <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="导出PDF"  onclick="ajjzzz_PDF();"/>
            <img src="images/Redo.png" alt=""/>
        </span>

    </p>
</div>

<!--表格-->
<div class="l-clear"></div>

<div id="maingrid"></div>

<!--- ---------------------------->
<!-----------添加数据窗口--------->
<!-------------------------- ----->
<div id="add_div" style="display: none; margin: 0 auto;">
  <form id="add_form" method="post">
  <p style="margin-top:10px;margin-left:45px;"><span>案件名称:</span><span><s:textfield style="width: 164px;" type="text" id="jzmc"  name="jzmc"/></span></p>
  <p style="margin-top:10px;margin-left:45px;"><span>案件类别:</span><span>
   <s:textfield  style="display:none" type="text" id="bmsah_id"  name="bmsah"/>
          <s:textfield  style="display:none" type="text" id="tysah_id"  name="tysah"/>
          <s:textfield  style="display:none" type="text" id="ajmbbm"  name="ajmbbm"/>
          <s:textfield   type="text" id="ajmbmc_1" />  <%-- 由于ajmbmc_1的value是id值 --%>
          <s:textfield  style="display:none" type="text" id="ajmbmc"  name="ajmbmc"/>
  </span></p>
   <p style="margin-top:10px;margin-left:45px;position: relative;">
   <span style="position: absolute;    top: 1px;    left: -4px;">备注信息:</span><span style="margin-left: 51px;"><textarea id="accomplices" name="accomplices" cols="100" rows="4" class="l-textarea" style="width: 167px;max-Width:200px;max-Width:200px\9; height: 100px;margin-left: 5px;margin-left:6px\9;"></textarea>
</span></p>
<!--     <table style="line-height: 30px; width: 100%;"> -->
<!--       <tr> -->
<!--         <td style="text-align: right;"> -->
<!--           案件名称: -->
<!--         </td> -->
<!--         <td class="nth-child_2"> -->
<%--         <s:textfield class="add_text" type="text" id="jzmc"  name="jzmc"/> --%>
<!--         </td> -->
<!--         <td style="text-align: right;width: 100px;"> -->
<%--           <span style="margin-top: -3px">案件类别:</span> --%>
<!--         </td> -->
<!--         <td > -->
<!--           <input type="text"  /> -->
<!--           隐藏属性 -->
<%--           <s:textfield  style="display:none" type="text" id="bmsah_id"  name="bmsah"/> --%>
<%--           <s:textfield  style="display:none" type="text" id="tysah_id"  name="tysah"/> --%>
<%--           <s:textfield  style="display:none" type="text" id="ajmbbm"  name="ajmbbm"/> --%>
<%--           <s:textfield   type="text" id="ajmbmc_1" /> --%>
<%--           <s:textfield  style="display:none" type="text" id="ajmbmc"  name="ajmbmc"/> --%>
<!--         </td> -->
<!--       </tr> -->
      
<!--       <tr> -->
<!--         <td style="text-align: right;"> -->
<!--           备注信息: -->
<!--         </td> -->
<!--         <td colspan="3"> -->
<!--             <textarea id="accomplices" name="accomplices" cols="100" rows="4" class="l-textarea" style="width: 168px;max-Width:215px; height: 100px;"></textarea> -->
<!--         </td> -->
<!--       </tr> -->
<!--     </table> -->
  </form>
</div>
<div style="display:none;">

</div>
  <!------------案件类别--------------->
  <script type="text/javascript">
    $(function (){
//        $("#ajlb").ligerComboBox({
//         width : 167,
//       	url:'ajlbbmAction!ajlbbmsList',
//       	valueField :'ajlbbm',
//       	textField: 'ajlbmc',
//       	valueFieldID:'ajlb_id',
//       	selectBoxWidth:200,
//       	highLight:true,
//       	autocompleAllowEmpty: true,
//       	autocomplete: true,
//       	keySupport:true,
//         initIsTriggerEvent: false,
//         onChangeValue:function(value){
//         	console.log(111111111);
//             console.log(value);
//             },
//         onSelected: function (value,text)
//         {
//            // console.log(value);  //ajlbbm
//            // console.log(text);  //ajlbmc
//          // $("#ajmbbm").val(value);
//          // $("#ajmbmc").val(text);
          
//         }
//       });
		jQuery.post("ajlbbmAction!ajlbbmsList",function(data){
				    		 var getData=data;  //json
				    		 var newdata=[];
				        	    for(var i=0;i<getData.length;i++){
				        	        newdata[i]={id:getData[i].ajlbbm,text:getData[i].ajlbmc,"iconCls":"ico"}
				        	    }
				        	    $('#ajmbmc_1').combotree({
				        	        data:newdata,
				        	       // lines:true,
				        	        width:169,
				        	        height:22,
				        	       editable:true,
				        	        onClick:function(data){
				        	           $("#ajmbbm").val(data.id);
				        	           $("#ajmbmc").val(data.text);
				        	        }
				        	    });
    				});
		$(".tree-indent").css("display","none");
    			

    });
  </script>
<script type="text/javascript">
//搜索下拉列表
jQuery.post("dwlist!queryList",function(data){
    var getData=data.rows;
    var newdata=[];
    for(var i=0;i<getData.length;i++){
        newdata[i]={id:getData[i].dwbm,dwmc:getData[i].dwmc,parentId:getData[i].fdwbm}
    }
    var result = convert (newdata);
//     console.log("---------------------");
//     console.log(newdata);
//     console.log("++++++++++++++++++++++++++++");
//     console.log(result);
    $('#txt1').combotree({
        data:result,
        valueField: "id",
        text:"text",
       width:239,
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

    
   // $("#txt1").ligerComboBox({
      //  width: 238,
     //   selectBoxWidth: 238,
     //   selectBoxHeight: 238,
      //  textField:'dwmc',
      //  valueField: 'dwmc',
      //  treeLeafOnly:false,
      //  valueFieldID: 'test3',
      //  tree: {
      //      data:getData,
      //      checkbox: false,
      //      textFieldName:"dwmc",
      //      idFieldName:"dwbm",
      //      parentIDFieldName:"fdwbm",
       //     onclick:function(){
       //         getSelected();
       //     }
      //  }
   // });


    
})
     //获取选中的值
        function  getSelected(){
            $("#txt1").val($("#test3").val());
           
            }
//同案人员信息
  function showTaryxx(obj) {
    $.ligerDialog.open({ title: '同案人员信息', height: 200, width: 500, content: obj,
      buttons: [{ text: '取消', onclick: function (item, dialog) {
      dialog.hidden();
      }
      }], isResize: true

    });
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
	  if($("#rq1").val()==""||$("#rq2").val()==""){
	     	$.ligerDialog.warn('受理日期不能为空!');
	         }else{
				  $("#dwbm").val('${sessionScope.yh.dwbm.dwbm}');
			  		$("#gh").val('${sessionScope.yh.gh}');
			      $("#rq1,#rq2").ligerDateEditor();
			      var dwbm1=$("#dwbm").val();
			      var gh1=$("#gh").val();
			      var rq11=$("#rq1").val();
			//      表格
			      	 jQuery.post("ajjbxxqueryList!queryByMap?dwbm="+dwbm1+"&&gh="+gh1+"&&slrq="+rq11,function(data1){
			    	 manager.options.data = data1;
			    	 manager.loadData(f_getWhere());
				 })
	         }
 }
  // 制作状态
  $("#secelt").change(function ()
		    {  
	  		$("#zzzt").val(this.value); 
	  		 //将选择的值赋给$("#zzzt")
		    });

 function f_getWhere()
 {
     if (!manager) return null;
     var clause = function (rowdata, rowindex)
     {
         var czsj = rowdata.slrq; ///没有获取到值
        var czsjTime = czsj.substring(0,10);
         var Company=get_unix_time(czsjTime);
         kssj=get_unix_time($("#rq1").val());
         jssj=get_unix_time($("#rq2").val());
         //时间判断
         if(Company>=kssj&&Company<=jssj){
             bjsj=Company;
         }
         //获取单位名称
         var key = $("#txt1").val();
         var bmsah=$("#bmsah").val();
         var ajmc=$("#ajmc").val();
         var cbr=$("#cbr").val();
		  	 var CBR=rowdata.cbr; //  获取数据承办人姓名
		  	 if(CBR==null){
			  	 ccc=" ";
			  	 }else{
			  		ccc=CBR;
				  	 }
//		  	       制作状态(页面表格没值)
		 var zzzt=$("#zzzt").val();
		 var IsRegard;
	     if(rowdata.IsRegard=="0"){
	    	 IsRegard="未制作"
		     }if(rowdata.IsRegard=="1") {
		    	 IsRegard="已制作"
			     }
		     if(zzzt=="全部"){
		    	// manager.reload();
		    	 window.location.reload();
				     }
		    
         return ((IsRegard.indexOf(zzzt)>-1)&&(rowdata.cbdw_mc.indexOf(key) > -1)&&(Company.indexOf(bjsj) > -1)&&(rowdata.bmsah.indexOf(bmsah) > -1)&&(rowdata.ajmc.indexOf(ajmc) > -1)&&(ccc.indexOf(cbr) > -1));
     };
     manager.changePage("first"); //重置到第一页
     return clause; 
 }
 //转换成时间戳
 function get_unix_time(dateStr)
 {
     var newstr = dateStr.replace(/-/g,'/');
     var date =  new Date(newstr);
     var time_str = date.getTime().toString();
     return time_str.substr(0, 10);
 }
  //制作
  function zjjz_zz(){
    var manager = $("#maingrid").ligerGetGridManager();
    var row = manager.getSelectedRow();
    if(!row){
      $.ligerDialog.warn('请先选择一条数据');
    }else{
    	 jQuery.post("ajjbxxqueryList!add_jzzz?bmsah="+row.bmsah+"&&sfdc="+0,function(data){
           window.location.href="copefilemaker://"+data;
        	 })
        }
  }
  //添加案件
  function ajjzzz_tjajAdd(){
  		$("#jzmc").removeAttr("readOnly");
    	$("#jzmc").css("background","white");
	  $("#tysah_id").val(" ");
		$("#bmsah_id").val(" ");
		$("#jzmc").val("");
		$("#accomplices").val(" ");
		$("#ajmbmc_txt").val(" ");
		$("#ajmbmc").val(" ");
		$("#ajmbbm").val(" ");
	  //alert($("#ajmbmc").val());
    $.ligerDialog.open({ title: '添加案件', target: $('#add_div'), width: 343,height:270,
      buttons: [{ text: '确定', onclick: function (item, dialog) {
//     	  if($("#jzmc").val()==""){
//   	     	$.ligerDialog.warn('请完善信息!');
//   	         }else{
  		    	  dialog.hidden(); 
  		    	 $("#add_form").attr("action", "ajjbxxqueryList!add_ajjbxx");
  		         $("#add_form").submit();  
  		          $.ligerDialog.success('添加成功!');
  		        $("#add_div").hidden();
  	  	         //}
    	  

  	        
      }, cls: 'l-dialog-btn-highlight'
      }, { text: '取消', onclick: function (item, dialog) {
        $("#add_form")[0].reset();
        dialog.hidden();
      }
      }], isResize: false
    });
  }

  //修改案件
  function ajjzzz_tjajUpdate(){
			
	  $("#jzmc").attr("readonly","readonly");
  	$("#jzmc").css("background","#ccc");
    var manager = $("#maingrid").ligerGetGridManager();
    var row = manager.getSelectedRow();
    if (row) {
    	$("#ajmbmc_1").combotree("setValue",row.ajlb_mc);//设置默认值
          //弹出窗口
    	$.ligerDialog.open({ title: '修改案件', target: $('#add_div'), width: 343,height:270,
    	      buttons: [{ text: '确定', onclick: function (item, dialog) {
    	    	  dialog.hidden(); 
    							$("#add_form").attr("action", "ajjbxxqueryList!update_ajjbxx");
    	        			     $("#add_form").submit();
    	        $("#add_div").hidden();
    	      }, cls: 'l-dialog-btn-highlight'
    	      }, { text: '取消', onclick: function (item, dialog) {
    	        $("#add_form")[0].reset();
    	        dialog.hidden();
    	      }
    	      }], isResize: false
    	    });
    } else{
      $.ligerDialog.warn('请选择修改项!');
    }
  }
  //导出PDF
  function  ajjzzz_PDF(){
	  var manager = $("#maingrid").ligerGetGridManager();
	    var row = manager.getSelectedRow();
	    if(!row){
	      $.ligerDialog.warn('请先选择一条数据');
	    }else{
	    	 jQuery.post("ajjbxxqueryList!add_jzzz?bmsah="+row.bmsah+"&&sfdc="+1,function(data){
	           window.location.href="copefilemaker://"+data;
	        	 })
	        }
  }

  //日期
  function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
      month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
      strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    return currentdate;
  }

  $("#rq1").ligerDateEditor({ labelAlign: 'center',onChangeDate:function(value){
    var d1=new Date($("#rq2").val().replace(/\-/g,"\/"));
    var d2=new Date(value.replace(/\-/g,"\/"));
    if(d1<=d2){
      $("#rq1").val("");
      $.ligerDialog.warn('受理开始日期不能大于等于结束日期');
      $(".l-dialog-body").css("width","300px");
      $(".l-dialog-content").css({
        "paddingTop":"25px",
        "paddingBottom": "19px"
      })
    }
  }});
  $("#rq2").ligerDateEditor({labelAlign: 'center', initValue: getNowFormatDate(),onChangeDate:function(value){
    var d1=new Date(value.replace(/\-/g,"\/"));
    var d2=new Date($("#rq1").val().replace(/\-/g,"\/"));
    if(d1<=d2){
      $.ligerDialog.warn('受理结束日期不能大于等于开始日期');
      $("#rq1").val("");
      $(".l-dialog-body").css("width","300px");
      $(".l-dialog-content").css({
        "paddingTop":"25px",
        "paddingBottom": "19px"
      });

    }
  } });
  var re=$("#rq2").val();
  $("#rq1").val(re.replace(re.charAt(3), re.charAt(3)-1));








</script>
</body>
</html>



