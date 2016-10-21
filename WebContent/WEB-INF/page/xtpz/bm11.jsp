
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8"/>
  <title></title>
        <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>   
<%--     	 <script src="js/ligerUI/js/core/base.js" type="text/javascript"></script> --%>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script> 
    <script src="js/ligerUI/js/plugins/ligerDrag.js"></script>
    <script src="js/ligerUI/js/plugins/ligerDialog.js"></script>
          
        <style type="text/css"> 
        .l-tree .l-tree-icon-folder-open {
            background-position: -87px -238px;
        }
        .l-tree .l-tree-icon-leaf {
            background-position: -87px -238px;
        }
        .l-tree .l-tree-icon-folder {
            background-position:-87px -238px;
        }
			input#dwmc,input#fbmmc{
			 background: #ccc;
		}
        
            body{ padding:5px; margin:0; padding-bottom:15px;}
            #layout1{  width:100%;margin:0; padding:0;  }  
            .l-page-top{ height:80px; background:#f8f8f8; margin-bottom:3px;}
            h4{ margin:20px;}
            /*表格的上边框*/
    .l-panel-body {
        border-top: 1px solid #A3C0E8;
    }
/*     /*左边树形结构*/ */
/*         .l-layout-left { */
/*             overflow: auto; */
/*         } */
      input {
        height: 20px;
        line-height: 20px;
        outline: none;
        margin-left: 3px;
        padding-left: 3px;
        border: 1px solid #AECAF0;
    }
                /***********添加*************/
     #aaa{
        position: relative;
        overflow: hidden;
    	zoom: 1;
    }
     #aaa tr{
         margin-top: 10px;
      display: inline-block;
    }
      #aaa tr:nth-child(odd){
      width: 210px;
    }
    #aaa tr:nth-child(even){
      width: 70px;
    }
    #aaa tr:nth-child(3){
      width: 0;
    }
    
    input {
        height: 20px;
        line-height: 20px;
        outline: none;
        margin-left: 3px;
        padding-left: 3px;
        border: 1px solid #AECAF0;
    }

    .sbxx_cx{
        margin-left: 10px;
        position: relative;
    }
    .sbxx_cx .rzcx_cx{
        width: 70px;
        padding-left: 20px;
        height: 22px;
        background: #E2F0FF url('images/grid/header-bg.gif') repeat-x left bottom;
        line-height: 22px;
        border: 1px solid #AECAF0;
    }
    .sbxx_cx img{
        position: absolute;
        left: 10px;
        top: -1px;
    }
    .sbxx_cx .rzcx_cx:hover{
        cursor: pointer;
        background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
        border-color: #D6A886;
    }
 .l-textarea{
 margin-left:2px;
 border: 1px solid #AECAF0;
 }
/**添加**/
div#add_div p {
    margin-top: 10px;
}
#add_div p.add_buju {
    margin-left: 15px;
}
#add_div p.add_buju input {
    width: 196px;
}
#add_div p.add_last {
    margin-left: 40px;
}
.l-tree li .l-body {
    width:320px;
    
}
/* div#left { */
/*     overflow: auto; */
/* } */
    
                </style>
    </head>
    <body style="padding:10px">  
       <div style="margin: 10px auto;overflow: hidden">
	    <span style="float: left">部门名称：<input id="bmmc_text" type="text" /></span>
	    <input type="hidden" id="dwmc1" value="370000"/>
		 <span class="sbxx_cx"><input id="btnOK" type="button" value="查询" onclick="f_search()" class="rzcx_cx" />
	            <img src="images/search.gif" alt=""/>
	    </span>
	</div> 
      <div id="layout1">
            <div position="left" id="left">
            <ul id="tree1" style="height: 565px;height:490px\0;overflow: auto;"></ul>
            </div>
            <div position="center" title="标题" id="maingrid">
            </div>  
        </div> 
        
        <%--添加数据窗口--%>
    <div id="add_div" style="display: none; margin: 0 auto;">
        <form id="add_form" method="post">
        <!-- 隐藏属性 -->
          <s:textfield style="display:none"  id="hidden" name="text1"  />
          <input type="hidden" id="dwbm" name="dwbm" value="" />
          <input type="hidden" id="fbmbm" name="fbmbm" value="" />
          <input type="hidden" id="hidd_unitNumber" name="hidd_unitNumber" value="" />
          <input type="hidden" id="bmbm" name="bmbm" value="" />
         <p class="add_buju"><span> 所属单位:</span><span><s:textfield  type="text" id="dwmc" name="dwmc" readOnly= "true" onfocus="this.blur()"/></span></p>
        <p class="add_buju"><span>上级部门:</span>
	        <span>
	        	<s:textfield class="l-text" type="text" id="fbmmc" name="fbmmc" readOnly= "true" unselectable='on'/>
	          	<input type="hidden" id="hidd_superiorNumber" name="hidd_superiorNumber" value="" />
	          	<input type="hidden" id="key_hidd" name="key_hidd" value="" />
	         </span>
          </p>
        <p class="add_buju"><span>部门名称:</span><span><s:textfield class="l-text" type="text" id="bmmc" name="bmmc" maxlength="150" /></span></p>
