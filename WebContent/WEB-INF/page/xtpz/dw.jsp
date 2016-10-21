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
    	 <script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script> 
    <script src="js/ligerUI/js/plugins/ligerDrag.js"></script>
    <script src="js/ligerUI/js/plugins/ligerDialog.js"></script>
          
        <style type="text/css"> 
			input#dwbm,input#fdwbm,input#fdwmc{
			 background: #ccc;
		}
        
            body{ padding:5px; margin:0; padding-bottom:15px;}
            #layout1{  width:100%;margin:0; padding:0;  }  
            .l-page-top{ height:80px; background:#f8f8f8; margin-bottom:3px;}
            h4{ margin:20px;}
             /********  表格部分超过，自动隐藏 ***********/
        
/*         .l-grid-row-cell-inner { */
/* 		     white-space: nowrap;  */
/* 		     overflow: hidden;  */
/* 		     text-overflow: ellipsis; */
/* 			} */
            /*表格的上边框*/
		    .l-panel-body {
		        border-top: 1px solid #A3C0E8;
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
/*       #aaa tr{ */
/*          margin-top: 10px; */
/*       display: inline-block; */
/*     } */
/*       #aaa tr:nth-child(odd){ */
/*       width: 70px; */
/*     } */
/*     #aaa tr:nth-child(even){ */
/*       width: 210px; */
/*     } */
/*       #aaa tr:nth-child(3){ */
/*       display: none; */
/*     } */
/*     #aaa tr:nth-child(4){ */
/*        display: none; */
/*     } */
/*     #aaa tr input { */
/*     width: 197px; */
/* } */
/* 添加**/
#add_div p {
    margin-top: 10px;
    margin-left: 45px;
}
  </style>
    </head>
    <body style="padding:10px">  
       <div style="margin: 10px auto;overflow: hidden">
	    <span>单位名称：<input id="dwmc_txt" type="text" /></span>
		 <span class="sbxx_cx"><input id="btnOK" type="button" value="查询" onclick="f_search()" class="rzcx_cx" />
	            <img src="images/search.gif" alt="查询"/>
	    </span>
	</div> 
      <div id="layout1">
            <div id="maingrid"></div>
        </div> 
        
        <%--添加数据窗口--%>
   <div id="add_div" style="display: none;">
        <div>
            <form id="add_form" method="post" >
	            <p><span>上级单位：</span>
		            <span>
		            	<s:textfield   id="fdwmc" name="fdwmc"  readOnly= "true" unselectable='on'/>
		            	<s:textfield style="display:none"  id="fdwbm" name="fdwbm"  readOnly= "true" unselectable='on' />
	                   <s:textfield style="display:none"  id="hidden" name="text1"  />
	                   <s:textfield style="display:none"  id="txt_superior" name="text"  />
		            </span>
	            </p>
	            <p><span>单位编码：</span><span><s:textfield   id="dwbm" name="dwbm" readOnly= "true" /></span></p>
	            <p><span>单位名称：</span><span><s:textfield   id="dwmc" name="dwmc" /></span></p>
	            <p><span>单位简称：</span><span> <s:textfield   id="dwjc" name="dwjc" /></span></p>
	            <p><span>单位级别：</span><span><s:textfield   id="dwjb" name="dwjb" /></span></p>
<!--             <table style="line-height: 30px;" id="aaa"> -->
<!--                 <tr> -->
<!--                     <td style="text-align: center;width: 70px;"> -->
<%--                         上级单位：<s:textfield   id="fdwbm" name="fdwbm"  readOnly= "true"/> --%>
<%--                    <s:textfield style="display:none"  id="hidden" name="text1"  /> --%>
<%--                    <s:textfield style="display:none"  id="txt_superior" name="text"  /> --%>
<!--                     </td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                     <td style="text-align: center;width: 70px;"> -->
                    	
<%--                         单位编码：<s:textfield   id="dwbm" name="dwbm" readOnly= "true"/> --%>
<!--                     </td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                     <td style="text-align: center;width: 70px;"> -->
<%--                         单位名称：<s:textfield   id="dwmc" name="dwmc" /> --%>
<!--                     </td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                     <td style="text-align: center;width: 70px;"> -->
<%--                         单位简称： <s:textfield   id="dwjc" name="dwjc" /> --%>
<!--                     </td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                     <td style="text-align: center;width: 70px;"> -->
<%--                         单位级别：<s:textfield   id="dwjb" name="dwjb" /> --%>
<!--                     </td> -->
<!--                 </tr> -->
<!--             </table> -->
            </form>
        </div>
    </div>
    </body>
     <script type="text/javascript">
        var manager;
       
           
        $(function (){
        	 jQuery.post("dwlist!queryList?dwmc=",function(data){
        		 console.log("-----------------------------");
            	 console.log($("#dwmc").val());
        	manager = $("#maingrid").ligerGrid({
                        toolbar: {//工具条
                            items: [
                                { text: '增加下级单位', click: addDw, icon: 'add' ,img: 'js/ligerUI/skins/icons/add.gif' },
                                { line: true },//|线条
                                { text: '修改', click: updateDw, icon: 'modify' ,img: 'js/ligerUI/skins/icons/edit.gif' },
                                { line: true },
                                { text: '删除', click: deleteDw, img: 'js/ligerUI/skins/icons/delete.gif' }
                            ]
                        },
                        columns: [
              	                { display: '单位名称', name: 'dwmc', width: 300, align: 'left' },
            	                { display: '单位编码', name: 'dwbm',  width: 250, align: 'center' },
            	                { display: '父单位编码', name: 'fdwbm',width: 250, align: 'center' }, 
            	                { display: '单位简称', name: 'dwjc', width: 250, align: 'center' },
            	                { display: '单位级别', name: 'dwjb', width: 250, align: 'center' }
            	                ],width: '100%',usePager:false, height: '105%',where : f_getWhere(),
    	                	data:data, alternatingRow: true, tree: {
    	                    columnName: 'dwmc',
    	                    idField: 'dwbm',
    	                    parentIDField: 'fdwbm',
    	                    delay:2,
    	                        onSuccess:function(data){

									console.log(data);
        	                        }
    	                }
                    } );
        	  } );
            $("#pageloading").hide();
        });

       function addDw(){
    	   //$("#fdwbm").removeAttr("readOnly") ;
    	  // $("#dwbm").removeAttr("readOnly") ;
    	   $("#dwbm").val("");
    	   $("#dwmc").val("");
    	   $("#dwjc").val("");
    	   $("#dwjb").val("");
    	   var cksld = manager.getSelectedRow();
    	   console.log(cksld);
	    	   if(cksld!=null){
	    		   $("#fdwmc").val(cksld.dwmc);
	    		   $("#dwbm").val(cksld.fdwbm);
    	 		//未选取添加节点
    	 		 $("#fdwbm").val(cksld.dwbm);
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
	    	  			$.ligerDialog.warn('请先选择一个需要添加下级单位的单位');

		    	  		 }
	    	   
           }
      
       function updateDw(){
    	   var cksld = manager.getSelectedRow();
    	   var cksld1 = manager.getParent(cksld);
           if (cksld != null) {
    	  		 var dwbm=cksld.dwbm;
               $.ajax({
                   type: "POST",
                   url: 'dwlist!queryByMap',
                   data: 'dwbm='+dwbm,
                   success: function (data) {
                	   if(cksld1==null||cksld1==""){
                           $("#fdwmc").val(data.rows[0].fdwbm);
                    	   }else{
                    		   $("#fdwmc").val(cksld1.dwmc);
                        	   }
                       $("#dwbm").val(data.rows[0].dwbm);
                       $("#dwmc").val(data.rows[0].dwmc);
                       $("#dwjc").val(data.rows[0].dwjc);
                       $("#dwjb").val(data.rows[0].dwjb);
                       $("#hidden").val("update");

                       
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
       function deleteDw(){
    	   var cksld = manager.getSelectedRow();
    	   //判断是否还有子节点
    	   var  cdata = manager.hasChildren(cksld)
    	   
    	   	if(cdata){
    	   	 $.ligerDialog.warn('该单位包含下级单位，请先选择删除下级单位！');
        	 }else{
        		 $("#dwbm").val(cksld.dwbm);
        		 $("#hidden").val("delete");
        		 submitForm();

            }
           }
       //提交form表单路径判断
       function  submitForm(){
           var hidden=$("#hidden").val();
           switch (hidden) {
	           case "update":
	        	   	var dwmc=   $("#dwmc").val();
			    	 var dwjc=   $("#dwjc").val();
			    	 var dwjb=  $("#dwjb").val();
			    	 String.prototype.trim = function ()  
						{  
						    return this.replace(/(^\s*)|(\s*$)/g, "");  
						}  
			    	 var reg=/^\d+$/;
			    	 if(dwmc.trim(String)==""||dwjc.trim(String)==""||dwjb.trim(String)==""||reg.test(dwjb)==false){
			    		 $.ligerDialog.warn('请完善添加信息;或分类序号不是阿拉伯数字！');
				    	 }else{
				    		 $("#add_form").attr("action", "dwlist!update");
				             $("#add_form").submit();
					    }
	               break;
	           case "add":
	              	 var dwbm=   $("#dwbm").val();
			    	 var fdwbm=  $("#fdwbm").val();
			    	 var dwmc=   $("#dwmc").val();
			    	 var dwjc=   $("#dwjc").val();
			    	 var dwjb=  $("#dwjb").val();
			    	 String.prototype.trim = function ()  
						{  
						    return this.replace(/(^\s*)|(\s*$)/g, "");  
						}  
			    	 var reg=/^\d+$/;
			    	 if(dwbm.trim(String)==""&&fdwbm.trim(String)==""&&dwmc.trim(String)==""&&dwjc.trim(String)==""&&dwjb.trim(String)==""||reg.test(dwjb)==false){
			    		 $.ligerDialog.warn('请完善添加信息;或分类序号不是阿拉伯数字！');
				    	 }else{
			              $("#add_form").attr("action", "dwlist!add");
			              $("#add_form").submit();
					    }
			    	 break;
	           case "delete":
	        	   $("#add_form").attr("action", "dwlist!delete1");
	        	   $("#add_form").submit();
	               break;
       			}
           }


       //条件搜索
       function f_search()
       {
           //dwlist!queryList
       	 jQuery.post("dwlist!queryList",function(data){
       		 manager.options.data = data;
       		 manager.loadData(f_getWhere());
              	 })
       }
       function f_getWhere()
       {
           if (!manager) return null;
           var clause = function (rowdata, rowindex)
           {
               var key1 = $("#dwmc_txt").val();
               return (rowdata.dwmc.indexOf(key1) > -1);
           };
           return clause;
       }

       $("div #maingridgrid").css("height","635px");
    </script>
    </html>
