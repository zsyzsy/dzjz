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
   <title>卷宗制作量统计</title>
   <link rel="stylesheet" type="text/css" href="js/easyUi/themes/easyui.css"/>
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
    <script src="js/data/AllProductData.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
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
        .jzzzltj_ri span{
            float: left;
        }
        /*查询*/
        .jzzzltj_ri .sbxx_cx {
            margin-top: 0;
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

        .jzzzqkcx_ajmc input{
            width: 167px;
        }
        .ajjz_cbr input{
            width: 197px;
        }
        /*riqi*/
        .jzzzltj_slrq{
               margin-left: 10px;
    			margin-top: 2px;
        }
        .jzzzltj_kg{
            width: 27px;
            margin-left: 7px;
            float: left;
            text-align: center;
        }
        .jzzzltj_ywlx{
         margin-top:2px;
            margin-left: 20px;
        }
        .jzzzltj_ywlx_text{
         margin-top:2px;
            margin-left:5px;
        }
        .jzzzltj_ajlb{
         margin-top:2px;
            margin-left: 10px;
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
        .l-text.l-text-combobox {
            margin-left: 3px;
        }
        .l-text-wrapper {
            width: 100px;
            position: relative;
            float: left;
        }
        /* 总量居右  */
        .l-grid-totalsummary-cell-inner div {
   			 text-Align: right;
			}
			
			
			.textbox {
    border: 1px solid #AECAF0;
  
}
.textbox-focused{
box-shadow:none;
}
    </style>

</head>
<body>
<div class="l-loading" style="display:block" id="pageloading"></div>
<div style="margin: 10px;overflow: hidden">
    <p class="jzzzltj_ri">
        <span style="float: left;margin-top: 3px">单位名称:</span><input type="text" id="txt1"/>
        <span class="jzzzltj_slrq">创建日期:</span><input type="text" id="rq1" />
        <span class="jzzzltj_kg">—</span><input type="text" id="rq2" />
      <%--   <span class="jzzzltj_ywlx"><input type="radio" checked name="ywaj"/></span><span class="jzzzltj_ywlx_text">业务类型</span>
        <span class="jzzzltj_ajlb"><input type="radio" name="ywaj"/></span><span class="jzzzltj_ywlx_text">案件类别</span>
	--%>
        <span class="sbxx_cx" onclick="f_search()">
        	<input class="rzcx_cx" type="button" value="查询"/>
            <img src="images/search.gif" alt=""/>
        </span>
        <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="导出Excel"/>
            <img src="images/Undo.png" alt=""/>
        </span>
    </p>
</div>

<!--布局-->
<div class="l-clear"></div>
<!---->
<div id="layout1" >
  <div position="left" title="统计列表">
        <div id="maingrid" style="margin:0; padding:0"></div>
  </div>
  <div position="right" title="详细统计">
    <div >
    <!-- 隐藏属性 -->
    <input type="hidden" id="dwbm" />
      <div id="maingrid2"></div>
    </div>
    
  </div>

</div>

<div style="display:none;">

</div>
</body>
<script type="text/javascript">
$(function (){
    var myChart = null;

    var layout = $("#layout1").ligerLayout({ leftWidth: '49%', rightWidth: '49%',
        onEndResize: function () { $(window).resize(); } });
    $(".l-layout-header-toggle", layout.left).click(function (f) {

        $(".l-layout-right").width(layout.width - (29 + layout.options.space));
        var hid = $(".l-layout-right").is(":hidden");
        if (hid == true) {
            layout.setRightCollapse(false);
        }
        layout.setLeftCollapse(true);
        $(window).resize();
        myChart.resize();
    });
    $(".l-layout-header-toggle", layout.right).click(function () {
        $(".l-layout-left").width(layout.width - (12 + layout.options.space));
        var hid = $(".l-layout-left").is(":hidden");
        if (hid == true) {
            layout.setLeftCollapse(false);
        }
        layout.setRightCollapse(true);
        $(window).resize();
        myChart.resize();
    });
    layout.leftCollapse.toggle.click(function () {
        var hid = $(".l-layout-right").is(":hidden");
        if (hid == false) {
            $(".l-layout-left").width('49%');
            $(".l-layout-right").width('49%');
        }
        layout.setLeftCollapse(false);
        $(window).resize();
        myChart.resize();
    });
    layout.rightCollapse.toggle.click(function () {
        var hid = $(".l-layout-left").is(":hidden");
        if (hid == false) {
            $(".l-layout-left").width('49%');
            $(".l-layout-right").width('49%');
        }
        layout.setRightCollapse(false);
        $(window).resize();
        myChart.resize();
    });
});
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
    	        width:150,
    	        height:22,
    	        lines:true,
    	        editable:true,
    	        onClick:function(data){
    	        	 //设置隐藏属性dwbm值
//    	             $("#dwbm").val(data.id);
    	            //设置显示单位名称
    	            $("#txt1").val(data.text);
    	        }
    	    });
