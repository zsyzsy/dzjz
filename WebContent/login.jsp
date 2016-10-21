<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
    <title>登录</title>
     <link rel="stylesheet" type="text/css" href="js/easyUi/themes/easyui.css">
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyUi/jquery.easyui.mobile.js"></script>
    <script src="js/easyUi/newdata.js"></script>
    <style>
    input:-webkit-autofill {-webkit-box-shadow: 0 0 0px 1000px white inset;}
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    
    .l-tree .l-tree-icon-folder-open {
        background-position: -87px -238px;
    }
    .l-tree .l-tree-icon-leaf {
        background-position: -87px -238px;
    }
    .l-tree .l-tree-icon-folder {
        background-position:-87px -238px;
    }
        body,html{
            margin: 0;
            background: #1863A4;
        }
        .login_bg{
            width: 100%;
            height: 650px;
            background: url('images/login_bg.gif') repeat-x;
        }
        .login_bg .content{
            width: 810px;
            margin: 0 auto;
            overflow: hidden;
        }
        .content .login_head{
            overflow: hidden;
            margin-top: 20px;
        }
        .content .login_head ul{
            padding: 0;
            color: white;
        }
        .content .login_head li{
            float: left;
            overflow: hidden;
            padding: 0;
        }

        .content .login_head h1,.content .login_head h6{
            padding: 0;
            margin: 0;
        }
        h1{
            font-size: 26px;
        }
        .content .login_head h6{
            padding-top: 5px;
            font-size: 12px;
        }
        .login_img2,.login_text,.login_img3{
            margin-top: 51px;
            margin-left: 10px;
            font-family:@微软雅黑;
        }
/*表单*/
        input {

            outline: none;
            height: 34px;
            line-height: 34px;
            margin-left: 3px;
            padding-left: 3px;
        }
        .content_form{
            overflow: hidden;
            float: left;
            position: relative;
            height: 448px;
            width: 710px;
            background: url("images/loginform.png" );
        }
        .l-text.l-text-combobox {
            position: absolute;
            top: 79px;
            left: 410px;
            height: 34px;
            line-height:34px;
            border: none;
        }
        .l-trigger, .l-trigger-hover, .l-trigger-pressed {
            top: 8px;
        }
        .l-text-field {
            height: 34px;
            line-height: 34px;
        }
        .name{
            position: absolute;
            top: 135px;
            left: 410px;
            height: 34px;
            line-height:34px;
        }
        .password{
            position: absolute;
            top: 191px;
            left: 410px;
            height: 34px;
            line-height:34px;
        }
        .content_form input{
            
		    width: 180px;
		    border: none;
		   
        }

		input#dwbm {
		    margin-left: 410px;
		    margin-top: 80px;
		}
        
        .login_btn{
            height: 42px;
            width: 246px;
            position: absolute;
            top: 260px;
            left: 355px;
        }
        .login_btn_cancel{
            margin-left: 150px;
            margin-top: -44px;
        }


        .content_form_right{
            width: 100px;
            float: right;
            overflow: hidden;
        }
        .l-tree .l-line{
            background-position: 24px -112px;
        }
        .l-tree .l-note {
            background-position: -233px -528px;
        }
        .l-tree .l-note-last {
            background-position: -233px -528px;
        }
        
       .login_btn img:hover{
            cursor: pointer;
        }
       
