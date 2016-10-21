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
    <title></title>
    <link href="js/ligerUI/skins/Aqua/css/ligerui-form.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
     <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
  <script src="js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
  <script src="js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <style type="text/css">
        .l-tree .l-checkbox-unchecked {
            display: none;
        }
        .l-text{
            float: left;
            height: 22px;
            line-height: 22px;
            margin-left: 3px;
        }
        .l-trigger {
            margin-top: 1px;}
    </style>
   
    <script type="text/javascript">
        var manager;
        $(function ()
        {

            $("#layout1").ligerLayout({
                leftWidth: 200,
                centerBottomHeight:180
            });
        });
        $(function () {
        	 jQuery.post("jzjbxxqueryList!queryByMap",function(data){
        		 manager = $("#maingrid").ligerGrid({
                columns: [
                    {display: '案件名称', name: 'jzmc',   minWidth: 40  } ,
                    { display: '部门受案号', name: 'bmsah', minWidth: 60 },
                    { display: '创建时间', name: 'cjsj',  minWidth: 60  }
                ], data: data,pageSizeOptions:[50, 100, 150, 200, 250], pageSize:50, sortName: 'bmsah',where : f_getWhere(),
                width: '99%', height: '100%', checkbox: true,rownumbers:true,
                fixedCellHeight:false
            });
        	 })
            $("#pageloading").hide();
        });

    </script>
    <style type="text/css">

        body{  margin:0; padding-bottom:15px;}
        #layout1{  width:100%;margin:0; padding:0;  }
        .l-page-top{ height:40px; background:#f8f8f8; margin-bottom:3px;}
        .jsqxgl_right{
            width: 100%;height: auto;padding: 5px;background:url('images/header-bg.gif');
            border-top:1px solid #99BBE8;color: #15428B;border-bottom:1px solid #99BBE8;
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
         /*   查询*/
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
            top: 0px;
        }
        .sbxx_cx .rzcx_cx:hover{
            cursor: pointer;
            background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
            border-color: #D6A886;
        }
    </style>
</head>
<body style="padding-top:10px">
<p style="margin-bottom: 10px;margin-left:10px">
  <span>案件名称:</span><input type="text" id="ajmc" />
  <span style="margin-left: 10px;">部门受案号:</span><input type="text" id="bmsah" />
  <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="查询" onclick="f_search()" />
        <img src="images/search.gif" alt="查询"/>
   </span>
   <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="解锁"  onclick="jzsdjc_js();"/>
      <img src="images/edittask.png" alt="解锁"/>
   </span>            
</p>
<div id="layout1">
        


    <div class="l-loading" style="display:block" id="pageloading"></div>
    <div class="l-clear"></div>

    <div id="maingrid"></div>

    <div style="display:none;"></div>

    </div>
</body>
<script>
  ////////////////////////////////
  //////////解锁///////////////
  ///////////////////////////////
  var manager;
  function jzsdjc_js(){
    manager = $("#maingrid").ligerGetGridManager();
    var row = manager.getSelectedRows();
  
    if(row!=null){
    	var jzbh1="";
        for(var i=0;i<row.length;i++){
        	jzbh1+=row[i].jzbh+",";
            }
      
        $.ligerDialog.confirm('是否解锁', function (yes)
                {
	        	 if(yes){
	        		 $.ajax({
		         		 type: "POST",
		         	 	 url: "jzjbxxqueryList!delete?jzbh="+jzbh1,
		         	 	 success:function(data){
		             	 	// console.log("ee");
		             	 	 }
		            })
	 	 				$.ligerDialog.success('解锁成功！');
	 	 				$(".l-dialog-btn-inner").click(function(){
	 	 					 window.location.reload();
		 	 				})
			        		 
		        	 }	
                });
       
        
    
    }else {
      $.ligerDialog.warn('请先选择一条数据进行解锁');
    }
  }
  function aa(){
	  window.location.reload();
	  }
//查询
  function f_search()
 {
	  
	 jQuery.post("jzjbxxqueryList!queryByMap",function(data1){
    	 manager.options.data = data1;
    	 manager.loadData(f_getWhere());
	 })
 }

 function f_getWhere()
 {
     if (!manager) return null;
     var clause = function (rowdata, rowindex)
     {
         //获取单位名称
         var bmsah=$("#bmsah").val();
         var ajmc=$("#ajmc").val();

         return ((rowdata.bmsah.indexOf(bmsah) > -1)&&(rowdata.jzmc.indexOf(ajmc) > -1));
     };
     manager.changePage("first"); //重置到第一页
     return clause; 
 }

</script>
</html>
