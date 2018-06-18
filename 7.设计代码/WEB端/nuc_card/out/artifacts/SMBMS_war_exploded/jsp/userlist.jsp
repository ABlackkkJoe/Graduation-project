<%@ page import="java.util.Date" %><%--
    用户列表界面
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <span>用户管理页面</span>
    </div>
    <div class="search">
        <form method="get" action="/jsp/user.do">
            <input name="method" value="queryStudent" class="input-text" type="hidden">
            <span>用户名：</span>
            <input name="queryname" class="input-text"	type="text" value="${queryUserName}">

            <span>用户角色：</span>
            <select name="queryUserRole">
                <c:if test="${roleList != null}">
                    <option value="0">--请选择--</option>
                    <c:forEach var="role" items="${roleList}">
                        <option <c:if test="${role.id == queryUserRole}">selected="selected"</c:if> value="${role.id}">${role.roleName}</option>
                    </c:forEach>
                </c:if>

            </select>

            <input type="hidden" name="pageIndex" value="1"/>
            <input	value="查 询" type="submit" id="searchbutton">
            <a href="${pageContext.request.contextPath}/jsp/useradd.jsp" >添加用户</a>
        </form>
    </div>


    <!--用户-->
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">用户学号</th>
            <th width="20%">用户名称</th>
            <th width="10%">性别</th>
            <th width="20%">地址</th>
            <th width="10%">电话</th>
            <th width="10%">用户角色</th>
            <th width="20%">操作</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.userCode}</td>
                <td>${user.userName}</td>
                <td>
                    <c:if test="${user.gender == 1}">男</c:if>
                    <c:if test="${user.gender == 2}">女</c:if>
                </td>
                <td> <span> ${user.address} </span> </td>
                <td> <span>${user.phone}</span> </td>
                <td> <span>${user.userRoleName}</span> </td>
                <td>
                    <span><a href="javascript:;" class="viewUser" userid="${user.id}" username="${user.userName}"><img src="${pageContext.request.contextPath}/images/read.png" title="查看"/></a></span>
                    <span><a href="javascript:;" class="modifyUser" userid="${user.id}" username="${user.userName}"><img src="${pageContext.request.contextPath}/images/xiugai.png" title="修改"/></a></span>
                    <span><a href="javascript:;" class="deleteUser" userid="${user.id}" username="${user.userName}"><img src="${pageContext.request.contextPath}/images/schu.png" title="删除"/></a></span>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="location" style="float: right">
        <span>共</span>${totalPageCount}<span>页</span>&nbsp;
        <span>当前页:</span>${currentPageNo}&nbsp;
        <c:if test="${currentPageNo}>1">
            <a href="${totalPageCount}&pageIndex=1">首页</a>&nbsp;
        </c:if>
        <a href="${pageContext.request.contextPath}/jsp/user.do?method=query&pageIndex=${currentPageNo-1}">上一页</a>&nbsp;
        <c:if test="${currentPageNo<totalPageCount}">
            <a href="${pageContext.request.contextPath}/jsp/user.do?method=query&pageIndex=${currentPageNo+1}">下一页</a>&nbsp;
            <a href="${pageContext.request.contextPath}/jsp/user.do?method=query&pageIndex=${totalPageCount}">末页</a>
        </c:if>
    </div>



</div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userlist.js"></script>
