<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.dzjz.xtpz.qx.po.Yh"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="utf-8" />
    <title>电子卷宗管理系统</title>
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />  
    <link rel="stylesheet" type="text/css" id="mylink"/>   
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>    
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>  
<%--     <script src="js/data/jquery.cookie.js"></script> --%>
    <script src="js/data/json2.js"></script>
      <script src="js/Backspace.js" type="text/javascript"></script>
    
    <style type="text/css">
    body,html{height:100%;}
    body{ padding:0; margin:0;   overflow:hidden;}
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:31px; line-height:31px; background:url('lib/images/top.jpg') repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:26px;background:url('lib/images/topicon.gif') no-repeat 10px 5px;}
    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:underline} 
     .body-gray2014 #framecenter{
        margin-top:3px;
    }
      .viewsourcelink {
         background:#B3D9F7;  display:block; position:absolute; right:10px; top:3px; padding:6px 4px; color:#333; text-decoration:underline;
    }
    .viewsourcelink-over {
        background:#81C0F2;
    }
    .l-topmenu-welcome label {color:white;
    }
    #skinSelect {
        margin-right: 6px;
    }
    
    input {
      height: 20px;
      line-height: 20px;
      outline: none;
      margin-left: 3px;
      padding-left: 3px;
      border: 1px solid #AECAF0;
    }
    .index_head{
      width: 100%;
      height: 55px;
      line-height: 55px;
      overflow: hidden;
      zoom: 1;
      background: url("images/02.png");
    }
    .index_head_left{
      width: 310px;
      height: 53px;
      float: left;
      background: url("images/index_head.png") no-repeat;
    }
    .index_head_right{
      float: right;
      width: 330px;
      color: white;
    }
    .index_head_right img{
      vertical-align: middle;
      margin-top: -6px;
    }
    .index_head_right a{
      color: white;
      text-decoration: none;
    }
    .index_head_text{
      margin-left: 5px;
    }
    .index_head_h{
      margin-left: 15px;
    }

    .nav li{
        height: 30px;
        line-height: 30px;
    }
    .nav li:hover{
        background: #ffff00;
    }
    .nav li a{
        text-decoration: none;
        color: #000000;
    }
    .nav img{
        vertical-align: middle;
        padding-left: 20px;
    }
    .nav span{
        padding-left: 10px;
    }

  #update_div input {
    width: 200px;
  }
  
  /* 菜单  */
/*   .l-tree .l-expandable-open { */
/*     position: relative; */
/*     background-position: 0px -132px; */
/*     left: 165px; */
/* } */
/* .l-tree .l-expandable-close { */
/*     position: relative; */
/*     left: 165px; */
/*      background-position: 0px -44px; */
/* } */
/* 去掉虚线   */
.l-tree .l-line {
    display: none;
}
.l-tree .l-note {
    display: none;
}
.l-tree .l-note-last {
    display: none;
}
/* 布局  */

.l-tree .l-tree-icon-folder-open {
    margin-left: -20px;
}
.l-tree .l-tree-icon-folder {
     margin-left: -20px;
}
.l-tree .l-tree-icon-leaf {
    margin-left: 44px;
}

.l-tree li .l-body {
    height: 25px;
    line-height: 25px;
	width: 200px;
	border: 1px solid #ccc;
	border-top-style: none;
	border-left-style: none;
    border-right-style: none;
    background: url('images/header-bg.gif');
}
.l-tree li .l-selected  .l-body {
margin-top:0;
}
.l-tree li .l-selected span {
    background: none;
    border: none;
    padding: 1px 0;
}
li.l-first {
    border-top: none;
}
.l-tree .l-over span {
    text-decoration: none;
}
.l-tree .l-children .l-selected span {
    padding: 0px 2px;
    height: 25px;
    line-height: 25px;
}
.l-tree li .l-children .l-body {
    border: none;
    background: white;
}
.l-tree  .l-children .l-over  span {
    text-decoration: underline;
}
.l-tree li .l-children .l-body:hover {
           background: #64c3ff;
        }
        .l-tree  .l-children .l-box:first-child{ 
        	display: none;
        }
        .l-layout-left {
    background: #BED5F3;
}
.l-tree .l-body span {
    margin-left: 6px;
}

