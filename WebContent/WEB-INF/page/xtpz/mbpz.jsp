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
   <link rel="stylesheet" type="text/css" href="js/easyUi/themes/easyui.css" />
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
 	<script type="text/javascript" src="js/easyUi/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.mobile.js"></script>
    <script src="js/easyUi/newdata.js"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
    <style type="text/css">
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
    .l-text-wrapper {
        width: 200px;
        position: relative;
        float: left;
    }
    
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
        margin-left: 20px;
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

    .l-text-wrapper {
        width: 200px;
        float: left;
        margin-left: 3px;
        position: relative;
    }
    .l-text {
        margin-top: 1px;
    }
     /*新增模板*/
        .add_muban{
            width: 100%;
            overflow: hidden;
            zoom: 1;
            height: 303px;
        }
        .add_muban_left{
            margin-left: 30px;
            width: 40%;
            float: left;
            overflow: auto;
            zoom: 1;
            height: 300px;
            border: 1px solid #A3C0E8;
        }
        .add_muban_left_content{
            margin: 20px auto;
        }
           /* 添加 */
        .add_muban_left_content p{
            overflow: hidden;
		    zoom: 1;
 		    margin-top: 37px;
		    margin-left: 12px;
        }
           /* 添加结束  */
        .add_baocun{
            width:50px;
            height: 22px;
            background: url('images/header-bg.gif');
            line-height: 22px;
            border: 1px solid #AECAF0;
        }
        /*you*/
        .add_muban_right{
            margin-left: 30px;
            margin-right: 30px;
            width: 40%;
            float: right;
            overflow: auto;
            zoom: 1;
            height: 300px;
            border: 1px solid #A3C0E8;
        }
        .jzmb_xh{
            width: 100px;
        }
        .btn{
            margin-left: 50px;
        }
     
     					.textbox {
     					float:left;
    border: 1px solid #AECAF0;
  
}
.textbox-focused{
box-shadow:none;
}
    
     
   /* 添加 */
/*      #add_form span.sbxx_cx { */
/* 	    display: none; */
/* 	} */
/* 	#add_form tr:nth-child(1),#add_form tr:nth-child(2) { */
/*     position: absolute; */
/*     top: 76px; */
/* } */
/* #add_form tr:nth-child(1) { */
/*     left: 47px; */
/* } */
/* #add_form tr:nth-child(2) { */
/*     left: 97px; */
/* } */
/* #add_form tr:nth-child(3),#add_form tr:nth-child(4) { */
/*     position: absolute; */
/*     top: 126px; */
/* } */
/* #add_form tr:nth-child(3) { */
/* 	left: 47px; */
/* } */
/* #add_form tr:nth-child(4) { */
/* 	left: 97px; */
/* } */
/* #add_form tr:nth-child(6) { */
/*     position: absolute; */
/*     top: 176px; */
/* } */
/* #add_form tr:nth-child(9) { */
/*     position: absolute; */
/*     top: 226px; */
/* } */
/* input#dwmc,input#sslb_mc_bm { */
/*     width: 147px; */
/* } */
/* 修改 */
#up_form .add_muban_left_content {
    position: relative;
}
#up_form tr:nth-child(1),#up_form tr:nth-child(2) {
    position: absolute;
    top: 50px;
}
#up_form tr:nth-child(1) {
    left: 14px;
}
#up_form tr:nth-child(2) {
    left: 74px;
}
#up_form tr:nth-child(3),#up_form tr:nth-child(4) {
    position: absolute;
    top: 100px;
}
#up_form tr:nth-child(3){
   left: 14px;  
}
#up_form tr:nth-child(4) {
    left: 74px;
}

#up_form tr:nth-child(5),#up_form tr:nth-child(6) {
    position: absolute;
    top: 150px;
}
#up_form tr:nth-child(5) {
    left: 14px;
}
#up_form tr:nth-child(6) {
        left: 74px;
}
#up_form tr:nth-child(9) {
    position: absolute;
    top: 200px;
}

