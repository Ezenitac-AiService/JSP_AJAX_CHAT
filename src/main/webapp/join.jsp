<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>채팅방 입장</title>
		<script src="jquery-3.7.1.js"></script>
	</head>
	<body>
		<script>
			window.onload = function()
			{
				$("#nick").focus();
			}
			
			function  DoJoin()
			{
				if($("#nick").val() == "")
				{
					alert("닉네임을 입력하세요!!");
					$("#nick").focus();
					return false;
				}
				return true;
			}
		</script>
		<form id="join" name="join" method="post" action="chat.jsp"
		onsubmit="return DoJoin();">
			닉네임 : <input type="text" size="10" id="nick" name="nick">
			<input type="submit" value="참여하기">
		</form>
	</body>
</html>