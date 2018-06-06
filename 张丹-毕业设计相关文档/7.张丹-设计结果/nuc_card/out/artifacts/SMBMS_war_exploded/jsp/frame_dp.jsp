<%--
--%>
<%@ page language="java" pageEncoding="utf-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/jsp/common/head_dp.jsp" %>
    <div class="right">
        <img class="wColck" src="${pageContext.request.contextPath }/images/clock.jpg" alt=""/>
        <div class="wFont">
            <h2>${userSession.userName }</h2>
            <p>欢迎来到中北大学一卡通数据分析与展示系统!</p>
        </div>
    </div>
</section>
<%@include file="/jsp/common/foot.jsp"%>