//     	    $("#txt1").ligerComboBox({
//     	        width: 180,
//     	        selectBoxWidth: 180,
//     	        selectBoxHeight: 238,
//     	        textField:'dwmc',
//     	        valueField: 'dwmc',
//     	        treeLeafOnly:false,
//     	        valueFieldID: 'test3',
//     	        tree: {
//     	            data:getData,
//     	            checkbox: false,
//     	            textFieldName:"dwmc",
//     	            idFieldName:"dwbm",
//     	            parentIDFieldName:"fdwbm",
//     	            onclick:function(){
// //     	                getSelected();
//     	            }
//     	        }
//     	    });
    	    $("#pageloading").hide();
    	})
    });
    var dwbm='${sessionScope.yh.dwbm.dwbm}' ;
    var gh='${sessionScope.yh.gh}' ;
    //加载默认时间
    var get_where1=$("#rq1").val()+","+$("#rq2").val();
    var manager;
    $(function (){
    	
        $("#rq1,#rq2").ligerDateEditor();
//            表格

        	 jQuery.post("jzzzltjAction!dwjzzztj?dwbm="+dwbm+"&&gh="+gh+"&&get_where="+get_where1,function(data){
          manager =   $("#maingrid").ligerGrid({
        	  height: '99%',
              width: '99%',
                columns: [

                    { display: '承办单位', name: 'CBDW_MC', align: 'center', width: 200 },
                    { display: '制作案件数', name: 'AJNUM', align: 'center', type:'float',
                    	render: function (suminf)
                        {
                   	 if(suminf.AJNUM==undefined||suminf.AJNUM==''){

                            return '0';
                                }else{
                               	 return suminf.AJNUM;
                                    }
                        },
                        totalSummary:
                        {
                            render: function (suminf)
                            {
                                return '<div>总:' + suminf.sum + '件</div>';
                            },
                            align: 'right'
                        }
                    },
                    { display: '卷数', name: 'JNUM', align: 'center', type: 'float',
                    	render: function (suminf)
                        {
                   	 if(suminf.JNUM==undefined||suminf.JNUM==''){

                            return '0';
                                }else{
                               	 return suminf.JNUM;
                                    }
                        },
                        totalSummary:
                        {
                            render: function (suminf)
                            {
                                return '<div>总:' + suminf.sum + '卷</div>';
                            },
                            align: 'right'
                        }
                    },
                    { display: '文件数', name: 'WJNUM', align: 'center', type: 'float',
                    	render: function (suminf)
                        {
                   	 if(suminf.WJNUM==undefined||suminf.WJNUM==''){

                            return '0';
                                }else{
                               	 return suminf.WJNUM;
                                    }
                        },
                        totalSummary:
                        {
                            render: function (suminf)
                            {
                                return '<div>总:' + suminf.sum + '件</div>';
                            },
                            align: 'right'
                        }
                    },
                    { display: '文件页数', name: 'WJYNUM', align: 'center', type: 'float',
                    	render: function (suminf)
                        {
                   	 if(suminf.WJYNUM==undefined||suminf.WJYNUM==''){

                            return '0';
                                }else{
                               	 return suminf.WJYNUM;
                                    }
                        },
                        totalSummary:
                        {
                            render: function (suminf)
                            {
                                return '<div>总:' + suminf.sum + '页</div>';
                            },
                            align: 'right'
                        }
                    }
                ], dataAction: 'local',rownumbers: true,where : f_getWhere(),
                data: data, sortName: 'CBDW_MC',
                showTitle: false,heightDiff:-10,onSelectRow :function(data){
						$("#dwbm").val(data.CBDW_BM);
						getRight();
                    }
            		});
            	 })
    		});
  
	//加载右侧案件详情
	function getRight(){
		var get_where=" and CBDW_BM="+$("#dwbm").val()+","+$("#rq1").val()+","+$("#rq2").val();
		jQuery.post("jzzzltjAction!dwjzzzyw?dwbm="+dwbm+"&&gh="+gh+"&&get_where="+get_where,function(data){
       	$("#maingrid2").ligerGrid({
           	
       	 height: '99%',
         width: '99%',
            columns: [
                { display: '业务名称', name: 'ywmc', align: 'center', width: 200 },
                { display: '制作案件数', name: 'ajnum', align: 'center', type:'float',
                	render: function (suminf)
                    {
               	 if(suminf.ajnum==undefined||suminf.ajnum==''){

                        return '0';
                            }else{
                           	 return suminf.ajnum;
                                }
                    },
                    totalSummary:
                    {
                        render: function (suminf)
                        {
                            return '<div>总:' + suminf.sum + '件</div>';
                        },
                        align: 'left'
                    }
                },
                { display: '卷数', name: 'jnum', align: 'center', type: 'float',
                	render: function (suminf)
                    {
               	 if(suminf.jnum==undefined||suminf.jnum==''){

                        return '0';
                            }else{
                           	 return suminf.jnum;
                                }
                    },
                    totalSummary:
                    {
                        render: function (suminf)
                        {
                            return '<div>总:' + suminf.sum + '卷</div>';
                        },
                        align: 'left'
                    }
                },
                { display: '文件数', name: 'wjnum', align: 'center', type: 'float',
                	render: function (suminf)
                    {
               	 if(suminf.wjnum==undefined||suminf.wjnum==''){

                        return '0';
                            }else{
                           	 return suminf.wjnum;
                                }
                    },
                    totalSummary:
                    {
                        render: function (suminf)
                        {
                            return '<div>总:' + suminf.sum + '件</div>';
                        },
                        align: 'left'
                    }
                },
                { display: '文件页数', name: 'wjynum', align: 'center', type: 'float',
                	render: function (suminf)
                    {
               	 if(suminf.wjynum==undefined||suminf.wjynum==''){

                        return '0';
                            }else{
                           	 return suminf.wjynum;
                                }
                    },
                    totalSummary:
                    {
                        render: function (suminf)
                        {
                            return '<div>总:' + suminf.sum + '页</div>';
                        },
                        align: 'left'
                    }
                }
            ],dataAction: 'local',rownumbers: true,
            data: data, sortName: 'ywmc',
            showTitle: false,heightDiff:-10

    		});

   	 })
       $("#pageloading").hide();

		}
	

	//查询
	  function f_search()
	 {
		//日期不能为空
			if($("#rq1").val()==""||$("#rq2").val()==""){
		     	$.ligerDialog.warn('创建日期不能为空!');
		         }else{ 
					  var dwbm=$("#dwbm").val();
				      var gh=$("#gh").val();
				    	var get_where2=$("#rq1").val()+","+$("#rq2").val();
					  jQuery.post("jzzzltjAction!dwjzzztj?dwbm="+dwbm+"&&gh="+gh+"&&get_where="+get_where2,function(data1){
						  
				    	 manager.options.data = data1;
				    	 manager.loadData(f_getWhere());
					 })
		         }
	 }
	 function f_getWhere()
	 {
	     if (!manager) return null;
	     var clause = function (rowdata, rowindex)
	     {
	        // var czsj = rowdata.slrq; ///没有获取到值
	       // var czsjTime = czsj.substring(0,10);
	         
	        // var Company=get_unix_time(czsjTime);
	       //  kssj=get_unix_time($("#rq1").val());
	       //  jssj=get_unix_time($("#rq2").val());
	         //时间判断
	        // if(Company>kssj&&Company<=jssj){
	        //     bjsj=Company;
	       //  }
	         //获取单位名称
	         var key = $("#txt1").val();
	         return ((rowdata.CBDW_MC.indexOf(key) > -1));
	     };
	     return clause; 
	 }
</script>
</html>