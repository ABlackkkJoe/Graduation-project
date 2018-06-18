<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${userSession.userRole==8}">
	<%@include file="/jsp/common/head_dp.jsp"%>
</c:if>


<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>学院管理页面</span>
       </div>
    <div class="search">
        <form method="get" action="${pageContext.request.contextPath }/jsp/user.do">
            <input name="method" value="level" class="input-text" type="hidden">
            <span>评选贫困生做依据</span>
            <span>输入学号：</span>
            <input name="num" class="input-text"	type="text" value="${number}">
            <input	value="查 询" type="submit" id="searchbutton">
            <span>${number}</span>
            <span>:</span>
            <span>${cla}</span>
        </form>
    </div>
       <!--账单表格 样式和供应商公用-->
      <table>
          <tr>
              <td><img src="${pageContext.request.contextPath }/images/cluster.png" ></td>
              <td><img src="${pageContext.request.contextPath }/images/kmeans.png" ></td>
          </tr>
          <tr>
              <td><img src="${pageContext.request.contextPath }/images/zbf.png" ></td>
              <td><img src="${pageContext.request.contextPath }/images/k3.png" ></td>
          </tr>
      </table>
    <table>

              <td>
                  <span style="font-size: larger">第1类[消费水平：低]数目: 3591</span><br>
                  <span style="font-size: larger">第2类[消费水平：高]数目: 3392</span>
              </td>
          </tr>
      </table>

  </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>