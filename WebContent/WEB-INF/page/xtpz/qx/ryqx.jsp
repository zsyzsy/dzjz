
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
  <title>人员权限管理</title>

        <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>   
    	<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
        <script src="js/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    	<script src="js/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    	 <script src="js/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
	    <script src="js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script> 
	    <script src="js/ligerUI/js/plugins/ligerDrag.js"></script>
	    <script src="js/ligerUI/js/plugins/ligerDialog.js"></script>
	    <script src="js/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
	    <script src="js/ligerUI/js/plugins/ligerMenuBar.js" type="text/javascript"></script>
	    <script src="js/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
	    <script src="CustomersData.js" type="text/javascript"></script>
	  <style type="text/css">
        body{ padding:5px; margin:0; padding-bottom:15px;}
        #layout1{  width:100%;margin:0; padding:0;  }
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
        /*查询*/
        input {
            height: 20px;
            line-height: 20px;
            outline: none;
            margin-left: 3px;
            padding-left: 3px;
            border: 1px solid #AECAF0;
        }
        .sbxx_sbxh {
            margin-left: 100px;
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
        /*添加人员权限*/
        .ryqxgl_gjt{
            height: 30px;
            margin-top: 10px;
            border: 1px solid #AECAF0;
            border-bottom: none;
            width: 99%;
            overflow: hidden;
            zoom: 1;
        }
        .ryqxgl_gjt div{
            width: 109px;
            height: 19px;
            margin-left: 5px;
            margin-top: 5px;
            float: left;
            border: 1px solid #ffffff;
        }
        .ryqxgl_gjt div:hover{
            cursor: pointer;
            background: url("images/panel-btn.gif" );
            border-left: 1px solid #9AC6FF;
            border-right: 1px solid #9AC6FF;
            border-bottom: 1px solid #9AC6FF;
            border-radius: 3px;

        }
        .ryqxgl_gjt div img{
            vertical-align: middle;
        }
        .ryqxgl_gjt .gjt_border{
            width: 0;
            float: left;
            height: 18px;
            border: 1px solid #9AC6FF;
            border-left: 1px solid #9AC6FF;
        }
        .ryqxgl_gjt span{
            padding-left: 10px;
        }
        .l-tree li .l-body {
    overflow: hidden;
    width: 200px;
}

        .l-tree .l-body span {
		    margin-top: 3px; 
		}
    </style>
             <script type="text/javascript">
//      功能
        var tree;
        var maingrid;
        var maingrid5;
        var ryqxAdd_name;
        var keyword_name;
        var dwbm='${sessionScope.yh.dwbm.dwbm}';
       $(function () {

        	 input_ryqx(); 
          jQuery.post("ryQxAction!gndyfl",function(data){
              //转换成tree  json格式
					var getData =data.rows;
					////console.log("======================"+getData);
              //添加左边单位树
           $("#layout1").ligerLayout({ leftWidth: '15%', rightWidth: '84%',
               allowLeftResize:false,
               allowCenterBottomResize:false });
         
                        tree = $("#tree1").ligerTree({  
                        data:getData,
                       nodeWidth:135,
                        checkbox: false,
                        idFieldName :'bm',
                        slide : false,
                        parentIDFieldName :'fbm',
                        textFieldName: 'mc',
                        ajaxType: 'get',
                        isExpand: false,
                        
                        onClick :function(data){
                            //获取所有选中的数据
                        	getChecked();
                       	 getSelected();
                            }
                        });
                       function aa(){
	                    	   $("div .l-tree .l-tree-icon-folder").each(function(index){
	                               $(this).addClass("l-tree-icon-folder-open-"+index);
	                           });
	                    	   $("div .l-tree .l-tree-icon-folder-open").each(function(index){
	                               $(this).addClass("l-tree-icon-folder-open-"+index);
	                           });
	                    	   $("div .l-tree .l-tree-icon-leaf").each(function(){
	                    	        $("div .l-tree .l-tree-icon-leaf:last-child").addClass("l-tree-icon-leaf-"+"x");

	                    	    });
                           };
                        treeManager = $("#tree1").ligerGetTreeManager(aa());
       	});
         
       });
       //获取未分配权限多选值
       function getCheckedTree() {
       	var notes = tree.getChecked();
       	////console.log(notes);
           var text = "";
//            for (var i = 0; i < notes.length; i++)
//            {
//                if(notes[i].data.gnbm.length==10){
//                    text += notes[i].data.gnbm + ",";
//                    }
//            }
//            return text;
           }
       //添加人员权限人员界面选中行信息
       function getChecked() {
    	   var a=tree.getChecked();
    	   $("#gh").val();
				////console.log(a);
           }
       
        //加载右边人员权限表
        function input_ryqx() {
            
             var dwbm='370000';
            var ingnbm=$("#gnbm").val();
        	jQuery.post("ryQxAction!queryRyQxByDwbmGnbm?dwbm="+dwbm+"&&gnbm="+ingnbm,function(data){
        	
        	maingrid=$("#maingrid").ligerGrid({
        		width: '99%',
        		 height: '99%', 
                columns: [
                    {display: '单位编码', name: 'dwbm.dwbm',   minWidth: 20  } ,
                    { display: '姓名', name: 'mc', minWidth: 30 },
                    { display: '登录别名', name: 'dlbm', minWidth: 30 },
                    { display: '工号', name: 'gh', minWidth: 30 },
                    { display: '性别', name: 'xb', Width: 60,render:function(e){
                       	if(e.xb=="0"){
   							return "女";
   						}if(e.xb=="1"){
   							return "男";
   							}
                           }
               		}, 
                   
                  { display: '工作证号', name: 'gzzh', minWidth: 20}
                ],dataAction: 'local', showTitle: false,sortName: 'dwbm.dwbm', pageSizeOptions:[50, 100, 150, 200, 250], data:data,pageSize:50,rownumbers: true,
                where : keyword_getWhere(),onSelectRow :function(data){
						$("#dwbm").val(data.dwbm);
						$("#gnbm").val(data.gnbm);
						$("#gh").val(data.gh);
						////console.log(data);
                     }
            });
            $("#pageloading").hide();
        	})
        };

		//获取树型结构选中值(使用的是单个选中)
        function getSelected(){

        	var note = treeManager.getSelected();
        	if(note!=null){
        	////console.log(note.data);
        	var bm=note.data.bm;
        	var dwbm=note.data.dwbm; 	        
					$("#gnbm").val(bm);
					$("#dwbm").val(dwbm);
					input_ryqx();	            	
            	}
            }

	   // 关键字条件搜索
	        function keyword_search()
	        {
	        	var dwbm='${sessionScope.yh.dwbm.dwbm}';
	            var ingnbm=$("#gnbm").val();
	        	jQuery.post("ryQxAction!queryRyQxByDwbmGnbm?dwbm="+dwbm+"&&gnbm="+ingnbm,function(data){       	   
			       	 maingrid.options.data = data;
			       	maingrid.loadData(keyword_getWhere());
	       	 })
	        }
	        function keyword_getWhere()
	        {
	            if (!maingrid) return null;
	            var clause = function (rowdata, rowindex)
	            {		       
	                var key = $("#keyword_text").val();
	                var CBR=rowdata.mc; //  获取部门姓名
	   		  	 if(CBR==null){
	   		  			keyword_name=" ";
	   			  	 }else{
	   			  		keyword_name=CBR;
	   				  	 }
	                return (rowdata.dwbm.dwbm.indexOf(key) > -1)||(rowdata.mc.indexOf(key) > -1)||(rowdata.gh.indexOf(key) > -1)||(rowdata.dlbm.indexOf(key) > -1)||(rowdata.gzzh.indexOf(key) > -1) ;
	            };
	            maingrid.changePage("first"); //重置到第一页
	            return clause; 
	        }
	


    </script>
   
</head>
<body style="padding:10px">
<div id="layout1">
    <!--左侧-->
    <div position="left" title="功能">

        <div style="width: 220px;float: left;overflow: auto;">
            <ul id="tree1" style="width: 200px;height: 607px;overflow: auto;">
            </ul>
        </div>
    </div>

    <!--右侧-->
    <div position="right" title="部门操作">
        <div style="margin: 10px">
                关键字:<input type="text" id="keyword_text"/>
            <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="查询" onclick="keyword_search()"/>
            <img src="images/search.gif" alt=""/>
            </span>
        </div>



        <div class="l-loading" style="display:block" id="pageloading"></div>
				<!-- 隐藏属性 -->
        				<s:textfield  style="display:none" id="dwbm" name="dwbm"  />
        				<s:textfield  style="display:none" id="gnbm" name="gnbm"  />
        				<s:textfield  style="display:none" id="gh" name="gh"  />
        
        <div class="l-clear"></div>

        <div id="maingrid"></div>

        <div style="display:none;">

        </div>

    </div>


</div>
</body>
</html>
