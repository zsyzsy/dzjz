<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META http-equiv=Content-Type content="text/html; charset=utf-8" />
   <title>角色权限管理</title>
    
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script> 
    <script src="js/ligerUI/js/plugins/ligerDrag.js"></script>
    <script src="js/ligerUI/js/plugins/ligerDialog.js"></script>
    <script src="js/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerMenuBar.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
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
 
        .l-text{
            float: left;
            height: 22px;
            line-height: 22px;
            margin-left: 3px;
        }
        .l-trigger {
            margin-top: 1px;}

        .l-layout-center {
            border: none;
        }
        .l-layout-right .l-layout-header-inner {
            padding-left: 0;
            padding-right: auto;
        }
        .l-text.l-text-combobox {
            display: none;
        }
        body{ padding:5px; margin:0; padding-bottom:15px;}
        #layout1{  width:100%;margin:0; padding:0;  }
        .l-page-top{ height:40px; background:#f8f8f8; margin-bottom:3px;}
        .jsqxgl_right{
            width: 100%;height: auto;padding: 5px;background:url('images/header-bg.gif');
            border-top:1px solid #99BBE8;color: #15428B;border-bottom:1px solid #99BBE8;
        }
        .jsqxgl_ul{
            display: table; line-height: 28px; padding: 5px 0;overflow: hidden;zoom: 1;
        }
        .jsqxgl_ul li{
            float: left; padding-left: 10px;overflow: hidden;
        }
        .jsqxgl_ul li input{
            border: 1px solid #AECAF0;
            outline: 0;
            width: 127px;
            height: 22px;
            line-height: 22px;
        }
        .jsqxgl_ul li img,.jsqxgl_fudong img,.qx img {
            vertical-align: middle;
            margin-top: -3px;
            padding-left: 5px;
        }
       
        .jsqxgl_ul li:last-child div span,.jsqxgl_fudong span,.qx span{
            padding-left:15px;
            letter-spacing:5px;
        }
        .jsqxgl_ul li:last-child div .span,.jsqxgl_fudong .span,.qx span{
            padding-left:5px;
            letter-spacing:0;
        }
        .jsqxgl_fudong,.qx{
            margin-top: 23px;
            margin-left: 39px;
            overflow: hidden;
            zoom: 1;
        }
        .jsqxgl_fudong div:hover,.jsqxgl_ul li div:hover,.qx div:hover{
            cursor: pointer;
            background: #FFBE76  url("mages/button-bg-over.gif")  repeat-x center;;
            /*background: #FFBE76 url('../images/controls/button-bg-over.gif') repeat-x center;*/
            border-color: #D6A886;
        }
        .jsqxgl_right_top {
            margin-left: 49px;
        }
        .jsqxgl_right_top span{
            padding-left: 10px;
        }
        .jsqxgl_right_top p{
            margin-top: 20px;
        }
        .jsqxgl_right_top p input{
            border: 1px solid #AECAF0;
            outline: 0;
            width: 147px;
            height: 22px;
            line-height: 22px;
        }
        .jsqxgl_right_jsxx{
            overflow: hidden;
            zoom: 1;
        }
        .jsqxgl_right_jsxx p span{
            float: left;
        }
        .jsqxgl_right_jsxx p .span{
            margin-top: 3px;
        }
        .jsqxgl_right_top p .jsxh{
            height: 22px;
            border: 0;
        }
.qx{
    margin-top: 160px;
    margin-left: -2px;
}
.qx .sbxx_cx img {
    position: absolute;
    left: 8px;
    left: 0px\0;
    top: 3px;
}
.qx .sbxx_cx .rzcx_cx {
    width: 78px;
}
.qx div{
    margin-top: 15px;
}
.ajqx_right .sbxx_cx img, .ajqx_left .sbxx_cx img {
    left: 10px;
    top: 0px;
}
      
/*********数据权限管理  *************/
		.l-tab-links {
            height: 24px;
             border-bottom:none;
        }
        .l-tab-links li{
            height:23px;
            line-height:23px;
            border-bottom:1px solid #BED5F3;
        }
        .l-tab-links .l-selected{
            height:23px;
            line-height:23px;
            border-bottom:1px solid white;
        }
        .ajqx{
	        width:900px;
	        height:370px;
	         overflow: hidden;
	             margin-top: 40px\0;
        }
        .ajqx_left{
	        width:370px;
	        float:left;
	        height:370px;
	        overflow:hidden;
	         border:1px solid #BED5F3;
        }
        .ajqx_content{
        	width:95px;
	        float:left;
	        height:370px;
	        margin-left:10px;
	        overflow:hidden;
/* 	        border:1px solid #BED5F3; */
        }
        .ajqx_right{
        	width:370px;
        	height:370px;
        	margin-left:10px;
	       float:left;
	       overflow:hidden;
	       border:1px solid #BED5F3;
        }
         input {
        height: 20px;
        line-height: 20px;
        outline: none;
        margin-left: 3px;
        padding-left: 3px;
        border: 1px solid #AECAF0;
    }

    /************ 单位权限************/

   .ajqx_right span.l-bar-text {
    display: none;
}
.dwqx_ul{
	width:100%;
	height:340px;
/*     border: 1px solid #ccc; */
    overflow: auto;
    
}
.l-grid-row-cell-inner {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
input#dwmc,input#dwjc,input#dwjb,input#jsmc,input#jsxh,input#bmmc_txt,input#bmmc,input#bmjc,input#bz{
 background: #ccc;
}

/*   查询*/
        .sbxx_cx {
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
           left: 18px;
           left:3px\0;
            top: 3px;
        }
        .sbxx_cx .rzcx_cx:hover{
            cursor: pointer;
            background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
            border-color: #D6A886;
        }
        .ryxx .sbxx_cx img {
		    position: absolute;
		    left: 7px;
		    top: 1px;
		}
		.ryxx span {
	    margin-left: 10px;
	}
	/* 功能权限数据样式  */
.gnqx_left {
    width: 220px;
    overflow-y: auto;
    overflow-x: hidden;
    height: 410px;
    border: 1px solid #99BBE8;
    border-top: none;
}
.gnqx_qx {
    width: 94px;
    position: absolute;
    left: 228px;
    top: 193px;
}
.gnqx_qx .sbxx_cx img {
    position: absolute;
    left: 7px;
/*     left: 3px\0; */
    top: 0px;
}
.gnqx_right {
    width: 540px;
    position: absolute;
    top: 0;
    left: 332px;
}


.l-tab-links {
    width: 865px\0;
    position: absolute\0;
    top: 9px\0;
}
/*定义父级图片  */
.l-box.l-tree-icon.l-tree-icon-www,.l-box.l-tree-icon.l-tree-icon-www-open {
    width: 17px;
    background: url('images/bm.png');
    height: 18px;
    margin-top: 7px;
}
#add_qxry img {
    top: 0px;
    left:18px;
}
    </style> 
     <script type="text/javascript">

        var g;
        var m;
        var tree;
        var tree5;
        var maingrid2;
        var maingrid3;
        var maingrid4;
        var maingrid5;
        var manager6;
        var manager7;
        var manager8;
        var dwbm='${sessionScope.yh.dwbm.dwbm}';
        $(function ()
        {

            $("#layout1").ligerLayout({
                leftWidth: 200,
                centerBottomHeight:180
            });
        });
        $(function ()
        {
            $("#tree2").ligerTree({ checkbox: false });
        });
        $(function ()
                {
                  //  $("#layout2").ligerLayout({ leftWidth: 200 ,centerWidth:95,rightWidth:588,allowLeftCollapse:false,allowRightCollapse:false,height:410});
                    $("#layout3").ligerLayout({ leftWidth: 200 ,centerWidth:95,rightWidth:588,allowLeftCollapse:false,allowRightCollapse:false,height:410});
                });
