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
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>

    <script src="js/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>

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
        .sbxx_cx{
            margin-left: 10px;
            position: relative;
        }
        .sbxx_cx .rzcx_cx{
            width: 70px;
            padding-left: 20px;
            height: 22px;
            background: url('images/header-bg.gif');
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
        
            /*添加*/
#add_form p{
    overflow: hidden;
    zoom: 1;
    margin-top: 15px;
    margin-left: 30px;
  }
  span.add_leix {
    margin-top: 4px;
    float: left;
}
span.add_leix_zhi {
    float: left;
}
span.add_zhi {
    padding-left: 11px;
}
input#configvalue {
    margin-left: -3px;
    width: 197px;
}
/*         #aaa{ */
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
/*     #aaa tr:nth-child(2){ */
/*       width: 0; */
/*     } */
/*     #aaa tr:nth-child(3){ */
/*       width: 210px; */
/*     } */
/*      #aaa tr:nth-child(6){ */
/*       width: 70px; */
/*     } */
/*     #aaa tr:nth-child(7){ */
/*       width: 210px; */
/*     } */
/*     #aaa tr input { */
/*     width: 197px; */
/* } */
  .l-textarea {
   border: 1px solid #AECAF0;
   margin-left:3px;
  } 
    </style>
    <script type="text/javascript">
        var manager;
        $(function ()
        {
        	 jQuery.post("cspzqueryList!queryByMap",function(data){
             	manager = $("#maingrid").ligerGrid({
             		 height: '99%',
                        toolbar: {//工具条
                            items: [
                                { text: '增加', click: addCspz, icon: 'add' },
                                { line: true },//|线条
                                { text: '修改', click: updateCspz, icon: 'modify' },
                                { line: true },
                                { text: '删除', click: deleteCspz, img: 'js/ligerUI/skins/icons/delete.gif' }
                            ]
                        },
                        columns: [
                            { display: '名称', name: 'configname', minWidth: 120 },
                            { display: '值', name: 'configvalue', minWidth: 120 }
                        ], pageSize:20,rownumbers: true,where : f_getWhere(),
                       data:data
                    });
        	 });
            $("#pageloading").hide();
        });
        function addCspz(){
        	$("#gnbm").removeAttr("readOnly") ;
        	//功能分类下拉列表
		        	$("#pzbs").ligerComboBox({
		                width : 200,
		             url:'cspzqueryList!queryList1',
		                initIsTriggerEvent: false,
		                valueField :"statusKey",
		                textField :"statusString",
		                    onSelected  :function(data){
			                    //configid赋值
			                    $("#configid").val(data);
			                    //configname赋值
			                    $("#configname").val($("#pzbs_txt").val());
//                            	 getSelected();
                                }
		            });
        	//弹出框
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
             }
        function updateCspz(){
      	   var cksld = manager.getSelectedRow();
             if (cksld != null) {
      	  		 var pzbm=cksld.pzbm;
      	  		 $("#pzbm").val(pzbm);
                 $.ajax({
                     type: "POST",
                     url: 'cspzqueryList!queryByMap',
                     data: 'pzbm='+pzbm,
                     success: function (data) {
                         $("#pzbs_txt").val(data.rows[0].configname);
                         $("#configvalue").val(data.rows[0].configvalue);
                         $("#configname").val(data.rows[0].configname);
                         $("#configid").val(data.rows[0].configid);
                         $("#hidden").val("update");
//                      }
//                  })
					//功能分类下拉列表
		        	$("#pzbs").ligerComboBox({
		                width : 200,
		               url:"cspzqueryList!queryList1",
		                initIsTriggerEvent: false,
		                valueField :"statusKey",
		                textField :"statusString",
		                onSuccess:function(data1){
		                	 $("#pzbs_txt").val(data.rows[0].configname);
// 		                	$("#pzbs_txt").val(data[0].configname);	
			                },
	                    onSelected  :function(data){
		                    //configid赋值
		                    $("#configid").val(data);
		                    //configname赋值
		                    $("#configname").val($("#pzbs_txt").val());
                               }
		            });

                     }
              })
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
  	           } else{
  	               $.ligerDialog.warn('请先选择需要编辑的数据');
  	           }
             }
             function deleteCspz(){
           	   var cksld = manager.getSelectedRow();
           	   //判断是否还有子节点
           	   if(cksld!=null){
  	             		 $("#pzbm").val(cksld.pzbm);
  	             		 $("#hidden").val("delete");
  	             		 submitForm();
  	         	   }
                  }
        //提交form表单路径判断
        function  submitForm(){
            var hidden=$("#hidden").val();
            switch (hidden) {
 	           case "update":
 	               $("#add_form").attr("action", "cspzqueryList!update");
 	               $("#add_form").submit();
 	               break;
 	           case "add":
 	              	 var configid=   $("#configid").val();
 			    	 var configname=  $("#configname").val();
 			    	 var configvalue=   $("#configvalue").val();
 			    	String.prototype.trim = function ()  
					{  
					    return this.replace(/(^\s*)|(\s*$)/g, "");  
					}  
 			    	 if(configvalue.trim(String)==""||configname.trim(String)==""||configvalue.trim(String)==""){
 			    		 $.ligerDialog.warn('请完善添加信息！');
 				    	 }else{
 			               $("#add_form").attr("action", "cspzqueryList!add");
 			               $("#add_form").submit();
 					    }
 			    	 break;
 	           case "delete":
 	        	   $("#add_form").attr("action", "cspzqueryList!delete");
 	        	   $("#add_form").submit();
 	               break;
        			}
            }
      //条件搜索
        function f_search()
        {
        	jQuery.post("cspzqueryList!queryByMap",function(data){
       	 manager.options.data = data;
       	 manager.loadData(f_getWhere());
       	 })
        }
        function f_getWhere()
        {
            if (!manager) return null;
            var clause = function (rowdata, rowindex)
            {
                var key = $("#txtKey").val();
                return rowdata.configname.indexOf(key) > -1;
            };
            manager.changePage("first"); //重置到第一页
            return clause; 
        }

    </script>
