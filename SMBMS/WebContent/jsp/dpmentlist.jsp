<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head_dpment.jsp"%>

<div class="right">
	<div class="location">
		<strong>你现在所在的位置是:</strong>
		<span>学院管理页面</span>
	</div>
	<div class="search">
		<form method="get" action="${pageContext.request.contextPath }/jsp/dpment.do">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>学院名称：</span>
			<input name="queryDpment1" type="text" value="${queryDpment1 }">
			<span>专业名称：</span>
			<input name="queryDpment2" type="text" value="${queryDpment2 }">
			<span>年级：</span>
			<input name="queryDpment3" type="text" value="${queryDpment3 }">

			<input	value="查 询" type="submit" id="searchbutton">
			<a href="${pageContext.request.contextPath }/jsp/dpmentadd.jsp">添加订单</a>
		</form>
	</div>
	<!--账单表格 样式和供应商公用-->
	<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr class="firstTr">
			<th width="10%">学院名称</th>
			<th width="20%">专业名称</th>
			<th width="10%">年级</th>
			<th width="10%">班级名</th>
		</tr>
		<c:forEach var="dpment" items="${providerList }" varStatus="status">
			<tr>
				<td>
					<span>${dpment.dpment1 }</span>
				</td>
				<td>
					<span>${dpment.dpment2 }</span>
				</td>
				<td>
					<span>${dpment.dpment3}</span>
				</td>
				<td>
					<span>${dpment.dpment4}</span>
				</td>
				<td>
					<span>
					<fmt:formatDate value="${dpment.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
				</td>
				<td>
					<span><a class="viewDpment" href="javascript:;" dpmentid=${dpment.id } }><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyDpment" href="javascript:;" dpmentid=${dpment.id } }><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteDpment" href="javascript:;" dpmentid=${dpment.id }  }><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
	<div class="removerChid">
		<h2>提示</h2>
		<div class="removeMain">
			<p>你确定要删除该学院记录吗？</p>
			<a href="#" id="yes">确定</a>
			<a href="#" id="no">取消</a>
		</div>
	</div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/dpmentlist.js"></script>