.btn .sbxx_cx .rzcx_cx {
    width: 50px;
     padding-left: 0; 
     }
 input#dwmc {
    background: #ccc;
}
</style>
   <script type="text/javascript">
        $(function ()
        {
        	//搜索单位下拉列表
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
        	        lines:true,
        	        width:180,
        	        height:22,
        	        editable:true,
        	        onClick:function(data){
        	        	 //设置隐藏属性dwbm值
//        	             $("#dwbm").val(data.id);
        	            //设置显示单位名称
        	            $("#txt1").val(data.text);
        	        }
        	    });
//         	    $("#txt1").ligerComboBox({
//         	        width: 238,
//         	        selectBoxWidth: 238,
//         	        selectBoxHeight: 238,
//         	        textField:'dwmc',
//         	        valueField: 'dwmc',
//         	        treeLeafOnly:false,
//         	        valueFieldID: 'test3',
//         	        tree: {
//         	            data:getData,
//         	            checkbox: false,
//         	            textFieldName:"dwmc",
//         	            idFieldName:"dwbm",
//         	            parentIDFieldName:"fdwbm",
//         	            onclick:function(){
//         	                getSelected();
//         	            }
//         	        }
//         	    });
        	})
            //所属类别
        	 jQuery.post("sslbAction!queryByWhereMap?sslblx=1",function(data){
					var getData=data.rows;
					 var newdata=[];
		        	    for(var i=0;i<getData.length;i++){
		        	        newdata[i]={id:getData[i].sslbbm,text:getData[i].sslbmc}
		        	    }
		        	    $('#test3').combotree({
		        	        data:newdata,
		        	        width:137,
		        	        valueField: "id",
		        	        height:22,
		        	        text:"text",
		        	        lines:true,
		        	        editable:true,
		        	        onClick:function(data){
		        	        	$("#sslbbm").val(data.id);
			                	right();
		        	        }
		        	    });
					
		           // $("#test3").ligerComboBox({
		            //    width : 150,
		            //    data:getData,
		             //   valueField:'sslbbm',
		             //   textField :'sslbmc',
		               /// initIsTriggerEvent: false,
		               // onSelected: function (value,text)
		               // {
			           //     console.log(value);
		                //	$("#sslbbm").val(value);
		                //	right();
		                	
		                
		             //   }
		           // });

		            
       			 })
       			//搜索案件类别下拉列表
				jQuery.post("ajlbbmAction!queryList",function(data){
				    		 var getData=data.rows;
				    		 var newdata=[];
				        	    for(var i=0;i<getData.length;i++){
				        	        newdata[i]={id:getData[i].ajlbmc,text:getData[i].ajlbmc}
				        	    }
				        	    $('#test1').combotree({
				        	        data:newdata,
				        	        valueField: "id",
				        	        text:"text",
				        	        lines:true,
				        	        width:180,
				        	        height:22,
				        	        editable:true,
				        	        onClick:function(data){
				        	        	$("#test11").val(data.text);
				        	        }
				        	    });
				        	    
				    //  $("#test1").ligerComboBox({
				     //   width : 200,
				      //  data:getData,
				       // textField:'ajlbmc',
				      //  valueField: 'ajlbmc',
				       // treeLeafOnly:false,
				       // valueFieldID: 'test4',
				     // });
    				})
            //事项类别
		         //   $("#test2").ligerComboBox({
		          //      width : 150,
		            //    url:'ajlbbmAction!ajlbbmsList',
		            //  	valueField :'ajlbbm',
		             // 	textField: 'ajlbmc',
		             //   initIsTriggerEvent: false,
		             //   onSelected: function (value,text)
		             //   {
		              //  	$("#ajlbbm").val(value);
		               // 	$("#ajlbmc").val(text);
		              //  }
       			// })
       			//事项类别
        	 jQuery.post("ajlbbmAction!ajlbbmsList",function(data){
					var getData=data;
					 var newdata=[];
		        	    for(var i=0;i<getData.length;i++){
		        	        newdata[i]={id:getData[i].ajlbbm,text:getData[i].ajlbmc}
		        	    }
		        	    $('#test2').combotree({
		        	        data:newdata,
		        	        width:137,
		        	        valueField: "id",
		        	        height:22,
		        	        text:"text",
		        	        lines:true,
		        	        editable:true,
		        	        onClick:function(data){
		        	        	$("#ajlbbm").val(data.id);
		        	        	$("#ajlbmc").val(data.text);
		        	        }
		        	    });
					
		         

		            
       			 })
       			 //添加页面树
        function right(){
        		 jQuery.post("sslbAction!queryByWhereMap?sslbbm="+$("#sslbbm").val(),function(data){
                     //转换成tree  json格式
							var getData =data.rows;
                               $("#tree1").ligerTree({  
                               data:getData,
                               nodeWidth:200,
                               checkbox: true,
//                              		url:"dwAction!queryList", 
                               idFieldName :'sslbbm',
                               slide : false,
                               enabledCompleteCheckbox :false,
                               parentIDFieldName :'fsslbbm',
                               textFieldName: 'sslbmc',
                               ajaxType: 'get'
                               });
                              
                               manager1 = $("#tree1").ligerGetTreeManager();
              	});
            	}
   });
    </script>
    <script type="text/javascript">
    var manager=null;
    var manager1=null;
    var manager2=null;
    var dwmc='${sessionScope.yh.dwbm.dwmc}';
	var dwbm='${sessionScope.yh.dwbm.dwbm}';
        $(function (){
        	jQuery.post("mbpzqueryList!queryList?about=1",function(data){
        	manager = $("#maingrid").ligerGrid({
                height: '99%',
                width: '97%',
                toolbar: {//工具条
                    items: [
                        { text: '添加模板', click: addBm, icon: 'add' ,img: 'js/ligerUI/skins/icons/add.gif' },
                        { line: true },//|线条
                        { text: '编辑模板', click: update_tree, icon: 'modify' ,img: 'js/ligerUI/skins/icons/edit.gif' },
                        { line: true },
                        { text: '删除', click: deletemb, img: 'js/ligerUI/skins/icons/delete.gif' }
                    ]
                },
                columns: [
                    { display: '单位名称', name: 'qxmc', minWidth: 60 },
                    { display: '模板名称', name: 'dossiertypedisplaymember', minWidth: 60 },
                    { display: '案件类别名称', name: 'ajlbmc', minWidth: 100 },
                    { display: '是否存在自动生成', name: 'autonum', minWidth: 60,render:function(e) {
								if(e.autonum>0){
										return "是";
									}else{
										return "否";
										}
                        }
                     }
                ], pageSize:10,rownumbers: true,where : getWhere(),
               // url:"mbpzqueryList!queryList?about=1",
               data:data, pageSize:20,
                onSelectRow :function(data){
						//console.log(data);
                    },
                onSuccess: function(data){
					//console.log(data);
                    }
            });
        	 });

            $("#pageloading").hide();
        });

        //工具条事件
        function addBm(){
         	   $("#dwbm").val(dwbm) ;
         	   $("#dwmc").val(dwmc) ;
//          	  var getCheckeddata1=manager1.getChecked();
//          	  console.log(getCheckeddata1);
         	 		//未选取添加节点
     			    	   $.ligerDialog.open({ title: '添加模板', target: $('#add_div'), width: 600,
     			               buttons: [{ text: '确定', onclick: function (item, dialog) {
     			            	  var getCheckeddata=manager1.getChecked();
     			            	 //console.log(getCheckeddata);
     			            	 var sslbbm="";
     			            	 var sslbmc="";
     							$(getCheckeddata).each(function(){
     									sslbbm+=this.data.sslbbm+",";
     									sslbmc+=this.data.sslbmc+",";
     								})
     			 				$("#sslbbm").val(sslbbm);
     			 				$("#sslbmc").val(sslbmc);
     			            	   var hidden=  $("#hidden").val("add");
     			            	   $("#add_form").attr("action", "mbpzqueryList!add");
     		     	               $("#add_form").submit();
     			               }, cls: 'l-dialog-btn-highlight'
     			               }, { text: '取消', onclick: function (item, dialog) {
     			                   $("#add_form")[0].reset();
     			                   dialog.hidden();
     			               }
     			               }], isResize: false
     			           });
                }
         
            function updateBm(){
         	   var cksld = manager.getSelectedRow();
         	  // console.log(cksld);
         	   $("#text_dwmc").val(dwmc);
         	   $("#text_ajlbmc").val(cksld.ajlbmc);
                if (cksld != null) {
                    $.ajax({
                        type: "POST",
                        url: 'mbpzqueryList!queryList',
                        data: 'dossiertypevaluemember='+cksld.dossiertypevaluemember,
                        success: function (data) {
                         //   console.log(data);
                           var getData2=data.rows;
                           $("#tree2").ligerTree({  
                               data:getData2,
//                                enabledCompleteCheckbox :true,
									nodeWidth:200,
                               checkbox: false,
//                              		url:"dwAction!queryList", 
                               idFieldName :'dossiertypevaluemember',
                               slide : false,
                               parentIDFieldName :'dossierparentmember',
                               textFieldName: 'sslbmc',
                               ajaxType: 'get',
                             onSelect:function(data){
                                 var sslbmc1=data.data.sslbmc;
                                 var sslbbm1=data.data.sslbbm;
                                 var pzbm1=data.data.dossiertypevaluemember;
                                 $("#text_sslbmc").val(sslbmc1);
                                 
                                 $("#text_pzbm1").val(pzbm1);
                                 },
                             onSuccess:function(data){
    							//console.log(data);
                                 }
                         });
                    	 manager2 = $("#tree2").ligerGetTreeManager();
                            //弹出窗口
     					manager1 = $("#maingrid").ligerGetGridManager();
                            }
                        })
     	           } 
                }
            ///t修改窗口
            function update_tree(){
            	 $("#text_dwmc").attr("readonly","readonly");
            	 $("#text_ajlbmc ").attr("readonly","readonly");
            	 $("#text_sslbmc").attr("readonly","readonly");
            	 $("#text_dwmc").css("background","#ccc");
            	 $("#text_ajlbmc ").css("background","#ccc");
            	 $("#text_sslbmc").css("background","#ccc");
            	  var row = manager.getSelectedRow();
            	  console.log(row);
            	 $("#text_sslbmc").val(row.sslbmc);
                  if (row) {
                	  updateBm();
                        //弹出窗口
                        $.ligerDialog.open({ title: '修改模板', target: $('#up_div'), width: 588,
                          buttons: [{ text: '确定', onclick: function (item, dialog) {
                        	  dialog.hidden();
                          }, cls: 'l-dialog-btn-highlight'
                          }, { text: '取消', onclick: function (item, dialog) {
                            dialog.hidden();
                          }
                          }], isResize: true
                        });
                   
                  } else{
                    $.ligerDialog.warn('请选择修改项');
                  }
                }
            //模板删除
            function deletemb(){
            	var cksldD = manager.getSelected();
            	if(cksldD!=null){
            		var mbbm=cksldD.dossiertypevaluemember;
            		  $.ligerDialog.confirm('是否删除该模板', function (yes) {
            		      if(yes){
			            		 $.ajax({
			                         type: "POST",
			                         url: 'mbpzqueryList!delete_Mb',
			                         data: 'dossiertypevaluemember='+mbbm,
			                         success: function (data) {
				                       	  $.ligerDialog.success('删除成功!!!');
				                       $(".l-dialog-btn-inner").click(function(){
				                    	   setTimeout(function(){
					 	 					 window.location.reload();
				                    	   },1000);
						 	 			})
			                             },
			                             error:function(error){
			                             $.ligerDialog.warn('删除失败!!!');
			
			                              }
			
			                     })
                		        	 
                		       }
            		  })
                	} else{
                        $.ligerDialog.warn('请选择模板');
                    }

                }
            //编辑窗口删除sslb
            function deleteBm(){
         	   var cksld = manager2.getSelected();
         	  // console.log(cksld);
         	   if(cksld!=null){
             	   //判断选择是否为j
             	   var a=cksld.data.category;
         		  if(a!="J"){
         	   		var pzbm2=cksld.data.dossiertypevaluemember;
		         	  $.ajax({
		                  type: "POST",
		                  url: 'mbpzqueryList!delete_sslb',
		                  data: 'pzbm='+pzbm2,
		                  success: function (data) {
		                	  updateBm();
		                	  $.ligerDialog.warn('删除成功!!!');
		                      },
		                      error:function(error){
		                      $.ligerDialog.warn('删除失败!!!');
		
		                       }
		
		              		})
             		  }else{
             			 $.ligerDialog.warn('卷不能被删除');
                 		  }

             	   }else{
             		  $.ligerDialog.warn('请选择文件');
                 	   }
         	 
                }
          
            function getCheckeddata(){
				$("#dwmc").val();
				$("#dwbm").val();
				$("#ajlbbm").val();
				$("#ajlbmc").val();
				$("#sslbbm").val();
				var getCheckeddata=manager1.getChecked();
				$("#sslb_mc_bm").val(getCheckeddata);
				var sslbbm="";
				$(getCheckeddata).each(function(){
						sslbbm+=this.data.sslbbm+",";
					})
				//console.log(sslbbm);
               }
            //条件搜索
            var manager;
	        function search()
	        {
	        	jQuery.post("mbpzqueryList!queryList?about=1",function(data){
		       	manager.options.data = data;
		       	manager.loadData(getWhere());
	       	 })
	        }
	        function getWhere()
	        {
	            if (!manager) return null;
	            var clause = function (rowdata, rowindex)
	            {
	                var key = $("#txt1").val();
	                var key1 = $("#test11").val();
	                return (rowdata.qxmc.indexOf(key) > -1)&&(rowdata.ajlbmc.indexOf(key1) > -1) ;
	            };
	            manager.changePage("first"); //重置到第一页
	            return clause; 
	        }
    </script>
