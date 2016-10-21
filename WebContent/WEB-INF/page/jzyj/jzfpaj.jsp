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
 <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
  <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
  <script src="js/ligerUI/js/ligerui.all.js"></script>
  <script src="js/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
  <script src="js/data/CustomersData.js" type="text/javascript"></script>
  <script src="js/Backspace.js" type="text/javascript"></script>
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
    input {
      height: 22px;
      line-height: 22px;
      outline: none;
      margin-left: 3px;
      padding-left: 3px;
      border: 1px solid #AECAF0;
    }
    .sbxx_cx{
      margin-left: 10px;
      position: relative;
    }
    .sbxx_cx .rzcx_cx{
      width: 82px;
      padding-left: 20px;
      height: 24px;
      background: url('images/header-bg.gif');
      line-height: 24px;
      border: 1px solid #AECAF0;
    }
    .sbxx_cx .yjfp_bcfp{
      width:70px;
      height: 24px;
      background: url('images/header-bg.gif');
      line-height: 24px;
      border: 1px solid #AECAF0;
    }
    .sbxx_cx img{
      position: absolute;
      left: 10px;
      top: -1px;
    }
    .sbxx_cx .rzcx_cx:hover,.sbxx_cx .yjfp_bcfp:hover{
      cursor: pointer;
      background: #FFBE76  url("images/button-bg-over.gif")  repeat-x center;;
      border-color: #D6A886;
    }
    #time{
      margin-left: 20px;
    }
    /*日期*/
    .l-text.l-text-date {
      width: 200px;
    }
    input#rq1,input#rq2 {
    width: 90%;
}
    /**/
    .l-layout-top{
      border: 0;
    }
    .dqjz{
  	margin-left: 120px;
  	font-weight:700;
	}
    .dqjzmc{
	margin-left:10px;
	}
	div#maingrid {
    maging:0;
}
/*  保存分配浮动  */
span.bcfpfd {
    float: left;
}
#save_div p{
    overflow: hidden;
    margin-top:25px;
    margin-left: 38px;
}
  </style>
  <script type="text/javascript">
    $(function ()
    {

      $("#layout1").ligerLayout({
        leftWidth: 205,
        centerBottomHeight:180,
        allowLeftResize:false,
        allowCenterBottomResize:false
      });
    });
   

  </script>
</head>
<% 
	String ajmc = new String(request.getParameter("ajmc"));
	String bmsah = new String(request.getParameter("bmsah"));
	String type = new String(request.getParameter("type"));
	request.setAttribute("ajmc",ajmc);
	request.setAttribute("bmsah",bmsah);
	request.setAttribute("type",type);
	%>
<body style="padding:10px">
  <!--top-->
  <div  style="overflow: hidden;height: 30px">
    <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="返回列表" onclick="yjfp_fhlb()"/>
      <img src="images/back.gif" alt=""/>
    </span>
    <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="选择案件" onclick="yjfp_xzaj();"/>
      <img src="images/search.gif" alt=""/>
    </span>
    <span class="sbxx_cx"><input class="rzcx_cx" type="button" value="保存分配" onclick="yjfp_bcfp();"/>
      <img src="images/save.gif" alt=""/>
    </span>
<%--     <span class="dqjz">当前12121卷宗:</span><span class="dqjzmc"><input id="ajmc_txt"/></span> --%>
  </div>
