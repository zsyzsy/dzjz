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
    <link rel="stylesheet" type="text/css" href="js/easyUi/themes/easyui.css">
	<link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.mobile.js"></script>
    <script src="js/easyUi/newdata.js"></script>
    <style>
        input {
            height: 20px;
            line-height: 20px;
            border: 1px solid #AECAF0;
        }
        .l-text-wrapper {
            width: 120px;
            position: relative;
            float: left;
        }
        .sbxx_sbxh {
            margin-left: 20px;
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
            outline: none;
        }
        .sbxx_cx img{
            position: absolute;
            left: 10px;
            top: -1px;
        }
        .sbxx_cx .rzcx_cx:hover{
            cursor: pointer;
            background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;
            border-color: #D6A886;
        }
        /*内部样式*/
  
        .l-tree .l-tree-icon-folder-open {
            background-position: -87px -238px;
        }
        .l-tree .l-tree-icon-leaf {
            background-position: -87px -238px;
        }
        .l-tree .l-tree-icon-folder {
            background-position:-87px -238px;
        }
        
  .textbox {
    border: 1px solid #AECAF0;
  
}
.textbox-focused{
		box-shadow:none;
}
    </style>
     <script type="text/javascript">
        $(function ()
        {
           

        });
    </script>
    <script>
        	 var manager = null;
        	 var dw_mc=null;
        $(function (){
//            表格
             $(function (){
             	 jQuery.post("sbxxqueryList!queryList",function(data){
//                  	 console.log(data);
             	manager = $("#maingrid").ligerGrid({
                     height: '99%',
                     width: '99%',
                     columns: [
                         { display: '单位名称', name: 'dwbm.dwmc', minWidth: 60 },
                         { display: 'IP地址', name: 'ip', minWidth: 120 },
                         { display: 'MAC地址', name: 'mac', minWidth: 140 },
                         { display: '设备型号', name: 'devtype', minWidth: 140 },
                         { display: '设备厂家', name: 'devfactory', minWidth: 140 },
                         { display: '首次使用时间', name: 'devusetime', minWidth: 140 }
                     ], pageSize:20,rownumbers: true,where : f_getWhere(),
                    		data:data
                 });

             	 })
                 $("#pageloading").hide();
             });

//搜索下拉列表存在问题
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
         	       width:180,
      	        	height:22,
         	        lines:true,
         	        editable:true,
         	        onClick:function(data){
         	        	 //设置隐藏属性dwbm值
//         	             $("#dwbm").val(data.id);
         	            //设置显示单位名称
         	            $("#txt1").val(data.text);
         	        }
         	    });
//                 $("#txt1").ligerComboBox({
//                 width: 200,
//                 selectBoxWidth: 200,
//                 selectBoxHeight: 200,
//                 textField:'dwmc', 
//                 valueField: 'dwmc',
//                 treeLeafOnly:false,
//                 valueFieldID: 'test3',
//                 tree: { 
//                     data:getData, 
//                     checkbox: false,
//                     textFieldName:"dwmc",
//                     idFieldName:"dwbm",
//                     parentIDFieldName:"fdwbm",
//                      onclick:function(){
//                         	getSelected();
//                             }
//                       }
//             });   
                 })
        })
        //获取选中的值
        function  getSelected(){
            $("#txt1").val($("#test3").val());
            }
      //条件搜索
        function f_search()
        {
       	 jQuery.post("sbxxqueryList!queryList",function(data){
       	 manager.options.data = data;
       	 manager.loadData(f_getWhere());
       	 })
        }
        function f_getWhere()
        {
            if (!manager) return null;
            var clause = function (rowdata, rowindex)
            {
                var key = $("#txt1").val();
                var key2 = $("#devtype").val();
                return (rowdata.dwbm.dwmc.indexOf(key) > -1)&&(rowdata.devtype.indexOf(key2) > -1) ;
            };
            manager.changePage("first"); //重置到第一页
           // manager.reload();
            return clause; 
        }
    </script>
</head>
<body>
<div class="l-loading" style="display:block" id="pageloading"></div>
<div style="margin: 10px">
    <p><span style="float: left;margin-top: 3px">单位名称:</span><input type="text" id="txt1"/>
        <span class="sbxx_sbxh">设备型号:</span><input type="text" id="devtype"/>
    <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="查询" onclick="f_search()"/>
        <img src="images/search.gif" alt=""/>
    </span>
    </p>
</div>

<!--表格-->
<div class="l-clear"></div>

<div id="maingrid"></div>

<div style="display:none;">

</div>
</body>
</html>