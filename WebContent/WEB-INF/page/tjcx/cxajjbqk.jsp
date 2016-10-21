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
    <title>案件基本情况查询</title>
     <link rel="stylesheet" type="text/css" href="js/easyUi/themes/easyui.css"/>
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
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
            width: 26px;
            margin-left: 7px;
            text-align: center;
        }
        /*查询*/
        .sbxx_cx{
            margin-left: 20px;
            position: relative;
        }
        .sbxx_cx .rzcx_cx{
            width: 86px;
            padding-left: 20px;
            height: 22px;
            background: url('images/header-bg.gif');
            line-height: 22px;
            border: 1px solid #AECAF0;
        }
        .sbxx_cx img{
            position: absolute;
            left: 10px;
            top: 4px;
        }
        .sbxx_cx .rzcx_cx:hover{
            cursor: pointer;
            background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
            border-color: #D6A886;
        }
        .rzcx_czmc {
		       float: left;
			    margin-top: 3px;
			    margin-left: 23px;
			    margin-right: 2px;
        }
        .rzcx_czrxm{
            margin-left: 18px;
        }
        .ajjbqkcx_ajmc{
            margin-top: 3px;
            margin-left: 20px;
        }
        .ajjz_cbr{
            margin-left: 41px;
        }
        .ajjz_cbr input{
            width: 197px;
        }
        .select{
            float: left;
            height: 22px;
            outline: 0;
            line-height: 22px;
            width: 137px;
            margin-left: 2px;
            border: 1px solid #AECAF0;
        }
        .ajjz_zzzt{
            margin-top: 2px;
            margin-left:31px;
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
            width: 105px;
        }
        .l-text-field {
            width: 102px;
        }
 span.textbox.combo {
    float: left;
    
}
.textbox {
    border: 1px solid #AECAF0;
  
}
.textbox-focused{
box-shadow:none;
}
.content_head{
	margin: 10px;
	overflow:auto
}
.content_head p {
    overflow: auto;
    min-width: 1070px;
    position: relative;
}
/* input#test11 { */
/*     position: absolute; */
/*     width: 170px; */
/*     border-right: none; */
/*     left: 364px; */
/* } */
    </style>
    <script>
   
    
//     var result1=eval("("+result+")");
            var manager ;	
            
        $(function (){
        	ajinfo();
        })
            function ajinfo(){

        	$("#dwbm").val('${sessionScope.yh.dwbm.dwbm}');
        	$("#gh").val('${sessionScope.yh.gh}');
            $("#rq1,#rq2").ligerDateEditor();
            var dwbm=$("#dwbm").val();
            var gh=$("#gh").val();
            var rq1=$("#rq1").val();
//            表格
            	 jQuery.post("ajjbxxqueryList!queryByMap?dwbm="+dwbm+"&&gh="+gh+"&&slrq="+rq1,function(data){
            	manager = $("#maingrid").ligerGrid({
                    height: '99%',
                    width: '99%',
                    columns: [
                        { display: '制作状态', name: 'IsRegard', minWidth:40 ,render:function(e){
                           	if(e.IsRegard=="0"){
       							return '<span style="color: red">未制作</span>';
       						}if(e.IsRegard=="1"){
       							return "已制作";
       							}
                               }
                   		},
                        { display: '案件名称', name: 'ajmc', minWidth: 100 },
                        { display: '部门受案号', name: 'bmsah', minWidth: 250 },
                        { display: '案件类别名称', name: 'ajlb_mc', minWidth: 150 },
                        { display: '承办单位', name: 'cbdw_mc', minWidth:100 },
                        { display: '承办部门', name: 'cbbm_mc', minWidth: 100},
                        { display: '承办人', name: 'cbr', minWidth: 50},
                        { display: '受理日期', name: 'slrq', minWidth: 140,render: function(suminf){
                            var bb=suminf.slrq;
                    		var aa=bb.replace("T"," ");
                    		return aa;
                    		}
                		 },
                        {  display: '案件状态', name: 'ajzt', minWidth: 100,render:function(e){
                        	if(e.ajzt=="0"){
    							return "受理";
    						}if(e.ajzt=="1"){
    							return "未受理";
    							}
                            }
                		}
                    ],pageSizeOptions:[50, 100, 150, 200, 250], pageSize:50,rownumbers: true,where : f_getWhere(),
                   		data:data
                });

            	 })
                $("#pageloading").hide();
                }
    </script>
