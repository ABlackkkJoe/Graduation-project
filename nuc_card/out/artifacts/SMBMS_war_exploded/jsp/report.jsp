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
<c:if test="${userSession.userRole==7||userSession.userRole==9}">
    <%@include file="/jsp/common/head_NormalStu.jsp"%>
</c:if>
<c:if test="${userSession.userRole==8}">
    <%@include file="/jsp/common/head_dp.jsp"%>
</c:if>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>个人消费报告页面</span>
        <br>
    </div>
            <div class="right">
                <div class="wFont">
                    <h3>1，查看个人购热水POS机消费情况分析图得知，你从未在水房购过热水。</h3>
                    <a href="${pageContext.request.contextPath }/images/water.png" style="font-size: larger">详情图查看</a><br>

                    <h3>2，查看个人每个月支出分析图得知，你在12月消费最低，10元左右，是不是期末了没钱花了呢？</h3>
                    <a href="${pageContext.request.contextPath }/images/month.png" style="font-size: larger">详情图查看</a><br>

                    <h3>3，查看个人淋浴POS机消费情况分析图得知，你喜欢在14#，34#处淋浴，消费最高为3元。但是整体来看，淋浴消费处于低水平.</h3>
                    <a href="${pageContext.request.contextPath }/images/shower.png" style="font-size: larger">详情图查看</a><br>

                    <a href = "${pageContext.request.contextPath }/jsp/report.jsp" style="font-size: larger">点击下载此报告</a>

                </div>
            </div>




</section>
</div>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userlist.js"></script>