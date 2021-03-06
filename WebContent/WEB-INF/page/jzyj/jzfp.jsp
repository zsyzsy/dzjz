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
   <title>阅卷分配</title>
   <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
    <script src="js/Backspace.js" type="text/javascript"></script>
    <style type="text/css">
    
        body{  margin:0; padding-bottom:15px;}
        #layout1{  width:100%;margin:0; padding:0;  }
        .l-page-top{ height:40px; background:#f8f8f8; margin-bottom:3px;}
        .jsqxgl_right{
            width: 100%;height: auto;padding: 5px;background:url('images/header-bg.gif');
            border-top:1px solid #99BBE8;color: #15428B;border-bottom:1px solid #99BBE8;
        }
        
    .table {
	    min-width: 1200px;
	    line-height: 28px;
	    padding-bottom: 5px;
	    overflow: auto;
	    zoom: 1;
		}
        .table input{
            border: 1px solid #AECAF0;
            outline: 0;
            width: 200px;
            height: 20px;
            padding-left: 5px;
            margin-left: 3px;
            line-height: 20px;
        }
        .table img{
            vertical-align: middle;
            margin-top: -3px;
            padding-left: 5px;
        }
        .cx{
            width: 70px;
            height: 20px;
            margin-top: 3px;
            line-height: 20px;
            border: 1px solid #AECAF0;
            background: #E0EDFF url('images/header-bg.gif') repeat-x center;
            float: left;overflow: hidden;margin-left: 10px;
        }
        .cx span{
            padding-left:10px;
            letter-spacing:5px;
        }
        .cx:hover{
            cursor: pointer;
            background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
            border-color: #D6A886;
        }
        
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
        /*表格的上边框*/
        .l-panel-body {
            border-top: 1px solid #A3C0E8;
        }
    </style>
    
    <script type="text/javascript">
        $(function ()
        {

            $("#layout1").ligerLayout({
                leftWidth: 200,
                centerBottomHeight:180
            });
        });
        var manager;
        var jddwbm='${sessionScope.yh.dwbm.dwbm}' ;
        var jdrgh='${sessionScope.yh.gh}' ;
        $(function ()
        {
        	function getNowFormatDate() {
			      var date = new Date();
			      var seperator1 = "-";
			      var seperator2 = ":";
			      var month = date.getMonth() + 1;
			      var strDate = date.getDate();
			      if (month >= 1 && month <= 9) {
			          month = "0" + month;
			      }
			      if (strDate >= 0 && strDate <= 9) {
			          strDate = "0" + strDate;
			      }
			      var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
			              + " " + date.getHours() + seperator2 + date.getMinutes()
			              + seperator2 + date.getSeconds();
			      return currentdate;
			  }
        	//转换成时间戳
        	 function get_unix_time(dateStr)
        	 {
        	     var newstr = dateStr.replace(/-/g,'/');
        	     var date =  new Date(newstr);
        	     var time_str = date.getTime().toString();
        	     return time_str.substr(0, 10);
        	 }
			  
        	 jQuery.post("lsajbdAction!queryList?jddwbm="+jddwbm+"&&jdrgh="+jdrgh,function(data){
            	
            manager = $("#maingrid").ligerGrid({
                        height:'100%',
                        toolbar: {//工具条
                            items: [
                                { text: '分配', click: itemclick, img: 'images/add.gif' }
//                                 { text: '修改', click: itemclick, img: 'images/add.gif' },
//                                 { line: true },
//                                 { text: '删除', click: itemclick, img: 'images/delete.gif' }
                            ]
                        },
                        columns: [
                            { display: '阅卷人工号', name: 'gh', minWidth: 60 },
                            { display: '阅卷人姓名', name: 'mc', minWidth: 60 },
                            { display: '部门受案号', name: 'bmsah', minWidth: 360 },
                            { display: '案件名称', name: 'ajmc', minWidth: 60 },
                            { display: '阅卷状态', name: 'yjkssjs', minWidth: 60 ,render: function (suminf){
                                var kssj=suminf.yjkssj;
                                var jssj=suminf.yjjssj;
								var date1=getNowFormatDate();
									//转换成时间戳
										var Kssj = kssj.replace("T"," ");
								      Kssj1=get_unix_time(Kssj);
								    //  console.log("Kssj1"+Kssj1);
								      var Jssj = jssj.replace("T"," ");
								      Jssj1=get_unix_time(Jssj);
								     // console.log("Jssj1"+Jssj1);
								      Date1=get_unix_time(date1);
								    //  console.log("Date1"+Date1);

	                              if(Date1<Kssj1){
	
											return '<span style="color: #03a9f4">未到阅卷时间</span>';
	
	                                  }else if(Date1>Kssj1&&Date1<Jssj1){
	
											return '<span style="color: #00d800">可正常阅卷</span>';
	
	                                  }else if(Date1>Jssj1){
	
											return '<span style="color: red">阅卷时间已过</span>';
	                                  }else{
	                                	  return "fghh";
		                                  }
                                }
                            },
                            { display: '开始时间', name: 'yjkssj', minWidth: 60,render: function(suminf){
                                var bb=suminf.yjkssj;
                                		var aa=bb.replace("T"," ");
                                		return aa;
                                	}
                                 },
                            { display: '结束时间', name: 'yjjssj', minWidth: 60,render: function(suminf){
	                                var bb=suminf.yjjssj;
	                        		var aa=bb.replace("T"," ");
	                        		return aa;
	                        	}
                             },
                            { display: '分配人', name: 'jdr', minWidth: 60 },
                            { display: '分配时间', name: 'jdsj', minWidth: 60,render: function(suminf){
	                                var bb=suminf.jdsj;
	                        		var aa=bb.replace("T"," ");
	                        		return aa;
	                        		}
                        	 }
                        ], pageSize:20,rownumbers: true,
//                         onSelectRow :function(data){
//                             console.log(data);
                            
//                         	$("#bmsah_txt").val(data.bmsah);
//                         	$("#yjxh").val(data.yjxh);
//                         	$("#ajmc").val(data.ajmc);
//                             },
                        data: data,where : f_getWhere()
                    }
            );
            $("#pageloading").hide();
            	 })
        });

// 查询
        function f_search()
        {
        	 jQuery.post("lsajbdAction!queryList?jddwbm="+jddwbm+"&&jdrgh="+jdrgh,function(data){
	       	 manager.options.data = data;
	       	 manager.loadData(f_getWhere());
       	 })
        }
        function f_getWhere()
        {
            if (!manager) return null;
            var clause = function (rowdata, rowindex)
            {
                
                var key = $("#bmsah").val();
              //  console.log("============"+rowdata.bmsah);
               // console.log("++++++++++++++++++"+key);
                var key1 = $("#ajmca").val();
                var key2 = $("#yjrgh").val();
                var key3 = $("#yjrmc").val();
                return (rowdata.bmsah.indexOf(key) > -1)&&(rowdata.ajmc.indexOf(key1) > -1)&&(rowdata.gh.indexOf(key2) > -1)&&(rowdata.mc.indexOf(key3) > -1) ;
            };
            manager.changePage("first"); //重置到第一页
            return clause; 
        }
        

        //工具条事件
        function itemclick(item) {
        	// var cksld1 = manager.getSelectedRow();
            switch (item.text) {
                case "分配":
                	location.href = '<s:url action="lsajbdAction!inputaj" namespace="/" />'+"?ajmc="+"&&bmsah="+"&&type=add";
                    break;
                case "修改":
                    var note=manager.getSelectedRow();
                    
                	var ubmsah=data.bmsah;
                	var uyjxh=data.yjxh;
                	var uajmc=data.ajmc;
                    if(note!=null){
                	location.href = '<s:url action="lsajbdAction!inputaj" namespace="/" />'+"?ajmc="+uajmc+"&&bmsah="+ubmsah+"&&type=update";
                        }else{
                        	$.ligerDialog.warn('请先选择需要修改的案件');
                            }
                    //console.log(note);
                    break;
                case "删除":
                	 var noteD=manager.getSelectedRow();
                	// console.log(noteD);
                    if(noteD==null){
                    	$.ligerDialog.warn('请先选择需要删除的案件');
                        }else{
                        	 $.ligerDialog.confirm('是否删除', function (yes) {
                     	        	 if(yes){
                     	        		 $.ajax({
                     		         		 type: "POST",
                     		         	 	 url: "lsajbdAction!delete?yjxh="+noteD.yjxh,
                     		         	 	 success:function(data){
                     		             	 //	 console.log("ee");
                     		             	 	 }
                     		            })
                     	 	 				$.ligerDialog.success('删除成功！');
                     	 	 				$(".l-dialog-btn-inner").click(function(){
                     	 	 					 window.location.reload();
                     		 	 				})
                     			        		 
                     		        	 }
                                     });
                            };

                    break;

            }
        }
    </script>
   
</head>
<body >

<%--- 
    <ul class="jsqxgl_ul">
        <li >
            <span>部门受案号:</span><input type="text" id="bmsah">
        </li>
        <li >
            <span>案件名称:</span><input type="text" id="ajmca">
        </li>
        <li >
            <span>阅卷人工号:</span><input type="text" id="yjrgh">
        </li>
        <li >
            <span>阅卷人姓名:</span><input type="text"  id="yjrmc">
        </li>
        <li >
            <div>
                <p onclick="f_search()"><img src="images/search.gif"  alt="查询" /><span>查询</span></p>
            </div>
        </li>
    </ul>
    
--%>
<div style="overflow: auto;margin:10px;">
<table class="table">
    <tr>
        <td class="td">部门受案号:</td><td><input type="text" id="bmsah" /></td>

        <td class="td">案件名称:</td><td><input type="text" id="ajmca" /></td>
        
          <td class="td">阅卷人姓名:</td><td><input type="text" id="yjrmc" /></td>

        <td class="td">阅卷人工号:</td><td><input type="text" id="yjrgh" /></td>

      

        <td onclick="f_search()" class="cx"><img src="images/search.gif"  alt="查询" /><span>查询</span></td>
    </tr>
</table>
</div>
<div id="layout1">
    <div class="l-loading" style="display:block" id="pageloading"></div>
    <div class="l-clear"></div>
		<!-- 隐藏属性 -->
    	<input type="hidden" id="yjxh" />
    	<input type="hidden" id="ajmc" />
    	<input type="hidden" id="bmsah_txt" />
    <div id="maingrid"></div>

    <div style="display:none;"></div>
</div>
</body>
</html>