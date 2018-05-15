<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${userSession.userRole==5}">
    <%@include file="/jsp/common/head_AttendStu.jsp"%>
</c:if>
<c:if test="${userSession.userRole==6}">
    <%@include file="/jsp/common/head_DownStu.jsp"%>
</c:if>
<c:if test="${userSession.userRole==7}">
    <%@include file="/jsp/common/head_NormalStu.jsp"%>
</c:if>


<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>个人管理页面</span>
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
                url: '${pageContext.request.contextPath}/threeshow',
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
        <div id="main1" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart1 = echarts.init(document.getElementById('main1'));
            var mapOnlyKey1 = [];
            var mapKeyValue1 = [];
            var mapOnlyValue1 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/canteenshow',
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
        <h1>个人shower消费类型分析柱状图演示</h1>
        <div id="main2" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart2 = echarts.init(document.getElementById('main2'));
            var mapOnlyKey2 = [];
            var mapKeyValue2 = [];
            var mapOnlyValue2 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/showershow',
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
                            text: '个人shower消费类型分析',//图片名称
                            subtext: '211',
                            x: 'center'
                        },
                        legend: {
                            data: mapOnlyKey2,
                            align: 'left',
                            left: 10
                        },
                        toolbox: {},
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
                            name: 'opfare',
                            type: 'bar',
                            stack: 'one',
                            data: mapKeyValue2
                        }]
                    }

                    myChart2.setOption(option2);
                }
            });
        </script>
        <h1>个人购热水支出分析柱状图演示</h1>
        <div id="main3" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart3 = echarts.init(document.getElementById('main3'));
            var mapOnlyKey3 = [];
            var mapKeyValue3 = [];
            var mapOnlyValue3 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/libraryshow',
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
                            text: '个人water消费类型分析',//图片名称
                            subtext: '222',
                            x: 'center'
                        },
                        legend: {
                            data: mapOnlyKey3,
                            align: 'left',
                            left: 10
                        },
                        toolbox: {},
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
                            name: 'opfare',
                            type: 'bar',
                            stack: 'one',
                            data: mapKeyValue3
                        }]
                    }

                    myChart3.setOption(option3);
                }
            });
        </script>
        </body>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>
