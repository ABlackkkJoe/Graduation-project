<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${userSession.userRole==5}">
    <%@include file="/jsp/common/head_AttendStu.jsp"%>
</c:if>
<c:if test="${userSession.userRole==6}">
    <%@include file="/jsp/common/head_DownStu.jsp"%>
</c:if>
<c:if test="${userSession.userRole==7||userSession.userRole==9}">
    <%@include file="/jsp/common/head_NormalStu.jsp"%>
</c:if>


<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>个人消费可视化页面</span>
    </div>

    <div class="providerAdd">
        <!‐‐ 引入Echarts3包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
        <body>
        <!‐‐ 引入Jquery包 ‐‐>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

        <h1>个人三大消费类型分析饼状图演示</h1>
        <div id="main" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));
            // 异步加载数据
            var mapOnlyKey = [];
            var mapKeyValue = [];
            var mapOnlyValue = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/northreeshow',
                //url: '/pieshow',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey.length = 0;
                    mapKeyValue.length = 0;
                    mapOnlyValue.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey.push(data[i].acccode);
                        mapKeyValue.push({"value": Math.round(data[i].opfare), "name": data[i].acccode});
                        mapOnlyValue.push(data[i].opfare);
                    }
                    option = {
                        title: {
                            text: '个人三大消费类型分析',//图片名称
                            subtext: '210：餐饮支出 211：淋浴支出 222：购热水支出',
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
        <h1>个人每个月支出分析雷达图演示</h1>
        <div id="main7" style="width: 800px;height:400px;"></div>
        <script type="text/javascript">
            var myChart7 = echarts.init(document.getElementById('main7'));
            var mapOnlyKey7 = [];
            var mapKeyValue7 = [];
            var mapOnlyValue7 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/normon2show',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey7.length = 0;
                    mapKeyValue7.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapKeyValue7.push(Math.round(data[i].opfare));

                    }

                    option7 = {
                        title: {
                            text: '个人每个月支出分析',//图片名称
                            x: 'center'
                        },
                        legend: {
                            data: ['month'],
                            align: 'left',
                            left: 10
                        },
                        toolbox: {show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }},
                        calculable : true,
                        polar : [
                            {
                                indicator : [
                                    {text : '2016-09', max  : 600},
                                    {text : '2016-10', max  : 600},
                                    {text : '2016-11', max  : 600},
                                    {text : '2016-12', max  : 600}
                                ],
                                radius : 150
                            }
                        ],
                        tooltip: { trigger: 'axis'},
                        series: [{
                            name: '月支出',
                            type: 'radar',
                            itemStyle: {
                                normal: {
                                    areaStyle: {
                                        type: 'default'
                                    }
                                }
                            },
                            data: [{
                                name:"月份",
                                value:mapKeyValue7
                            }]
                        }]
                    }

                    myChart7.setOption(option7);
                }
            });
        </script>
        <!--
        <h1>个人每个月支出分析柱状图演示</h1>
        <div id="main5" style="width: 800px;height:400px;"></div>
        <script type="text/javascript">
            var myChart5 = echarts.init(document.getElementById('main5'));
            var mapOnlyKey5 = [];
            var mapKeyValue5 = [];
            var mapOnlyValue5 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/normonshow',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey5.length = 0;
                    mapKeyValue5.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey5.push(data[i].dt);
                        mapKeyValue5.push({"value": Math.round(data[i].opfare), "name": data[i].dt});
                        mapOnlyValue5.push(data[i].dt);
                    }

                    option5 = {
                        title: {
                            text: '个人每个月支出分析',//图片名称
                            x: 'center'
                        },
                        legend: {
                            data: mapOnlyKey5,
                            align: 'left',
                            left: 10
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: {show: true},
                                dataZoom: {show: true},
                                dataView: {show: true, readOnly: false},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        tooltip: {},
                        xAxis: {
                            data: mapOnlyKey5,
                            name: 'date',
                            silent: false,
                            axisLine: {onZero: true},
                            splitLine: {show: false},
                            splitArea: {show: false}
                        },
                        yAxis: {
                            name: '消费金额',
                            type:'value',
                            inverse: false,
                            splitArea: {show: false}
                        }, grid: {
                            left: 100
                        },
                        series: [{
                            name: 'per_month',
                            type: 'bar',
                            stack: 'one',
                            data: mapKeyValue5
                        }]
                    }

                    myChart5.setOption(option5);
                }
            });
        </script>
        -->
        <h1>个人每日支出K图演示</h1>
        <div id="main8" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart8 = echarts.init(document.getElementById('main8'));
            var mapOnlyKey8 = [];
            var mapKeyValue8 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/nordaydyshow',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey8.length = 0;
                    mapKeyValue8.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey8.push(data[i].dt);
                        var mapOnlyValue8 = [data[i].min, data[i].max, data[i].ave, data[i].opfare];
                        mapKeyValue8.push(mapOnlyValue8);
                    }
                    option8 = {
                        title: {
                            text: '个人每日消费动态分析',//图片名称
                            x: 'left'
                        },
                        legend: {
                            data: ['day_opfare']
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: {show: true},
                                dataZoom: {show: true},
                                dataView: {show: true, readOnly: false},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        tooltip: {
                            trigger: 'axis',
                            formatter: function (params) {
                                var res = params[0].seriesName + ' ' + params[0].name;
                                res += '<br/>  日最低消费 : ' + params[0].value[0];
                                res += '<br/>  日最高消费 : ' + params[0].value[1];
                                res += '<br/>  日平均消费 : ' + params[0].value[2];
                                res += '<br/>  日总消费 : ' + params[0].value[3];
                                return res;
                            }
                        },
                        dataZoom: {
                            show: true,
                            realtime: true,
                            start: 50,
                            end: 100
                        },
                        xAxis: [{
                            type: 'category',
                            boundaryGap: true,
                            data: mapOnlyKey8,
                            name: '日期'
                        },
                            {
                                type: 'value',
                                max: 100,
                                scale: true
                            }],
                        yAxis: [{
                            type: 'value',
                            scale: true,
                            splitNumber: 5,
                            boundaryGap: [0.05, 0.05],
                            name: '消费金额',
                        },
                            {
                                type: 'value',
                                splitNumber: 5,
                                scale: true
                            }],
                        series: [{
                            name: '',
                            type: 'k',
                            data: mapKeyValue8
                        },
                        ]
                    };

                    myChart8.setOption(option8);
                    var lastIndex = 0;
                    var len = option8.series[0].data.length;
                    clearInterval(timeTicket);
                    timeTicket=setInterval(function () {
                        // 动态数据接口 addData
                        lastIndex += 1;
                        myChart8.addData([
                            [
                                0,        // 系列索引
                                option8.series[0].data[lastIndex % len], // 新增数据
                                false,     // 新增数据是否从队列头部插入
                                false,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
                                option8.xAxis[0].data[lastIndex % len]
                            ]
                        ]);

                    }, 2000);
                }

            });
        </script>