//       功能权限管理树形菜单
        $(function ()
        {
            $("#tree3").ligerTree({
                url: 'tree.json',
                width : 180,
                selectBoxWidth: 200,
                selectBoxHeight: 300,
                onSuccess:function(){
                    $("div .l-tree .l-tree-icon-folder-open").each(function(index){
                        $(this).addClass("l-tree-icon-folder-open-"+index);
                    });}
            });
        });
       
        $(function ()
        {
           jQuery.post("jsQxAction!getSearchList",function(data){
               //转换成tree  json格式
        	   
	            var getData =data.rows;	
	            var myaccount = 'images/3.png';
	            var memeber = 'images/4.png';
	            var archives = 'images/bm.png';
			var newdate1=[];
			console.log(getData);
			for(var i=0;i<getData.length;i++){
				var bm1=getData[i].BM;
				console.log(bm1.length);
				if(bm1.length==4){
					newdate1[i]={BM:getData[i].BM,fbm:getData[i].fbm,mc:getData[i].mc,icon: memeber};
				}else if(bm1.length==5){
					newdate1[i]={BM:getData[i].BM,fbm:getData[i].fbm,mc:getData[i].mc,icon: archives };
				}else if(bm1.length==7){
					newdate1[i]={BM:getData[i].BM,fbm:getData[i].fbm,mc:getData[i].mc,icon: myaccount };
				}
			}	
			console.log(newdate1);
               //添加左边单位树
            $("#layout1").ligerLayout({ leftWidth: 200});
          
                         tree = $("#tree1").ligerTree({  
                         data:newdate1,
                         checkbox: false,
//                        		url:"dwAction!queryList", 
                         idFieldName :'BM',
                         slide : false,
                         parentIDFieldName :'fbm',
                         textFieldName: 'mc',
                         ajaxType: 'get',
                         onClick :function(data){
                        	 getSelected();
                             } 
                         });
                        
                         treeManager = $("#tree1").ligerGetTreeManager();
                         treeManager.collapseAll();
        	});
          
        });
        //获取选中的值
        function getSelected()
        {
        	var note = treeManager.getSelected();
        	if(note!=null){
        
        	//获取选中的名称
        	var mc=note.data.mc;
            	//获取选中的BM
        	var sb=note.data.BM;
        	//截取a后面的字符串
        	var sub1=sb.substring(1);
        	//根据BM长度判断选中的是部门或者是角色
        	var size=sub1.length;
					if(size==3){//角色
						//获取选中的父编码名称
			        	var fbm=note.data.fbm;
			        	var subfbm=fbm.substring(1);
			        	//显示角色div
			        	$("#js_btn").removeAttr("style");
			        	$("#js_txt").removeAttr("style");
			        	//隐藏部门.单位div
			        	$("#bm_btn").css("display", "none");
			        	$("#bm_txt").css("display", "none");
			        	$("#dw_bm_btn").css("display", "none");
			        	$("#dw_bm_txt").css("display", "none");
			        	//角色中的部门编码
			        	$("#bmbm").val(subfbm);
						//角色中的角色编码
						$("#jsbm").val(sub1);
			        	//获取角色信息
			        	$.ajax({
	                        type: "POST",
	                        url: 'jsQxAction!jsinfo',
	                        data: 'dwbm='+$("#dwbm").val()+"&&bmbm="+subfbm+"&&jsbm="+sub1,
	                        success: function (data) {
		                       $("#jsmc").val(data.rows[0].jsmc);
		                       $("#jsxh").val(data.rows[0].jsxh);
		                       $("#bmmc_txt").val(data.rows[0].bmbm);

		                        }
			        	})
			        	ryqx();
					}else if(size==4){//部门
			        	//显示部门div
			        	$("#bm_btn").removeAttr("style");
			        	$("#bm_txt").removeAttr("style");
			        	//隐藏角色.单位div
			        	$("#js_btn").css("display", "none");
			        	$("#js_txt").css("display", "none");
			        	$("#dw_bm_btn").css("display", "none");
			        	$("#dw_bm_txt").css("display", "none");
			        	//添加时使用
			        	$("#fbmbm").val(sub1);
			        	//部门中的部门编码
			        	$("#bmbm").val(sub1);
			        	$("#bmmc_txt").val(note.data.mc);
			        	//清空角色编码
			        	$("#jsbm").val("");
			        	//页面显示获取的部门信息
			        	$.ajax({
	                        type: "POST",
	                        url: 'jsQxAction!bminfo',
	                        data: 'dwbm='+dwbm+"&&bmbm="+sub1,
	                        success: function (data) {
		                        
									$("#bmmc").val(mc);
									$("#bmjc").val(data.rows[0].bmjc);
									if(data.rows[0].bz==null){
										$("#bz").val(" ");
									}else{
											$("#bz").val(data.rows[0].bz);
									}
									if(data.rows[0].bmxh==null){
										$("#bmxh").val(" ");
									}else{
											$("#bmxh").val(data.rows[0].bmxh);
									}
		                         }
						})
						ryqx();
			        	
					}else if(size==6){
						$.ajax({
	                         type: "POST",
	                         url: 'jsQxAction!dwinfo',
	                         data: 'dwbm='+dwbm,
	                         success: function (data) {
									$("#dwmc").val(data.rows[0].DWMC);
									$("#dwjc").val(data.rows[0].DWJC);
									$("#dwjb").val(data.rows[0].DWJB);
		                         }
						})
						//显示单位div
			        	$("#dw_bm_btn").removeAttr("style");
			        	$("#dw_bm_txt").removeAttr("style");
			        	//隐藏角色.部门div
			        	$("#js_btn").css("display", "none");
			        	$("#js_txt").css("display", "none");
			        	$("#bm_btn").css("display", "none");
			        	$("#bm_txt").css("display", "none");
			        	//清空部门角色编码
						$("#bmbm").val("");
						$("#jsbm").val("");
					}
					ryqx();
            	}else{
            		$.ajax({
                        type: "POST",
                        url: 'jsQxAction!dwinfo',
                        data: 'dwbm='+dwbm,
                        success: function (data) {
								$("#dwmc").val(data.rows[0].DWMC);
								$("#dwjc").val(data.rows[0].DWJC);
								$("#dwjb").val(data.rows[0].DWJB);
	                         }

                   
					})
            		//显示单位div
		        	$("#dw_bm_btn").removeAttr("style");
		        	$("#dw_bm_txt").removeAttr("style");
		        	//隐藏角色.部门div
		        	$("#js_btn").css("display", "none");
		        	$("#js_txt").css("display", "none");
		        	$("#bm_btn").css("display", "none");
		        	$("#bm_txt").css("display", "none");
		        	//清空部门角色编码
					$("#bmbm").val("");
					$("#jsbm").val("");
		        	ryqx();

                	}
            }
        //添加部门
            function add_bm(){
            	//显示部门div
	        	$("#bm_btn").removeAttr("style");
	        	$("#bm_txt").removeAttr("style");
	        	//隐藏角色.单位div
	        	$("#js_btn").css("display", "none");
	        	$("#js_txt").css("display", "none");
	        	$("#dw_bm_btn").css("display", "none");
	        	$("#dw_bm_txt").css("display", "none");
	        	//解锁文本输入框
	        	$("#bmmc").removeAttr("readOnly");
	        	$("#bmjc").removeAttr("readOnly");
	        	$("#bz").removeAttr("readOnly");
	        	// 解决ie8
	        	$("#bmmc").removeAttr("unselectable");
	        	$("#bmjc").removeAttr("unselectable");
	        	$("#bz").removeAttr("unselectable");
	        	$("#bmmc").css("background","white");
	        	$("#bmjc").css("background","white");
	        	$("#bz").css("background","white");
	        	//清空数据
	        	$("#bmmc").val("");
	        	$("#bmjc").val("");
	        	$("#bz").val("");
	        	$("#hidden").val("add_bm");
	        	
            }
            //编辑部门
            function update_bm(){
            	//解锁文本输入框
	        	$("#bmmc").removeAttr("readOnly");
	        	$("#bmjc").removeAttr("readOnly");
	        	$("#bz").removeAttr("readOnly");
	        	// 解决ie8
	        	$("#bmmc").removeAttr("unselectable");
	        	$("#bmjc").removeAttr("unselectable");
	        	$("#bz").removeAttr("unselectable");
	        	$("#bmmc").css("background","white");
	        	$("#bmjc").css("background","white");
	        	$("#bz").css("background","white");
            	$("#hidden").val("update_bm");
                }
          // 取消部门
            function  qx_bm(){
            	//解锁文本输入框
	        	$("#bmmc").attr("readonly","readonly");
	        	$("#bmjc").attr("readonly","readonly");
	        	$("#bz").attr("readonly","readonly");
	        	// 解决ie8
	        	$("#bmmc").attr("unselectable","on");
	        	$("#bmjc").attr("unselectable","on");
	        	$("#bz").attr("unselectable","on");
	        	$("#bmmc").css("background","#ccc");
	        	$("#bmjc").css("background","#ccc");
	        	$("#bz").css("background","#ccc");
            	$("#hidden").val("update_bm");
                }
        
        //部门提交
       
       function bm_submit(){
				var bmmc=$("#bmmc").val();
				var bmjc=$("#bmjc").val();
				var bz=$("#bz").val();
				$("#dwbm").val(dwbm);
				 String.prototype.trim = function ()  
					{  
					    return this.replace(/(^\s*)|(\s*$)/g, "");  
					} 
				if(bmmc.trim(String)!=""&&bmjc.trim(String)!=""&&bz.trim(String)!=""){
					if($("#hidden").val()=="add_bm"){
					 $("#add_form").attr("action", "jsQxAction!add_bminfo");

						}else if($("#hidden").val()=="update_bm"){
							$("#add_form").attr("action", "jsQxAction!update_bm");
						}
   	               $("#add_form").submit();

					}else{
						 $.ligerDialog.warn('请完善部门信息！');
						}
            }

       //添加角色
       function add_js(){
    	 //显示角色div
       	$("#js_btn").removeAttr("style");
       	$("#js_txt").removeAttr("style");
       	//隐藏部门.单位div
       	$("#bm_btn").css("display", "none");
       	$("#bm_txt").css("display", "none");
       	$("#dw_bm_btn").css("display", "none");
       	$("#dw_bm_txt").css("display", "none");
       	//清空数据
       	$("#jsmc").val("");
       	$("#jsxh").val("");
       	//解除锁定
       	$("#jsmc").removeAttr("readOnly");
       	$("#jsxh").removeAttr("readOnly");
       	// 解决ie8
       	$("#jsmc").removeAttr("unselectable");
       	$("#jsxh").removeAttr("unselectable");
       	$("#jsmc").css("background","white");
    	$("#jsxh").css("background","white");
    	$("#dwbm").val(dwbm);
       	$("#hidden").val("add_js");
           }
       //编辑角色
       function update_js(){
       	//解锁文本输入框
       	$("#jsmc").removeAttr("readOnly");
       	$("#jsxh").removeAttr("readOnly");
     // 解决ie8
       	$("#jsmc").removeAttr("unselectable");
       	$("#jsxh").removeAttr("unselectable");
       	$("#jsmc").css("background","white");
    	$("#jsxh").css("background","white");
       	$("#hidden").val("update_js");
           }
     //取消角色
       function js_qx(){
       	//解锁文本输入框
       	$("#jsmc").attr("readonly","readonly");
       	$("#jsxh").attr("readonly","readonly");
     // 解决ie8
       	$("#jsmc").attr("unselectable","on");
       	$("#jsxh").attr("unselectable","on");
       	$("#jsmc").css("background","#ccc");
    	$("#jsxh").css("background","#ccc");
       	$("#hidden").val("update_js");
           }
       //删除角色
       function delete_js(){
    	   $("#hidden").val("delete_js");
    	   $.ligerDialog.confirm('您确定要删除当前角色信息？', function (yes) {
               if (yes) {
    	   	js_submit();
                   }
               })
   	   
           }
       //角色提交
       function js_submit(){
			var jsmc=$("#jsmc").val();
			var jsxh=$("#jsxh").val();
			var bmmc_txt=$("#bmmc_txt").val();
			$("#dwbm").val(dwbm);
			 String.prototype.trim = function ()  
				{  
				    return this.replace(/(^\s*)|(\s*$)/g, "");  
				}
			 var reg=/^\d+$/;
			if(jsmc.trim(String)!=""&&jsxh.trim(String)!=""&&bmmc_txt.trim!=""&&reg.test(jsxh)==true){
				if($("#hidden").val()=="add_js"){
					$("#add_form").attr("action", "jsQxAction!add_jsinfo");

				}else if($("#hidden").val()=="update_js"){
					$("#add_form").attr("action", "jsQxAction!update_js");
				}else if($("#hidden").val()=="delete_js"){
					$("#add_form").attr("action", "jsQxAction!delete_js");
					}
				 
	               $("#add_form").submit();

				}else{
					 $.ligerDialog.warn('请完善角色信息或角色序号为阿拉伯数字！');
					}

       }
       //已分配功能角色
       function yfpGndyByJs(){
    	   var ydwbm=$("#dwbm").val();
	       var ybmbm=$("#bmbm").val();
	       var yjsbm=$("#jsbm").val();
	       jQuery.post("jsQxAction!yfpGndyByJs?dwbm="+dwbm+"&&bmbm="+ybmbm+"&&jsbm="+yjsbm,function(data){
                   //已选择权限窗体
        	m=$("#maingrid").ligerGrid({
                columns: [
                    { display: '功能名称', name: 'gnmc', minWidth: 134 },
                    { display: '功能窗体', name: 'gnct', minWidth: 130 },
                    { display: '功能序号', name: 'GNXH', minWidth: 40 },
                    { display: '功能说明', name: 'gnsm',minWidth: 140  }
                ], data:data, sortName: 'gnbm',height:380,checkbox: false,width:"100%",checkbox :true,
                pageSize:20,pageSizeOptions: [20, 100, 150, 200]
            }); 
         
		       })
           }
		//未分配供能角色
        function wfpGndyByJs(){
		       var wbmbm=$("#bmbm").val();
		       var wjsbm=$("#jsbm").val();
		       jQuery.post("jsQxAction!wfpGndyByJs?dwbm="+dwbm+"&&bmbm="+wbmbm+"&&jsbm="+wjsbm,function(data){
              //转换成tree  json格式
					var getData =data.rows;
		        	   var myaccount = 'js/ligerUI/skins/icons/myaccount.gif';
			            var memeber = 'images/3.png';
			            var archives = 'images/4.png';
			    
			            
					var newdate1=[];
					for(var i=0;i<getData.length;i++){
						var bm1=getData[i].gnbm;
						console.log(bm1.length);
						if(bm1.length==12){
							newdate1[i]={gnbm:getData[i].gnbm,gnmc:getData[i].gnmc,icon:memeber};
						}

						else if(bm1.length==10){
							newdate1[i]={gnbm:getData[i].gnbm,gnmc:getData[i].gnmc,gnct:getData[i].gnct,gnfl:getData[i].gnfl,icon: memeber};
						}
					}
              //添加左边单位树
           $("#layout1").ligerLayout({ leftWidth: 220});
         
                        tree5 = $("#tree5").ligerTree({  
                        data:newdate1,
                        nodeWidth:150,
                        checkbox: true,
                        idFieldName :'gnbm',
                        slide : false,
                        parentIDFieldName :'gnfl',
                        textFieldName: 'gnmc',
                        ajaxType: 'get',
                        isExpand: false, 
                        onClick :function(data){
                            //获取所有选中的数据
//                         	getChecked();
//                        	 getSelected();
                            }
                        });
                        manager7 = $("#tree5").ligerGetTreeManager();
                       
		       		})
                };
                //获取未分配权限多选值
                function getCheckedTree(type) {
                	var notes = type.getChecked();
                    var text = "";
                    for (var i = 0; i < notes.length; i++)
                    {
                        if(notes[i].data.gnbm.length==10){
	                        text += notes[i].data.gnbm + ",";
                            }
                    }
                    return text;
                    }
                //获取已分配权限多选值
                function getCheckedTable() {
                	var noteT = m.getSelectedRows();
                    var textT = "";
                    for (var i = 0; i < noteT.length; i++)
                    {
	                        textT += noteT[i].gnbm + ",";
                    }
                    return textT;
                    }
        		//删除权限
                function moveToLeft()
                {
                    //获取选中需要移除的功能编码(单选)
//                   var row = m.getSelectedRow();
//                   if(row!=null){
//                 	  $("#gnbm").val(row.gnbm);
					//多选
                  var row = getCheckedTable();
                	  if(row.length!=0){
                		  $("#gnbm").val(row);
       		      	 var djsbm=$("#jsbm").val();
                      var dgnbm=$("#gnbm").val();
                      $.ligerDialog.confirm('是否删除权限', function (yes){
                      	if(yes){
                      		jQuery.post("jsQxAction!delete_jsgnqx?dwbm="+dwbm+"&&jsbm="+djsbm+"&&gnbm="+dgnbm,function(data){
                          		yfpGndyByJs();
                          		$.ligerDialog.success('成功删除权限!');
                            	//移除选中的行
                                m.deleteSelectedRow();
                                //刷新已选权限页面
                                yfpGndyByJs();
                              //未选权限中添加删除的功能
                                wfpGndyByJs(); 
                              	})
                          	 }else{
          		        		 $.ligerDialog.error('暂不删除！');
      			        	 }
                          });

                    }else{
                    	$.ligerDialog.warn('请先选择一条数据');
                        }
                }
                //添加权限
                function moveToRight()
                {
                    		var gnbmR= getCheckedTree(manager7);
                   //判断是否选中权限
                    if(gnbmR.length!=0){
	                    $.ligerDialog.confirm('是否添加权限', function (yes){
	                    	if(yes){
	                    			//单选
	// 	                             var selecteds = tree5.getSelected();
	// 	                             //获取选中的功能编码并赋值
		                             $("#gnbm").val(gnbmR);
		                             addJsQxGn();
	                        	 }
                        });
                  	}else{
                  		 $.ligerDialog.warn('请先选择权限');
		        	 }
                    
                }
                function addJsQxGn(){
     		       	var addbmbm=$("#bmbm").val();
     		      	var addjsbm=$("#jsbm").val();
                    var addgnbm=$("#gnbm").val();
                	jQuery.post("jsQxAction!add_jsgnqx?dwbm="+dwbm+"&&bmbm="+addbmbm+"&&jsbm="+addjsbm+"&&gnbm="+addgnbm,function(data){
                		$.ligerDialog.warn('权限添加成功！');
                		yfpGndyByJs();
                		wfpGndyByJs();
                    	})
                    }
                    //已分配案件权限
                function yfpajqx(){
						$("#sffp").val(" ");
	      		      	 var ajjsbm=$("#jsbm").val();
	                     var ajbmbm=$("#bmbm").val();
	                     var ajsffp=$("#sffp").val();
	                     console.log("------------------");
	                     console.log(dwbm);
	                     console.log(ajjsbm);
	                     console.log(ajbmbm);
	                     console.log(ajbmbm);
	                	jQuery.post("jsQxAction!ajlbqx?dwbm="+dwbm+"&&jsbm="+ajjsbm+"&&bmbm="+ajbmbm+"&&sffp="+ajsffp,function(data){
	                    	 maingrid3 = $("#maingrid3").ligerGrid({
	                             columns: [
	                                 {display: '案件分类编码', name: 'ajlbbm',   minWidth: 140  } ,
	                                 { display: '案件分类名称', name:'ajlbmc', minWidth: 160 }
	                             ], data: data, pageSize: 50, sortName: 'ajlbbm',
	                             width: '99%', height: '330px', checkbox: true,rownumbers:true,
	                             fixedCellHeight:false,
	                             where : ajflmcRight_getWhere()
// 	                             ,onSelectRow :function(data){
// 	 								var ajrowdbm=data.ajlbbm;
// 										$("#ajlbbm").val(ajrowdbm);
// 	                                 }
	                         });
	                    	 $(".ajqx_right .l-bar-text").css("display","none");
	                     	})
                    }
              //未分配案件权限
                function wfpajqx(){
                	$("#sffp").val("N");
      		      	 var ajjsbm=$("#jsbm").val();
                     var ajbmbm=$("#bmbm").val();
                     var ajsffp=$("#sffp").val();
                	jQuery.post("jsQxAction!ajlbqx?dwbm="+dwbm+"&&jsbm="+ajjsbm+"&&bmbm="+ajbmbm+"&&sffp="+ajsffp,function(data){
                    	 maingrid2 = $("#maingrid2").ligerGrid({
                             columns: [
                                 {display: '案件分类编码', name: 'ajlbbm',   minWidth: 140  } ,
                                 { display: '案件分类名称', name: 'ajlbmc', minWidth: 160 }
                             ], data: data, pageSize: 50, sortName: 'ajlbbm',
                             width: '99%', height: '330px', checkbox: true,rownumbers:true,
                             where : ajflmcLeft_getWhere(),
                             fixedCellHeight:false
//                              ,onSelectRow :function(data){
// 								var ajrowbm=data.ajlbbm;
// 								var ajrowmc=data.ajlbmc;
// 								$("#ajlbbm").val(ajrowbm);
// 								$("#ajlbmc").val(ajrowmc);
//                                  }
                         });
                    	 $(".ajqx_left .l-bar-text").css("display","none");
                     	})
                    }
                //获取选中的案件权限行
                function add_ajlb(){
                    // 在未分配案件类别中删除选中的案件类别权限
                	var manager2a = maingrid2.getSelectedRows();
                	 var textAJ = "";
                	 var textAM = "";
                    if(manager2a.length==0){
                      $.ligerDialog.warn('请先选择一条数据');
                    }else{
                    	$.ligerDialog.confirm('是否添加权限', function (yes){
                        	if(yes){
			                     for (var i = 0; i < manager2a.length; i++)
			                     {
			                    	 textAJ += manager2a[i].ajlbbm + ",";
			                    	 textAM += manager2a[i].ajlbmc + ",";
			                     }
// 	                        		maingrid2.deleteSelectedRow();
	                 		      	 var ajjsbm=$("#jsbm").val();
	                                var ajbmbm=$("#bmbm").val();
	                                var ajajlbbm=$("#ajlbbm").val();
	                                var ajajlbmc=$("#ajlbmc").val();
	                           	jQuery.post("jsQxAction!add_ajlbqx?dwbm="+dwbm+"&&jsbm="+ajjsbm+"&&bmbm="+ajbmbm+"&&ajlbbm="+textAJ+"&&ajlbmc="+encodeURI(textAM),function(data){
	                           		$.ligerDialog.warn('权限添加成功！');
	                           		yfpajqx();
	                           		wfpajqx();
	                               	})
                            	 }else{
            		        		 $.ligerDialog.error('暂时不添加！');
        			        	 	}
                            });
                        }
                	
                    }
                //删除已分配案件类别权限
                function delete_ajlb(){
                	var manager3a = maingrid3.getSelectedRows();
                	 var textDAJ = "";
                    if(manager3a.length==0){
                      $.ligerDialog.warn('请先选择一条数据');
                    }else{
                    	$.ligerDialog.confirm('是否删除权限', function (yes){
                        	if(yes){
                    	 for (var i = 0; i < manager3a.length; i++)
	                     {
                    		 textDAJ += manager3a[i].ajlbbm + ",";
	                     }
// 	                    	maingrid3.deleteSelectedRow();
	         		      	var ajdjsbm=$("#jsbm").val();
	                        var ajdbmbm=$("#bmbm").val();
	                        var ajdajlbbm=$("#ajlbbm").val();
	                   	jQuery.post("jsQxAction!delete_ajlbqx?dwbm="+dwbm+"&&jsbm="+ajdjsbm+"&&bmbm="+ajdbmbm+"&&ajlbbm="+textDAJ,function(data){
	                   		wfpajqx();
	                   		yfpajqx();
	                   		$.ligerDialog.success('成功删除权限!');
	                       	})
                        	}
                    	})
                       }
                		
                    }
                //所有单位信息
               function wdwqx(){
                	jQuery.post("dwlist!queryList",function(data){
                		var getData=data.rows;
                	    var archives = 'images/3.png';
                	    var memeber = 'images/4.png';
            			var newdate1=[];
            			for(var i=0;i<getData.length;i++){
            				console.log("-------------------------");
                			console.log(getData[i].dwbm);
                			console.log("-------------------------");
            				var dwbm=getData[i].dwbm;
            				var fdwbm=getData[i].fdwbm;
            				if(dwbm==370000){
            					newdate1[i]={dwbm:getData[i].dwbm,
                    					dwjb:getData[i].dwjb,
                    					dwjc:getData[i].dwjc,
                    					dwmc:getData[i].dwmc,
                    					dwsx:getData[i].dwsx,
                    					fdwbm:getData[i].fdwbm,
                    					sfsc:getData[i].sfsc,
                    					icon: archives};
            				}else{
            					newdate1[i]={dwbm:getData[i].dwbm,
                    					dwjb:getData[i].dwjb,
                    					dwjc:getData[i].dwjc,
                    					dwmc:getData[i].dwmc,
                    					dwsx:getData[i].dwsx,
                    					fdwbm:getData[i].fdwbm,
                    					sfsc:getData[i].sfsc};
            				}
            			}
	                	  manager8=$("#tree4").ligerTree({
	                          nodeWidth: 210,
	                          data:newdate1,
	                          checkbox : true,
	                          idFieldName :'dwbm',
	                          parentIDFieldName :'fdwbm',
	                          textFieldName :'dwmc',
	                          slide: false,
	                         // parentIcon:'www',  //定义父级图片 
	                          enabledCompleteCheckbox :false,
		                          isExpand: 2
	                      });
	                	  manager8 = $("#tree4").ligerGetTreeManager();
                 		})
                    }
               //已选择单位信息
               function ydwqx(){
    		      	var dwjsbm=$("#jsbm").val();
                   var dwbmbm=$("#bmbm").val();
                   var dwsffp=$("#sffp").val();
                	jQuery.post("jsQxAction!dwqx?dwbm="+dwbm+"&&bmbm="+dwbmbm+"&&jsbm="+dwjsbm+"&&sffp="+dwsffp,function(data){
                		maingrid4 = $("#maingrid4").ligerGrid({
                			columns: [
                  	                { display: '单位编码', name: 'dwbm',  minWidth: 168, align: 'left' },
                    	            { display: '单位名称', name: 'dwmc', minWidth: 168, align: 'left' }
                  	                
                  	                ],width: '100%',height: '324px',usePager:true,pageSize :50,checkbox :true, where : dwqxRight_getWhere(),
          	                	data:data
                    		})
                 		})
                    }
               //添加单位权限
               function add_dwqx(){
            	   var node = manager8.getChecked();
            	   var textD = "";
            	   var textDm = "";
//                    for (var i = 0; i < node.length; i++)
//                    {
//                     	   textD += node[i].data.dwbm + ",";
//                     	   textDm += node[i].data.dwmc + ",";
//                    }
                   if (node!=0){
	                	   $.ligerDialog.confirm('是否增加单位权限', function (yes){
	                       	if(yes){
		  		                  var dwqxbmbm=$("#bmbm").val();
		  		   		      	  var dwqxjsbm=$("#jsbm").val();
		  		   		      	  //此处为解决多选数据时请求参数过长造成后台报错问题,
		  		   		      	  var num=node.length;
		  		   		     for (var i = 0; i < num; i++) {
		  		   		    	textD += node[i].data.dwbm + ",";
	                    	    textDm += node[i].data.dwmc + ",";
		  						if(i%50==0){
		  		                  jQuery.post("jsQxAction!add_dwqx?dwbm="+dwbm+"&&bmbm="+dwqxbmbm+"&&jsbm="+dwqxjsbm+"&&ajlbbm="+textD+"&&ajlbmc="+textDm,function(data){
		  		                      })
		  							textD="";
		  							textDm="";
		  								}
		  							}
		  						 jQuery.post("jsQxAction!add_dwqx?dwbm="+dwbm+"&&bmbm="+dwqxbmbm+"&&jsbm="+dwqxjsbm+"&&ajlbbm="+textD+"&&ajlbmc="+textDm,function(data){
		  		   					 ydwqx();
		  		                     $.ligerDialog.success('成功增加单位权限!');
	  		                      })
		  		                   
	                           	 }
	                           });
                     }else{
                   		$.ligerDialog.warn('请先选择单位');
              		 	}
                   	   
            	 
                }
               //删除单位权限
               function delete_dwqx(){
                   var noteDD = maingrid4.getSelectedRows();
                   var textTD = "";
                   
                   if(noteDD.length==0){
                     $.ligerDialog.warn('请先选择一条数据');
                   }else{
                	   $.ligerDialog.confirm('是否删除单位权限', function (yes){
	                       	if(yes){
								for (var i = 0; i < noteDD.length; i++) {
		                	   		textTD += noteDD[i].dwbm + ",";
		                   		}
	                      	 	var dwqxbmbm=$("#bmbm").val();
	        		      	  	var dwqxjsbm=$("#jsbm").val();
	                       		jQuery.post("jsQxAction!delete_dwqx?dwbm="+dwbm+"&&bmbm="+dwqxbmbm+"&&jsbm="+dwqxjsbm+"&&ajlbbm="+textTD,function(data){
//                      	  		maingrid4.deleteSelectedRow();
                            		$.ligerDialog.success('成功删除权限!');
                       			ydwqx();
                       			wdwqx();
                           })
	                       	}
                	   })
                       }
            	  
                   }
               //人员信息加载
               function ryqx(){
            		   var ryqxdwbm=$("#dwbm").val();
                       var ryqxbmbm=$("#bmbm").val();
        		      	var ryqxjsbm=$("#jsbm").val();
            	   jQuery.post("jsQxAction!ryBydwjsbm?dwbm="+dwbm+"&&bmbm="+ryqxbmbm+"&&jsbm="+ryqxjsbm,function(data){
                  	 g = $("#maingrid1").ligerGrid({
                  		height: '100%',
	                    width: '99%',
                           columns: [
                               {display: '姓名', name: 'mc',   minWidth: 40  } ,
                               { display: '登录别名', name: 'dlbm', minWidth: 60 },
                               { display: '工作证号', name: 'gzzh',  minWidth: 60  },
                               { display: '工号', name: 'gh', minWidth: 40 },
                               { display: '性别', name: 'xb', Width: 60,render:function(e){
                               	if(e.xb=="0"){
           							return "女";
           						}if(e.xb=="1"){
           							return "男";
           							}
                                   }
                       		},
                               { display: '联系电话', name: '', minWidth:20  },
                               { display: '是否停职', name: 'sftz',Width: 50  ,render:function(e){
                                   
                               	if(e.sftz=="N"){
           							return "否";
           						}else{
           							return "是";
           							}
                                   }
                               }
                           ], dataAction: 'local', pageSize:20,rownumbers: true,
                           data: data, sortName: 'CustomerID',
                           showTitle: false,
                           where : f_getWhere(),
                           onSelectRow :function(data){
									$("#gh").val(data.gh);
									$(".l-bar-text").css("display","block");
                               },onReload:function(){
                                   g.grid();
                                   }
                       });
                      $("#pageloading").hide();
                	   })
                   }
               //添加人员权限
               function add_ryqx1(){
                   var ryqxaddbmbm=$("#bmbm").val();
    		      	var ryqxaddjsbm=$("#jsbm").val();
    		      	var ryqxaddgh=$("#gh").val();
    		      	 jQuery.post("jsQxAction!add_ryqx?dwbm="+dwbm+"&&bmbm="+ryqxaddbmbm+"&&jsbm="+ryqxaddjsbm+"&&gh="+ryqxaddgh,function(data){
    		      		add_jsry();
    		      		ryqx();
    		      		
    		      		//window.location.reload();
    	    		      	 })
    		      	
                   }
           
               //删除人员权限
               function delete_ryqx(){
                   var ryqxdebmbm=$("#bmbm").val();
    		      	var ryqxdejsbm=$("#jsbm").val();
    		      	var ryqxdegh=$("#gh").val();
    		    	$.ligerDialog.confirm('是否删除该用户', function (yes){
                    	if(yes){
    		        jQuery.post("jsQxAction!delete_ryqx?dwbm="+dwbm+"&&bmbm="+ryqxdebmbm+"&&jsbm="+ryqxdejsbm+"&&gh="+ryqxdegh,function(data){
    		        	ryqx();
        		        })
                        	}
                    	})
                   }
               //加载角色人员界面
               function add_jsry(){
            	   var ryjsqxdedwbm=$("#dwbm").val();
                   var ryjsqxdebmbm=$("#bmbm").val();
    		      var ryjsqxdejsbm=$("#jsbm").val();
            	   jQuery.post("jsQxAction!ryjsBydwjsbm?dwbm="+dwbm+"&&bmbm="+ryjsqxdebmbm+"&&jsbm="+ryjsqxdejsbm,function(data){
                	   maingrid5=$("#maingrid5").ligerGrid({
                       columns: [
                           {display: '姓名', name: 'mc',   minWidth: 100  } ,
                           { display: '登录别名', name: 'dlbm', minWidth: 100 },
                           { display: '工作证号', name: 'gzzh', minWidth: 140},
                           { display: '工号', name: 'gh', width: 140 },
                           { display: '性别', name: 'xb', width: 65,render:function(e){
                              	if(e.xb=="0"){
          							return "女";
          						}if(e.xb=="1"){
          							return "男";
          							}
                                  }
                      		},
                           { display: '电话', name: 'yddhhm',minWidth: 60 }
                       ], data: data, pageSize: 10, sortName: 'CustomerID',
                       width: '99%', height: '380px', checkbox: false,rownumbers:true, where : addRyqx1_getWhere(),
                       fixedCellHeight:true,onSelectRow :function(data){
							$("#gh").val(data.gh);
                       }
                   });
            	   $("#pageloading1").hide();
            	   })

                   }

               //人员信息搜索
               function f_search()
               {
                   var sedwbm=$("#dwbm").val();
                   var sebmbm=$("#bmbm").val();
                   var sejsbm=$("#jsbm").val();
            	   jQuery.post("jsQxAction!ryBydwjsbm?dwbm="+dwbm+"&&bmbm="+sebmbm+"&&jsbm="+sejsbm,function(data){
               		 g.options.data = data;
               		 g.loadData(f_getWhere());
                      	 })
               }
               function f_getWhere()
               {
                   if (!g) return null;
                   var clause = function (rowdata, rowindex)
                   {
                       var key1 = $("#txt1").val();//姓名
                       var key2 = $("#txt2").val();//工号
                       var key3 = $("#txt3").val();// 工作证号
                       return (rowdata.mc.indexOf(key1) > -1)&&(rowdata.gh.indexOf(key2) > -1)&&(rowdata.gzzh.indexOf(key3) > -1);
                   };
                   g.changePage("first"); //重置到第一页
                   return clause;
               } 
             // 案件权限左侧搜索
               function ajflmcLeft_search()
               { 
                   var ajdwbm=$("#dwbm").val();
                   var ajjsbm=$("#jsbm").val();
                   var ajbmbm=$("#bmbm").val();
                   var ajsffp=$("#sffp").val();
               	jQuery.post("jsQxAction!ajlbqx?dwbm="+ajdwbm+"&&jsbm="+ajjsbm+"&&bmbm="+ajbmbm+"&&sffp="+ajsffp,function(data){
                	   maingrid2.options.data = data;
                	   maingrid2.loadData(ajflmcLeft_getWhere());
                      	 })
               }
               function ajflmcLeft_getWhere()
               {
                   if (!maingrid2) return null;
                   var clause = function (rowdata, rowindex)
                   {
                       var ajflmcLeft = $("#ajflmcLeft").val();//
                       return (rowdata.ajlbmc.indexOf(ajflmcLeft) > -1);
                   };
                   return clause;
               } 
             //案件权限右侧搜索
               function ajflmcRight_search()
               {
            	   $("#sffp").val(" ");
					 var ajdwbm=$("#dwbm").val();
    		      	 var ajjsbm=$("#jsbm").val();
                   var ajbmbm=$("#bmbm").val();
                   var ajsffp=$("#sffp").val();
	                	jQuery.post("jsQxAction!ajlbqx?dwbm="+ajdwbm+"&&jsbm="+ajjsbm+"&&bmbm="+ajbmbm+"&&sffp="+ajsffp,function(data){
                       maingrid3.options.data = data;
                       maingrid3.loadData(ajflmcRight_getWhere());
                  })
               }
               function ajflmcRight_getWhere()
               {
                   if (!maingrid3) return null;
                   var clause = function (rowdata, rowindex)
                   {
                       var ajflmcRight = $("#ajflmcRight").val();
                       return (rowdata.ajlbmc.indexOf(ajflmcRight) > -1);
                   };
                   return clause;
               } 
               //单位权限左侧查询
               function dwqxLeft_search(){
            	 	jQuery.post("dwlist!queryList",function(data){
            	 				manager6.options.data = data;
            	 				manager6.loadData(dwqxLeft_getWhere());
                         })
                      }
                      function dwqxLeft_getWhere()
                      {if (!manager6) return null;
                          var clause = function (rowdata, rowindex)
                          {
                        	  var key = $("#dwqxmcLeft").val();
                              return (rowdata.dwmc.indexOf(key) > -1);
                          };
                          return clause;
                      } 
             	
             // 单位权限右侧查询
               function dwqxRight_search()
               {
   		      	  var dwjsbm=$("#jsbm").val();
                  var dwbmbm=$("#bmbm").val();
                  var dwsffp=$("#sffp").val();
                  
               	jQuery.post("jsQxAction!dwqx?dwbm="+dwbm+"&&bmbm="+dwbmbm+"&&jsbm="+dwjsbm+"&&sffp="+dwsffp,function(data){
               	//var aa=$("#ajlbmc").val();
                       maingrid4.options.data = data;
                       maingrid4.loadData(dwqxRight_getWhere());
                  })
               }
               function dwqxRight_getWhere()
               {
                   if (!maingrid4) return null;
                   var clause = function (rowdata, rowindex)
                   {
                       var dwqxRight = $("#dwqxRight").val();
                       return (rowdata.dwmc.indexOf(dwqxRight) > -1);
                   };
                   return clause;
               }  
            //   人员信息添加人员查询
               function addRyqx1_search()
               {
            	   var ryjsqxdedwbm=$("#dwbm").val();
                   var ryjsqxdebmbm=$("#bmbm").val();
    		      var ryjsqxdejsbm=$("#jsbm").val();
            	   jQuery.post("jsQxAction!ryjsBydwjsbm?dwbm="+dwbm+"&&bmbm="+ryjsqxdebmbm+"&&jsbm="+ryjsqxdejsbm,function(data){
                       maingrid5.options.data =data;
                       maingrid5.loadData(addRyqx1_getWhere());
                  })
               }
               function addRyqx1_getWhere()
               {
                   var ccc;
                   if (!maingrid5) return null;
                   var clause = function (rowdata, rowindex)
                   {
          		  	 var mc=rowdata.mc; // 获取数据人员信息添加姓名
                	   var key=$("#addRyqx1_name").val();//姓名
                	 
                       var key1=$("#addRyqx1_mull").val();//工号
                      
                       return ((rowdata.gh.indexOf(key1) > -1)&&(mc.indexOf(key) > -1));
                   };
                   maingrid5.changePage("first"); //重置到第一页
                   return clause;
               }         
    </script>
