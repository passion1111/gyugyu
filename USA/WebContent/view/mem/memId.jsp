<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function idValidate() {
		var mem_id = $("#mem_id").val();
		$.ajax({
			type:"post",
			async:false,
			url:"../../memIdValidate.do",
			data:{idInfo:mem_id},
			success:function(data, textStatus){
				var jsonInfo = JSON.parse(data);
				var memberInfo = "?�원 ?�보<br>";
				memberInfo += "======<br>";
				console.log(memberInfo);
				for(var i in jsonInfo.members) {
					memberInfo += "?�름: " + jsonInfo.members[i].name + "<br>";
					memberInfo += "?�이: " + jsonInfo.members[i].age + "<br>";
				}
				console.log(memberInfo);
				$("#output").html(memberInfo);
				console.log(memberInfo);
				
			}
		});
	}
</script>
</head>
<body>
?�이?? : ${mem_id }
<form action="${pageContext.request.contextPath }/memIdPro.do">
	?�름 <input type="text" name="mem_name"><br>
	주소 <input type="text" name="mem_addr"><br>
	<input type="submit" value="찾기">

<form action="${pageContext.request.contextPath }/memWritePro.do" method="post" enctype="multipart/form-data">
	?�이?? : <input type="text" name="mem_id" id="mem_id"> <input type="button" value="?�이?�확??" onclick="idValidate()"><br>
	<div id="output"></div>
	비�?번호 : <input type="password" name="mem_pwd"><br>
	?�름 : <input type="text" name="mem_name"><br>
	?�화번호 : <input type="text" name="mem_ph"><br>
	주소 : <input type="text" name="mem_addr"><br>
	?�일 : <input type="file" name="mem_filename"><br>
	<input type="submit" value="?�원가??">
</form>
</body>
</html>
</head>
<body>
?�이?? : ${mem_id }
<form action="${pageContext.request.contextPath }/memIdPro.do">
	?�름 <input type="text" name="mem_name"><br>
	주소 <input type="text" name="mem_addr"><br>
	<input type="submit" value="찾기">
</form>
</body>
</html>