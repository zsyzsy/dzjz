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
    <script type="text/javascript">
        $(function ()
        {
        	jQuery.post("gnflqueryList!queryList",function(data){
            	var getData=data.rows;
            $("#test1,#flbm").ligerComboBox({
                width : 200,
               data:getData,
                initIsTriggerEvent: false,
                valueField :"flbm",
                textField :"flmc",
              onSelected :function(data1){
            	  String.prototype.trim = function ()  
					{  
					    return this.replace(/(^\s*)|(\s*$)/g, "");  
					} ;
						if(data1.trim(String)!=""){
										$("#test2").val(data1);
						}
                  }
            	});
        	})
        });
    </script>
    <script type="text/javascript">
        var manager = null;
        $(function (){
        	 jQuery.post("gndyqueryList!queryList",function(data){
        	manager = $("#maingrid").ligerGrid({
                height: '99%',
                width: '99%',
                toolbar: {//工具条
                	items: [
                            { text: '增加', click: addGndy, icon: 'add' },
                            { line: true },//|线条
                            { text: '修改', click: updateGndy, icon: 'modify' },
                            { line: true },
                            { text: '删除', click: deleteGndy, img: 'js/ligerUI/skins/icons/delete.gif' }
                        ]
                },
                columns: [
                    { display: '功能名称', name: 'gnmc', minWidth: 60 },
                    { display: '功能窗体', name: 'gnct', minWidth: 120 },
                    { display: '功能序号', name: 'gnxh', minWidth: 140 },
                    { display: '功能说明', name: 'gnsm', minWidth: 140 }
                ], pageSize:20,rownumbers: true,where : f_getWhere(),
               		data:data
            });

        	 })
            $("#pageloading").hide();
        });

        function addGndy(){
        	$("#gnbm").removeAttr("readOnly") ;
        	
        	
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
        
         function updateGndy(){
      	   var cksld = manager.getSelectedRow();
      	 //  console.log(cksld);
             if (cksld != null) {
                 var gnbm=cksld.gnbm;
                 $.ajax({
                     type: "POST",
                     url: 'gndyqueryList!queryByMap',
                     data: 'gnbm='+gnbm,
                     success: function (data) {
                         //console.log(data);
                         $("#gnbm").val(data.rows[0].gnbm);
                         $("#gnmc").val(data.rows[0].gnmc);
                         $("#gnxh").val(data.rows[0].gnxh);
                         $("#gnct").val(data.rows[0].gnct);
                         $("#gnsm").val(data.rows[0].gnsm);
//                          $("#gnfl").val(data.rows[0].gnfl);
                         $("#hidden").val("update");
//                      }
//                  })
					//功能分类下拉列表
		        	$("#flbm").ligerComboBox({
		                width : 200,
		               url:"gnflAction!queryGnfl",
		                initIsTriggerEvent: false,
		                valueField :"flbm",
		                textField :"flmc",
		                onSuccess:function(data){
			              //  console.log("----");
							//	console.log(data);
		         
		                    }
		            });
		            var boxGndy=$("#flbm").ligerComboBox();
		            boxGndy.setValue(data.rows[0].flbm);
		            boxGndy.selectValue(data.rows[0].flbm);
		            
		           
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
         function deleteGndy(){
      	   var cksld = manager.getSelectedRow();
      	   //判断是否还有子节点
      	  // console.log(cksld);
      	   if(cksld!=null){
//	         	   var  cdata = manager.hasChildren(cksld);
//	         	   console.log(cdata);
//	         	   	if(cdata!=null){
//	         	   	 $.ligerDialog.warn('该单位包含下级单位，请先选择删除下级单位！');
//	             	 }else{
	             		 $("#gnbm").val(cksld.gnbm);
	             		 $("#hidden").val("delete");
	             		 submitForm();
//	                 }
	         	   }
             }
         //提交form表单路径判断
         function  submitForm(){
             var hidden=$("#hidden").val();
             switch (hidden) {
  	           case "update":
  	        	 	var gnbm=   $("#gnbm").val();
			    	 var gnmc=  $("#gnmc").val();
			    	 var gnxh=   $("#gnxh").val();
		        	var reg=/^\d+$/; //
			    	 var gnct=   $("#gnct").val();
			    	 var gnsm=   $("#gnsm").val();
			    	 var gnfl=   $("#gnfl").val();
			    	 if(gnmc.trim()==""||gnct.trim()==""||reg.test(gnxh)==false){
  			    		 $.ligerDialog.warn('请完善添加信息;或功能序号不是阿拉伯数字！');
  				    	 }else{
  				    		 $("#add_form").attr("action", "gndyqueryList!update");
  		  	               $("#add_form").submit();
  					    }
  	              
  	               break;
  	           case "add":
  	              	 var gnbm=   $("#gnbm").val();
  			    	 var gnmc=  $("#gnmc").val();
  			    	 var gnxh=   $("#gnxh").val();
  		        	var reg=/^\d+$/; // 注意：故意限制了 0321 这种格式，如不需要，直接reg=/^\d+$/;
  			    	 var gnct=   $("#gnct").val();
  			    	 var gnsm=   $("#gnsm").val();
  			    	 var gnfl=   $("#gnfl").val();
  			    	 if(gnmc.trim()==""||gnct.trim()==""||reg.test(gnxh)==false){
  			    		 $.ligerDialog.warn('请完善添加信息;或功能序号不是阿拉伯数字！');
  				    	 }else{
  			               $("#add_form").attr("action", "gndyqueryList!add");
  			               $("#add_form").submit();
  					    }
  			    	 break;
  	           case "delete":
  	        	   $("#add_form").attr("action", "gndyqueryList!delete");
  	        	   $("#add_form").submit();
  	               break;
         			}
             }
		//条件搜索
         function f_search()
         {
        	 jQuery.post("gndyqueryList!queryList",function(data){
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
                 var key2 = $("#test2").val();
                 return (rowdata.gnmc.indexOf(key) > -1) && (rowdata.flbm.indexOf(key2) > -1);
             };
             manager.changePage("first"); //重置到第一页
            
             return clause; 
         }
    </script>
</head>
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
    select .l-text{
        height: 22px;
        line-height: 22px;
    }
    .sbxx_cx{
        margin-left: 10px;
        position: relative;
    }
    .sbxx_cx .rzcx_cx{
        width: 70px;
        padding-left: 20px;
        height: 22px;
        background: #E2F0FF url('../images/grid/header-bg.gif') repeat-x left bottom;
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
        background: #FFBE76  url("../images/button-bg-over.gif")  repeat-x center;;
        border-color: #D6A886;
    }
    .l-text-wrapper {
        width: 200px;
        float: left;
        position: relative;
    }
    /***********添加*************/
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
/*     #aaa tr:nth-child(6){ */
/*     		width: 70px; */
/*     } */
/*     #aaa tr:nth-child(8){ */
/*     		width: 70px; */
/*     } */
/*     #aaa tr:nth-child(10){ */
/*     		width: 70px; */
/*     } */
/*     #aaa tr:nth-child(5){ */
/*     		width: 210px; */
/*     } */
/*     #aaa tr:nth-child(7){ */
/*     		width: 210px; */
/*     } */
/*     #aaa tr:nth-child(9){ */
/*     		width: 210px; */
/*     } */
/*     #aaa tr input { */
/*     width: 197px; */
/* } */

div#add_div p {
    margin-top: 10px;
    margin-left: 15px;
}
#add_div p input {
    width: 197px;
}
/*下拉框*/
.l-text.l-text-combobox {
    margin-left: 3px;
}
</style>
<body style="overflow-x:hidden; padding:2px;">
	<div style="margin: 10px auto;overflow: hidden">
	    <span style="float: left">功能名称：<input id="txtKey" type="text" /></span>
	    <span style="float: left;margin-left: 10px;margin-top: 3px;">
	    所属类别：</span><input type="text" id="test1" />
	    	<input type="text" id="test2" style="display: none"/>															
	    <span class="sbxx_cx"><input id="btnOK" type="button" value="查询" onclick="f_search()" class="rzcx_cx" />
	            <img src="images/search.gif" alt=""/>
	    </span>
	</div>
<%-- 		 <s:textfield class="l-text" type="text" id="www"   /> --%>
<%-- 	<s:action name="gnflAction!queryGnfl" executeResult="true" id="gnflAction" namespace="/"/>  --%>
<%-- 	<s:property value="jsonListResult"/> --%>
	<div class="l-loading" style="display:block" id="pageloading"></div>
	<!--<a class="l-button" style="width:120px;float:left; margin-left:10px;display:none" onclick="deleteRow()">删除选择的行</a>-->
		<div class="l-clear"></div>
		<div id="maingrid"></div>
	
	<div style="display:none;">
	
	</div>
	<%--添加数据窗口--%>
    <div id="add_div" style="display: none; margin: 0 auto;">
  <form id="add_form" method="post">
  <p style="display: none"><span>功能编码:</span><span><s:textfield class="l-text" type="text" id="gnbm" name="gnbm"  readOnly= "true" style="display:none"/></span></p>
  <p><span>功能名称:</span>
  	<span>
   		<s:textfield class="l-text" type="text" id="gnmc" name="gnmc" />
          <input type="hidden" id="hidden" name="hidd_unitNumber" value="" />
  	</span>
  </p>
  <p><span>功能序号:</span><span><s:textfield class="l-text" type="text" id="gnxh" name="gnxh" maxlength="150" /></span></p>
  <p><span>功能窗体:</span><span><s:textfield class="l-text" type="text" id="gnct" name="gnct" maxlength="150" /></span></p>
  <p><span style="float:left;margin-right: 4px;">功能分类:</span><span id="flbm_text"><s:textfield class="l-text" type="text" id="flbm" name="flbm" maxlength="150" style="display :none"/></span></p>
<!--     <table style="line-height: 30px; width: 100%;overflow: hidden;" id="aaa"> -->
<!--       <tr> -->
<!--         <td style="text-align: center;width: 70px;display:none"> -->
<!--           功能编码: -->
<%--           <s:textfield class="l-text" type="text" id="gnbm" name="gnbm"  readOnly= "true" style="display:none"/> --%>
<!--         </td> -->
<!--         <td style="text-align: center;width: 70px;"> -->
<!--              功能名称: -->
<%--           <s:textfield class="l-text" type="text" id="gnmc" name="gnmc" /> --%>
<!--           <input type="hidden" id="hidden" name="hidd_unitNumber" value="" /> -->
<!--         </td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--         <td style="text-align: center;width: 70px;"> -->
<!--           功能序号: -->

<%--           <s:textfield class="l-text" type="text" id="gnxh" name="gnxh" maxlength="150" /> --%>
<!--         </td> -->
<!--         <td style="text-align: center;width: 70px;"> -->
<!--           功能窗体: -->
<%--           <s:textfield class="l-text" type="text" id="gnct" name="gnct" maxlength="150" /> --%>
<!--         </td> -->
<!--       </tr> -->
<!--       <tr> -->
<!--         <td style="text-align: center;width: 70px;"> -->
<!--           功能分类: -->
<!--         </td> -->
<!--         <td id="flbm_text"> -->
<%--           <s:textfield class="l-text" type="text" id="flbm" name="flbm" maxlength="150" style="display :none"/> --%>
<!--         </td> -->
<!--       </tr> -->
<!--     </table> -->
  </form>
</div>

</body>

</html>
