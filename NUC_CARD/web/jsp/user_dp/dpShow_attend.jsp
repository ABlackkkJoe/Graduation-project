<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <%@include file="/jsp/common/head_dp.jsp"%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>学院入伍学生消费可视化页面</span>
    </div>
    <div class="providerAdd">
        <!‐‐ 引入Echarts3包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>

        <!‐‐ 引入Jquery包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <h1>12级学生入伍总人数分析漏斗图演示</h1>
            <div id="main4" style="width: 200px;height:400px;"></div>
            <script type="text/javascript">
                var myChart4 = echarts.init(document.getElementById('main4'));
                var mapOnlyKey4 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/Num',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey4.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey4.push(data[i].count);
                        }
                        option4 = {
                            title: {
                                text: '12级应征入伍学生总人数',//图片名称
                                x: 'center'
                            },
                            tooltip: {
                                trigger: 'axis'
                            },

                            toolbox: {show : true,
                                feature : {
                                    mark : {show: true},
                                    dataView : {show: true, readOnly: false},
                                    saveAsImage : {show: true}
                                }},
                            legend: {
                                data: ['总人数'],
                            },
                            calculable : true,
                            xAxis : [
                                {
                                    data : ['总人数']
                                }
                            ],
                            yAxis : [
                                {
                                    type : 'value'
                                }
                            ],
                            series: [{
                                name: 'num',
                                type: 'bar',
                                data: mapOnlyKey4
                            }]
                        }

                        myChart4.setOption(option4);
                    }
                });
            </script>
        </tr>
        <tr class="firstTr">
            <h1>各个学院应征入伍人数分析漏斗图演示</h1>
            <div id="main1" style="width: 1200px;height:400px;"></div>
            <script type="text/javascript">
                var myChart1 = echarts.init(document.getElementById('main1'));
                var mapOnlyKey1 = [];
                var mapKeyValue1 = [];
                var mapOnlyValue1 = [];
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/stuNum',
                    dataType: 'json',
                    success: function (data) {
                        mapOnlyKey1.length = 0;
                        mapKeyValue1.length = 0;
                        mapOnlyValue1.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            mapOnlyKey1.push(data[i].dpname1);
                            mapKeyValue1.push({"value": data[i].count, "name": data[i].dpname1});
                            mapOnlyValue1.push(data[i].count);
                        }
                        option1 = {
                            title: {
                                text: '',//图片名称
                                x: 'center'
                            },
                            tooltip: {trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} 人"
                            },

                            toolbox: {show : true,
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
                                name: '',
                                type: 'funnel',
                                x:'20%',
                                sort : 'ascending',
                                itemStyle: {
                                    normal: {
                                        // color: 各异,
                                        label: {
                                            position: 'left'
                                        }
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
            <h1>各个学院应征入伍学生每一消费类型分析堆积面积图演示</h1>
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
                    url: '${pageContext.request.contextPath}/part',
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
                                trigger: 'axis'
                            },
                            legend: {
                                data: ['210 餐饮消费','211 淋浴消费','222 购热水消费'],
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataView : {show: true, readOnly: false},
                                    magicType: {show: true, type: [ 'bar','tiled']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            calculable : true,
                            xAxis: {
                                type : 'category',
                                boundaryGap : false,
                                data: mapOnlyDp2,
                                name: '学院名称',
                            },
                            yAxis: {
                                name: '消费金额',
                                type: 'value'
                            },
                            series: [
                                {
                                    name:'餐饮支出',
                                    type: 'line',
                                    stack: '总消费',
                                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                                    markPoint : {
                                        data : [
                                            {type : 'max', name: '餐饮支出最大值'},
                                            {type : 'min', name: '餐饮支出最小值'}
                                        ]
                                    },
                                    markLine : {
                                        data : [
                                            {type : 'average', name: '餐饮消费平均值'}
                                        ]
                                    },
                                    data: mapKeyValue210
                                },
                                {
                                    name:'淋浴支出',
                                    type: 'line',
                                    stack: '总消费',
                                    markPoint : {
                                        data : [
                                            {type : 'max', name: '淋浴支出最大值'},
                                            {type : 'min', name: '淋浴支出最小值'}
                                        ]
                                    },
                                    markLine : {
                                        data : [
                                            {type : 'average', name: '淋浴支出平均值'}
                                        ]
                                    },
                                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                                    data: mapKeyValue211
                                },
                                {
                                    name:'购热水支出',
                                    type: 'line',
                                    stack: '总消费',
                                    markPoint : {
                                        data : [
                                            {type : 'max', name: '购热水支出最大值'},
                                            {type : 'min', name: '购热水支出最小值'}
                                        ]
                                    },
                                    markLine : {
                                        data : [
                                            {type : 'average', name: '购热水支出平均值'}
                                        ]
                                    },
                                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
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

        <h1>各个学院应征入伍学生人均消费分析标准条形图演示</h1>
        <div id="main3" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart3 = echarts.init(document.getElementById('main3'));
            var mapOnlyKey3 = [];
            var mapKeyValue3 = [];
            var mapOnlyValue3 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/ave',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey3.length = 0;
                    mapKeyValue3.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey3.push(data[i].dpname1);
                        mapKeyValue3.push({"value": Math.round(data[i].ave), "name": Math.round(data[i].dpname1)});
                        mapOnlyValue3.push(data[i].ave);
                    }

                    option3 = {
                        title: {
                            text: '各个学院应征入伍学生人均消费分析',//图片名称
                            subtext: 'average',
                            x: 'center'
                        },
                        legend: {
                            data: ['AVE'],
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
                            type : 'value',
                            boundaryGap : [0, 0.01]
                        },
                        yAxis: {
                            type : 'category',
                            data : mapOnlyKey3
                        },
                        series: [{
                            name: '学院应征入伍学生人均消费',
                            type: 'bar',
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