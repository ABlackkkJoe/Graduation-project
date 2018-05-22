<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    var national = [
            "汉族", "壮族", "满族", "回族", "苗族", "维吾尔族", "土家族", "彝族", "蒙古族", "藏族", "布依族", "侗族", "瑶族", "朝鲜族", "白族", "哈尼族",
            "哈萨克族", "黎族", "傣族", "畲族", "傈僳族", "仡佬族", "东乡族", "高山族", "拉祜族", "水族", "佤族", "纳西族", "羌族", "土族", "仫佬族", "锡伯族",
            "柯尔克孜族", "达斡尔族", "景颇族", "毛南族", "撒拉族", "布朗族", "塔吉克族", "阿昌族", "普米族", "鄂温克族", "怒族", "京族", "基诺族", "德昂族", "保安族",
            "俄罗斯族", "裕固族", "乌孜别克族", "门巴族", "鄂伦春族", "独龙族", "塔塔尔族", "赫哲族", "珞巴族"
    ];
    window.onload = function ()
    {
        var nat = document.getElementById ("native");
        for ( var i = 0; i < national.length; i++)
        {
            var option = document.createElement ('option');
            option.value = national[i];
            var txt = document.createTextNode (national[i]);
            option.appendChild (txt);
            nat.appendChild (option);
        }
        
        
        
       //户口性质
 	   var hukou = "${user.hukou}";
     	  var obj = document.getElementById("hukou");
		  for(var i = 0; i < obj.options.length; i++){
              var tmp = obj.options[i].value;
              if(tmp == hukou){
                  obj.options[i].selected = 'selected';
                  break;
          }   
    }
		  
		  
	   //民族
		   var stuNative = "${user.stuNative}";
	    
	     	  var obj = document.getElementById("native");
			  for(var i = 0; i < obj.options.length; i++){
	              var tmp = obj.options[i].value;
	              if(tmp == stuNative){
	                  obj.options[i].selected = 'selected';
	                  break;
	          }   
	    }
			  
			  
		//倒计时60s
	    var phoneButton = document.getElementById("phoneCode_button");
	    var flag = "${!empty user.telephone}";
			if(flag == "true"){
			    time(phoneButton);
			} 
    };
    
      //注册用户已存在的提示
      var flag = "${!empty userExit}";
      var userExitInfo = "${userExit}";
      if(flag == "true"){
    	  alert(userExitInfo);
      }
      
    
</script>


     <!-- 获取手机验证码 -->
    <script type="text/javascript">
    function getPhoneCode(){
      var form = document.getElementById("form");
  	  form.action="getPhoneCode.action";
  	  form.submit();
    } 
    </script>  
    
    
     	  <!-- 倒计时60s -->
  	<script type="text/javascript">
  	var wait=60;
  	function time(o) {
  	  if (wait == 0) {
  	   o.removeAttribute("disabled");   
  	   o.value="点击获取手机验证码";
  	   wait = 60;
  	  } else { 
  	 
  	   o.setAttribute("disabled", true);
  	   o.value="重新发送(" + wait + ")";
  	   wait--;
  	   setTimeout(function() {
  	    time(o);
  	   },
  	   1000);
  	  }
  	 } 
  	</script>
  	
  	  <script type="text/javascript">
  	     function back(){
  	    	 var form = document.getElementById("form");
	  	  	  form.action="login.jsp";
	  	  	  form.submit();
  	     }
  	  </script>
         
    </head>
    <body>
    

    	<div align="center" style="margin-top: 5%;">
    	<form action="addUser.action" method="post" id="form">
    		
    		    <!-- 基本信息 -->
    		    <table style="width: 1000px;">
    			<tr bgcolor="lavender"><td style="width:1000px ;">基本信息</td></tr>
    			</table>
    			
    			
    			<table style="width: 1000px;">

    			   <tr><td><div class="info">
							
							户籍所在地<font color="red">*</font>：
							
							<c:if test="${!empty user.province }">
							   <select  name="province">
							      <option value="山西省" selected="selected">山西省</option>
							   </select>&nbsp;
							</c:if>
							
							<c:if test="${empty user.province }">
							    <select id="s_province" name="province"></select>&nbsp;
							</c:if>
							
							
							<c:if test="${ !empty user.city }">
							       <select  name="city" >
							         <option value="临汾市" selected="selected">临汾市</option>
							       </select>&nbsp;
							</c:if>
							
							<c:if test="${empty user.city }">
						        <select id="s_city" name="city" ></select>&nbsp;
							</c:if>
							

					
					        <c:if test="${!empty user.county }">
					            <select  name="county">
					               <option value="洪洞县" selected="selected">洪洞县</option>
					            </select>
					        </c:if>
					        
					        <c:if test="${empty user.county }">
					             <select id="s_county" name="county"></select>
					        </c:if>
						   
						 

						    <script class="resources library" src="js/area.js" type="text/javascript"></script>
						    
						    <script type="text/javascript">_init_area();</script>
						   
						    <div id="show"></div>
						</div></td>
						<td>家庭住址<font color="red">*</font>：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address" placeholder="请输入详细的街道和门牌号信息" size="30" value="${user.address }"></td>
						</tr>

    			</table>
    			<!-- 就学信息 -->
    			<table style="width: 1000px;">
    			<tr bgcolor="lavender"><td style="width:1000px ;">就学信息</td></tr>
    			</table>
    			

    	        
    	        
    			<!-- 共同借款人信息 -->
    			<table style="width: 1000px;">
    			<tr bgcolor="lavender"><td style="width:1000px ;">共同借款人信息</td></tr>
    			</table>
    			

    		    
    		    <table style="width: 1000px;">
    		        <tr bgcolor="lavender"><td style="width:1000px ;">联系方式</td></tr>
    		    </table>
    		    <table style="width: 1000px;">
    		        <tr><td>常用联系方式<font color="red">*</font>：<input type="text" name="telephone" value="${user.telephone }"></td></tr>
                    <tr><td><input type="button" value="点击获取手机验证码：" onclick="getPhoneCode()" id="phoneCode_button"/>&nbsp;&nbsp;<input type="text" id="phoneCode" name="phoneCode" value="" placeholder="请输入手机验证码"/>&nbsp;&nbsp;<font color="red">${phoneCode_error }</font></td></tr>  		    
    		    </table>
    		    
    		    <br>
    		     <input type="submit" value="注册">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="back()" value="返回登录页">
    		
    	</form>
    	</div>
 	</body>
</html>
<style>button{
	border:1px solid #ccc;
	cursor:pointer;
  display:block;
  margin:auto;
  position:relative;
  top:100px;
}</style>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
    