</head>
<body style="padding:10px">

<div id="layout1">
<!-- <input id="test3" type="hidden"/> -->
    <!--左侧-->
    <div position="left" title="组织机构">

        <div style="width: 195px;  margin: 10px; float: left;overflow: auto;">
            <ul id="tree1">
            </ul>
        </div>
    </div>

    <!--右侧-->
    <div position="center" title="组织机构管理">
        <form name="form1" method="post" id="add_form">
        <input type="hidden" id="hidden"/>
    <div style="height: 110px" id="cancel">
        <div class="jsqxgl_right">单位信息</div>
        <!--单位信息-->
        <div class="jsqxgl_fudong" id="dw_bm_btn" style="display:none">
        	<span class="sbxx_cx"><input class="rzcx_cx" type="button" value="添加部门" onclick="add_bm()" />
            	<img src="images/add.gif" alt=""/>
        	</span>
        	<span class="sbxx_cx"><input class="rzcx_cx" type="button" value="保存"  />
            	<img src="images/save.gif" alt="保存"/>
        	</span>
        	<span class="sbxx_cx"><input class="rzcx_cx" type="button" value="取消" />
            	<img src="images/candle.gif" alt="取消"/>
        	</span>
<!--             <div> -->
<%--                 <p onclick="add_bm()"><img src="images/add.gif"  alt="添加部门" /><span class="span" >添加部门</span></p> --%>
<!--             </div> -->
            
