<%--
    用户详情界面
--%>
<%@ page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <span>用户管理页面 >> 用户信息查看页面</span>
    </div>
    <div class="providerView">
        <p><strong>用户学号：</strong><span>${user.userCode}</span></p>
        <p><strong>用户名称：</strong><span>${user.userName}</span></p>
        <p><strong>用户性别：</strong>
            	<span>
            		<c:if test="${user.gender == 1}">男</c:if>
                    <c:if test="${user.gender == 2}">女</c:if>
				</span>
        </p>
        <p><strong>出生日期：</strong><span>${user.birthday }</span></p>
        <p><strong>用户电话：</strong><span>${user.phone }</span></p>
        <p><strong>用户地址：</strong><span>${user.address }</span></p>
        <p><strong>用户角色：</strong><span>${user.userRoleName}</span></p>
        <div class="providerAddBtn">
            <input type="button" id="back" name="back" value="返回" >
        </div>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/userview.js"></script>