</head>
<body style="overflow-x:hidden; padding:2px;">
<div style="margin: 10px">
    名称:<input id="txtKey" type="text" />
     <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="查询" onclick="f_search()"/>
        <img src="images/search.gif" alt=""/>
    </span>
</div>
<div class="l-loading" style="display:block" id="pageloading"></div>
<div class="l-clear"></div>

<div id="maingrid"></div>

<%--添加数据窗口--%>
    <div id="add_div" style="display: none; margin: 0 auto;">
  <form id="add_form" method="post">
  <p><span class="add_leix">类型:</span>
	  <span class="add_leix_zhi">
	  <s:textfield class="l-text" type="text" id="pzbm" name="pzbm"  style="display :none" readOnly= "true"/>
	  <s:textfield class="l-text" type="text" id="pzbs"   style="display :none"/>
	  <s:textfield class="l-text" type="text" id="configid" name="configid"  style="display :none"/>
	  <s:textfield class="l-text" type="text" id="configname" name="configname"  style="display :none"/>
	  </span>
	</p>
	<p><span class="add_zhi">值:</span>
		<span>
		<s:textfield class="l-text" type="text" id="configvalue" name="configvalue" />
	    <input type="hidden" id="hidden" name="hidd_unitNumber" value="" />
		</span>
	</p>
<!--     <table style="line-height: 30px; width: 100%;overflow: hidden;" id="aaa"> -->
<!--       <tr> -->
<!--         <td style="text-align: center;width: 70px;" id="pzbs_text"> -->
<!--           类型: -->
<%--           <s:textfield class="l-text" type="text" id="pzbm" name="pzbm"  style="display :none" readOnly= "true"/> --%>
<%--           <s:textfield class="l-text" type="text" id="pzbs"   style="display :none"/> --%>
<%--           <s:textfield class="l-text" type="text" id="configid" name="configid"  style="display :none"/> --%>
<%--           <s:textfield class="l-text" type="text" id="configname" name="configname"  style="display :none"/> --%>
<!--         </td> -->
<!--         <td style="text-align: center;width: 70px;"> -->
<!--              值: -->
<%--           <s:textfield class="l-text" type="text" id="configvalue" name="configvalue" /> --%>
<!--           <input type="hidden" id="hidden" name="hidd_unitNumber" value="" /> -->
<!--         </td> -->
<!--       </tr> -->
<!--     </table> -->
  </form>
</div>

</body>

</html>