<!--             <div> -->
<%--                 <p><img src="images/save.gif"  alt="保存"/><span>保&nbsp;存</span></p> --%>
<!--             </div> -->
<!--             <div> -->
<%--                 <p ><img src="images/candle.gif"  alt="取消"/><span>取&nbsp;消</span></p> --%>
<!--             </div> -->
        </div>
        <!--部门信息-->
        <div class="jsqxgl_fudong" id="bm_btn" style="display: none">
        
        <span class="sbxx_cx" onclick="add_bm()"><input class="rzcx_cx" type="button" value="添加部门" />
            	<img src="images/add.gif" alt="添加部门"/>
        </span>
        <span class="sbxx_cx" onclick="add_js()"><input class="rzcx_cx" type="button" value="添加角色" />
            	<img src="images/role.gif" alt="添加角色"/>
        </span>
        <span class="sbxx_cx" onclick="update_bm()"><input class="rzcx_cx" type="button" value="编辑部门" />
            	<img src="images/edit.png" alt="编辑部门"/>
        </span>
        <span class="sbxx_cx" onclick="bm_submit()"><input class="rzcx_cx" type="button" value="保存" />
            	<img src="images/save.gif" alt="保存"/>
        </span>
        <span class="sbxx_cx" onclick="qx_bm()"><input class="rzcx_cx" type="button" id="bm_cancel" value="取消" />
            	<img src="images/candle.gif" alt="取消"/>
        </span>
        	