/*******************************************/
        /*****************功能样式********************/
        /*******************************************/
/* .l-tree .l-tree-icon-folder { */
/* 		    background: url("151511z.png") ; */
		    
/* 		} */
/*         .l-tree .l-tree-icon-folder-0 { */
/* 		    background: url("images/zz.png") no-repeat 5px center; */
/* 		} */
/*         .l-tree .l-tree-icon-folder-1 */
/*         { */
/*             background: url("images/yj.png") no-repeat 5px center; */
/*         } */
/*         .l-tree .l-tree-icon-folder-2 */
/*         { */
/*             background: url("images/cx.png") no-repeat 5px center; */
/*         } */
/*         .l-tree .l-tree-icon-folder-3 */
/*         { */
/*             background: url("images/tj.png") no-repeat 5px center; */
/*         } */
/*         .l-tree .l-tree-icon-folder-4 */
/*         { */
/*             background: url("images/system.png") no-repeat 5px center; */
/*         } */
/* 展开和收缩   */
      .l-tree .l-body .l-expandable-close {
	    position: relative;
	    left: 165px;
	    background: url("images/togglebar.gif") no-repeat;
        background-position: 0px 2px;
}
.l-tree .l-body .l-expandable-close:hover {
    background-position: 1px -19px;
}
	.l-tree .l-body .l-expandable-open {
		position: relative;
	    left: 165px;
	    background: url("images/togglebar.gif") no-repeat;
		    background-position: 0px -39px;
		}
		.l-tree .l-body .l-expandable-open:hover {
    background-position: 1px -59px;
}
/* .l-tree .l-tree-icon-leaf { */
/*            background-position: -87px -241px; */
/*     } */
 </style>
    <script src="js/data/indexdata.js" type="text/javascript"></script>
        <script type="text/javascript">
        
            var tab = null;
            var accordion = null;
            var tree = null;
            var tabItems = [];
            $(function ()
            {

                //布局
                $("#layout1").ligerLayout({
                    leftWidth: 200,
                    height: '100%',
                    heightDiff: -34,
                    space: 4,
                    allowLeftResize:false,
                    allowCenterBottomResize:false,
                    onHeightChanged: f_heightChanged,
                    onLeftToggle: function ()
                    {
                        tab && tab.trigger('sysWidthChange');
                    },
                    onRightToggle: function ()
                    {
                        tab && tab.trigger('sysWidthChange');
                    }
                });

                var height = $(".l-layout-center").height();

                //Tab
                tab = $("#framecenter").ligerTab({
                    height: height,
                    //dragToMove:true,
       
                    showSwitch: false,
                    ShowSwitchInTab: false,  //切换窗口按钮显示在最后一项
                    onAfterAddTabItem: function (tabdata)
                    {
                        tabItems.push(tabdata);
                    },
                    onAfterRemoveTabItem: function (tabid)
                    { 
                        for (var i = 0; i < tabItems.length; i++)
                        {
                            var o = tabItems[i];
                            if (o.tabid == tabid)
                            {
                                tabItems.splice(i, 1);
                                break;
                            }
                        }
                    },
                    onReload: function (tabdata)
                    {
                        var tabid = tabdata.tabid;
                        addFrameSkinLink(tabid);
                    }
                });

                //面板
                $("#accordion1").ligerAccordion({
                    height: height - 24, speed: null
                });

                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
                //树
                jQuery.post("gnByRyMenuAction!gnbyry",function(data){
                    var jzzz='images/zz.png';
                    var jzyj='images/yj.png';
                    var tjcx="images/cx.png";
                    var tjbb="images/tj.png";
                    var xtpz="images/system.png";
                    var imgs="images/3.png";
                    var getData=data.rows;
                    var newdata=[];
                    for(var i=0;i<getData.length;i++){
                    	var flbm1=getData[i].flbm;
                     if(flbm1==370000000002){
                    	 newdata[i]={dwbm:getData[i].dwbm,
	                                flxh:getData[i].flxh,
	                                gnct:getData[i].gnct,
	                                fflbm:getData[i].fflbm,
	                                flmc:getData[i].flmc,
	                                flbm:getData[i].flbm,
	                                tabid:getData[i].flmc,
	                                icon:jzzz}
                         }else if(flbm1==370000000001){
                        	 newdata[i]={dwbm:getData[i].dwbm,
 	                                flxh:getData[i].flxh,
 	                                gnct:getData[i].gnct,
 	                                fflbm:getData[i].fflbm,
 	                                flmc:getData[i].flmc,
 	                                flbm:getData[i].flbm,
 	                                tabid:getData[i].flmc,
 	                                icon:xtpz}
                          }else if(flbm1==370000000003){
                         	 newdata[i]={dwbm:getData[i].dwbm,
  	                                flxh:getData[i].flxh,
  	                                gnct:getData[i].gnct,
  	                                fflbm:getData[i].fflbm,
  	                                flmc:getData[i].flmc,
  	                                flbm:getData[i].flbm,
  	                                tabid:getData[i].flmc,
  	                                icon:tjcx}
                           }else if(flbm1==370000000004){
                           	 newdata[i]={dwbm:getData[i].dwbm,
   	                                flxh:getData[i].flxh,
   	                                gnct:getData[i].gnct,
   	                                fflbm:getData[i].fflbm,
   	                                flmc:getData[i].flmc,
   	                                flbm:getData[i].flbm,
   	                                tabid:getData[i].flmc,
   	                                icon:tjbb}
                            }else if(flbm1==370000000005){
                              	 newdata[i]={dwbm:getData[i].dwbm,
        	                                flxh:getData[i].flxh,
        	                                gnct:getData[i].gnct,
        	                                fflbm:getData[i].fflbm,
        	                                flmc:getData[i].flmc,
        	                                flbm:getData[i].flbm,
        	                                tabid:getData[i].flmc,
        	                                icon:jzyj}
                                 }else if(flbm1.length==10){
                        newdata[i]={dwbm:getData[i].dwbm,
	                                flxh:getData[i].flxh,
	                                gnct:getData[i].gnct,
	                                fflbm:getData[i].fflbm,
	                                flmc:getData[i].flmc,
	                                flbm:getData[i].flbm,
	                                tabid:getData[i].flmc,
	                                icon:imgs}
                    }
                     }
                $("#tree1").ligerTree({
                    data : newdata,
                    checkbox: false,
                    slide: false,
                    isExpand: false,
                    nodeWidth: 135,
                    idFieldName :'flbm',
                 	parentIDFieldName :'fflbm',
                 	attribute: ['nodename', 'gnct'],
                 	onExpand:function(){
                     	},
                    render : function(a){
                        if (!a.isnew) return a.flmc;
                        return '<a href="' + 'http://www.baidu.com' + '" target="_blank">' + a.flmc + '</a>';
                       
                    },
                    onSelect: function (node)
                    {
                    	//$(".l-tree li .l-body").addClass("l-expandable-close");
                        if (!node.data.gnct) return;
                        if (node.data.isnew)
                        { 
                            return;
                        }
//                         var tabid = $(node.target).attr("tabid");
                        
//                         if (!tabid)
//                         {
                        	
//                             tabid = new Date().getTime();
//                             $(node.target).attr("tabid", tabid);
                            
//                         } 
                        f_addTab(node.data.tabid, node.data.flmc, node.data.gnct);
                    }
                	});
            	//菜单整行点击展开和收缩
                function aa(){
                    //添加树形节点属性
                	$(".l-tree li .l-body").addClass("l-expandable-close");
                	//移除父节点下的子节点属性
                	$(".l-tree li .l-children .l-body").removeClass("l-expandable-close");
                	
                    };
                treeManager = $("#tree1").ligerGetTreeManager(aa());
              //菜单整行点击展开和收缩
                })
              
                function openNew(url)
                { 
                    var jform = $('#opennew_form');
                    if (jform.length == 0)
                    {
                        jform = $('<form method="post" />').attr('id', 'opennew_form').hide().appendTo('body');
                    } else
                    {
                        jform.empty();
                    } 
                    jform.attr('action', url);
                    jform.attr('target', '_blank'); 
                    jform.trigger('submit');
                };


                tab = liger.get("framecenter");
                accordion = liger.get("accordion1");
                tree = liger.get("tree1");
                $("#pageloading").hide();

                css_init();
            });
            function f_heightChanged(options)
            {  
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid, text, url)
            {
                tab.addTabItem({
                    tabid: tabid,
                    text: text,
                    url: url,
                    callback: function ()
                    {
                        addFrameSkinLink(tabid); 
                    }
                });
            }
            function showCodeView(src)
            {
                $.ligerDialog.open({
                    title : '源码预览',
                    url: 'dotnetdemos/codeView.aspx?src=' + src,
                    width: $(window).width() *0.9,
                    height: $(window).height() * 0.9
                });

            }
            function addFrameSkinLink(tabid)
            {
                var prevHref = getLinkPrevHref(tabid) || "";
                var skin = getQueryString("skin");
                if (!skin) return;
                skin = skin.toLowerCase();
                attachLinkToFrame(tabid, prevHref + skin_links[skin]);
            }
            var skin_links = {
                "aqua": "lib/ligerUI/skins/Aqua/css/ligerui-all.css",
                "gray": "lib/ligerUI/skins/Gray/css/all.css",
                "silvery": "lib/ligerUI/skins/Silvery/css/style.css",
                "gray2014": "lib/ligerUI/skins/gray2014/css/all.css"
            };
            function css_init()
            {
                var css = $("#mylink").get(0), skin = getQueryString("skin");
                $("#skinSelect").val(skin);
                $("#skinSelect").change(function ()
                { 
                    if (this.value)
                    {
                        location.href = "index.htm?skin=" + this.value;
                    } else
                    {
                        location.href = "index.htm";
                    }
                });

               
                if (!css || !skin) return;
                skin = skin.toLowerCase();
                $('body').addClass("body-" + skin); 
                $(css).attr("href", skin_links[skin]); 
            }
            function getQueryString(name)
            {
                var now_url = document.location.search.slice(1), q_array = now_url.split('&');
                for (var i = 0; i < q_array.length; i++)
                {
                    var v_array = q_array[i].split('=');
                    if (v_array[0] == name)
                    {
                        return v_array[1];
                    }
                }
                return false;
            }
            function attachLinkToFrame(iframeId, filename)
            { 
                if(!window.frames[iframeId]) return;
                var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
                var fileref = window.frames[iframeId].document.createElement("link");
                if (!fileref) return;
                fileref.setAttribute("rel", "stylesheet");
                fileref.setAttribute("type", "text/css");
                fileref.setAttribute("href", filename);
                head.appendChild(fileref);
            }
            function getLinkPrevHref(iframeId)
            {
                if (!window.frames[iframeId]) return;
                var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
                var links = $("link:first", head);
                for (var i = 0; links[i]; i++)
                {
                    var href = $(links[i]).attr("href");
                    if (href && href.toLowerCase().indexOf("ligerui") > 0)
                    {
                        return href.substring(0, href.toLowerCase().indexOf("lib") );
                    }
                }
            }


            //$(".l-tree #tree1 li .l-body").addClass("l-expandable-close");
