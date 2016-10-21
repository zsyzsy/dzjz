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
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.mobile.js"></script>
    <script src="js/easyUi/newdata.js"></script>
    <style>
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
        .rzcx_ri{
            margin-top: 10px;
            overflow: hidden;
            zoom: 1;
        }
        .rzcx_ri span{
            float: left;
            margin-top: 2px;
        }
        .rzcx_ri .sapn{
                    margin-left: 135px;
        }
     
        /*查询*/
        .sbxx_cx{
                margin-left: 15px;
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
            top: 2px;
        }
        .sbxx_cx .rzcx_cx:hover{
            cursor: pointer;
            background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
            border-color: #D6A886;
        }
        .rzcx_czmc {
    		margin-left: 33px;       
     }
        .rzcx_czrxm{
            margin-top: 3px;
    		margin-left: 25px;
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
        .l-text {
    margin-left: 2px;
    width: 105px;
}
input#rq1,input#rq2 {
    width: 102px;
}
			.l-text-wrapper {
			}
			
			
span.ks {
	    float: left;
	    margin-top: 3px;
	    margin-left: 20px;
}
span.js {
    float: left;
    margin-top: 3px;
    margin-left: 20px;
}

    					.textbox {
     					float:left;
    border: 1px solid #AECAF0;
  
}
.textbox-focused{
box-shadow:none;
}
    </style>
    <script type="text/javascript">
        $(function ()
        {
            $("#test1").ligerComboBox({
                width : 200,
                data: [
                    { text: '--全部--', id: '0' },
                    { text: '系统登录', id: '1' },
                    { text: '卷宗制作', id: '2' },
                    { text: '统计查询', id: '3' },
                    { text: '卷宗阅卷', id: '4' }
                ],
                value: '0',
                initIsTriggerEvent: false,
                onSelected: function (value)
                {
                    $("#czmc").val(value);
                   // alert('选中事件:' + value);
                }
            });
          //搜索下拉列表
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
         	       width:150,
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

        });
    </script>
    <script>
