<%--
--%>
<%@ page language="java" pageEncoding="utf-8" %>

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
        <img class="wColck" src="${pageContext.request.contextPath }/images/clock.jpg" alt=""/>
        <div class="wFont">
            <h2>${userSession.userName }</h2>
            <p>欢迎来到中北大学一卡通数据分析与展示系统!</p>
        </div>
    </div>
</section>
<%@include file="/jsp/common/foot.jsp"%>
