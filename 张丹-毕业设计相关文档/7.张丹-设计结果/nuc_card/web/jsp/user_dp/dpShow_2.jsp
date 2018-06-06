<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/jsp/common/head_dp.jsp"%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>学院普通学生消费可视化页面</span>
    </div>
    <div class="search">
        <form method="get" action="${pageContext.request.contextPath }/jsp/user.do">
            <input name="method" value="dp" class="input-text" type="hidden">
            <span>选择：</span>

            <select id="s_province" name="school" value="${school}"></select>&nbsp;

            <select id="s_city" name="major" value="${major}"></select>&nbsp;

            <select id="s_county" name="num" value="${num}"></select>


            <script class="resources library" src="${pageContext.request.contextPath }/js/school.js" type="text/javascript"></script>

            <script type="text/javascript">_init_area();</script>


            <input	value="查 询" type="submit" id="searchbutton">
        </form>
    </div>
    <div class="providerAdd">
    <!‐‐ 引入Echarts3包 ‐‐>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>

    <!‐‐ 引入Jquery包 ‐‐>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <h1>学院一个专业每个班级三大消费类型分析堆积面积图演示</h1>
            <div id="main4" style="width: 800px;height:400px;"></div>
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
                    url: '${pageContext.request.contextPath}/major_num',
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
                                mapOnlyDp2.push(data[i].dpname4);
                                mapOnlyKey210.push(data[i].acccode);
                                mapKeyValue210.push({"value": Math.round(data[i].opfare), "name": data[i].dpname4});
                                mapOnlyValue210.push(data[i].opfare);
                            }
                            else if (data[i].acccode==211){
                                mapOnlyKey211.push(data[i].dpname4);
                                mapKeyValue211.push({"value": Math.round(data[i].opfare), "name": data[i].dpname4});
                                mapOnlyValue211.push(data[i].opfare);
                            }else if (data[i].acccode==222) {
                                mapOnlyKey222.push(data[i].dpname4);
                                mapKeyValue222.push({"value": Math.round(data[i].opfare), "name": data[i].dpname4});
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
                                type : 'category',
                                data: mapOnlyDp2,
                                name: '班级号',


                            },
                            yAxis: {
                                type: 'value',
                                name: '消费金额',

                            },
                            series: [
                                {
                                    name:'淋浴支出',
                                    type: 'bar',
                                    stack: '总消费',
                                    itemStyle : { normal: {label : {show: false, position: 'insideRight'}}},
                                    data: mapKeyValue211
                                },
                                {
                                    name:'餐饮支出',
                                    type: 'bar',
                                    stack: '总消费',
                                    itemStyle : { normal: {label : {show: false, position: 'insideRight'}}},
                                    data: mapKeyValue210
                                },
                                {
                                    name:'购热水支出',
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