//            表格
        var maingrid = null;
        var kssj,jssj,bjsj,cccc;
        $(function (){
     		 var row=eval(CustomersData);
            $("#rq1,#rq2").ligerDateEditor();
        	jQuery.post("rzcxqueryList!queryList",function(data){
            	console.log(data);
        		maingrid = $("#maingrid").ligerGrid({
                height: '99%',
                width: '99%',
                columns: [
                    { display: '单位名称', name: 'dwmc', minWidth: 50 },
                    { display: '部门名称', name: 'bmmc', minWidth: 50 },
                    { display: '操作人', name: 'czr', minWidth: 50 },
                    { display: '操作时间', name: 'czsj', minWidth: 50,render: function(suminf){
	                        var bb=suminf.czsj;
	                		var aa=bb.replace("T"," ");
	                		return aa;
	                	}
                	 },
                    { display: '操作IP', name: 'czip', minWidth: 50 },
                    {display: '日志内容', name: 'rznr', minWidth: 150, render: function (date) {
                      if (date.rznr) {
                        return '<a href="javascript:" onclick="onedit(\'' + date.rznr + '\')">' + date.rznr + '</a>';
                       }
                     }
                  }

                ],pageSizeOptions:[50, 100, 150, 200, 250], pageSize:50,rownumbers: true,where : f_getWhere(),
                data: data
            });

        	});
        	
            $("#pageloading").hide();
        });

        //弹窗
       

      //同案人员信息
        function onedit(obj) {
          $.ligerDialog.open({ title: '日志内容', height: 200, width: 500, content: obj,
            buttons: [{ text: '取消', onclick: function (item, dialog) {
              dialog.hidden();
            }
            }], isResize: true

          });
        }
        //获取选中的值
        function  getSelected(){
            $("#txt1").val($("#test3").val());
           
            }
        //查询
        var ccc;
         function f_search()
        {
        	//日期不能为空
 			if($("#rq1").val()==""||$("#rq2").val()==""){
 		     	$.ligerDialog.warn('操作日期不能为空!');
 		         }else{ 
				       	 jQuery.post("rzcxqueryList!queryList",function(data1){
				           	maingrid.options.data = data1;
				           	maingrid.loadData(f_getWhere());
				       	 })
 		         }
        }
        function f_getWhere()
        {
            if (!maingrid) return null;
            var clause = function (rowdata, rowindex)
            {
                var key = $("#txt1").val();
                var key2=$("#gjz").val();
                var key3=$("#czr").val();
                var czsj = rowdata.czsj;
                var czsjTime = czsj.substring(0,10);
                var Company=get_unix_time(czsjTime);
                kssj=get_unix_time($("#rq1").val());
                jssj=get_unix_time($("#rq2").val());
                //时间判断
                
                if(Company>=kssj&&Company<=jssj){
                    bjsj=Company
                }
                var CBR=rowdata.bmmc; //  获取数据承办人姓名
                console.log("edfjwef========="+CBR);
   		  	 	if(CBR==null||CBR==""){
   			  	 ccc=" ";
   			  	 }else{
   			  		ccc=CBR;
   				  	 }
                return (rowdata.dwmc.indexOf(key) > -1)&&((rowdata.rznr.indexOf(key2) > -1)||(rowdata.czip.indexOf(key2) > -1)||(ccc.indexOf(key2) > -1))&&(rowdata.czr.indexOf(key3) > -1)&&((Company.indexOf(bjsj) > -1));
            };
            maingrid.changePage("first"); //重置到第一页
            return clause; 
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
<body>

<div style="margin: 10px;overflow: auto">
    <p style="min-width: 1125px;overflow: auto;">
        <span style="float: left;margin-top: 3px">单位名称:</span><input type="text" id="txt1"/>
        <span class="ks">操作日期:</span><input type="text" id="rq1" />
        <span class="js">结束日期:</span><input type="text" id="rq2" />
        
       <%--  <span class="rzcx_czmc">操作名称:</span><input type="text" id="test1" />
        										<input type="hidden" id="czmc"></input> --%>
        <span class="rzcx_czmc">关键字:<input type="text" id="gjz"/></span>
        <span class="rzcx_czrxm">操作人姓名:</span><input type="text" id="czr"/>
   <%--  </p>
    <p class="rzcx_ri">
        <span>开始日期:</span><input type="text" id="rq1" />
        <span class="sapn">结束日期:</span><input type="text" id="rq2" />  --%>
        <span class="sbxx_cx" style="margin-top: 0"><input class="rzcx_cx" type="button" value="查询" onclick="f_search()"/>
            <img src="images/search.gif" alt=""/>
        </span>
    </p>
</div>

<!--表格-->
<div class="l-clear"></div>

<div id="maingrid"></div>

<div style="display:none;">
</div>
<div id="target1" style="width:200px; margin:3px; display:none;">
    <h3>提示文本标题</h3>
    <div>
        这里是目标容器的内容，执行open({target:$("#target1")});<BR />
        以后将把这段内容以ligerDialog的方式加载并显示。
    </div>
 </div>
 
</body>
<script >

  //-----------------------------------//
  //-----------日期----------------------//
  // -----------------------------------//
  function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
      month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
      strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    return currentdate;
  }

  $("#rq1").ligerDateEditor({ labelAlign: 'center',onChangeDate:function(value){
    var d1=new Date($("#rq2").val().replace(/\-/g,"\/"));
    var d2=new Date(value.replace(/\-/g,"\/"));
    if(d1<=d2){
      $("#rq1").val("");
      $.ligerDialog.warn('受理开始日期不能大于等于结束日期');
      $(".l-dialog-body").css("width","300px");
      $(".l-dialog-content").css({
        "paddingTop":"25px",
        "paddingBottom": "19px"
      })
    }
  }});
  $("#rq2").ligerDateEditor({labelAlign: 'center', initValue: getNowFormatDate(),onChangeDate:function(value){
    var d1=new Date(value.replace(/\-/g,"\/"));
    var d2=new Date($("#rq1").val().replace(/\-/g,"\/"));
    if(d1<=d2){
      $.ligerDialog.warn('受理结束日期不能大于等于开始日期');
      $("#rq1").val("");
      $(".l-dialog-body").css("width","300px");
      $(".l-dialog-content").css({
        "paddingTop":"25px",
        "paddingBottom": "19px"
      });

    }
  } });

  var re=$("#rq2").val();
  $("#rq1").val(re.replace(re.charAt(3), re.charAt(3)-1));
</script>
</html>