</head>

<body>
<div style="margin:10px;overflow: hidden">
    <span style="float: left;margin-top: 3px">单位名称:</span><input type="text" id="txt1"/>
    <span style="float: left;margin-top: 3px;margin-left: 20px">案件类别:</span><input type="text" id="test1" /><input type="hidden" id="test11" />
    <span class="sbxx_cx"><input class="rzcx_cx" type="button"  value="查询" onclick="search()"/>
            <img src="images/search.gif" alt=""/>
    </span>
</div>



<div class="l-loading" style="display:block" id="pageloading"></div>
<div class="l-clear"></div>

<div id="maingrid"></div>
<%--添加数据窗口--%>
    <div id="add_div" style="display: none; margin: 0 auto;">
    <form id="add_form" method="post">
        <div class="add_muban">
            <div class="add_muban_left">
                <div class="add_muban_left_content">
                
                <p><span>所属单位:</span>
	                <span><s:textfield class="l-text" type="text"  id="dwmc" name="dwmc" readonly="true" unselectable="on"/>
                        <s:textfield style="display:none" type="text"  id="dwbm" name="dwbm"/>
	                </span>
                </p>
                <p><span>模板名称:</span><span><s:textfield  type="text"  id="sslb_mc_bm" name="sslb_mc_bm"/></span></p>
                <p><span style="float: left;margin-right: 7px;">案件类别:</span>
	                <span id="test2"><s:textfield style="display:none" type="text"  id="ajlbbm" name="ajlbbm"/>
	                            <s:textfield style="display:none" type="text"  id="ajlbmc" name="ajlbmc"/>
	                </span>
                </p>
                <p><span style="float: left;margin-right: 7px;">所属类别:</span>
	                <span id="test3"></span>
	            </p>
              <p>
              		<span><s:textfield style="display: none;"   type="text"  id="sslbbm" name="sslbbm"/>
                     <s:textfield  style="display: none;"  type="text"  id="sslbmc" name="sslbmc"/>
                     </span>
