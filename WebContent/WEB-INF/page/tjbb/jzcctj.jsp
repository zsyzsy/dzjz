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
    <script src="js/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="js/data/CustomersData.js" type="text/javascript"></script>
    <script src="js/data/AllProductData.js" type="text/javascript"></script>
    <script src="js/echarts-all.js" type="text/javascript"></script>
    <script src="js/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
  <script type="text/javascript">
    $(function (){
      //布局
      var myChart = null;
      var layout = $("#layout1").ligerLayout({ leftWidth: '49%', rightWidth: '49%',
        onEndResize: function () { $(window).resize(); } });
      $(".l-layout-header-toggle", layout.left).click(function () {

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
        $(".l-layout-left").width(layout.width - (25 + layout.options.space));
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

  </script>
</head>
<body>
<div class="l-loading" style="display:block" id="pageloading"></div>
<!--布局-->
<div class="l-clear"></div>
<!---->
<div id="layout1" style="margin:0 10px">
  <div position="left" title="统计图形">
        <div id="main" style="height:600px;width:650px"></div>
  </div>
  <div position="right" title="统计列表">
    <div id="maingrid" style="margin:0; padding:0">
    
      <div id="maingrid2"></div>
    </div>
    
  </div>

</div>

<div style="display:none;">

</div>

<div style="display:none;">

</div>
</body>
<script>
  //            表格
  var grid = null;
  var dwbm='${sessionScope.yh.dwbm.dwbm}' ;
  var gh='${sessionScope.yh.gh}' ;
  console.log("--------------------");
  console.log(dwbm);
  console.log(gh);
  $(function (){
	  
    grid = $("#maingrid").ligerGrid({
      height: '99%',
      width: '99%',
      columns: [
        { display: '单位编码', name: 'dwbm', minWidth: 50 },
        { display: '单位名称', name: 'dwmc', minWidth: 50 },
        { display: '已用存储', name: 'wjdx', minWidth: 50 ,render: function (suminf){
        	if (suminf.wjdx > (1024 * 1024 * 1024)) {
                return (suminf.wjdx / 1024 / 1024 / 1024).toFixed(2) + " T";
            }
            else if (suminf.wjdx > (1024 * 1024)) {
                return (suminf.wjdx / 1024 / 1024).toFixed(2) + " GB";
            } else if (suminf.wjdx > 1024) {
                return (suminf.wjdx / 1024).toFixed(2) + " MB";
            }
            else return suminf.wjdx.toFixed(2) + " KB";
        	}
        }
      ], pageSize:10,rownumbers: true,
     url:'jzcctjAction!dwjznumber',onSuccess:function(data){
			console.log(data);
         }
    });
    $("#pageloading").hide();

  })
</script>
<script type="text/javascript">
jQuery.post("jzcctjAction!jmapznumber?dwbm="+dwbm+"&&gh="+gh,function(data){
			//使用空间
			var wjdx=data.rows[0].wjdx;
			
			//未使用空间
			var sykj=1024*1024*1024-wjdx;
			if (wjdx > (1024 * 1024 * 1024)) {
				wjdx=(wjdx / 1024 / 1024 / 1024).toFixed(2) ;
				sykj=(sykj/ 1024 / 1024 / 1024).toFixed(2)
			}else if (wjdx > (1024 * 1024 )){
				wjdx=(wjdx / 1024 / 1024).toFixed(2) ;
				sykj=(sykj/ 1024 / 1024 ).toFixed(2)
			}else if (wjdx > (1024  )){
				wjdx=(wjdx / 1024).toFixed(2);
				sykj=(sykj/ 1024 ).toFixed(2)
			    }
		    console.log(wjdx);
		    console.log(sykj);
                // 基于准备好的dom，初始化echarts图表
                var myChart = echarts.init(document.getElementById('main'));
                var data=[
                          {value:wjdx, name:'已用'},
                          {value:sykj, name:'剩余'}
                      ];
//                 var Used=[];
//              for(var i=0;i<data.length;i++){
//             	 Used[i]=data[i].value;
              
//          }
//                 var newdata=[];
//                 var newdata1=[];
//                 for(var i=0;i<data.length;i++){
//                     newdata[i]={value:data[i].value,name:data[i].name+Used[i]+"G"};
//                     newdata1[i]={name:data[i].name+Used[i]+"G"};
//                 }
                var Used=[];
                for(var i=0;i<data.length;i++){
               	 Used[i]=data[i].name;
                 
            }
                var option = {

                    title : {
                        text: '卷宗空间大小',
                        subtext: '存储大小1024.00GB',
                        x:'center' ,  
                        label:{
                            normal:{
                                textStyle:{
                                    fontSize:300
                                }
                            }
                        }
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient : 'vertical',
                        x : 'left',
                        data:Used

                    },
                 
                    calculable : true,
                    series : [
                        {
                            type:'pie',
                            radius : '55%',
                            legendHoverLink: true,
                            center: ['50%', '60%'],
                            data:data,
                            itemStyle:{
                                normal: {
                                    label: {
                                        show: true,
                                        formatter: '{b} : {c} G'
                                    },
                                    labelLine: {show: true}
                                }
                            }
                        }
                    ]
                };
                // 为echarts对象加载数据
    myChart.setOption(option);
})
</script>
</html>