<!--             <div> -->
<%--                 <p onclick="add_bm()"><img src="images/add.gif"  alt="添加部门"/><span class="span" >添加部门</span></p> --%>
<!--             </div> -->
<!--             <div> -->
<%--                 <p onclick="add_js()"><img src="images/role.gif"  alt="添加角色"/><span class="span">添加角色</span></p> --%>
<!--             </div> -->
<!--             <div> -->
<%--                 <p onclick="update_bm()"><img src="images/edit.png"  alt="编辑部门"/><span class="span">编辑部门</span></p> --%>
<!--             </div> -->
<!--             <div> -->
<%--                 <p onclick="bm_submit()"><img src="images/save.gif"  alt="保存"/><span id="bm_submit">保&nbsp;存</span></p> --%>
<!--             </div> -->
<!--             <div> -->
<%--                 <p onclick="qx_bm()"><img src="images/candle.gif"  alt="取消"/><span id="bm_cancel">取&nbsp;消</span></p> --%>
<!--             </div> -->
        </div>
        <!--角色信息-->
        <div class="jsqxgl_fudong" id="js_btn" style="display: none">

            <!--角色信息-->
            <span class="sbxx_cx" onclick="update_js()"><input class="rzcx_cx" type="button"  value="编辑角色" />
            	<img src="images/edit.png" alt="编辑角色"/>
        	</span>
        	<span class="sbxx_cx" onclick="delete_js()"><input class="rzcx_cx" type="button"  value="删除角色" />
            	<img src="images/delete.gif" alt="删除角色"/>
        	</span>
        	<span class="sbxx_cx" onclick="js_submit()"><input class="rzcx_cx" type="button" value="保存角色" />
            	<img src="images/candle.gif" alt="保存角色"/>
        	</span>
        	<span class="sbxx_cx" onclick="js_qx()"><input class="rzcx_cx" type="button" value="取消" />
            	<img src="images/candle.gif" alt="取消"/>
        	</span>
        	<span class="sbxx_cx" onclick="jsqxgl_gnqxgl()"><input class="rzcx_cx" style="width: 112px" type="button"  value="功能权限管理" />
            	<img src="images/role.gif" alt="功能权限管理"/>
        	</span>
        	<span class="sbxx_cx"  onclick="jsqxgl_sjqxgl()"><input style="width: 112px" class="rzcx_cx" type="button"  value="数据权限管理" />
            	<img src="images/role.gif" alt="数据权限管理"/>
        	</span>
        	
