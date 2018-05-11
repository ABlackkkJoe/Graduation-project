<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head_dpment.jsp"%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>学院管理页面>> 信息查看</span>
    </div>
    <div class="dpmentView">
        <p><strong>学院：</strong><span>${dpment.dpment1 }</span></p>
        <p><strong>专业：</strong><span>${dpment.dpment2 }</span></p>
        <p><strong>年级：</strong><span>${dpment.dpment3 }</span></p>
        <p><strong>班级：</strong><span>${dpment.dpment4 }</span></p>

        <div class="dpmentAddBtn">
            <input type="button" id="back" name="back" value="返回" >
        </div>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/dpmentview.js"></script>