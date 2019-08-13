<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 컨텍스트 패스(절대위치) 값 변수에 저장 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="sejongDeveloper">
<meta name="description" content="아이디 찾아주는 페이지">
<title>아이디 찾기</title>

<!-- css파일 읽어오기 -->
<link rel="stylesheet" href="${contextPath }/css/memId.css">

<!-- 파라미터 값(err)가 비어있지 않다면 javascript 실행 -->
<c:if test="${not empty param.err }">
<script type="text/javascript">
	alert("입력한 회원정보와 일치하는 아이디가 없습니다");
</script>
</c:if>

</head>
<body>
<!-- jstl include -->
<jsp:include page="/view/main/header.jsp" />
<jsp:include page="/view/main/weather.jsp" />
<jsp:include page="/view/main/money.jsp" />
<div id="memId">

<div class="subject">아이디 찾기</div>
<span id="id"><hr></span><span><hr></span>
<div id="idDetail">회원 정보를 입력해 주세요.</div>

<!-- form 태그 -->
<form action="${pageContext.request.contextPath }/memIdPro.do">
<div class="main">
	<h4>본인 확인 후 아이디를 찾아드립니다.</h4>
	<div class="name"><label for="mem_name">이름</label></div>
	<div class="data"><input type="text" name="mem_name" id="mem_name"></div><br>

	<div class="name"><label for="mem_addr">주소</label></div>
	<div class="data"><input type="text" name="mem_addr" id="mem_addr"></div><br>
</div>
	<input type="submit" value="다음">
</form>

</div>

<!-- jstl include -->
<jsp:include page="/view/main/footer.html" />

</body>
</html>