<!--             <div> -->
<%--                 <p onclick="update_js()"><img src="images/edit.png"  alt="编辑角色"/><span class="span">编辑角色</span></p> --%>
<!--             </div> -->
<!--             <div> -->
<%--                 <p onclick="delete_js()"><img src="images/delete.gif"  alt="删除角色"/><span class="span">删除角色</span></p> --%>
<!--             </div> -->
<!--             <div> -->
<%--                 <p onclick="js_submit()"><img src="images/save.gif"  alt="保存角色"/><span class="span">保存角色</span></p> --%>
<!--             </div> -->
<!--             <div> -->
<%--                 <p onclick="js_qx()"><img src="images/candle.gif"  alt="取消"/><span>取&nbsp;消</span></p> --%>
<!--             </div> -->
<!--             <div style="width: 112px" onclick="jsqxgl_gnqxgl()"> -->
<%--                 <p><img src="images/role.gif"  alt="功能权限管理"/><span class="span">功能权限管理</span></p> --%>
<!--             </div> -->
<!--             <div style="width: 112px" onclick="jsqxgl_sjqxgl()"> -->
<%--                 <p><img src="images/role.gif"  alt="数据权限管理"/><span class="span">数据权限管理</span></p> --%>
<!--             </div> -->
        </div>
        <!--单位信息-->
        <div class="jsqxgl_right_top" id="dw_bm_txt" style="display:none">
            <p>单位名称: <s:textfield  type="text" id="dwmc" name="dwmc"  readOnly= "true" unselectable='on'/> 
            <span>单位简称:</span> <s:textfield  type="text" id="dwjc" name="dwjc"  readOnly= "true" unselectable='on'/> 
            <span>单位级别:</span> <s:textfield  type="text" id="dwjb" name="dwjb"  readOnly= "true" unselectable='on'/></p>
        </div>
        <!--部门信息-->
        <div class="jsqxgl_right_top" id="bm_txt" style="display:none">
        <!-- 隐藏属性 -->
        				<s:textfield  style="display:none" id="dwbm" name="dwbm"  />
        				<s:textfield  style="display:none" id="fbmbm" name="fbmbm"  />
        <!-- 隐藏属性 -->
            <p>部门名称: <s:textfield  type="text" id="bmmc" name="bmmc"  readOnly= "true" unselectable='on'/> 
            <span>部门简称:</span> <s:textfield  type="text" id="bmjc" name="bmjc"  readOnly= "true" unselectable='on'/>
            <span>备注信息: </span><s:textfield  type="text" id="bz" name="bz"  readOnly= "true" unselectable='on'/></p>
        </div>
        <!--角色信息-->
        <div class="jsqxgl_right_top jsqxgl_right_jsxx" id="js_txt" style="display:none">
        	<!-- 隐藏属性 -->
        				<s:textfield  style="display:none" id="bmbm" name="bmbm"  />
        				<s:textfield  style="display:none" id="jsbm" name="jsbm"  />
        				<s:textfield  style="display:none" id="gnbm" name="gnbm"  />
