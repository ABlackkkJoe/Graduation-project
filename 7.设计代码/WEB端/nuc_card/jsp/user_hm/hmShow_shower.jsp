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

        <!‐‐ 引入Jquery包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

            <h1>shower消费类型分析柱状图演示</h1>
            <div id="main1" style="width: 1000px;height:400px;"></div>
            <script type="text/javascript">
                var myChart1 = echarts.init(document.getElementById('main1'));
                var mapOnlyKey1 = [];
                var mapKeyValue1 = [];
                var mapOnlyValue1 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/shower',
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
                                text: 'shower消费类型分析',//图片名称
                                subtext: '211',
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
                                name: 'shower',
                                type: 'bar',
                                stack: 'one',
                                data: mapKeyValue1
                            }]
                        }

                        myChart1.setOption(option1);
                    }
                });
            </script>
            <h1>shower消费时间分析散点图演示</h1>
            <div id="main2" style="width: 1000px;height:400px;"></div>
            <script type="text/javascript">
                var myChart2 = echarts.init(document.getElementById('main2'));
                var mapOnlyKey2 = [];
                var mapKeyValue2 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/showerhour',
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
                                text: 'shower消费时间分析',//图片名称
                                subtext: '211',
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
            <h2>每周日峰值分析折线图演示</h2>
            <div id="main6" style="width:450px;height:300px;"></div>
            <script type="text/javascript">
                var myChart6 = echarts.init(document.getElementById('main6'));
                var mapOnlyKey6 = [];
                var mapKeyValue6 = [];
                var mapOnlyValue6 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/srweeknum',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey6.length = 0;
                        mapKeyValue6.length = 0;
                        mapOnlyValue6.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey6.push(data[i].dt);
                            mapKeyValue6.push({"value": Math.round(data[i].count), "name": data[i].dt});
                            mapOnlyValue6.push(data[i].count);
                        }
                        option6 = {
                            title: {
                                text: '每周日峰值',//图片名称
                                subtext: '211',
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
                                name: 'day',
                                silent: false,
                                axisLine: {onZero: true},
                                splitLine: {show: false},
                                splitArea: {show: false},
                                data:mapOnlyKey6,
                            },
                            yAxis: {
                                type:'value',
                                name: 'num',
                                inverse: false,
                                splitArea: {show: false}
                            },
                            series: [{
                                name: 'num',
                                type: 'line',
                                data: mapKeyValue6,
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

                        myChart6.setOption(option6);
                    }
                });
            </script>
            <h2>shower人数9-12月日峰值分析折线图演示</h2>
            <div id="main5" style="width:400px;height:300px;"></div>
            <script type="text/javascript">
                var myChart5 = echarts.init(document.getElementById('main5'));
                var mapOnlyKey5 = [];
                var mapKeyValue5 = [];
                var mapOnlyValue5 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/srdaynum',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey5.length = 0;
                        mapKeyValue5.length = 0;
                        mapOnlyValue5.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey5.push(data[i].dt);
                            mapKeyValue5.push({"value": Math.round(data[i].count), "name": data[i].dt});
                            mapOnlyValue5.push(data[i].count);
                        }
                        option5 = {
                            title: {
                                text: 'shower人数日峰值',//图片名称
                                subtext: '211',
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
                                name: 'point',
                                silent: false,
                                axisLine: {onZero: true},
                                splitLine: {show: false},
                                splitArea: {show: false},
                                data:mapOnlyKey5,
                                splitNumber:8
                            },
                            yAxis: {
                                type:'value',
                                name: 'num',
                                inverse: false,
                                splitArea: {show: false}
                            },
                            series: [{
                                name: 'num',
                                type: 'line',
                                data: mapKeyValue5,
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

                        myChart5.setOption(option5);
                    }
                });
            </script>
            <h2>shower9月每人消费金额分析散点图演示</h2>
            <div id="main7" style="width: 400px;height:300px;"></div>
            <script type="text/javascript">
                var myChart7 = echarts.init(document.getElementById('main7'));
                var mapOnlyKey7 = [];
                var mapKeyValue7 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/srmonop9',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey7.length = 0;
                        mapKeyValue7.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey7.push(data[i].outid);
                            var mapOnlyValue7 = [data[i].outid,data[i].opfare];
                            mapKeyValue7.push(mapOnlyValue7);
                        }
                        option7 = {
                            title: {
                                text: 'shower9月每人消费时间分析',//图片名称
                                subtext: '211',
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
                                data: mapOnlyKey7,
                                name: 'outid',
                                scala:true
                            },
                            yAxis: {
                                name: 'opfare',
                                scala:true
                            },
                            series: [{
                                name: 'num',
                                type: 'scatter',
                                data: mapKeyValue7,
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
                        myChart7.setOption(option7);
                    }
                });
            </script>

            <h2>shower10月每人消费金额分析散点图演示</h2>
            <div id="main8" style="width: 400px;height:300px;"></div>
            <script type="text/javascript">
                var myChart8 = echarts.init(document.getElementById('main8'));
                var mapOnlyKey8 = [];
                var mapKeyValue8 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/srmonop10',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey8.length = 0;
                        mapKeyValue8.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey8.push(data[i].outid);
                            var mapOnlyValue8 = [data[i].outid,data[i].opfare];
                            mapKeyValue8.push(mapOnlyValue8);
                        }
                        option8= {
                            title: {
                                text: 'shower10月每人消费时间分析',//图片名称
                                subtext: '211',
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
                                data: mapOnlyKey8,
                                name: 'outid',
                                scala:true
                            },
                            yAxis: {
                                name: 'opfare',
                                scala:true
                            },
                            series: [{
                                name: 'num',
                                type: 'scatter',
                                data: mapKeyValue8,
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
                        myChart8.setOption(option8);
                    }
                });
            </script>
            <h2>shower11月每人消费金额分析散点图演示</h2>
            <div id="main4" style="width: 400px;height:300px;"></div>
            <script type="text/javascript">
                var myChart4 = echarts.init(document.getElementById('main4'));
                var mapOnlyKey4 = [];
                var mapKeyValue4 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/srmonop11',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey4.length = 0;
                        mapKeyValue4.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey4.push(data[i].outid);
                            var mapOnlyValue4 = [data[i].outid,data[i].opfare];
                            mapKeyValue4.push(mapOnlyValue4);
                        }
                        option4 = {
                            title: {
                                text: 'shower11月每人消费时间分析',//图片名称
                                subtext: '211',
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
                                data: mapOnlyKey4,
                                name: 'outid',
                                scala:true
                            },
                            yAxis: {
                                name: 'opfare',
                                scala:true
                            },
                            series: [{
                                name: 'num',
                                type: 'scatter',
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
            <h2>shower12月每人消费金额分析散点图演示</h2>
            <div id="main3" style="width: 400px;height:300px;"></div>
            <script type="text/javascript">
                var myChart3 = echarts.init(document.getElementById('main3'));
                var mapOnlyKey3 = [];
                var mapKeyValue3= [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/srmonop12',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey3.length = 0;
                        mapKeyValue3.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey3.push(data[i].outid);
                            var mapOnlyValue3 = [data[i].outid,data[i].opfare];
                            mapKeyValue3.push(mapOnlyValue3);
                        }
                        option3 = {
                            title: {
                                text: 'shower12月每人消费时间分析',//图片名称
                                subtext: '211',
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
                                data: mapOnlyKey3,
                                name: 'outid',
                                scala:true
                            },
                            yAxis: {
                                name: 'opfare',
                                scala:true
                            },
                            series: [{
                                name: 'num',
                                type: 'scatter',
                                data: mapKeyValue3,
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
                        myChart3.setOption(option3);
                    }
                });
            </script>
            <h2>男女淋浴消费金额分析折线图演示</h2>
            <div id="main9" style="width:1000px;height:300px;"></div>
            <script type="text/javascript">
                var myChart9 = echarts.init(document.getElementById('main9'));
                var mapOnlyKey9 = [];
                var mapOnlyValue9=[];
                var mapKeyValue9= [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/srtwo',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey9.length = 0;
                        mapKeyValue9.length = 0;
                        mapOnlyValue9.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey9.push(data[i].termname);
                            mapKeyValue9.push({"value": Math.round(data[i].opfare), "name": data[i].termname});
                            mapOnlyValue9.push(data[i].opfare);
                        }
                        option9 = {
                            title: {
                                text: '男女淋浴消费金额分析',//图片名称
                                subtext: '211',
                                x: 'center'
                            },
                            legend: {
                                data: ['opfare'],
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
                                name: 'id',
                                silent: false,
                                axisLine: {onZero: true},
                                splitLine: {show: false},
                                splitArea: {show: false},
                                data:mapOnlyKey9,
                            },
                            yAxis: {
                                type:'value',
                                name: 'opfare',
                                inverse: false,
                                splitArea: {show: false}
                            },
                            series: [{
                                name: 'opfare',
                                type: 'line',
                                data: mapKeyValue9,
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

                        myChart9.setOption(option9);
                    }
                });
            </script>
    <h2>shower pos机刷卡次数和金额分析折线图演示</h2>
    <div id="main10" style="width:600px;height:300px;"></div>
    <script type="text/javascript">
        var myChart10 = echarts.init(document.getElementById('main10'));
        var mapOnlyKey10 = [];
        var mapKeyValue10 = [];
        var mapOnlyValue10 = [];
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/srposnum',
            dataType: 'json',
            success: function (data) {
                mapOnlyKey10.length = 0;
                mapKeyValue10.length = 0;
                mapOnlyValue10.length = 0;
                for (var i = 0; i < data.length; i++) {
                    mapOnlyKey10.push(data[i].termname);
                    mapKeyValue10.push({"name":data[i].termname,"value":data[i].count});
                    mapOnlyValue10.push({"name":data[i].termname,"value":data[i].opfare});
                }
                option10 = {
                    title: {
                        text: 'shower pos num_opfare',//图片名称
                        subtext: '211',
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
                    tooltip: {
                        trigger: 'axis'
                    },
                    xAxis: {
                        name: 'termname',
                        data:  mapOnlyKey10
                    },
                    yAxis: {
                        type:'value'
                    },
                    series: [{
                        name: 'count',
                        type: 'line',
                        data: mapKeyValue10,
                    },
                        {
                            name: 'opfare',
                            type: 'line',
                            data: mapOnlyValue10,
                        }
                    ]
                }

                myChart10.setOption(option10);
            }
        });
    </script>
    </div>
<%@include file="/jsp/common/foot.jsp" %>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>