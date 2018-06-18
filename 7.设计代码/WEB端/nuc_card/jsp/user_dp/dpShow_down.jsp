<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/jsp/common/head_dp.jsp"%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>消费区域---入伍学生消费页面</span>
    </div>
    <div class="providerAdd">
        <!‐‐ 引入Echarts3包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>

        <!‐‐ 引入Jquery包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
        <h1>canteen消费类型分析柱状图演示</h1>
        <div id="main1" style="width: 1200px;height:400px;"></div>
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
        </tr>
            <tr class="firstTr">
        <h1>shower消费类型分析柱状图演示</h1>
        <div id="main2" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart2 = echarts.init(document.getElementById('main2'));
            var mapOnlyKey2 = [];
            var mapKeyValue2 = [];
            var mapOnlyValue2 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/shower',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey2.length = 0;
                    mapKeyValue2.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey2.push(data[i].termname);
                        mapKeyValue2.push({"value": Math.round(data[i].opfare), "name": Math.round(data[i].termname)});
                        mapOnlyValue2.push(data[i].opfare);
                    }

                    option2 = {
                        title: {
                            text: 'shower消费类型分析',//图片名称
                            subtext: '211',
                            x: 'center'
                        },
                        legend: {
                            data: mapOnlyKey2,
                            align: 'left',
                            left: 10
                        },
                        calculable : true,
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        tooltip: {},
                        xAxis: {
                            data: mapOnlyKey2,
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
                            data: mapKeyValue2
                        }]
                    }

                    myChart2.setOption(option2);
                }
            });
        </script>
            </tr>
        <tr class="firstTr">

        <h1>library消费类型分析柱状图演示</h1>
        <div id="main3" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart3 = echarts.init(document.getElementById('main3'));
            var mapOnlyKey3 = [];
            var mapKeyValue3 = [];
            var mapOnlyValue3 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/library',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey3.length = 0;
                    mapKeyValue3.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey3.push(data[i].termname);
                        mapKeyValue3.push({"value": Math.round(data[i].opfare), "name": Math.round(data[i].termname)});
                        mapOnlyValue3.push(data[i].opfare);
                    }

                    option3 = {
                        title: {
                            text: 'library消费类型分析',//图片名称
                            subtext: '222',
                            x: 'center'
                        },
                        legend: {
                            data: mapOnlyKey3,
                            align: 'left',
                            left: 10
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        tooltip: {},
                        xAxis: {
                            data: mapOnlyKey3,
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
                            data: mapKeyValue3
                        }]
                    }

                    myChart3.setOption(option3);
                }
            });
        </script>
        </tr>
    </table>

</div>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>