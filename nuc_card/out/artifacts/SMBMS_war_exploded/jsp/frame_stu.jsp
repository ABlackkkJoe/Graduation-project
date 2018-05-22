<%--
--%>
<%@ page language="java" pageEncoding="utf-8" %>
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
        <img class="wColck" src="${pageContext.request.contextPath }/images/clock.jpg" alt=""/>
        <div class="wFont">


            <h2>${userSession.userName }</h2>
            <p>欢迎来到中北大学一卡通数据分析与展示系统!</p>
            <c:if test="${userSession.userRole==9}">
                <p>预警：您这一学期未使用过一卡通进行任何消费，请检查一卡通状况，同时邮箱也有相关提示，请注意查看，谢谢合作!</p>
            </c:if>
        </div>
    </div>
</section>
<%@include file="/jsp/common/foot.jsp"%>