</head>
<body>
<div class="l-loading" style="display:block" id="pageloading"></div>
<div class="content_head">
<!-- 隐藏属性 -->
        				<s:textfield  style="display:none" id="dwbm" name="dwbm"  />
        				<s:textfield  style="display:none" id="gh" name="gh"  />
    <p>
        <span style="float: left;margin-top: 3px">单位名称:</span><input type="text" id="txt1"/>
        <span class="rzcx_czmc">案件类别:</span><input type="text" id="test1" /><input style="display:none" type="text" id="test11" />
        <span class="rzcx_czrxm">部门受案号:<input type="text" id="bmsah" /></span>
        <span class="ajjbqkcx_ajmc">案件名称:</span><input type="text" id="ajmc"/>
    </p>
    <p class="rzcx_ri">
        <span>受理日期:</span><input type="text" id="rq1" />
        <span class="sapn">-</span><input type="text" id="rq2" />
        <span class="ajjz_cbr">承办人:<input type="text" id="cbr"/></span>

        <span class="ajjz_zzzt">制作状态:</span>
        <select class="select" name="" id="secelt">
            <option value="全部">全部</option>
            <option value="未制作">未制作</option>
            <option value="已制作">已制作</option>
        </select>
        <span class="sbxx_cx" style="margin-top: 0" onclick="f_search()">
        	<input class="rzcx_cx" type="button" value="查询"/>
            <img src="images/search.gif" alt=""/>
        </span>
        <span class="sbxx_cx" style="margin-top: 0;margin-left:10px;"><input class="rzcx_cx" type="button" value="导出Excel"/>
            <img src="images/Undo.png" alt=""/>
        </span>
        <input type="hidden" id="zzzt"/>
    </p>
</div>
<!--表格-->
<div class="l-clear"></div>

<div id="maingrid"></div>
<div style="display:none;">

</div>
<script type="text/javascript">
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
        width:240,
        height:22,
        lines:true,
        editable:true,
        onClick:function(data){
        	 //设置隐藏属性dwbm值
//             $("#dwbm").val(data.id);
            //设置显示单位名称
            $("#txt1").val(data.text);
        }
    });
//     $("#txt1").ligerComboBox({
//         width: 238,
//         selectBoxWidth: 238,
//         selectBoxHeight: 238,
//         textField:'dwmc',
//         valueField: 'dwmc',
//         treeLeafOnly:false,
//         valueFieldID: 'test3',
//         tree: {
//             data:getData,
//             checkbox: false,
//             textFieldName:"dwmc",
//             idFieldName:"dwbm",
//             parentIDFieldName:"fdwbm",
//             onclick:function(){
//                 getSelected();
//             }
//         }
//     });
})
//搜索案件类别下拉列表
jQuery.post("ajlbbmAction!queryList",function(data){
    		 var getData=data.rows; //json
    		
    		 var newdata=[];
     	    for(var i=0;i<getData.length;i++){
     	        newdata[i]={id:getData[i].ajlbmc,text:getData[i].ajlbmc,"iconCls":"ico"}
     	    }
     	    $('#test1').combotree({
     	        data:newdata,
     	        valueField: "id",
     	        text:"text",
     	       	lines:false,
     	        width:200,
     	        height:22,
     	        editable:true,
     	        onClick:function(data){
     	        	$("#test11").val(data.text);
     	        }
     	    });
		     // $("#test1").ligerComboBox({
		       // width : 200,
		        //data:getData1,
		        //textField:'ajlbmc',
		        //valueField: 'ajlbmc',
		        //treeLeafOnly:false,
		        //autocompleAllowEmpty:true,
		       // isTextBoxMode:true,
		       // valueFieldID: 'test4',
		     // });

		      
    	})
     //获取选中的值
        function  getSelected(){
    console.log($("#test3").val());
            $("#txt1").val($("#test3").val());
           
            }
//同案人员信息
  function showTaryxx(obj) {
    $.ligerDialog.open({ title: '同案人员信息', height: 200, width: 500, content: obj,
      buttons: [{ text: '取消', onclick: function (item, dialog) {
      dialog.hidden();
      }
      }], isResize: true

    });
  }

  var manager;
  var g;
  var kssj;
  var jssj;
  var bjsj;
  var ccc;
  var secelt;
//查询
  function f_search()
 {
	  if($("#rq1").val()==""||$("#rq2").val()==""){
	     	$.ligerDialog.warn('受理日期不能为空!');
	         }else{
				  $("#dwbm").val('${sessionScope.yh.dwbm.dwbm}');
			  	$("#gh").val('${sessionScope.yh.gh}');
			      $("#rq1,#rq2").ligerDateEditor();
			      var dwbm=$("#dwbm").val();
			      var gh=$("#gh").val();
			      var rq1=$("#rq1").val();
			//      表格
			      	 jQuery.post("ajjbxxqueryList!queryByMap?dwbm="+dwbm+"&&gh="+gh+"&&slrq="+rq1,function(data1){
			    	 manager.options.data = data1;
			    	 manager.loadData(f_getWhere());
				 })
	         }
 }
  // 制作状态
