<%@ page import="java.util.Date" %><%--
    用户列表界面
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${userSession.userRole==1}">
    <%@include file="/jsp/common/head_root.jsp"%>
</c:if>
<c:if test="${userSession.userRole==2}">
    <%@include file="/jsp/common/head_Canteen.jsp"%>
</c:if>
<c:if test="${userSession.userRole==3}">
    <%@include file="/jsp/common/head_Shower.jsp"%>
</c:if>
<c:if test="${userSession.userRole==4}">
    <%@include file="/jsp/common/head_Water.jsp"%>
</c:if>
<c:if test="${userSession.userRole==5}">
    <%@include file="/jsp/common/head_AttendStu.jsp"%>
</c:if>
<c:if test="${userSession.userRole==6}">
    <%@include file="/jsp/common/head_DownStu.jsp"%>
</c:if>
<c:if test="${userSession.userRole==7}">
    <%@include file="/jsp/common/head_NormalStu.jsp"%>
</c:if>
<c:if test="${userSession.userRole==8}">
    <%@include file="/jsp/common/head_dp.jsp"%>
</c:if>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>淋浴消费区报告页面</span>

    </div>
    <div class="right">
        <div class="wFont">
            <h3>1，查看9-12月每日刷卡总频率分析图得知，每日消费低水平阶段是在每周的周末和每月的月末。</h3>
            <h3>建议：在这两个时间段可以适当减少花洒开放的数量或者是减少供水量。</h3>
            <a href="www.ocpro.cc/nuccard/images/day.png" style="font-size: larger">详情图查看</a><br/>


            <h3>2，查看男女淋浴POS机收益分析图得知，女浴收益相对高，符合女生日常洗澡频率。</h3>
            <h3>建议：女生澡堂增大日供水量或适当增加花洒数量，以避免供不应求。</h3>
            <a href="www.ocpro.cc/nuccard/images/women.png" style="font-size: larger">详情图查看</a><br/>



            <h3>3，查看POS机刷卡次数和收益额分析图得知，每一pos机收益是均衡的，不存在较大反差。</h3>
            <a href="www.ocpro.cc/nuccard/images/ratio.png" style="font-size: larger">详情图查看</a><br/>

            <h3>4，查看各个POS机收益分析图得知，pos机收益是有较大差距的。</h3>
            <h3>建议：对于收益较低的POS机，定期检查花洒质量或周围环境问题，以改善收益同时方便学生。</h3>
            <a href="www.ocpro.cc/nuccard/images/insterest.png" style="font-size: larger">详情图查看</a> <br>

            <a href = "${pageContext.request.contextPath }/jsp/shReport.jsp" style="font-size: larger">点击下载此报告</a>
        </div>
    </div>




    </section>
</div>



</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userlist.js"></script>
