<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/jsp/common/head_dp.jsp"%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>对学院一卡通分析展示---正常学生</span>
    </div>
    <div class="providerAdd">
    <!‐‐ 引入Echarts3包 ‐‐>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>

    <!‐‐ 引入Jquery包 ‐‐>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <h1>14级每个学院人数分析标准条形图演示</h1>
            <div id="main3" style="width: 1200px;height:400px;"></div>
            <script type="text/javascript">
                var myChart3 = echarts.init(document.getElementById('main3'));
                var mapOnlyKey3 = [];
                var mapKeyValue3 = [];
                var mapOnlyValue3 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/normal_stuNum',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey3.length = 0;
                        mapKeyValue3.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey3.push(data[i].dpname1);
                            mapKeyValue3.push({"value": data[i].count, "name": data[i].dpname1});
                            mapOnlyValue3.push(data[i].count);
                        }

                        option3 = {
                            title: {
                                text: '学院学生人数分析',//图片名称
                                subtext: 'num',
                                x: 'center'
                            },
                            legend: {
                                data: ['每个学院人数'],
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
                            tooltip: {
                                trigger: 'axis'
                            },
                            xAxis: {
                                type : 'category',
                                data : mapOnlyKey3

                            },
                            yAxis: {
                                type : 'value',
                                boundaryGap : [0, 0.01]
                            },
                            series: [{
                                name: 'num',
                                type: 'bar',
                                data: mapKeyValue3
                            }]
                        }

                        myChart3.setOption(option3);
                    }
                });
            </script>
        </tr>
        <tr class="firstTr">
            <h1>学院每一消费类型分析堆积面积图演示</h1>
            <div id="main2" style="width: 1200px;height:400px;"></div>
            <script type="text/javascript">
                var myChart2 = echarts.init(document.getElementById('main2'));
                var mapOnlyDp2 = [];
                var mapOnlyKey210 = [];
                var mapKeyValue210 = [];
                var mapOnlyValue210 = [];
                var mapOnlyKey211 = [];
                var mapKeyValue211 = [];
                var mapOnlyValue211 = [];
                var mapOnlyKey222 = [];
                var mapKeyValue222 = [];
                var mapOnlyValue222 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/normal_part',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyDp2.length=0
                        mapOnlyKey210.length = 0;
                        mapKeyValue210.length = 0;
                        mapOnlyValue210.length=0;
                        mapOnlyKey211.length = 0;
                        mapKeyValue211.length = 0;
                        mapOnlyValue211.length=0;
                        mapOnlyKey222.length = 0;
                        mapKeyValue222.length = 0;
                        mapOnlyValue222.length=0;
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].acccode==210){
                                mapOnlyDp2.push(data[i].dpname1);
                                mapOnlyKey210.push(data[i].acccode);
                                mapKeyValue210.push({"value": Math.round(data[i].opfare), "name": data[i].acccode});
                                mapOnlyValue210.push(data[i].opfare);
                            }
                            else if (data[i].acccode==211){
                                mapOnlyKey211.push(data[i].acccode);
                                mapKeyValue211.push({"value": Math.round(data[i].opfare), "name": data[i].acccode});
                                mapOnlyValue211.push(data[i].opfare);
                            }else if (data[i].acccode==222) {
                                mapOnlyKey222.push(data[i].acccode);
                                mapKeyValue222.push({"value": Math.round(data[i].opfare), "name": data[i].acccode});
                                mapOnlyValue222.push(data[i].opfare);
                            }
                        }
                        option2 = {
                            title: {
                            },
                            tooltip : {
                                trigger: 'axis',
                                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            legend: {
                                data: ['210 餐饮消费','211 淋浴消费','222 购热水消费'],
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataView : {show: true, readOnly: false},
                                    magicType: {show: true, type: ['line', 'bar','tiled']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            calculable : true,
                            xAxis: {
                                type: 'value',
                                name: 'opfare',

                            },
                            yAxis: {
                                type : 'category',
                                data: mapOnlyDp2,
                                name: '学院名称',

                            },
                            series: [
                                {
                                    name:'210',
                                    type: 'bar',
                                    stack: '总消费',
                                    itemStyle : { normal: {label : {show: false, position: 'insideRight'}}},
                                    data: mapKeyValue210
                                },{
                                    name:'211',
                                    type: 'bar',
                                    stack: '总消费',
                                    itemStyle : { normal: {label : {show: false, position: 'insideRight'}}},
                                    data: mapKeyValue211
                                },
                                {
                                    name:'222',
                                    type: 'bar',
                                    stack: '总消费',
                                    itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
                                    data: mapKeyValue222
                                }
                            ]
                        }

                        myChart2.setOption(option2);
                    }
                });
            </script>
        </tr>
        <tr class="firstTr">
            <h1>14级软件学院专业人数分析漏斗图演示</h1>
            <div id="main1" style="width: 1300px;height:400px;"></div>
            <script type="text/javascript">
                var myChart1 = echarts.init(document.getElementById('main1'));
                var mapOnlyKey1 = [];
                var mapKeyValue1 = [];
                var mapOnlyValue1 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/normal_mjNum',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey1.length = 0;
                        mapKeyValue1.length = 0;
                        mapOnlyValue1.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey1.push(data[i].dpname2);
                            mapKeyValue1.push({"value": data[i].count, "name": data[i].dpname2});
                            mapOnlyValue1.push(data[i].count);
                        }
                        option1 = {
                            title: {
                                text: '',//图片名称
                                x: 'center'
                            },

                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c}"
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataView : {show: true, readOnly: false},
                                    saveAsImage : {show: true}
                                }},
                            legend: {
                                data: mapOnlyKey1,
                                align: 'left',
                                left: 1
                            },
                            calculable : true,
                            series: [{
                                name: 'major_num',
                                type: 'funnel',
                                x:'1%',
                                y: 100,
                                //x2: 80,
                                y2: 100,
                                width: '80%',
                                // height: {totalHeight} - y - y2,
                                min: 0,
                                max: 100,
                                minSize: '0%',
                                maxSize: '100%',
                                sort : 'descending', // 'ascending', 'descending'
                                gap : 5,
                                itemStyle: {
                                    borderColor: '#fff',
                                    borderWidth: 1,
                                    label: {
                                        show: true,
                                        position: 'inside'
                                        // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                                    },
                                    labelLine: {
                                        show: false,
                                        length: 10,
                                        lineStyle: {
                                            // color: 各异,
                                            width: 1,
                                            type: 'solid'
                                        }
                                    }
                                  },
                                emphasis: {
                                    // color: 各异,
                                    borderColor: 'red',
                                    borderWidth: 5,
                                    label: {
                                        show: true,
                                        formatter: '{b}:{c}',
                                        textStyle:{
                                            fontSize:20
                                        }
                                    },
                                    labelLine: {
                                        show: true
                                    }
                                },
                                data: mapKeyValue1
                            }]
                        }
                        myChart1.setOption(option1);
                    }
                });
            </script>
        </tr>
        <tr class="firstTr">
            <h1>14级软件学院每个班级人均消费分析标准柱状图演示</h1>
            <div id="main5" style="width: 1200px;height:400px;"></div>
            <script type="text/javascript">
                var myChart5 = echarts.init(document.getElementById('main5'));
                var mapOnlyKey3 = [];
                var mapKeyValue3 = [];
                var mapOnlyValue3 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/normal_ave',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey3.length = 0;
                        mapKeyValue3.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey3.push(data[i].dpname4);
                            mapKeyValue3.push({"value": data[i].ave, "name": data[i].dpname4});
                            mapOnlyValue3.push(data[i].ave);
                        }

                        option5 = {
                            title: {
                                text: '学院每个班级人均消费分析',//图片名称
                                subtext: 'num',
                                x: 'center'
                            },
                            legend: {
                                data: ['每个班级人均消费'],
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
                            tooltip: {
                                trigger: 'axis'
                            },
                            xAxis: {
                                type : 'category',
                                data : mapOnlyKey3

                            },
                            yAxis: {
                                type : 'value',
                                boundaryGap : [0, 0.01]
                            },
                            series: [{
                                name: 'num',
                                type: 'bar',
                                data: mapKeyValue3
                            }]
                        }

                        myChart5.setOption(option5);
                    }
                });
            </script>
        </tr>
        <tr class="firstTr">
            <h1>专业一个班每人消费类型分析堆积面积图演示</h1>
            <div id="main4" style="width: 1200px;height:960px;"></div>
            <script type="text/javascript">
                var myChart4 = echarts.init(document.getElementById('main4'));
                var mapOnlyDp2 = [];
                var mapOnlyKey210 = [];
                var mapKeyValue210 = [];
                var mapOnlyValue210 = [];
                var mapOnlyKey211 = [];
                var mapKeyValue211 = [];
                var mapOnlyValue211 = [];
                var mapOnlyKey222 = [];
                var mapKeyValue222 = [];
                var mapOnlyValue222 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/normal_per',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyDp2.length=0
                        mapOnlyKey210.length = 0;
                        mapKeyValue210.length = 0;
                        mapOnlyValue210.length=0;
                        mapOnlyKey211.length = 0;
                        mapKeyValue211.length = 0;
                        mapOnlyValue211.length=0;
                        mapOnlyKey222.length = 0;
                        mapKeyValue222.length = 0;
                        mapOnlyValue222.length=0;
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].acccode==210){
                                mapOnlyDp2.push(data[i].outid);
                                mapOnlyKey210.push(data[i].acccode);
                                mapKeyValue210.push({"value": Math.round(data[i].opfare), "name": data[i].outid});
                                mapOnlyValue210.push(data[i].opfare);
                            }
                            else if (data[i].acccode==211){
                                mapOnlyKey211.push(data[i].outid);
                                mapKeyValue211.push({"value": Math.round(data[i].opfare), "name": data[i].outid});
                                mapOnlyValue211.push(data[i].opfare);
                            }else if (data[i].acccode==222) {
                                mapOnlyKey222.push(data[i].outid);
                                mapKeyValue222.push({"value": Math.round(data[i].opfare), "name": data[i].outid});
                                mapOnlyValue222.push(data[i].opfare);
                            }
                        }
                        option4 = {
                            title: {
                            },
                            tooltip : {
                                trigger: 'axis',
                                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            legend: {
                                data: ['210餐饮消费','211淋浴消费','222购热水消费'],
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataView : {show: true, readOnly: false},
                                    magicType: {show: true, type: ['line', 'bar','tiled']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            calculable : true,
                            xAxis: {
                                type: 'value',
                                name: 'opfare',

                            },
                            yAxis: {
                                type : 'category',
                                data: mapOnlyDp2,
                                name: '学号',

                            },
                            series: [
                                {
                                    name:'211',
                                    type: 'bar',
                                    stack: '总消费',
                                    itemStyle : { normal: {label : {show: false, position: 'insideRight'}}},
                                    data: mapKeyValue211
                                },
                                {
                                    name:'210',
                                    type: 'bar',
                                    stack: '总消费',
                                    itemStyle : { normal: {label : {show: false, position: 'insideRight'}}},
                                    data: mapKeyValue210
                                },
                                {
                                    name:'222',
                                    type: 'bar',
                                    stack: '总消费',
                                    itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
                                    data: mapKeyValue222
                                }
                            ]
                        }

                        myChart4.setOption(option4);
                    }
                });
            </script>
        </tr>

    </table>

</div>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>