//             setTimeout(function(){
//                 $(".l-tree-icon-folder").each(function(index){
//                     $(this).addClass("l-tree-icon-folder-"+index);
//                 });

//             },700);
     </script> 
<style type="text/css"> 
    
 </style>
</head>
<body style="padding:0;background:#EAEEF5;">

<div id="pageloading"></div>
<!--头部-->
<!-- 获取用户集合 -->
<%-- <%=session.getAttribute("yh") %> --%>
<div id="topmenu">
  <div class="index_head">
    <div class="index_head_left"></div>
    <div class="index_head_right">
      <p>
        <span><img src="images/user-white.png"  alt=""></span><span class="index_head_text">${sessionScope.yh.dwbm.dwmc}</span>
        <span class="index_head_text">—</span><span class="index_head_text">${sessionScope.yh.dlbm}</span>
        <a href="javascript:;" id="updatePassword" class="index_head_h"><span><img src="images/lock-white.png"  alt=""></span><span class="index_head_text">修改密码</span></a>
        <a href="#"  id="exit" class="index_head_h"><span><img src="images/exit-hover.png"  alt=""></span><span class="index_head_text">退出</span></a>
      </p>
    </div>
  </div>
</div>

<!--菜单-->
  <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; ">
      <div position="left"  title="主菜单" id="tree1" style="overflow-y: auto;width: 202px;height: 655px;">
          
      </div>




