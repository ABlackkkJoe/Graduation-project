
var dpment1 = null;
var dpment2 = null;
var dpment3 = null;
var dpment4 = null;
var saveBtn = null;
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
	addBtn = $("#save");
	backBtn = $("#back");
	
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上

    dpment1.next().html("*");
    dpment2.next().html("*");
    dpment3.next().html("*");
    dpment4.next().html("*");
	
	$.ajax({
		type:"GET",//请求类型
		url:path+"/jsp/dpment.do",//请求的url
		data:{method:"getproviderlist"},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			if(data != null){
				var pid = $("#pid").val();
				$("select").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
				var options = "<option value=\"0\">请选择</option>";
				for(var i = 0; i < data.length; i++){
					//alert(data[i].id);
					//alert(data[i].proName);
					if(pid != null && pid != undefined && data[i].id == pid ){
						options += "<option selected=\"selected\" value=\""+data[i].id+"\" >"+data[i].proName+"</option>";
					}else{
						options += "<option value=\""+data[i].id+"\" >"+data[i].proName+"</option>";
					}
					
				}
				$("select").html(options);
			}
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			validateTip(providerId.next(),{"color":"red"},imgNo+" 获取学院列表error",false);
		}
	});
	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */

    dpment1.on("focus",function(){
		validateTip(dpment1.next(),{"color":"#666666"},"* 请输入学院名称",false);
	}).on("blur",function(){
		if(dpment1.val() != null){
			validateTip(dpment1.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(dpment1.next(),{"color":"red"},imgNo+" 学院名称不能为空，请重新输入",false);
		}
		
	});

    dpment2.on("focus",function(){
		validateTip(dpment2.next(),{"color":"#666666"},"* 请输入专业",false);
	}).on("blur",function(){
		if(dpment2.val() != null && dpment1.val() != ""){
			validateTip(dpment2.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(dpment2.next(),{"color":"red"},imgNo+" 专业不能为空，请重新输入",false);
		}
		
	});

    dpment3.on("focus",function(){
		validateTip(dpment3.next(),{"color":"#666666"},"* 请选择班级",false);
	}).on("blur",function(){
		if(dpment3.val() != null && dpment2.val() != "" && dpment1.val() != 0){
			validateTip(dpment3.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(dpment3.next(),{"color":"red"},imgNo+" 班级不能为空，请选择",false);
		}
		
	});


    dpment4.on("focus",function(){
        validateTip(dpment4.next(),{"color":"#666666"},"* 请选择班级",false);
    }).on("blur",function(){
        if(dpment4.val() != null && dpment3.val() != "" && dpment2.val() != "" && dpment1.val() != ""){
            validateTip(dpment4.next(),{"color":"green"},imgYes,true);
        }else{
            validateTip(dpment4.next(),{"color":"red"},imgNo+" 班级不能为空，请选择",false);
        }

    });
	addBtn.on("click",function(){
        dpment1.blur();
        dpment2.blur();
        dpment3.blur();
        dpment4.blur();
		if(dpment1.attr("validateStatus") == "true"
			&& dpment2.attr("validateStatus") == "true"
            && dpment3.attr("validateStatus") == "true"
            && dpment4.attr("validateStatus") == "true"){
			if(confirm("是否确认提交数据")){
				$("#dpmentForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		//alert("modify: "+referer);
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