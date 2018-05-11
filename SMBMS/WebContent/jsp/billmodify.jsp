<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head_root.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>消费管理页面 >> 消费添加页面</span>
        </div>
        <div class="providerAdd">
          <form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/jsp/bill.do">
				<input type="hidden" name="method" value="modifysave">
				<input type="hidden" name="id" value="${bill.id }">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="billCode">消费编码：</label>
                    <input type="text" name="billCode" id="billCode" value="${bill.billCode }" readonly="readonly"> 
                </div>
                <div>
                    <label for="productName">消费名称：</label>
                    <input type="text" name="productName" id="productName" value="${bill.productName }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="productUnit">消费区：</label>
                    <input type="text" name="productUnit" id="productUnit" value="${bill.productUnit }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="productCount">消费次数：</label>
                    <input type="text" name="productCount" id="productCount" value="${bill.productCount }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="totalPrice">总金额：</label>
                    <input type="text" name="totalPrice" id="totalPrice" value="${bill.totalPrice }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="providerId">消费区：</label>
                    <input type="hidden" value="${bill.providerId }" id="pid" />
					<select name="providerId" id="providerId">
		        	</select>
					<font color="red"></font>
                </div>
                <div>
                    <label >付款状态：</label>
                    <c:if test="${bill.isPayment == 1 }">
						<input type="radio" name="isPayment" value="1" checked="checked">未付款
						<input type="radio" name="isPayment" value="2" >已付款
					</c:if>
					<c:if test="${bill.isPayment == 2 }">
						<input type="radio" name="isPayment" value="1">未付款
						<input type="radio" name="isPayment" value="2" checked="checked">已付款
					</c:if>
                </div>
                <div class="providerAddBtn">
                  <input type="button" name="save" id="save" value="保存">
				  <input type="button" id="back" name="back" value="返回" >
              	</div>
            </form>
        </div>

    </div>
</section>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billmodify.js"></script>