<!--默认页面-->
      <div position="center" id="framecenter">
<!--       showClose="true" 默认页面增加删除键 -->
            <div title="案件卷宗制作" tabid="案件卷宗制作"  >
                <iframe frameborder="0"  src='<s:url action="ajjbxxqueryList!input" namespace="/" />'></iframe>
            </div>
        </div>

  </div>


    <div  style="height:32px; line-height:32px; text-align:center;">
           Copyright &copy; 2015-2016四川雅达尔科技有限公司. All rights reserved.
    </div>
    <%-------------------------------  --%>
    <%----------------------修改密码---- --%>
<div id="update_div" style="display: none; margin: 0 auto;">
  <form id="update_form" method="post">
    <table style="line-height: 30px; width: 100%;">
      <tr>
        <td style="text-align: right;">
          旧密码:
        </td>
        <td >
          <input class="l-text" type="password"  id="jkl" name="kl"/>
        </td>
      </tr>
      <tr>
        <td style="text-align: right;">
          新密码:
        </td>
        <td >
          <input class="l-text" type="password" id="xkl" name="xkl" />
        </td>
      </tr>
      <tr>
        <td style="text-align: right;">
          确认密码:
        </td>
        <td>
          <input class="l-text" type="password" id="qkl" name="qkl"/>
        </td>
      </tr>
    </table>
  </form>