<div id="layout1">
  <!--左侧-->
  <div position="left" title="案件目录">
    <div style="height: 580px;width: 200px;">
      <h1 id="ajml" style="padding: 10px;">请选择案件!</h1>
        <ul id="tree1" style="width: 180px;height:99%;height:500px\0;overflow: auto;"">
        </ul>
    </div>


  </div>

  <!--右侧-->
  <div position="center" >



  </div>

  <!------------------------------->
  <!-----------选择案件------------->
  <!------------------------------->
  <div id="add_div" style="display: none; margin: 0 auto;">
    <form id="add_form" method="post">
      <table style="line-height: 30px; ">
        <tr>
          <td>部门受案号:</td>
          <td><input type="text" class="text" id="bmsah1" /></td>
          <td style="padding-left: 20px;">案件名称:</td>
          <td><input type="text" class="text" id="ajmc1" /></td>
          <td onclick="f_search()">
            <span class="sbxx_cx"><input class="yjfp_bcfp" type="button" value="查询"/>
              <img src="images/search.gif" alt=""/>
            </span>
          </td>
        </tr>
      </table>
      <div class="l-loading" style="display:block" id="pageloading"></div>
      <div class="l-clear"></div>

      <div id="maingrid"></div>

      <div style="display:none;"></div>
    </form>
  </div>
  <!------------------------------->
  <!-----------保存分配------------->
  <!------------------------------->
  <div id="save_div" style="display: none; margin: 0 auto;overflow: hidden">
    <form id="save_form" method="post">
    
<!--       <table style="width: 300px;margin:20px auto;"> -->
       <!-- 隐藏属性 -->
       <!-- 被分配人员信息 -->
    	<s:textfield type="hidden" style="display:none" name="gh" id="gh" />
    	<s:textfield type="hidden" style="display:none" name="dwbm" id="dwbm" />
    	<s:textfield type="hidden" style="display:none" name="mc" id="mc" />
    	<!-- 案件基本信息 -->
    	<s:textfield type="hidden" style="display:none" name="bmsah" id="bmsah" />
    	<s:textfield type="hidden" style="display:none" name="ajmc" id="ajmc" />
    	<s:textfield type="hidden" style="display:none" name="ajlbmc" id="ajlbmc" />
    	<s:textfield type="hidden" style="display:none" name="ajlbbm" id="ajlbbm"/>
    	<!-- 案件目录信息 -->
    	<s:textfield type="hidden" style="display:none" name="getCheckeddata" id="getCheckeddata"/>
    	<!-- 分配人信息 -->
    	<s:textfield type="hidden" style="display:none" name="jdr" id="jdr" />
    	<s:textfield type="hidden" style="display:none" name="jdrgh" id="jdrgh" />
    	<s:textfield type="hidden" style="display:none" name="jddwbm" id="jddwbm" />
    	<s:textfield type="hidden" style="display:none" name="jddwmc" id="jddwmc" />
    	<s:textfield type="hidden" style="display:none" name="jdbmmc" id="jdbmmc"/>
    	<s:textfield type="hidden" style="display:none" name="jdbmbm" id="jdbmbm"/>
    	<s:textfield type="hidden" style="display:none" name="jdsj" id="jdsj"/>
    	<s:textfield type="hidden" style="display:none" name="yjkssj" id="yjkssj"/>
    	<s:textfield type="hidden" style="display:none" name="yjjssj" id="yjjssj"/>
    	<s:textfield type="hidden" style="display:none" name="yjzh" id="yjzh"/>
    	<s:textfield type="hidden" style="display:none" name="yjmm" id="yjmm" value="123"/>
    	<s:textfield type="hidden" style="display:none" name="yjsqdh" id="yjsqdh"/>
    	<!-- uuid -->
<%--     	<s:textfield type="hidden" style="display:none" name="yjxh" id="yjxh"/> --%>
			<p><span style="padding-left: 11px;" class="bcfpfd">阅卷人姓名:</span><span id="txt2"></span></p>
			<p><span class="bcfpfd">阅卷开始时间:</span><span><input type="text" id="rq1" /></span></p>
			<p><span class="bcfpfd">阅卷结束时间:</span><span><input type="text" id="rq2" /></span></p>
<!--         <tr> -->
<!--           <td>阅卷人姓名:</td> -->
<!--           <td id="txt2"></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--           <td><div style="height: 10px"></div></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>阅卷开始时间:</td> -->
<!--           <td><input type="text" id="rq1" /></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--           <td><div style="height: 10px"></div></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>阅卷结束时间:</td> -->
<!--           <td><input type="text" id="rq2" /></td> -->
<!--         </tr> -->
<!--       </table> -->
    </form>
  </div>