<!--
        <h1>个人每日支出line演示</h1>
        <div id="main9" style="width: 1100px;height:400px;"></div>
        <script type="text/javascript">
            var mapOnlyKey4=[]
            var mapOnliValue=[];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/nordayshow',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey4.length = 0;
                    for (var i = 0; i < data.length; i++) {
                    mapOnlyKey4.push(data[i].dt);
                        mapOnliValue.push(data[i].opfare);
                    }
                    option9 = {
                        tooltip: {
                            trigger: 'axis',
                            showDelay: 0             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
                        },
                        legend: {
                            y: -30,
                            data: ['day_opfare']
                        },
                        toolbox: {
                            y: -30,
                            show: true,
                            feature: {
                                mark: {show: true},
                                dataZoom: {show: true},
                                dataView: {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        dataZoom: {
                            show: true,
                            realtime: true,
                            start: 50,
                            end: 100
                        },
                        grid: {
                            x: 80,
                            y: 5,
                            x2: 20,
                            y2: 40
                        },
                        xAxis: [
                            {
                                type: 'category',
                                position: 'top',
                                boundaryGap: true,
                                axisTick: {onGap: false},
                                splitLine: {show: false},
                                data: mapOnlyKey4
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                scale: true,
                                splitNumber: 3,
                                boundaryGap: [0.05, 0.05],
                                name: '消费金额',
                                splitArea: {show: true}
                            }
                        ],
                        series: [
                            {
                                name: 'day_opfare',
                                type: 'line',
                                symbol: 'none',
                                data: mapOnliValue,
                                markLine: {
                                    symbol: 'none',
                                    itemStyle: {
                                        normal: {
                                            color: '#1e90ff',
                                            label: {
                                                show: false
                                            }
                                        }
                                    },
                                    data: [
                                        {type: 'average', name: '平均值'}
                                    ]
                                }
                            }
                        ]
                    };
                    var myChart9 = echarts.init(document.getElementById('main9'));
                    myChart9.setOption(option9);
                }

            });
        </script>
        -->
        <h1>个人就餐时间点分析折线图演示</h1>
        <div id="main6" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            // 基于准备好的dom，初始化echarts实例
            var myChart6 = echarts.init(document.getElementById('main6'));
            // 异步加载数据
            var mapOnlyKey6 = [];
            var mapKeyValue6 = [];
            var mapOnlyValue6 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/norpoishow',
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
                            text: '个人餐饮时间点分析',//图片名称
                            x: 'center'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: ['point']//不修改，从数据库调取
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType : {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        xAxis : [
                            {
                                type : 'category',
                                boundaryGap : false,
                                data : mapOnlyKey6
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value',
                                axisLabel : {
                                    formatter: '{value} 次'
                                }
                            }
                        ],
                        series: [
                            {
                                name: '次数',
                                type: 'line',
                                data: mapKeyValue6,//不修改，从数据库调取
                                markPoint : {
                                    data : [
                                        {type : 'max', name: '最大值'},
                                        {type : 'min', name: '最小值'}
                                    ]
                                },
                            },
                        ]
                    };
                    myChart6.setOption(option6);
                }
            });
        </script>
        <h1>个人餐饮POS机消费情况分析柱状图演示</h1>
        <div id="main1" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart1 = echarts.init(document.getElementById('main1'));
            var mapOnlyKey1 = [];
            var mapKeyValue1 = [];
            var mapOnlyValue1 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/norcanteenshow',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey1.length = 0;
                    mapKeyValue1.length = 0;
                    mapOnlyValue1.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey1.push(data[i].termname);
                        mapKeyValue1.push({"value": Math.round(data[i].opfare), "name": data[i].termname});
                        mapOnlyValue1.push(data[i].opfare);
                    }
                    option1 = {
                        title: {
                            text: '个人餐饮POS机消费情况分析',//图片名称
                            subtext: '餐饮支出',
                            x: 'center'
                        },
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
                            name: '消费金额',
                            inverse: false,
                            splitArea: {show: false}
                        }, grid: {
                            left: 100
                        },
                        series: [{
                            name: '',
                            type: 'bar',
                            stack: 'one',
                            data: mapKeyValue1
                        }]
                    }

                    myChart1.setOption(option1);
                }
            });
        </script>
        <!--
        <h1>个人淋浴POS机消费情况分析柱状图演示</h1>
        <div id="main2" style="width: 1000px;height:400px;"></div>
        <script type="text/javascript">
            var myChart2 = echarts.init(document.getElementById('main2'));
            var mapOnlyKey2 = [];
            var mapKeyValue2 = [];
            var mapOnlyValue2 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/norshowershow',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey2.length = 0;
                    mapKeyValue2.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey2.push(data[i].termname);
                        mapKeyValue2.push({"value": Math.round(data[i].opfare), "name": data[i].termname});
                        mapOnlyValue2.push(data[i].opfare);
                    }

                    option2 = {
                        title: {
                            text: '个人淋浴POS机消费情况分析',//图片名称
                            subtext: '淋浴支出',
                            x: 'center'
                        },
                        legend: {
                            data: mapOnlyKey2,
                            align: 'left',
                            left: 10
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: {show: true},
                                dataZoom: {show: true},
                                dataView: {show: true, readOnly: false},
                                restore: {show: true},
                                saveAsImage: {show: true}
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
                            name: '消费金额',
                            inverse: false,
                            splitArea: {show: false}
                        }, grid: {
                            left: 100
                        },
                        series: [{
                            name: '',
                            type: 'bar',
                            stack: 'one',
                            data: mapKeyValue2
                        }]
                    }

                    myChart2.setOption(option2);
                }
            });
        </script>
        -->
        <!--
        <h1>个人购热水POS机消费情况分析柱状图演示</h1>
        <div id="main3" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart3 = echarts.init(document.getElementById('main3'));
            var mapOnlyKey3 = [];
            var mapKeyValue3 = [];
            var mapOnlyValue3 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/norlibraryshow',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey3.length = 0;
                    mapKeyValue3.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey3.push(data[i].termname);
                        mapKeyValue3.push({"value": Math.round(data[i].opfare), "name": data[i].termname});
                        mapOnlyValue3.push(data[i].opfare);
                    }

                    option3 = {
                        title: {
                            text: '个人够热水POS机消费情况分析',//图片名称
                            subtext: '购热水',
                            x: 'center'
                        },
                        legend: {
                            data: mapOnlyKey3,
                            align: 'left',
                            left: 10
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: {show: true},
                                dataZoom: {show: true},
                                dataView: {show: true, readOnly: false},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
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
                            name: '消费金额',
                            inverse: false,
                            splitArea: {show: false}
                        }, grid: {
                            left: 100
                        },
                        series: [{
                            name: 'per_pos',
                            type: 'bar',
                            stack: 'one',
                            data: mapKeyValue3
                        }]
                    }

                    myChart3.setOption(option3);
                }
            });
        </script>
-->
        </body>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>