</div>
    <div style="display:none"></div>
</body>
<script type="text/javascript">

    //修改密码

  $("#updatePassword").click(function(){
    $.ligerDialog.open({ title: '修改密码', target: $('#update_div'), width: 320,
      buttons: [{ text: '确定', onclick: function (item, dialog) {
          var jkl=$("#jkl").val();
          var xkl=$("#xkl").val();
          var qkl=$("#qkl").val();
          if(xkl.trim()==qkl.trim()&&xkl.trim()!=""&&qkl.trim()!=""&&jkl.trim()!=""){
        	  $.ajax({
				   type: "POST",
				   url: "loginAction!updateMm",
				   data:"xkl="+xkl+"&&kl="+jkl,
	                error: function (data) {
					var msg="${sessionScope.errMsg}";
//				  var msg="${requestScope.errMsg}";
	                    $.ligerDialog.error(msg)
	                },
	                success: function (data) {
	                	console.log(data);
		                $("#update_form").attr("action","loginAction!updateMm");
		                $("#update_form").submit();
	                }
			   })
              }else{
            	  $.ligerDialog.warn('输入错误!请重新输入!');
                  }
      }, cls: 'l-dialog-btn-highlight'
      }, { text: '取消', onclick: function (item, dialog) {
        $("#update_form")[0].reset();
        dialog.hidden();
      }
      }], isResize: false
    });
  });


  $("#exit").click(function(){
    $.ligerDialog.confirm('您确定是否退出？', function ()
    {
    	 window.location.href="loginAction!loginOut";
    });
  })
</script>
</html>
