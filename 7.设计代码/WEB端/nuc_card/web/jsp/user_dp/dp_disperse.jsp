<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/jsp/common/head_Shower.jsp"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>离散化比较男女消费</span>
    </div>

    <div class="providerAdd">
    <!‐‐ 引入Echarts3包 ‐‐>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>

    <!‐‐ 引入Jquery包 ‐‐>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">

        <tr class="firstTr">
            <h1>消费记录数量与消费时间柱状图演示</h1>
        <div id="main5" style="width: 1200px;height:400px;"></div>
        <script type="text/javascript">
            var myChart5 = echarts.init(document.getElementById('main5'));
            var mapOnlyKey3 = [];
            var mapKeyValue3 = [];
            var mapOnlyValue3 = [];
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/disperse',
                dataType: 'json',
                success: function (data) {
                    mapOnlyKey3.length = 0;
                    mapKeyValue3.length = 0;
                    for (var i = 0; i < data.length; i++) {
                        mapOnlyKey3.push(data[i].classify);
                        mapKeyValue3.push({"value": data[i].count, "name": data[i].classify});
                        mapOnlyValue3.push(data[i].count);
                    }

                    option5 = {
                        title: {
                            text: '消费记录数量与消费时间分析',//图片名称
                            subtext: 'num',
                            x: 'center'
                        },
                        legend: {
                            data: ['消费记录数量'],
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
                            name: '消费记录数量',
                            type: 'bar',
                            markPoint : {
                                data : [
                                    {type : 'max', name: '消费记录数量最大值'},
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name: '消费记录数量平均值'}
                                ]
                            },
                            data: mapKeyValue3
                        }]
                    }

                    myChart5.setOption(option5);
                }
            });


        </script>
        </tr>
        <tr>
            <h3>从消费整体情况看，男性消费数量约为女性消费数量的 2.315 倍。
                纵观整个交叉表，绝大部分时段，男女消费数量比接近 2.315:1。
                为寻找消费者性别与消费时间的规律，从交叉表中找出男女消费比显著偏离 2.315:1 的记录，
                设计函数 F=T(T>2.315)，其中 T=Ti(sex1)/Ti(sex2) 即第 i 个时间段的男女消费记录比
                在表中</h3><br>
                <h3>1，对于某个时段 Ti，sex(男)+sex(女) 的值越小说明在此时间段产生的消费记录越少，
                即使产生较大的 F 值，相应的说服力也不大，
                为减少此类数据的影响，在计数大于平均数的时段内，选取算子 F 较大值才是有意义的。</h3><br>
                <h3>2，由于每个时段消费的平均值约为 30357，因此在消费总数大于 30357 的时间段内选取 F 较大的值，
                相应时段分别为:K、V、W、X、Y。分别代表在 11:30--12:00,17:00-19:00期间，性别消费差异更明显，
                在这个期间男生相对于其他时段的消费比例更高一些。</h3><br>
                <h3>3，在消费总数大于 30357 的时间段内选取 F 较小的值，相应时段分别为:B、C、J、L，
                分别代表在 7:00--8:00,11:30-12:30期间，性别消费差异更明显，在这个期间男生相对于其他时段的消费比例更高一些。</h3><br>
            <h3>整体来看，男生晚上消费更多「女生减肥原因」，女生早晨消费更多「男生早起问题」。对于早晚饭菜可以针对男女生喜好改进，提高收益。</h3>
        </tr>
        <tr>
            <img src="${pageContext.request.contextPath }/images/sex.png" >
        </tr>
    </table>
</div>

    <!--
    <table border="1">

        <c:forEach var="bean" items="${list}">
            <tr>
                <td>${bean.classify}</td>
                <td>${bean.m}</td>
                <td>${bean.f}</td>
            </tr>
        </c:forEach>
        <tr>
            <td>总数</td>
            <td>720812</td>
            <td>311336</td>
        </tr>
        <tr>
            <td>性别</td>
            <td>时间段</td>
            <c:forEach var="bean" items="${list}">
                <td>${bean.classify}</td>
            </c:forEach>
            <td>总数</td>
        </tr>

        <tr>
            <td>sex(男)</td>
            <td>消费记录数量</td>
            <c:forEach var="bean" items="${list}">
                <td>${bean.m}</td>
            </c:forEach>
            <td>720812</td>
        </tr>
        <tr>
            <td>sex(女)</td>
            <td>消费记录数量</td>
            <c:forEach var="bean" items="${list}">
                <td>${bean.f}</td>
            </c:forEach>
            <td>311336</td>
        </tr>
        <tr>
            <td>sex(男)+sex(女)</td>
            <td>消费记录数量</td>
            <c:forEach var="bean" items="${list}">
                <td>${bean.f+bean.m}</td>
            </c:forEach>
            <td>1032148</td>
        </tr>
        <tr>
            <td>男女消费比率</td>
            <td></td>
            <c:forEach var="bean" items="${list}">
                <td><fmt:formatNumber value="${bean.m/bean.f}" pattern="#.00" groupingUsed="false"/></td>
            </c:forEach>
            <td>2.315</td>
        </tr>
    </table>

    -->
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>