<%--                      <span class="sbxx_cx"><input class="rzcx_cx" type="button"  value="查询" onclick="getCheckeddata()"/></span> --%>
              </p>
<!--                     <table id="aaa"> -->
<!--                     <tr> -->
<!--                             <td>模板名称:</td> -->
<!--                         <td> -->
<%--                         <s:textfield  type="text"  id="sslb_mc_bm" name="sslb_mc_bm"/> --%>
<!--                         </td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td>所属单位:</td> -->
<%--                         <td><s:textfield class="l-text" type="text"  id="dwmc" name="dwmc" readonly="true"/> --%>
<%--                         <s:textfield style="display:none" type="text"  id="dwbm" name="dwbm"/> --%>
<!--                         </td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td style="float: left;margin-top: 5px;margin-left: 10px;">案件类别:</td> -->
<!--                             <td id="test2"></td> -->
<%--                             <s:textfield style="display:none" type="text"  id="ajlbbm" name="ajlbbm"/> --%>
<%--                             <s:textfield style="display:none" type="text"  id="ajlbmc" name="ajlbmc"/> --%>
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td style="float: left;margin-top: 5px;margin-left: 10px;">所属类别:</td> -->
<!--                             <td id="test3"></td> -->
<!--                         </tr> -->
                         
<!--                         <tr> -->
<!--                             <td colspan="2"> -->
<%--                              <s:textfield  type="text"  id="sslbbm" name="sslbbm"/> --%>
<%--                             <s:textfield type="text"  id="sslbmc" name="sslbmc"/> --%>
<%--                             <span class="sbxx_cx"><input class="rzcx_cx" type="button"  value="查询" onclick="getCheckeddata()"/></span> --%>
<!--                             </td> -->
<!--                         </tr> -->
<!--                     </table> -->
                </div>

            </div>
            <div class="add_muban_right">
                <ul id="tree1" >
                </ul>
            </div>
        </div>
    </form>
