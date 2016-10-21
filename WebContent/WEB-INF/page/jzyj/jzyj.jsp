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
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
    <script src="js/Backspace.js" type="text/javascript"></script>
    <style type="text/css">
    
    body{ padding-top:5px; margin:0; padding-bottom:15px;}
        #layout1{  width:100%;margin:0; padding:0;  }
        .l-page-top{ height:40px; background:#f8f8f8; margin-bottom:3px;}
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
        var dwbm='${sessionScope.yh.dwbm.dwbm}' ;
        var gh='${sessionScope.yh.gh}' ;
        console.log(dwbm);
        console.log(gh);
        $(function ()
        {
        	jQuery.post("lsajyjAction!queryListyj?dwbm="+dwbm+"&&gh="+gh,function(data){
            manager = $("#maingrid").ligerGrid({
                        height:'100%',
                        toolbar: {//工具条
                            items: [
                                { text: '阅卷', click: itemclick, img: 'images/search.gif' }
                            ]
                        },
                        columns: [
                            { display: '部门受案号', name: 'bmsah', minWidth: 300 },
                            { display: '事项议题', name: 'ajmc', minWidth: 60 },
                            { display: '阅卷状态', name: 'yjkssjs', minWidth: 60 ,render: function (suminf){
                                var kssj=suminf.yjkssj;
                                var jssj=suminf.yjjssj;
								var date1=getNowFormatDate();
									//转换成时间戳
										var Kssj = kssj.replace("T"," ");
								      Kssj1=get_unix_time(Kssj);
								      var Jssj = jssj.replace("T"," ");
								      Jssj1=get_unix_time(Jssj);
								      Date1=get_unix_time(date1);

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
                            { display: '结束时间', name: 'yjjssj', minWidth: 60 ,render: function(suminf){
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
                        ], pageSize:18,rownumbers: true,onSelectRow :function(data){
                            $("#bmsah").val(data.bmsah);
                            $("#yjxh").val(data.yjxh);
                            },
                        data:data
                    });
            $("#pageloading").hide();
            	})
        });

        //工具条事件
        function itemclick(item) {
        	  var cksld1 = manager.getSelectedRow();
            switch (item.text) {
                case "阅卷":
                    var note=manager.getSelectedRow();
                   console.log(note);
                    if(note==null){
                    	$.ligerDialog.warn('请先选择一个案件');
                        }else{
                        	 var KssjN = note.yjkssj.replace("T"," ");
	       				      KssjN=get_unix_time(KssjN);
	       				      var JssjN = note.yjjssj.replace("T"," ");
	       				      JssjN=get_unix_time(JssjN);
	       				      var dateN=getNowFormatDate();
	       				      DateN=get_unix_time(dateN);
                           	if(DateN<KssjN){
                           		$.ligerDialog.warn("未到阅卷时间");
                               	}else if(DateN>JssjN){
                               	$.ligerDialog.warn("阅卷时间已过")
                                   }else{
                	location.href = '<s:url action="lsajyjAction!inputaj" namespace="/" />'+"?bmsah="+$("#bmsah").val()+"&&yjxh="+$("#yjxh").val()+"&&yjkssj="+cksld1.yjkssj+"&&yjjssj="+cksld1.yjjssj+"&&ajmc="+cksld1.ajmc;
                                       }
                        }
                    break;
            }
        }
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
		  
    </script>
  
</head>
<body style="padding:10px">
<div id="layout1">
		<!-- 隐藏属性 -->
    	<input type="hidden" id="bmsah" />
    	<input type="hidden" id="yjxh" />
    <div class="l-loading" style="display:block" id="pageloading"></div>
    <div class="l-clear"></div>

    <div id="maingrid"></div>

    <div style="display:none;"></div>
</div>
</body>
</html>