<%--         				<s:textfield  style="display:none" id="fbmbm" name="fbmbm"  /> --%>
       		 <!-- 隐藏属性 -->
            <p><span style="padding: 0;">角色名称: <s:textfield  type="text" id="jsmc" name="jsmc"  readOnly= "true" unselectable='on'/></span>
                <span class="span">角色序号:</span><s:textfield style="float: left;" class="jsxh" type="text" id="jsxh" name="jsxh"  readOnly= "true" unselectable='on'/>
                <span>所属部门: <s:textfield  type="text" id="bmmc_txt" name="bmmc_txt"  readOnly= "true" unselectable='on'/></span></p>
        </div>
    </div>
</form>
            <br />
        <div class="jsqxgl_right">人员信息</div>
        	<div style="margin:10px;" class="ryxx">
                <span>姓名：</span><input id="txt1" type="text" />
                <span>工号：</span><input id="txt2" type="text" />
                <span>工作证号：</span><input id="txt3" type="text" />
	            <span class="sbxx_cx" onclick="f_search()"><input class="rzcx_cx" type="button"  value="查询" />
	            	<img src="images/search.gif" alt="查询"/>
	        	</span>
	        	<span class="sbxx_cx" onclick="add_ryqx()"><input class="rzcx_cx" type="button"  value="添加人员" />
	            	<img src="images/add.gif" alt="添加人员"/>
	        	</span>
	        	<span class="sbxx_cx" onclick="delete_ryqx()"><input class="rzcx_cx" type="button"  value="解除" />
	            	<img src="images/delete.gif" alt="解除"/>
	        	</span>
<!--                 <div onclick="f_search()"> -->
<%--                     <p><img src="images/search.gif"  alt="查询"/><span>查&nbsp;询</span></p> --%>
<!--                 </div> -->
<!--                 <div> -->
<%--                     <p onclick="add_ryqx();"><img src="images/add.gif"  alt="查询"/><span class="span">添加人员</span></p> --%>
<!--                 </div> -->
<!--                 <div> -->
<%--                     <p onclick="delete_ryqx();"><img src="images/delete.gif"  alt="查询"/><span>解除</span></p> --%>
<!--                 </div> -->
            </div>
        <div class="l-loading" style="display:block" id="pageloading"></div>
        <div class="l-clear"></div>

        <div id="maingrid1"></div>
        <!-- 隐藏属性 -->
		<s:textfield  style="display:none" id="gh" name="gh"  />

        <div style="display:none;"></div>
    </div>
    <!--功能权限管理 -->
    <div id="add_div" style="display: none; margin: 0 auto;position: relative;">
    <form id="add_form" method="post">
        <div >
            <div  class="gnqx_left">
            		<div class="jsqxgl_right">未选择权限</div>
                    <div style="margin:4px;float:left;">
					    <ul id="tree5"></ul>
					</div>
            </div>
