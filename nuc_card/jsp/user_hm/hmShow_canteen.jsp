
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${userSession.userRole==2}">
    <%@include file="/jsp/common/head_Canteen.jsp"%>
</c:if>
<c:if test="${userSession.userRole==3}">
    <%@include file="/jsp/common/head_Shower.jsp"%>
</c:if>
<c:if test="${userSession.userRole==4}">
    <%@include file="/jsp/common/head_Water.jsp"%>
</c:if>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>消费区域---入伍学生消费页面</span>
    </div>
    <div class="providerAdd">
        <!‐‐ 引入Echarts3包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
        <body>
        <!‐‐ 引入Jquery包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
        <h1>canteen消费类型分析柱状图演示</h1>

        <div id="main1" style="width: 1000px;height:400px;"></div>
        <script type="text/javascript">
            var myChart1 = echarts.init(document.getElementById('main1'));
            var mapOnlyKey1 = [];
            var mapKeyValue1 = [];
            var mapOnlyValue1 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/canteen',
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
                            text: 'canteen消费类型分析',//图片名称
                            subtext: '210',
                            x: 'center'
                        },
                        legend: {
                            data: mapOnlyKey1,
                            align: 'left',
                            left: 10
                        },
                        toolbox: {show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }},
                        calculable : true,
                        tooltip: {},
                        xAxis: {
                            name: 'opfare',
                            silent: false,
                            axisLine: {onZero: true},
                            splitLine: {show: false},
                            splitArea: {show: false}
                        },
                        yAxis: {
                            data: mapOnlyKey1,
                            name: '刷卡机编码',
                            inverse: false,
                            splitArea: {show: false}
                        }, grid: {
                            left: 100
                        },
                        series: [{
                            name: 'canteen',
                            type: 'bar',
                            stack: 'one',
                            data: mapKeyValue1
                        }]
                    }

                    myChart1.setOption(option1);
                }
            });
        </script>
        <h1>canteen消费时间分析散点图演示</h1>
        <div id="main2" style="width: 1000px;height:400px;"></div>
        <script type="text/javascript">
            var myChart2 = echarts.init(document.getElementById('main2'));
            var mapOnlyKey2 = [];
            var mapKeyValue2 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/canteenhour',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey2.length = 0;
                    mapKeyValue2.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey2.push(data[i].dt);
                        var mapOnlyValue2 = [data[i].dt,data[i].count];
                        mapKeyValue2.push(mapOnlyValue2);

                    }
                    option2 = {
                        title: {
                            text: 'canteen消费时间分析',//图片名称
                            subtext: '210',
                            x: 'center'
                        },
                        legend: {
                            data: ['point'],
                            align: 'left',
                            left: 10
                        },
                        calculable : true,
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataZoom : {show: true},
                                dataView : {show: true, readOnly: false},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        tooltip: {
                            trigger: 'axis',
                            showDelay : 0,
                            formatter : function (params) {
                                var res = params[0].seriesName + ' ' + params[0].name;
                                res += '<br/>  point : ' + params[0].value[0];
                                res += '<br/>  num : ' + params[0].value[1];
                                return res;
                            },
                            axisPointer:{
                                show: true,
                                type : 'cross',
                                lineStyle: {
                                    type : 'dashed',
                                    width : 1
                                }
                            }},
                        xAxis: {
                            data: mapOnlyKey2,
                            name: 'point',
                            scala:true
                        },
                        yAxis: {
                            name: 'num',
                            scala:true
                        },
                        series: [{
                            name: 'num',
                            type: 'scatter',
                            data: mapKeyValue2,
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值'},
                                    {type : 'min', name: '最小值'}
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name: '平均值'}
                                ]
                            }
                        }]
                    }
                    myChart2.setOption(option2);
                }
            });
        </script>

    <h1>用餐费用峰值分析折线图演示</h1>
    <div id="main4" style="width: 1000px;height:400px;"></div>
    <script type="text/javascript">
        var myChart4= echarts.init(document.getElementById('main4'));
        var mapOnlyKey4 = [];
        var mapKeyValue4 = [];
        var mapOnlyValue4 = [];
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/opfarednnum',
            dataType: 'json',
            success: function (data) {
                mapOnlyKey4.length = 0;
                mapKeyValue4.length = 0;
                mapOnlyValue4.length = 0;
                for (var i = 0; i < data.length; i++) {
                    mapOnlyKey4.push(data[i].opfare);
                    mapKeyValue4.push({"value": Math.round(data[i].count), "name": data[i].opfare});
                    mapOnlyValue4.push(data[i].count);
                }
                option4 = {
                    title: {
                        text: '用餐费用峰值',//图片名称
                        subtext: '210',
                        x: 'center'
                    },
                    legend: {
                        data: ['num'],
                        align: 'center',
                        left: 10
                    },
                    toolbox: {show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }},
                    calculable : true,
                    tooltip: {},
                    xAxis: {
                        name: 'opfare',
                        silent: false,
                        axisLine: {onZero: true},
                        splitLine: {show: true},
                        splitArea: {show: true},
                        data:mapOnlyKey4,
                        max:50,
                    },
                    yAxis: {
                        type:'value',
                        name: 'num',
                        inverse: false,
                        splitArea: {show: true}
                    },
                    series: [{
                        name: 'num',
                        type: 'line',
                        data: mapKeyValue4,
                        markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        },
                        markLine : {
                            data : [
                                {type : 'average', name: '平均值'}
                            ]
                        }
                    }]
                }

                myChart4.setOption(option4);
            }
        });
    </script>



</div>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>