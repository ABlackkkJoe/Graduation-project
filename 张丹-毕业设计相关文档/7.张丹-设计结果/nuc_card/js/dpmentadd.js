var dpment1 = null;
var dpment2 = null;
var dpment3 = null;
var dpment4 = null;
var addBtn = null;
var backBtn = null;

function priceReg (value){
	value = value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
		value = value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
    value = value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
    value = value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");//去掉特殊符号￥
	if(value.indexOf(".")>0){
		value = value.substring(0,value.indexOf(".")+3);
	}
	return value;
}


$(function(){
    dpment1 = $("#dpment1");
    dpment2 = $("#dpment2");
    dpment3 = $("#dpment3");
    dpment4 = $("#dpment4");
	addBtn = $("#add");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
    dpment1.next().html("*");
    dpment2.next().html("*");
    dpment3.next().html("*");
    dpment4.next().html("*");
	totalPrice.next().html("*");
	providerId.next().html("*");
	
	$.ajax({
		type:"GET",//请求类型
		url:path+"/jsp/dpment.do",//请求的url
		data:{method:"getproviderlist"},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			if(data != null){
				$("select").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
				var options = "<option value=\"0\">请选择</option>";
				for(var i = 0; i < data.length; i++){
					//alert(data[i].id);
					//alert(data[i].proName);
					options += "<option value=\""+data[i].id+"\">"+data[i].dpment+"</option>";
				}
				$("select").html(options);
			}
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			validateTip(providerId.next(),{"color":"red"},imgNo+" 获取供应商列表error",false);
		}
	});
	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
    dpment1.on("blur",function(){
		if(dpment1.val() != null && billCode.val() != ""){
			validateTip(dpment1.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(dpment1.next(),{"color":"red"},imgNo+" 学院不能为空，请重新输入",false);
		}
	}).on("focus",function(){
		//显示友情提示
		validateTip(billCode.next(),{"color":"#666666"},"* 请输入学院",false);
	}).focus();

    dpment2.on("focus",function(){
		validateTip(dpment2.next(),{"color":"#666666"},"* 请输入专业",false);
	}).on("blur",function(){
		if(dpment2.val() != null && productName.val() != ""){
			validateTip(dpment2.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(dpment2.next(),{"color":"red"},imgNo+" 专业名称不能为空，请重新输入",false);
		}
		
	});

    dpment3.on("focus",function(){
		validateTip(productUnit.next(),{"color":"#666666"},"* 请输入年级",false);
	}).on("blur",function(){
		if(dpment3.val() != null && dpment3.val() != ""){
			validateTip(dpment3.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(dpment3.next(),{"color":"red"},imgNo+" 年级不能为空，请重新输入",false);
		}
		
	});

    dpment4.on("focus",function(){
		validateTip(dpment4.next(),{"color":"#666666"},"* 请填写班级",false);
	}).on("blur",function(){
		if(dpment4.val() != null && providerId.val() != "" && providerId.val() != 0){
			validateTip(dpment4.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(dpment4.next(),{"color":"red"},imgNo+" 班级不能为空，请选择",false);
		}
		
	});

	
	addBtn.on("click",function(){
		if(billCode.attr("validateStatus") != "true"){
			billCode.blur();
		}else if(productName.attr("validateStatus") != "true"){
			productName.blur();
		}else if(productUnit.attr("validateStatus") != "true"){
			productUnit.blur();
		}else if(providerId.attr("validateStatus") != "true"){
			providerId.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#billForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});