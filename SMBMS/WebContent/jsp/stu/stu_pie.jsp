<%--
  Created by IntelliJ IDEA.
  User: Zd
  Date: 2018/3/22
  Time: 上午10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "‐//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>个人三大消费类型分析(饼图)</title>
</head>
<!‐‐ 引入Echarts3包 ‐‐>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<body>
<!‐‐ 引入Jquery包 ‐‐>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

<h1>个人三大消费类型分析饼状图演示</h1>
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    // 异步加载数据
    var mapOnlyKey = [];
    var mapKeyValue = [];
    var mapOnlyValue = [];
    $.ajax({
        type: 'GET',
        url: '/pieshow',
        //url: '/pieshow',
        dataType: 'json',
        success: function (data) {
            mapOnlyKey.length = 0;
            mapKeyValue.length = 0;
            mapOnlyValue.length = 0;
            for (var i = 0; i < data.length; i++) {
                mapOnlyKey.push(data[i].acccode);
                mapKeyValue.push({"value": Math.round(data[i].opfare), "name": Math.round(data[i].acccode)});
                mapOnlyValue.push(data[i].opfare);
            }
            option = {
                title: {
                    text: '个人三大消费类型分析',//图片名称
                    subtext: '210 211 222',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: mapOnlyKey//不修改，从数据库调取
                },
                series: [
                    {
                        name: '个人三大消费类型分析',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: mapKeyValue,//不修改，从数据库调取
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            myChart.setOption(option);
        }
    });
</script>
<h1>个人canteen消费类型分析柱状图演示</h1>
<div id="main1" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var myChart1 = echarts.init(document.getElementById('main1'));
    var mapOnlyKey1 = [];
    var mapKeyValue1 = [];
    var mapOnlyValue1 = [];
    $.ajax({
        type: 'GET',
        url: '/barshow',
        dataType: 'json',
        success: function (data) {
            mapOnlyKey1.length = 0;
            mapKeyValue1.length = 0;
            mapOnlyValue1.length = 0;
            for (var i = 0; i < data.length; i++) {
                mapOnlyKey1.push(data[i].termname);
                mapKeyValue1.push({"value": Math.round(data[i].opfare), "name": Math.round(data[i].termname)});
                mapOnlyValue1.push(data[i].opfare);
            }
            option1 = {
                title: {
                    text: '个人canteen消费类型分析',//图片名称
                    subtext: '210',
                    x: 'center'
                },
                backgroundColor: '#FFE793',
                legend: {
                    data: mapOnlyKey1,
                    align: 'left',
                    left: 10
                },
                toolbox: {},
                tooltip: {},
                xAxis: {
                    data: mapOnlyKey1,
                    name: '刷卡机编码',
                    silent: false,
                    axisLine: {onZero: true},
                    splitLine: {show: false},
                    splitArea: {show: false}
                },
                yAxis: {
                    name: 'opfare',
                    inverse: false,
                    splitArea: {show: false}
                }, grid: {
                    left: 100
                },
                series: [{
                    name: 'bar',
                    type: 'bar',
                    stack: 'one',
                    data: mapKeyValue1
                }]
            }

            myChart1.setOption(option1);
        }
    });
</script>
</body>
</html>