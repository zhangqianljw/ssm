<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>女院便捷打印服务系统-注册</title>
	
	<style type="text/css">
		*{
			padding:0;
			margin:0;
		}
		body{
			margin:0 auto;
			background-image:url(../image/login/bg.jpg);
			background-size:100%;
			background-repeat:no-repeat;
		}
		#wrapper{
			max-width:1000px;
			margin:0 auto;
		}
		h1{
			display:none;
		}
		#logo{
			float:left;
			padding-top:10px;
		}
		#word{
			float:left;
			padding-top:10px;
		}
		.QRcode{
			padding-top:30px;
			margin-left:800px;
			color:rgb(0,176,80)
		}
		a{
			text-decoration:none;
		}
		header{
			height:120px;
			padding-top:10px;
			padding-left:20px;
		}
		.side{
			float:right;
			position:absolute;
			right:300;
			top:235;
			width:120px;
			height:200px;
			background-color:rgba(102,102,102,0.6);
			border-radius:10px;
			color:blue;
			padding:10px;
		}
		.register{
			margin:0 auto;
			width:800px;
			height:400px;
			background-color:rgba(255,255,255,0.6);
			box-shadow:0px 0px 15px #9933ff;
		}
		.getInfo{
			border:dashed 2px rgba(0,0,0,0.6);
			width:500px;
			height:260px;
			margin-left:80px;
			margin-top:40px;
			padding-top:5px;
		}
		.phoneNum,.checkNum{
			width:460px;
			height:50px;
			margin-top:25px;
			padding-left:18px;
		}
		.inputPhoneNum,.inputCheckNum{
			margin-top:5px;
			margin-left:15px;
			width:260px;
			height:38px;
			border:none;
			font-size:16px;
			padding-left:10px;
			border-radius:5px;
			float:left;
		}
		.imgPhoneNum,.imgCheckNum{
			margin-top:10px;
			float:left;
		}
		.divgetNum{
			margin-left:320px;
			width:140px;
			height:45px;
			background-color:rgba(0,0,0,0.7);
			border-top-left-radius:50px;
			border-bottom-left-radius:50px;
		}
		.userRegister{
			margin-left:60px;
			margin-top:30px;
			width:260px;
			height:45px;
			background-color:rgb(0,112,192);
			border-radius:10px;
			border:none;
			outline: none;
			font-size:17px;
			color:#ffffff;
		}
		.imgRegister{
			margin-right:600px;
		}
		.return{
			padding-top:25px;
			padding-left:8px;
			padding-right:8px;
		}
		.registerWord{
			background-color:rgba(0,112,192,0.6);
		}
		.errorMes{
			margin-left:65px;
			color:red;
		}
	</style>
  </head>
  
  <body>
  	<div id="wrapper">
  		<header role="banner">
  			<h1>女院便捷打印服务系统</h1>
    		<div id="logo">
    			<img src="${pageContext.request.contextPath}/image/login/logo.png" width="90" height="90"/>
    		</div>
    		<div id="word">
    			<img src="${pageContext.request.contextPath}/image/login/logo_word.png" width="300" height="110"/>
    		</div>
    		<a href="#">
	    		<div class="QRcode">
	    			<img src="${pageContext.request.contextPath}/image/login/QR_code.png" width="60" height="40"/><b>扫一扫</b>
	    		</div>
    		</a>
  		</header>
  		
  		<main role="main">
  			<div class="register">
  				<div class="registerWord">
  					<img src="${pageContext.request.contextPath}/image/user/userRegister01.png" width="140" height="45" class="imgRegister"/>
  					<a href="${pageContext.request.contextPath}/login/ssm_Login.jsp" class="return">
  						<img src="${pageContext.request.contextPath}/image/user/registerBack.png" width="30" height="35"/>
  					</a>
  				</div>
  				<div class="getInfo">
  					<b class="errorMes">${errorMap.PhoneNumNull}${errorMap.CodeNull}${errorMap.codeError}${errorMap.samePhone}${errorMap.registerError}</b>
  					<form action="<c:url value='/user/user_Register_setPwd'/>" method="post">
	  					<div class="phoneNum">
	  						<img src="${pageContext.request.contextPath}/image/user/phoneNum.png" width="28" height="30" class="imgPhoneNum"/>
							<input type="text" name="phonenumber" placeholder="请输入手机号" class="inputPhoneNum"/>
							<a href="#" onclick="createCode()" class="getNum">
								<div class="divgetNum">
									<img src="${pageContext.request.contextPath}/image/user/getNum02.png" width="150" height="50" class="imggetNum"/>
								</div>
							</a>
	  					</div>
	  					<div class="checkNum">
	  						<img src="${pageContext.request.contextPath}/image/user/checkNum.png" width="28" height="30" class="imgCheckNum"/>
							<input type="text" name="checknumber" placeholder="请输入短信验证码" class="inputCheckNum" />
	  						<input type="text" name="codeNum" class="inputeCodeNum" id="code"/>
	  					</div>
	  					<div>
					    	<input type="submit" name="userRegisterSetPwd" value="提交" class="userRegister"/>
					    </div>
				    </form>
  				</div>
  				
  			</div>
  		</main>
  		
  		<aside role="complementary">
  			<div class="side">
				让人<b>迷茫</b>的<b>原因</b>只有一个</br>那就是<b>本该拼搏</b>的年纪</br>却<b>想</b>的太<b>多</b></br><b>做</b>的太<b>少！</b>
			</div>
  		</aside>
  		
  		<footer role="contentinfo">
    		
    	</footer>
  	
  	</div>
  </body>
</html>
<script>
var code ; //在全局定义验证码   

function createCode(){ 
     code = "";    
     var codeLength = 4;//验证码的长度   
     var checkCode = document.getElementById("code");    
     var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',   
     'S','T','U','V','W','X','Y','Z');//随机数   
     for(var i = 0; i < codeLength; i++) {//循环操作   
        var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）   
        code += random[index];//根据索引取得随机数加到code上   
    }   
    checkCode.value = code;//把code值赋给验证码   
} 
</script>
