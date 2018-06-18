<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>POS机收益详情页面</span>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="20%">刷卡机编码</th>
              <th width="20%">收益金额</th>
              <th width="10%">学院</th>
              <th width="10%">专业</th>
              <th width="10%">年级</th>
              <th width="10%">班级</th>
          </tr>
          <c:forEach var="consume" items="${consumes}" varStatus="status">
				<tr>
					<td>
						<span>${consume.termname}</span>
					</td>
					<td>
						<span>${consume.opfare_sum}</span>
					</td>
					<td>
						<span>${consume.dpname1}</span>
					</td>
					<td>
						<span>${consume.dpname2}</span>
					</td>
					<td>
						<span>${consume.dpname3}</span>
					</td>
					<td>
						<span>${consume.dpname4}</span>
					</td>
				</tr>
			</c:forEach>
      </table>
  </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>