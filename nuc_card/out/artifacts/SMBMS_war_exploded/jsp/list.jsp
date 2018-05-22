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
        <span>学院管理员页面</span>
    </div>
    <div class="search">
        <form method="get" action="/jsp/user.do">
            <input name="method" value="dp" class="input-text" type="hidden">
            <span>选择：</span>

            <select id="s_province" name="school"></select>&nbsp;

            <select id="s_city" name="major" ></select>&nbsp;

            <select id="s_county" name="num"></select>


            <script class="resources library" src="/js/school.js" type="text/javascript"></script>

            <script type="text/javascript">_init_area();</script>


            <input	value="查 询" type="submit" id="searchbutton">
        </form>
    </div>
</div>
</section>


<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userlist.js"></script>