</div>
 <%--修改数据窗口--%>
<div id="up_div" style="display: none; margin: 0 auto;">
    <form id="up_form" method="post">
        <div class="add_muban">
            <div class="add_muban_left">
                <ul id="tree2">
                </ul>


            </div>
            <div class="add_muban_right">
                <div class="add_muban_left_content">
                <p><span>所属单位:</span><span><s:textfield class="l-text" type="text" id="text_dwmc" readonly="true" unselectable='on'/></span></p>
                <p><span>案件类别:</span><span><s:textfield class="l-text" type="text" id="text_ajlbmc" readonly="true" unselectable='on'/></span></p>
                <p><span>所属类别:</span>
	                <span><s:textfield class="l-text" type="text" id="text_sslbmc" readonly="true" unselectable='on'/></span>
	                <span><s:textfield class="l-text" type="text" id="text_pzbm1" style="display:none"/></span>
                </p>
                <p>
<%-- 	                <span class="sbxx_cx"><input style="padding-left: 0px;" class="rzcx_cx" type="button"  value="保存" onclick="deleteBm()"/></span> --%>
	                <span class="sbxx_cx"><input style="padding-left: 0px;margin-left: 70px;" class="rzcx_cx" type="button"  value="删除" onclick="deleteBm()"/></span>
                </p>