<%--         <p><span>部门编码:</span><span><s:textfield class="l-text" type="text" id="bmbm" name="bmbm" maxlength="150" /></span></p> --%>
        <p class="add_buju"><span>部门简称:</span><span><s:textfield class="l-text" type="text" id="bmjc" name="bmjc" maxlength="30" /></span></p>
        <p class="add_last"><span>备注:</span><span style="margin-left:3px;"><textarea id="bz" name="bz" cols="100" rows="4" class="l-textarea" style="width: 201px; height: 100px;"></textarea></span></p>
<!--         <table style="heighr:300px, width:320px;padding-left:10px;overflow: hidden" id="aaa"> -->
<!--           <tr> -->
<!--           隐藏属性 -->
<%--           <s:textfield style="display:none"  id="hidden" name="text1"  /> --%>
<!--           <input type="hidden" id="dwbm" name="dwbm" value="" /> -->
<!--           <input type="hidden" id="fbmbm" name="fbmbm" value="" /> -->
<!--           <input type="hidden" id="hidd_unitNumber" name="hidd_unitNumber" value="" /> -->
<!--         <td style="text-align: center;width:70px;"> -->
<!--           所属单位: -->
<%--           <s:textfield  type="text" id="dwmc" name="dwmc" readOnly= "true"/> --%>
<!--         </td> -->
<!--         <td style="text-align: center;width:70px;"> -->
<%--           <span >上级部门:</span> --%>
<%--           <s:textfield class="l-text" type="text" id="fbmmc" name="fbmmc" readOnly= "true" /> --%>
<!--           <input type="hidden" id="hidd_superiorNumber" name="hidd_superiorNumber" value="" /> -->
<!--           <input type="hidden" id="key_hidd" name="key_hidd" value="" /> -->
<!--         </td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--         <td style="text-align: center;width:70px;"> -->
<!--           部门名称: -->