<!--             <div position="center" > -->

                <div class="gnqx_qx">
                    <div>
	                    <span class="sbxx_cx" onclick="moveToRight()"><input class="rzcx_cx" type="button" value="添加权限" />
			            	<img src="images/add.gif" alt="添加权限"/>
			       		</span>
<%--                         <p onclick="moveToRight()"><img src="images/add.gif"  alt="添加权限"/><span class="span">添加权限</span></p> --%>
                    </div>
                    <div style="margin-top:10px;">
                    	<span class="sbxx_cx" onclick="moveToLeft()"><input class="rzcx_cx" type="button" value="删除权限" />
			            	<img src="images/delete.gif" alt="删除权限"/>
			       		</span>
<%--                         <p onclick="moveToLeft()"><img src="images/delete.gif"  alt="删除权限"/><span class="span">删除权限</span></p> --%>
                    </div>
                </div>
<!--             </div> -->
<!--             <div id="listbox2"></div> -->
            <div  class="gnqx_right" >
            	<div class="jsqxgl_right" style="width: 530px; border: 1px solid #99BBE8;border-bottom: none;" >已选择权限</div>
                <div id="maingrid"></div>
            </div>
        </div>
    </form>
</div>
</div>
     <%---------- 添加人员  ----%>
         <div id="add_qxry" style="display: none; margin: 0 auto;">
		       <div style="margin: 10px">
		                姓名:<input type="text" id="addRyqx1_name"/>
		                工号:<input type="text" id="addRyqx1_mull"/>
		            <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="查询" onclick="addRyqx1_search()"/>
		            <img src="images/search.gif" alt=""/>
		            </span>
		            <span class="sbxx_cx">
		            <input type="button" value="添加" class="rzcx_cx" onclick="add_ryqx1()"/>
		            <img src="images/add.gif" alt=""/>
		            </span>
		        </div>
		        <div class="l-loading" style="display:block" id="pageloading1"></div>
		        <div class="l-clear"></div>
		        <div id="maingrid5"></div>
		        <div style="display:none;"> </div>
		</div>
<!--数据权限管理 -->
    <div id="sjqx_div" style="display: none; margin: 0 auto;position: relative;">
    <form id="add_form" method="post">
    	<s:textfield  style="display:none" id="sffp" name="sffp"  />
        <div id="tab1" style="width: 865px;overflow:hidden; border:1px solid #A3C0E8; "> 
            <%---------- 案件权限 ----%>
            
            <div title="案件权限" >
					<div style="margin-top: 10px"></div>
					<div class="ajqx">
						<div class="ajqx_left">
							<div style="margin: 10px auto;overflow: hidden">
							    <span style="float: left">案件分类名称：<input id="ajflmcLeft" type="text" /></span>
								 <span class="sbxx_cx"><input id="btnOK" type="button" value="查询" onclick="ajflmcLeft_search()" class="rzcx_cx" />
							            <img src="images/search.gif" alt=""/>
							    </span>
							</div> 
							<div id="maingrid2"></div>
							<!-- 隐藏属性 -->
							<s:textfield  style="display:none" id="ajlbbm" name="ajlbbm"  />
							<s:textfield  style="display:none" id="ajlbmc" name="ajlbmc"  />
						</div>
						<div class="ajqx_content">
							
							  <div class="qx">
			                    <div>
			                    <span class="sbxx_cx" onclick="add_ajlb()" id="add_ajlb"><input class="rzcx_cx" type="button" value="添加权限" />
					            	<img src="images/add.gif" alt="添加权限"/>
					       		</span>
<%-- 			                        <p onclick="add_ajlb()" id="add_ajlb"><img src="images/add.gif"  alt="添加权限"/><span class="span">添加权限</span></p> --%>
			                    </div>
			                    <div style="margin-top:10px;">
			                    <span class="sbxx_cx" onclick="delete_ajlb()" id="delete_ajlb"><input class="rzcx_cx" type="button" value="删除权限" />
					            	<img src="images/delete.gif" alt="删除权限"/>
					       		</span>
<%-- 			                        <p onclick="delete_ajlb()" id="delete_ajlb"><img src="images/delete.gif"  alt="删除权限"/><span class="span">删除权限</span></p> --%>
			                    </div>
			                </div>
							
						</div>
						<div class="ajqx_right">
							<div style="margin: 10px auto;overflow: hidden">
							    <span style="float: left">案件分类名称：<input id="ajflmcRight" type="text" /></span>
								 <span class="sbxx_cx"><input id="btnOK" type="button" value="查询" onclick="ajflmcRight_search()" class="rzcx_cx" />
							            <img src="images/search.gif" alt=""/>
							    </span>
							</div> 
							<div id="maingrid3"></div>
						</div>
					</div>
			
						
            </div>
            <%-- ---------------- --%>
            <%---------- 单位权限 ----%>
            <div title="单位权限" >

					<div style="margin-top: 10px"></div>
					<div class="ajqx">
					<%-- 左边 --%>
						<div class="ajqx_left" style="border-left:none;">
							    <!-- 隐藏属性 -->
							<s:textfield  style="display:none" id="dwbm_dwbm" name="dwbm_dwbm"  />
							<s:textfield  style="display:none" id="dwbm_dwmc" name="dwbm_dwmc"  />
							<div  class="jsqxgl_right" style="border-bottom: 1px solid #BED5F3;border-top:none;">所有单位</div>
							<div class="dwqx_ul">
								<ul id="tree4"></ul> 
							 </div>
						</div>
						<%-- 中间 --%>
						<div class="ajqx_content">
							
							  <div class="qx">
			                    <div>
			                    <span class="sbxx_cx" onclick="add_dwqx()"><input class="rzcx_cx" type="button" value="添加权限" />
					            	<img src="images/add.gif" alt="添加权限"/>
					       		</span>
<%-- 			                        <p onclick="add_dwqx()"><img src="images/add.gif"  alt="添加权限"/><span class="span">添加权限</span></p> --%>
			                    </div>
			                    <div>
				                    <span class="sbxx_cx" onclick="delete_dwqx()"><input class="rzcx_cx" type="button" value="删除权限" />
						            	<img src="images/delete.gif" alt="删除权限"/>
						       		</span>
<%-- 			                        <p onclick="delete_dwqx()"><img src="images/delete.gif"  alt="删除权限"/><span class="span">删除权限</span></p> --%>
			                    </div>
			                </div>
							
						</div>
						<%-- 右边 --%>
						<div class="ajqx_right">
							<div style="margin: 10px auto;overflow: hidden">
							    <span style="float: left">单位名称：<input id="dwqxRight" type="text" /></span>
								 <span class="sbxx_cx"><input id="btnOK" type="button" value="查询" onclick="dwqxRight_search()" class="rzcx_cx" />
							            <img src="images/search.gif" alt=""/>
							    </span>
							</div> 
							<div id="maingrid4"></div>
						</div>
            </div>
        </div>
    </form>
</div>
<script>
    //功能权限管理

    function jsqxgl_gnqxgl(){
    	wfpGndyByJs();
    	yfpGndyByJs();
        $.ligerDialog.open({ title: '功能权限管理', target: $('#add_div'), width: 900,height:500, isResize: false});
    }
    //数据权限管理 
     $(function ()
        {
            $("#tab1").ligerTab({ onBeforeSelectTabItem: function (tabid)
            {
                $(".l-selected").css({
                    height: "23px",
                    lineHeight:"23px",
                    borderBottom:"1px solid #BED5F3"
                })
            }, onAfterSelectTabItem: function (tabid)
            {
                $(".l-selected").css({
                    height: "23px",
                    lineHeight:"23px",
                    borderBottom:"1px solid white"

                })
            } 
            });
        });

     function jsqxgl_sjqxgl(){
    	 yfpajqx();
    	 wfpajqx();
    	 wdwqx();
     	ydwqx();
         $.ligerDialog.open({ title: '数据权限管理', target: $('#sjqx_div'), width: 900,height:485, isResize: false});
     }
   //添加人员
     function add_ryqx(){
    	 var noteR = treeManager.getSelected();
    	 if(noteR!=null){
        	 //判断是否选中角色
	    	 if(noteR.data.BM.length==4){
		    	 add_jsry();
		    	
     			$.ligerDialog.open({ title: '添加角色人员信息', target: $('#add_qxry'), width: 750,height:500, isResize: false});
        	 }else{
            	 $.ligerDialog.warn('你选中的不是角色');
        	 }
        }else{
        	$.ligerDialog.warn('请先选择一个角色');
        }
     }
    
</script>
</body>
</html>