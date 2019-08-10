<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="sejongDeveloper">
<meta name="description" content="회원정보를 입력하여 회원가입하는 페이지">
<title>회원가입</title>

<link rel="stylesheet" href="${contextPath }/css/memWrite.css">
	
</head>
<body>

<div id="memWrite">

<form action="${contextPath }/memWritePro.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
	<div class="subject"><label for="mem_id">아이디</label></div>
	<div class="inputBack" id="idDiv">
		<input type="text" name="mem_id" class="inputReal" id="mem_id" onfocusout="idValidate()" onfocusin="basic('idDiv')">
		<div class="imgDiv"><img src="${contextPath }/view/mem/upload/test.svg"></div>
	</div>
	<span class="outmsg" id="outIdMsg"></span>

	<div class="subject"><label for="mem_pwd">비밀번호</label></div>
	<div class="inputBack" id="pwdDiv">
		<input type="password" name="mem_pwd" class="inputReal" id="mem_pwd" onfocusout="pwdValidate()" onfocusin="basic('pwdDiv')">
		<div class="imgDiv"><img src="${contextPath }/view/mem/upload/test.svg"></div>
	</div>
	<span class="outmsg" id="outPwdMsg"></span>
	
	<div class="subject"><label for="mem_pwdChk">비밀번호 재확인</label></div>
	<div class="inputBack" id="pwdChkDiv" >
		<input type="password" name="mem_pwd" class="inputReal" id="mem_pwdChk" onfocusout="pwdChkValidate()" onfocusin="basic('pwdChkDiv')">
		<div class="imgDiv"><img src="${contextPath }/view/mem/upload/test.svg"></div>
	</div>
	<span class="outmsg" id="outPwdChkMsg"></span>

	<div class="subject"><label for="mem_name">이름</label></div>
	<div class="inputBack" id="nameDiv">
		<input type="text" name="mem_name" class="inputReal" id="mem_name" onfocusout="basicValidate(this.id, 'nameDiv', 'outNameMsg')" onfocusin="basic('nameDiv')">
		<div class="imgDiv"><img src="${contextPath }/view/mem/upload/test.svg"></div>
	</div>
	<span class="outmsg" id="outNameMsg"></span>

	<div class="subject"><label for="mem_ph">전화번호</label></div>
	<div class="inputBack" id="phDiv">
		<input type="text" name="mem_ph" class="inputReal" id="mem_ph" onfocusout="basicValidate(this.id,'phDiv', 'outPhMsg')" onfocusin="basic('phDiv')">
		<div class="imgDiv"><img src="${contextPath }/view/mem/upload/test.svg"></div>
	</div>
	<span class="outmsg" id="outPhMsg"></span>

	<div class="subject"><label for="mem_addr">주소</label></div>
	<div class="inputBack" id="addrDiv">
		<input type="text" name="mem_addr" class="inputReal" id="mem_addr" onfocusout="basicValidate(this.id,'addrDiv', 'outAddrMsg')" onfocusin="basic('addrDiv')">
		<div class="imgDiv"><img src="${contextPath }/view/mem/upload/test.svg"></div>
	</div>
	<span class="outmsg" id="outAddrMsg"></span>

	<div class="subject"><label for="mem_id">파일</label></div>
	<input type="file" name="mem_filename" id="mem_filename"><br>
	
	<input type="submit" value="회원가입" >
</form>

</div>
</body>

<script type="text/javascript" src="${contextPath }/view/mem/js/memWrite.js"></script>

</html>