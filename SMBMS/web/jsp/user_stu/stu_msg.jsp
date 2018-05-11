<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${userSession.userRole==2}">
	<%@include file="/jsp/common/head_hm.jsp"%>
</c:if>
<c:if test="${userSession.userRole==5}">
	<%@include file="/jsp/common/head_stu.jsp"%>
</c:if>


<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>个人管理页面</span>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="20%">消费类型[210:餐厅 211:淋浴 222:饮水]</th>
              <th width="20%">opfare</th>
              <th width="10%">学院</th>
              <th width="10%">系别</th>
              <th width="10%">年级</th>
              <th width="10%">班级</th>
          </tr>
          <c:forEach var="consume" items="${consumes}" varStatus="status">
				<tr>
					<td>
						<span>${consume.acccode}</span>
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