<%--           <s:textfield class="l-text" type="text" id="bmmc" name="bmmc" maxlength="150" /> --%>
<!--         </td> -->
<!--         <td style="text-align: center;width:70px;display:none" > -->
<!--           部门编码: -->
<%--           <s:textfield class="l-text" type="text" id="bmbm" name="bmbm" maxlength="150"  style="display:none" /> --%>
<!--         </td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--         <td style="text-align: center;width:70px;"> -->
<!--           部门简称: -->
<%--           <s:textfield class="l-text" type="text" id="bmjc" name="bmjc" maxlength="30" /> --%>
<!--         </td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--         <td style="text-align: center;width:70px;"> -->
<!--           备注: -->
<!--         </td> -->
<!--          </tr> -->
<!--           <tr> -->
<!--         <td id="flbm_text"> -->
<!--           <textarea id="bz" name="bz" cols="100" rows="4" class="l-textarea" style="width: 201px; height: 100px;"></textarea> -->
<!--         </td> -->
<!--       </tr> -->
<!--         </table> -->
        </form>
    </div>
    </body>
      <script type="text/javascript">
            var manager;
            var tree;
                $(function ()
                {
                   jQuery.post("dwlist!queryList",function(data){
                       //转换成tree  json格式
							var getData =data.rows;
                       //添加左边单位树
                    $("#layout1").ligerLayout({ leftWidth: 200});
                  
                                 tree = $("#tree1").ligerTree({  
                                 data:getData,
                                 checkbox: false,
//                                		url:"dwAction!queryList", 
                                 idFieldName :'dwbm',
                                 slide : false,
                                 nodeWidth:90,
                                 parentIDFieldName :'fdwbm',
                                 textFieldName: 'dwmc',
                                 ajaxType: 'get',
                                 onClick :function(data){
                                	 getSelected();
                                     } 
                                 });
                                
                                 treeManager = $("#tree1").ligerGetTreeManager();
                                 treeManager.collapseAll();
                	});
                  
                });
              
                //获取选中值
                function getSelected()
                {
                    var note = treeManager.getSelected(); 
                    //初始化时未选中，默认为顶级单位
                    if(note==null){
                        //广元市单位编码
                        
                    	var dwbm=$("#dwmc1").val();
                        }else{
                            //条件查询赋值
                            $("#dwmc1").val(note.data.dwbm);
                            $("#dwmc").val(note.data.dwmc);
                           
                        	var dwbm=note.data.dwbm;
                        }
                    jQuery.post("bmqueryList!queryByMap?dwbm="+dwbm,function(data){
                        
                    manager = $("#maingrid").ligerGrid({
                        height: '99%',
                        height: '99%',
                        toolbar: {//工具条
                            items:[
								{ text: '增加部门', click: addBm, icon: 'add' ,img: 'js/ligerUI/skins/icons/add.gif' },
								{ line: true },//|线条
								{ text: '增加下级部门', click: addBmLast, icon: 'add' ,img: 'js/ligerUI/skins/icons/add.gif' },
								{ line: true },//|线条
								{ text: '修改', click: updateBm, icon: 'modify' ,img: 'js/ligerUI/skins/icons/edit.gif' },
								{ line: true },
								{ text: '删除', click: deleteBm, img: 'js/ligerUI/skins/icons/delete.gif' }
								]
                        },
                        columns:[
							{ display: '单位名称', name: 'dwbm.dwmc', width: 250, align: 'center' },
							{ display: '部门名称', name: 'bmmc',  width: 250, align: 'center' },
							{ display: '部门简称', name: 'bmjc',width: 250, align: 'center' },
							{ display: '备注', name: 'bz',width: 250, align: 'center' },
							] , pageSize:20,rownumbers: true,where : f_getWhere(),
                       		data:data
//                        		,tree: {
//                                 //columnId: 'deptName',
//                                 columnName: 'dwbm.dwmc',
//                                 idField: 'bmbm',
//                                 parentIDField: 'fbmbm'
//                             }
                    });
                    
                    } );
            				$("#pageloading").hide();
                }

                //setTimeout(function(){
        	 	//	$(".l-panel-body #maingridgrid").css("height","543px");
        	 	//	},4100);
                //部门页面展示
            function addBm(){
         	  var note1 = treeManager.getSelected(); 
     	    	   if(note1!=null){
         	 		//未选取添加节点
         	 		 $("#dwbm").val(note1.data.dwbm);
         	 		 $("#dwmc").val(note1.data.dwmc);
         	 		 $("#fbmbm").val("");
         	 		 $("#fbmmc").val("");
     			    	   $.ligerDialog.open({ title: '添加单位', target: $('#add_div'), width: 320,
     			               buttons: [{ text: '确定', onclick: function (item, dialog) {
     			            	   var hidden=  $("#hidden").val("add");
     			                   submitForm();
     			               }, cls: 'l-dialog-btn-highlight'
     			               }, { text: '取消', onclick: function (item, dialog) {
     			                   $("#add_form")[0].reset();
     			                   dialog.hidden();
     			               }
     			               }], isResize: false
     			           });
     	    	  		 }else{
     	    	  			$.ligerDialog.warn('请先选择单位');
     		    	  		 }
     	    	   
                }
           
            function addBmLast(){
         	  var note1 = treeManager.getSelected(); 
         	  if(note1!=null){
         	   var cksld = manager.getSelectedRow();
     	    	   if(cksld!=null){
         	 		//未选取添加节点
         	 		 $("#fbmbm").val(cksld.bmbm);
         	 		 $("#fbmmc").val(cksld.bmmc);
         	 		 $("#dwbm").val(cksld.dwbm.dwbm);
     			    	   $.ligerDialog.open({ title: '添加单位', target: $('#add_div'), width: 320,
     			               buttons: [{ text: '确定', onclick: function (item, dialog) {
     			            	   var hidden=  $("#hidden").val("addLast");
     			                   submitForm();
     			               }, cls: 'l-dialog-btn-highlight'
     			               }, { text: '取消', onclick: function (item, dialog) {
     			                   $("#add_form")[0].reset();
     			                   dialog.hidden();
     			               }
     			               }], isResize: false
     			           });
     	    	  		 }else{
     	    	  			$.ligerDialog.warn('请先选择部门');
     		    	  		 }
            }else{
 	  			$.ligerDialog.warn('请先选择单位');
	  		 }
     	    	   
                }
           
            function updateBm(){
         	   var cksld = manager.getSelectedRow();
                if (cksld != null) {
         	  		 var dwbm=cksld.dwbm.dwbm;
         	  		 var bmbm=cksld.bmbm;
         	  		$("#dwmc").val(cksld.dwbm.dwmc);
         	  		$("#fbmmc").val(cksld.fbmbm);
                    $.ajax({
                        type: "POST",
                        url: 'bmqueryList!queryByMap',
                        data: 'dwbm='+dwbm+"&&bmbm="+bmbm,
                        success: function (data) {
                            
                            $("#dwbm").val(data.rows[0].dwbm.dwbm);
                            $("#fbmbm").val(data.rows[0].fbmbm);
                            $("#bmbm").val(data.rows[0].bmbm);
                            $("#bmmc").val(data.rows[0].bmmc);
                            $("#bmjc").val(data.rows[0].bmjc);
                            $("#bz").val(data.rows[0].bz);
                            $("#hidden").val("update");
//                         }
//                     })
                            //弹出窗口
     							 $.ligerDialog.open({ title: '编辑单位', target: $('#add_div'), width: 320,
     	                                buttons: [{ text: '确定', onclick: function (item, dialog) {
     	                                    submitForm();
     	                                }, cls: 'l-dialog-btn-highlight'
     	                                }, { text: '取消', onclick: function (item, dialog) {
     	                                    $("#add_form")[0].reset();
     	                                    dialog.hidden();
     	                                }
     	                                }], isResize: false
     	                            });
                            }
                        })
     	           } else{
     	               $.ligerDialog.warn('请先选择一个需要编辑的单位');
     	           }
                }
            function deleteBm(){
         	   var cksld = manager.getSelectedRow();
         	   //判断是否还有子节点
         	   if(cksld!=null){
	             		 $("#dwbm").val(cksld.dwbm.dwbm);
	             		 $("#bmbm").val(cksld.bmbm);
	             		 $("#hidden").val("delete");
	             		 submitForm();
// 	                 }
	         	   }
                }
            //提交form表单路径判断
            function  submitForm(){
                var hidden=$("#hidden").val();
                switch (hidden) {
     	           case "update":
     		           
     	               $("#add_form").attr("action", "bmqueryList!update");
     	               $("#add_form").submit();
     	               break;
     	           case "addLast":
     	              	 var dwbm=   $("#dwbm").val();
     			    	 var fbmbm=  $("#fbmbm").val();
     			    	 var bmmc=   $("#bmmc").val();
     			    	 var bmbm=   $("#bmbm").val();
     			    	 var bmjc=   $("#bmjc").val();
     			    	 var bz=  $("#bz").val();
     			    	 if(dwbm.trim()==""||fbmbm.trim()==""||bmmc.trim()==""){
     			    		 $.ligerDialog.warn('请完善添加信息！');
     				    	 }else{
     			               $("#add_form").attr("action", "bmqueryList!add");
     			               $("#add_form").submit();
     					    }
     			    	 break;
     	           case "add":
     	              	 var dwbm=   $("#dwbm").val();
     			    	 var bmmc=   $("#bmmc").val();
     			    	 var bmjc=   $("#bmjc").val();
     			    	 var bz=  $("#bz").val();
     			    	String.prototype.trim = function ()  
    					{  
    					    return this.replace(/(^\s*)|(\s*$)/g, "");  
    					}  
     			    	 if(dwbm.trim(String)==""||bmjc.trim(String)==""||bmmc.trim(String)==""){
     			    		 $.ligerDialog.warn('请完善添加信息！');
     				    	 }else{
     			               $("#add_form").attr("action", "bmqueryList!add");
     			               $("#add_form").submit();
     					    }
     			    	 break;
     	           case "delete":
     	        	   $("#add_form").attr("action", "bmqueryList!delete");
     	        	   $("#add_form").submit();
     	               break;
            			}
                }


            //条件搜索
            function f_search()
            {
                var dwmc2=$("#dwmc1").val();
            	 jQuery.post("bmqueryList!queryByMap?dwbm="+dwmc2,function(data){
            		 manager.options.data = data;
            		 manager.loadData(f_getWhere());
                   	 })
            }
            function f_getWhere()
            {
                if (!manager) return null;
                var clause = function (rowdata, rowindex)
                {
                    var key1 = $("#bmmc_text").val();
                    return (rowdata.bmmc.indexOf(key1) > -1);
                };
                manager.changePage("first"); //重置到第一页
                return clause;
            }
         </script> 
    </html>