$("#secelt").change(function ()
    {
        $("#zzzt").val(this.value);  //将选择的值赋给$("#zzzt")
    });

 function f_getWhere()
 {
	 
     if (!manager) return null;
     var clause = function (rowdata, rowindex)
     {
         var czsj = rowdata.slrq; ///没有获取到值
        var czsjTime = czsj.substring(0,10);
         
         var Company=get_unix_time(czsjTime);
         kssj=get_unix_time($("#rq1").val());
         jssj=get_unix_time($("#rq2").val());
         //时间判断
         if(Company>=kssj&&Company<=jssj){
             bjsj=Company;
         }
         //获取单位名称
         var key = $("#txt1").val();
         var key1=$("#test11").val();
         console.log("-------------------------"+$("#test1").val());
         var bmsah=$("#bmsah").val();
         var ajmc=$("#ajmc").val();
           
         var cbr=$("#cbr").val();
		  	 var CBR=rowdata.cbr; //  获取数据承办人姓名
		  	 if(CBR==null){
			  	 ccc=" ";
			  	 }else{
			  		ccc=CBR;
				  	 }
//////////////////////////////////////////
//
//		  	       制作状态没查询功能
//
//////////////////////////////////////////
		  	var zzzt=$("#zzzt").val();
		  	var IsRegard;
		     if(rowdata.IsRegard=="0"){
		    	 IsRegard="未制作"
			     }if(rowdata.IsRegard=="1") {
			    	 IsRegard="已制作"
				     }if(zzzt=="全部"){
			    	 window.location.reload();
				     }

			   
         return ((rowdata.cbdw_mc.indexOf(key) > -1)&&(IsRegard.indexOf(zzzt) > -1)&&(rowdata.ajlb_mc.indexOf(key1) > -1)&&(Company.indexOf(bjsj) > -1)&&(rowdata.bmsah.indexOf(bmsah) > -1)&&(rowdata.ajmc.indexOf(ajmc) > -1)&&(ccc.indexOf(cbr) > -1));
     };
     manager.changePage("first"); //重置到第一页
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
  ////////////////////////////////
  //////////制作///////////////
  ///////////////////////////////
  function zjjz_zz(){
    var manager = $("#maingrid").ligerGetGridManager();
    var row = manager.getSelectedRow();
    if(!row){
      $.ligerDialog.warn('请先选择一条数据');
    }
  }
  ////////////////////////////////
  //////////添加案件///////////////
  ///////////////////////////////
  function ajjzzz_tjaj(){
    $.ligerDialog.open({ title: '添加案件', target: $('#add_div'), width: 588,
      buttons: [{ text: '确定', onclick: function () {
//        if(($(".add_text").val()=="")&&($(".add_txt_remark").val()=="")){
//          $.ligerDialog.error('请将案件信息填写完整');
//        }
        $("#add_div").hidden();
      }, cls: 'l-dialog-btn-highlight'
      }, { text: '取消', onclick: function (item, dialog) {
        $("#add_form")[0].reset();
        dialog.hidden();
      }
      }], isResize: true
    });
  }
////////////////////////////////
//////////修改案件///////////////
///////////////////////////////
  function updateaj(){
    var manager = $("#maingrid").ligerGetGridManager();
    var row = manager.getSelectedRow();
    if (row) {
          //弹出窗口
          $.ligerDialog.open({ title: '修改案件', target: $('#update_div'), width: 588,
            buttons: [{ text: '确定', onclick: function (item, dialog) {
              submitForm();
            }, cls: 'l-dialog-btn-highlight'
            }, { text: '取消', onclick: function (item, dialog) {
              $("#update_form")[0].reset();
              dialog.hidden();
            }
            }], isResize: true
          });
    } else{
      $.ligerDialog.error('请选择修改项');
    }
  }
  ////////////////////////////////
  //////////导出PDF///////////////
  ///////////////////////////////
  function  ajjzzz_PDF(){
    var manager = $("#maingrid").ligerGetGridManager();
    var row = manager.getSelectedRow();
    if(!row){
      $.ligerDialog.warn('请先选择一条数据');
    }else {
    }
  }

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
</body>
</html>



