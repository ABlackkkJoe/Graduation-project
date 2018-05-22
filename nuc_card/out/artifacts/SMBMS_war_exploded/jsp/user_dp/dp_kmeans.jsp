<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${userSession.userRole==8}">
	<%@include file="/jsp/common/head_dp.jsp"%>
</c:if>


<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>学院消费详情页面</span>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <<img src="/images/g6.jpg" >
      </table>
  </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>