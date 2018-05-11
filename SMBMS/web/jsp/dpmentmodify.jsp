<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head_root.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>学院管理页面 >> 学院添加页面</span>
    </div>
    <div class="dpmentAdd">
        <form id="dpmentForm" name="dpmentForm" method="post" action="${pageContext.request.contextPath }/jsp/dpment.do">
            <input type="hidden" name="method" value="modifysave">
            <input type="hidden" name="id" value="${dpment.id }">
            <!--div的class 为error是验证错误，ok是验证成功-->
            <div class="">
                <label for="dpname1">学院名称：</label>
                <input type="text" name="dpname1" id="dpname1" value="${dpname.dpname1 }" readonly="readonly">
            </div>
            <div>
                <label for="dpname2">专业名称：</label>
                <input type="text" name="dpname2" id="dpname2" value="${dpname.dpname2 }">
                <font color="red"></font>
            </div>
            <div>
                <label for="dpname3">年级：</label>
                <input type="text" name="dpname3" id="dpname3" value="${dpname.dpname3 }">
                <font color="red"></font>
            </div>
            <div>
                <label for="dpname4">班级名：</label>
                <input type="text" name="dpname4" id="dpname4" value="${dpname.dpname4 }">
                <font color="red"></font>
            </div>

            <div class="dpmentAddBtn">
                <input type="button" name="save" id="save" value="保存">
                <input type="button" id="back" name="back" value="返回" >
            </div>
        </form>
    </div>

</div>
</section>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/dpmentmodify.js"></script>