</div>
</body>
<script type="text/javascript">
  $("#rq1,#rq2").ligerDateEditor(
		  { 	 format: "yyyy-MM-dd hh:mm:ss",
			  showTime: true
			  
			  }
		  );

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
      $.ligerDialog.warn('开始日期不能大于等于结束日期');
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
      $.ligerDialog.warn('结束日期不能大于等于开始日期');
      $("#rq1").val("");
      $(".l-dialog-body").css("width","300px");
      $(".l-dialog-content").css({
        "paddingTop":"25px",
        "paddingBottom": "19px"
      });

    }
  } });
  //搜索
  var condition = { fields: [{ name: 'mc', label: '姓名',width:90,type:'text' }] };
  $(function () {
	  var type='${type}';
	  leftTree(type);
	  jQuery.post("lsajbdAction!getPeople?dwbm="+dwbm,function(data){
    $("#txt2").ligerComboBox({
      width: 200,
      slide: false,
      selectBoxWidth: 655,
      selectBoxHeight: 400,
      valueField: 'mc',
      textField: 'mc',
      grid:{
          columns: [
                    { display: '姓名', name: 'mc', align: 'left',  minWidth: 60 },
                    { display: '性别', name: 'xb', minWidth: 120 },
                    { display: '工号', name: 'gh', minWidth: 140 },
                    { display: '登录别名', name: 'dlbm', minWidth: 100 },
                    { display: '工作证号', name: 'gzzh', minWidth: 100 }
                  ], 
                  data: data,
//                   url : 'lsajbdAction!getPeople?dwbm='+dwbm,
                  pageSize: 10,
                  onSelectRow :function(data){
            			$("#gh").val(data.gh);
            			$("#dwbm").val(data.dwbm);
            			$("#mc").val(data.mc);

                      }
                },
                condition: condition
                
                
    });
	  })
  });
</script>
<script type="text/javascript">
//返回列表
  function  yjfp_fhlb(){
    location.href ="lsajbdAction!input";
  }

var manager;
var manager1;
var dwbm='${sessionScope.yh.dwbm.dwbm}' ;
var dwmc='${sessionScope.yh.dwbm.dwmc}' ;
var dlbm='${sessionScope.yh.dlbm}' ;
var gh='${sessionScope.yh.gh}' ;
	$("#jdr").val(dlbm);
	$("#jdrgh").val(gh);
	$("#jddwbm").val(dwbm);
	$("#jddwmc").val(dwmc);
//案件列表绑定
function ajbd() {
	 jQuery.post("lsajbdAction!queryListaj?dwbm="+dwbm+"&&gh="+gh,function(data){
		 manager = $("#maingrid").ligerGrid({
      height:'390px',
      width:'99%',
      columns: [
        { display: '部门受案号', name: 'bmsah', minWidth: 300 },
        { display: '事项议题', name: 'ajmc', minWidth: 120 },
        { display: '事项类别名称', name: 'ajlb_mc', minWidth: 130 },
        { display: '事项状态', name: 'ajzt', minWidth: 80 ,render: function (item) {
            if(item.ajzt==0){
				return '受理';
             }else if(item.ajzt==1){
            	 return '办理';
              }else if(item.ajzt==2){
            	  return '已办';
              }else if(item.ajzt==3){
            	  return '归档';
              }else{
				 return '状态未定义';
                  }
                  
        	}
        }
      ], pageSize:50,rownumbers: true,where : f_getWhere(),
      onSelectRow :function(data){
			$("#bmsah").val(data.bmsah); 
			$("#ajmc").val(data.ajmc); 
			$("#ajmc_txt").val(data.ajmc); 
			$("#ajlbbm").val(data.ajlb_bm); 
			$("#ajlbmc").val(data.ajlb_mc); 
      },
      data:data
    }
  );
  $("#pageloading").hide();
		 })
};

