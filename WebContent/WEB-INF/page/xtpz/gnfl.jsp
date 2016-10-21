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
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
    <style>
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
/*     #aaa{ */
/*     overflow: hidden; */
/*     } */
/*      #aaa tr{ */
/*          margin-top: 10px; */
/*       display: inline-block; */
/*     } */
/*       #aaa tr:nth-child(odd){ */
/*       width: 70px; */
/*     } */
/*     #aaa tr:nth-child(even){ */
/*       width: 210px; */
/*     } */
/*     #aaa tr:nth-child(4){ */
/*       width: 70px; */
/*     } */
/*     #aaa tr:nth-child(5){ */
/*      width: 210px; */
/*     } */
/*     #aaa tr:nth-child(6){ */
/*       width: 70px; */
/*     } */
/*     #aaa tr:nth-child(7){ */
/*       width: 210px; */
/*     } */
/*     #aaa tr input { */
/*     width: 197px; */
/* } */

div#add_div p {
    margin-top: 10px;
    margin-left: 35px;
}

input#flbm{
 background: #ccc;
}
    </style>
        <script type="text/javascript">
        var manager = null;
        $(function (){
        	 jQuery.post("gnflqueryList!queryList",function(data){
        	manager = $("#maingrid").ligerGrid({
                height: '99%',
                width: '97%',
                toolbar: {//工具条
                	items: [
                            { text: '增加', click: addGnfl, icon: 'add' },
                            { line: true },//|线条
                            { text: '修改', click: updateGnfl, icon: 'modify' },
                            { line: true },
                            { text: '删除', click: deleteGnfl, img: 'js/ligerUI/skins/icons/delete.gif' }
                        ]
                },
                columns: [
                     { display: '分类名称', name: 'flmc', minWidth: 60,  },
                      { display: '序号', name: 'flxh', width: 100 }
                ], pageSize:10,rownumbers: true,
               		data:data
            });

        	 })
            $("#pageloading").hide();
        });
            function addGnfl(){
//             	$("#flbm").removeAttr("readOnly") ;
            	 				$("#flbm").val("");
                             $("#flmc").val("");
                             $("#flxh").val("");
      			    	   $.ligerDialog.open({ title: '添加分类名称', target: $('#add_div'), width: 300,
      			               buttons: [{ text: '确定', onclick: function (item, dialog) {
      			            	 $("#hidden").val("add");
      			                   submitForm();
      			               //  dialog.hidden();
      			               }, cls: 'l-dialog-btn-highlight'
      			               }, { text: '取消', onclick: function (item, dialog) {
      			                   $("#add_form")[0].reset();
      			                   dialog.hidden();
      			               }
      			               }], isResize: false
      			           });
                 }
            
             function updateGnfl(){
          	   var cksld = manager.getSelectedRow();
          	   console.log(cksld);
                 if (cksld != null) {
                     var flbm=cksld.flbm;
                     $.ajax({
                         type: "POST",
                         url: 'gnflqueryList!queryByMap',
                         data: 'flbm='+flbm,
                         success: function (data) {
                             $("#flbm").val(data.rows[0].flbm);
                             $("#flmc").val(data.rows[0].flmc);
                             $("#flxh").val(data.rows[0].flxh);
                             $("#hidden").val("update");
//                          }
//                      })
                             //弹出窗口
      							 $.ligerDialog.open({ title: '编辑分类名称', target: $('#add_div'), width: 300,
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
             function deleteGnfl(){
          	   var cksld = manager.getSelectedRow();
          	   //判断是否还有子节点
          	   console.log(cksld);
          	   if(cksld!=null){
//  	         	   var  cdata = manager.hasChildren(cksld);
//  	         	   console.log(cdata);
//  	         	   	if(cdata!=null){
//  	         	   	 $.ligerDialog.warn('该单位包含下级单位，请先选择删除下级单位！');
//  	             	 }else{
 	             		 $("#flbm").val(cksld.flbm);
 	             		 $("#hidden").val("delete");
 	             		 submitForm();
//  	                 }
 	         	   }
                 }
             //提交form表单路径判断
             function  submitForm(){
                 var hidden=$("#hidden").val();
               //  alert(hidden);
                 switch (hidden) {
      	           case "update":
      		           
      	               $("#add_form").attr("action", "gnflqueryList!update");
      	               $("#add_form").submit();
      	               break;
      	           case "add":
      			    	 var flmc=  $("#flmc").val();
      			    	 var flxh=   $("#flxh").val();
      			    	 var reg=/^\d+$/;
      			    	String.prototype.trim = function ()  
    					{  
    					    return this.replace(/(^\s*)|(\s*$)/g, "");  
    					} 
      			    	 if(flmc.trim(String)==""||reg.test(flxh)==false){
      			    		 $.ligerDialog.warn('请完善添加信息;或分类序号不是阿拉伯数字！');
      				    	 }else{
      			               $("#add_form").attr("action", "gnflqueryList!add");
      			               $("#add_form").submit();
      					    }
      			    	 break;
      	           case "delete":
      	        	   $("#add_form").attr("action", "gnflqueryList!delete");
      	        	   $("#add_form").submit();
      	               break;
             			}
                 }

   </script>
</head>
	<body style="overflow-x:hidden; padding:2px;">
		<div class="l-loading" style="display:block" id="pageloading"></div>
		<div class="l-clear"></div>
		
		<div id="maingrid"></div>
		
		<div style="display:none;"></div>
		 <%--添加数据窗口--%>
    <div id="add_div" style="display: none; margin: 0 auto;">
        <form id="add_form" method="post">
<%--         <p><span>分类编码：</span> --%>
        	<span><s:textfield class="l-text" type="text" style="display:none" id="flbm" name="flbm"  readOnly= "true"/>
                   <input type="hidden" id="hidden" name="hidd_unitNumber" value="" /></span>
<!--          </p> -->
         <p><span>分类名称：</span><span><s:textfield class="l-text" type="text" id="flmc" name="flmc"  /></span></p>
<!--          <input type="number"  class="l-text" id="flxh" name="flxh"  min="1" max="10" />  -->
         <p><span>分类序号：</span><span><s:textfield class="l-text" type="text" id="flxh" name="flxh" maxlength="150" /></span></p>
<!--         <table style="line-height: 30px; width: 100%;padding-left:10px" id="aaa"> -->
<!--             <tr> -->
<!--                 <td style="text-align: center;width: 70px; display:none"> -->
<!--                     分类编码： -->
<!--                 </td> -->
<!--                 <td > -->
<%--                    <s:textfield class="l-text" type="text" style="display:none" id="flbm" name="flbm"  readOnly= "true"/> --%>
<!--                     <input type="hidden" id="hidden" name="hidd_unitNumber" value="" /> -->
<!--                 </td> -->
<!--                 <td style="text-align: center;width: 70px;"> -->
<!--                     分类名称： -->
<!--                 </td> -->
<!--                 <td> -->
<%--                     <s:textfield class="l-text" type="text" id="flmc" name="flmc"  /> --%>
<!--                 </td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--                 <td style="text-align: center;width: 70px;"> -->
<!--                     分类序号： -->
<!--                 </td> -->
<!--                 <td> -->
<%--                    <s:textfield class="l-text" type="text" id="flxh" name="flxh" maxlength="150" /> --%>
<!--                 </td> -->
               
<!--             </tr> -->
      
            
<!--         </table> -->
        </form>
    </div>
	
	</body>

</html>
