<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
  <title>班级男女比例（饼图）</title>
  
  <!-- 引入Jquery包 -->
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.4.min.js"></script></head>
  <!-- 引入Echarts3包 -->
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
  <body>
  	<h1>饼状图演示</h1>
    <br/>
	<div id="main" style="width: 600px;height:400px;"></div>
  </body>
</html>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        myChart.setOption({
		    title : {
		        text: '班级男女比例',//图片名称
		        
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: '{a} <br/>{b} : {c} ({d}%)'
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: []//不修改，从数据库调取
		    },
		    series : [
		        {
		            name: '班级男女比例',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[],//不修改，从数据库调取
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		});
		
		// 异步加载数据
		var mapOnlyKey = [];
	    var mapKeyValue = [];
	    var mapOnlyValue = [];
		var info = {"opt": "pie"};
		$.post("${pageContext.request.contextPath }/pieshow", info, function(data){
		    mapOnlyKey.length=0;
			mapKeyValue.length=0;
			mapOnlyValue.length=0;
			for(var i=0; i < data.length; i++){
				mapOnlyKey.push( data[i].gender);
				mapKeyValue.push({"value":Math.round(data[i].num), "name": data[i].gender });
				mapOnlyValue.push( data[i].num );
			}
		    console.log(mapOnlyKey);
		    console.log(mapKeyValue);
		    console.log(mapOnlyValue);
		    
		    // 填入数据
		    myChart.setOption({
		        legend: {
		            //类别
		            data: mapOnlyKey
		        },
		        series: [{
		            // 根据名字对应到相应的系列
		            name: '数量',
		            data: mapKeyValue
		        }]
		    });
        // 使用刚指定的配置项和数据显示图表。
		}, 'json');
		
    </script>