//查询
function f_search()
{
//    表格
    	 jQuery.post("lsajbdAction!queryListaj?dwbm="+dwbm+"&&gh="+gh,function(data){
    		 manager.options.data = data;
           	 manager.loadData(f_getWhere());
	 })
}
// 制作状态
function f_getWhere()
{
	if (!manager) return null;
    var clause = function (rowdata, rowindex)
    {
       var ajmc = $("#ajmc1").val();
       var bmsah=$("#bmsah1").val(); 
		return ((rowdata.bmsah.indexOf(bmsah) > -1)&&(rowdata.ajmc.indexOf(ajmc) > -1));
   };
 
   manager.changePage("first"); //重置到第一页
   return clause; 
}


	//左侧树加载
	function leftTree(type) {
		if(type=="add"){
		var bmsah=$("#bmsah").val();
		}if(type=="update"){
		var bmsah='${bmsah}';
		}
	  var myaccount = 'images/3.png';
	  console.log(bmsah);
	  jQuery.post("lsajbdAction!queryListleftTree?bmsah="+encodeURI(bmsah),function(data){
		var getData=data.rows;
 
	  $("#tree1").ligerTree({
		  nodeWidth:120,
		  checkbox: true,
          idFieldName :'mlbh',
          parentIDFieldName :'fmlbh',
          textFieldName: 'mlxsmc',
          topParentIDValue:'广元市公安局',
          //isExpand: false,
          // enabledCompleteCheckbox:false, 
          data:getData
	  });
	//  manager1.collapseAll();
	  manager1 = $("#tree1").ligerGetTreeManager();
	  
		  })
	}
	
	//获取选中卷宗信息
	function getChecked1(){
		var getCheckeddata=manager1.getChecked();
		var value="";
		if(getCheckeddata.length>0){
			for(var i=0;i<getCheckeddata.length;i++){
				value+=getCheckeddata[i].data.mlbh+",";
				}
			}
		$("#getCheckeddata").val(value);
		//alert(value);
				
		
		}
// 选择案件
  function yjfp_xzaj(){
	  ajbd();
    $.ligerDialog.open({ title: '选择案件', target: $('#add_div'), width: 797,height:500,
      buttons: [{ text: '确定', onclick: function (item, dialog) {
          $("#ajml").css("display","none");
    	  leftTree("add");
    	  dialog.hidden();
      }, cls: 'l-dialog-btn-highlight'
      }, { text: '取消', onclick: function (item, dialog) {
        $("#add_form")[0].reset();
        dialog.hidden();
      }
      }], isResize: true
    });
  }

//保存分配
function  yjfp_bcfp(){
	if(manager==null){
		$.ligerDialog.warn('请先选择一个案件');
	}else{
		var note=manager.getSelectedRow();
		if(note==null){
			$.ligerDialog.warn('请先选择一个案件');
		}else{
					getChecked1();
				  $.ligerDialog.open({ title: '分配保存设置', target: $('#save_div'), width:400,height:240,top:50,left:270,
				    buttons: [{ text: '确定', onclick: function (item, dialog) {
				    //	 dialog.hidden();
// 				    	 $("#bmsah").val(note.bmsah); 
// 							$("#ajmc").val(note.ajmc); 
// 							$("#ajlbbm").val(note.ajlb_bm); 
// 							$("#ajlbmc").val(note.ajlb_mc); 
				    	 $("#yjkssj").val($("#rq1").val());
				    	 $("#yjjssj").val($("#rq2").val());
				    	 $("#jdsj").val(new Date());

							var txt2=$("#txt2").val();
							var rq1=$("#rq1").val();
							var rq2=$("#rq2").val();
							 if(txt2.trim()==""||rq1.trim()==""||rq2.trim()==""){
								 dialog.show();
		  			    		 $.ligerDialog.warn('请完善添加信息！');
		  				    	 }else{
		  				    		dialog.hidden();
		  				    		$("#save_form").attr("action", "lsajbdAction!add_lsajbd"); 
		  					    	$("#save_form").submit();
		  					    }
				    	 
// 				    	$("#save_form").attr("action", "lsajbdAction!add_lsajbd"); 
// 				    	$("#save_form").submit();
				    }, cls: 'l-dialog-btn-highlight'
				    }, { text: '取消', onclick: function (item, dialog) {
				      $("#save_form")[0].reset();
				      dialog.hidden();
				    }
				    }], isResize: false
				  });
				}
			}
	
}

</script>
</html>