span.textbox.combo {
    margin-top: 82px;
    margin-left: 413px;
    border: none;
    outline: none;
}
.combo-panel.panel-body.panel-body-noheader {
    margin-top: 4px;
    margin-top: 1px solid #dd\0;
     margin-top: 2px\0;
}

    </style>
    <script type="text/javascript">
  
  //搜索下拉列表
    jQuery.post("dwlist!queryList",function(data){
        var getData=data.rows;
        var newdata=[];
        for(var i=0;i<getData.length;i++){
            newdata[i]={id:getData[i].dwbm,dwmc:getData[i].dwmc,parentId:getData[i].fdwbm}
        }
        var result = convert (newdata);
       //   console.log(result);

        $('#dwmc').combotree({
            data:result,
            valueField: "id",
            text:"text",
            lines:true,
            editable:true,
            value:370000,
            onLoadSuccess:function(){
            	 $("#dwbm").val("370000");
                },
            onClick:function(data){
            	 //设置隐藏属性dwbm值
                $("#dwbm").val(data.id);
                //设置显示单位名称
                $("#dwmc").val(data.text);
            }
        });
//         $("#dwmc").ligerComboBox({
//             width: 182,
//             nodeWidth: 100,
//             selectBoxWidth: 185,
//             selectBoxHeight: 182,
//             textField:'dwmc',
//             valueField: 'dwmc',
//             treeLeafOnly:false,
//             isTextBoxMode :true,
//             valueFieldID: 'test3',
//             tree: {
//                 data:getData,
//                 checkbox: false,
//                 textFieldName:"dwmc",
//                 idFieldName:"dwbm",
//                 parentIDFieldName:"fdwbm",
//                 onclick:function(data){
//                     //设置隐藏属性dwbm值
//                     $("#dwbm").val(data.data.dwbm);
//                     //设置显示单位名称
//                     $("#dwmc").val($("#test3").val());
//                 }
//             }
//         });
    })
        	function submit1(){
    	
				var dwbm=$("#dwbm").val();
				var dlbm=$("#dlbm").val();
				
				var kl=$("#kl").val();
				//alert(dwbm+"=="+dlbm);
				String.prototype.trim = function ()  
					{  
					    return this.replace(/(^\s*)|(\s*$)/g, "");  
					}  
					
				if(dlbm.trim(String)!=""&&kl.trim(String)!=""){
				$.ajax({
					   type: "POST",
					   url: "loginAction!login",
					   data:"dwbm="+dwbm+"&&dlbm="+dlbm+"&&kl="+kl,
		                error: function (data) {
							var msg="${sessionScope.errMsg}";
	// 					  var msg="${requestScope.errMsg}";
		                    $.ligerDialog.error("密码或用户名错误");
		                },
		                success: function (data) {
			                $("#add_form").attr("action","loginAction!login");
			                $("#add_form").submit();
	                	  //$.ligerDialog.success('登录成功!!!');
		                }
				   })
				}
            }
    document.onkeydown = function(e) {
    	
     //捕捉回车事件
     var ev = (typeof event!= 'undefined') ? window.event : e;
     if(ev.keyCode == 13) {
    	 submit1();
     }
    }

    </script>
</head>
<body>
<div id="msg" style="display:none;"><s:actionerror/></div>
<div class="login_bg">
<div class="content">
    <div class="login_head">
        <ul>
            <li>
                <img src="images/style1.png"  alt="">
            </li>
            <li class="login_img2">
                <img src="images/logimg.png"  alt="">
            </li>
            <li class="login_text">
                <h1>电子卷宗管理系统</h1>
                <h6>Electronic file management system</h6>
            </li>
            <li class="login_img3">
                <img src="images/style2.png" alt="">
            </li>
        </ul>
    </div>
   
    <!--表单-->
    <form  id="add_form" method="post">
        <div style="overflow: hidden;zoom: 1;position: relative;">
            <div class="content_form">
            <div class="aaa" >
                  <s:textfield id="dwmc" style="display:none" name="dwmc"/>
                 <s:textfield id="dwbm" style="display:none" name="dwbm" />
<!--                  用户名       -->
                <div class="name"><s:textfield type="text" id="dlbm" name="dlbm" value=""  validtype="length[1,20]"/></div>
<!--                密码      -->
                <div class="password"><s:password type="text" id="kl" name="kl" value=""/></div>
                <div class="login_btn" >
                    <p  ><img src="images/btn_login.png" alt="" onclick="submit1()"></p>
                    <p  class="login_btn_cancel"><img src="images/btn_cancel.png" alt=""></p>
                </div>
                </div>
            </div>
            <div class="content_form_right">
                <div style="height: 150px">
                    <img src="images/style3.png" alt="">

                </div>
                <div style="height: 20px">
                    <img src="images/style4.png" alt="">
                </div>
            </div>
        </div>
    </form>
</div>
</div>
</body>
</html>