<!--                     <table id="aaa"> -->
<!--                          <tr> -->
<!--                             <td>所属单位:</td> -->
<%--                             <td><s:textfield class="l-text" type="text" id="text_dwmc" readonly="true"/></td> --%>
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td>案件类别:</td> -->
<%--                             <td><s:textfield class="l-text" type="text" id="text_ajlbmc" readonly="true"/></td> --%>
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td>所属类别:</td> -->
<%--                             <td><s:textfield class="l-text" type="text" id="text_sslbmc" readonly="true"/></td> --%>
<!--                             隐藏属性 -->
<%--                             <td><s:textfield class="l-text" type="text" id="text_pzbm1" style="display:none"/></td> --%>
<!--                         </tr> -->
<!-- <!--                         <tr> --> 
<!-- <!--                             <td>序号:</td> -->
<%-- <%--                              <td><s:textfield class="l-text" type="text" ltype='spinner' ligerui="{type:'int'}" value="0" /></td> --%> 
<!-- <!--                         </tr> --> 
<!-- <!--                         <tr> --> 
<!-- <!--                              <td><input type="checkbox" /></td> -->
<!-- <!--                              <td> 自动生成模板</td> --> 
<!-- <!--                         </tr> --> 
<!--                         <tr> -->
<!--                             <td colspan="2"> -->
<!--                                 <div class="btn"> -->
<%--                                      <span class="sbxx_cx"><input class="rzcx_cx" type="button"  value="保存" onclick="deleteBm()"/></span> --%>
<%--                                      <span class="sbxx_cx"><input class="rzcx_cx" type="button"  value="删除" onclick="deleteBm()"/></span> --%>
<!--                                 </div> -->

<!--                             </td> -->
<!--                         </tr> -->
<!--                     </table> -->
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>