
window.onload = function()
{
	$("#btnSend").click(function()
	{
		SendMsg();
	});
	
	//1초 간격으로 실행하기
	setInterval(function() 
	{ 
		GetMsg();
	}, 1000);	
			
	GetMsg();
}

function SendMsg()
{
	if($("#msg").val() == "")
	{
		alert("발송 할 메시지를 입력하세요.");
		$("#msg").focus();
		return false;
	}
	var postData = "";
	postData = "msg=" + $("#msg").val();
	
	$.ajax({
		type : "post",
		url: "sendmsg.jsp",
		data: postData,
		dataType: "html",
		success : function(data) 
		{
			$("#msg").val("");
			$("#msg").focus();
			
			GetMsg();
		}
	});	
	
	return false;
}

var last_cno = "0";
function GetMsg()
{
	$.ajax({
		type : "get",
		url: "getmsg.jsp?cno=" + last_cno,
		dataType: "xml",
		success : function(data) 
		{
			// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
			$(data).find("msg").each(function(){			
				var cno    = $(this).find("no").text();
				var uname  = $(this).find("name").text();
				var cnote  = $(this).find("note").text();
				var cwdate = $(this).find("wdate").text();
				var messageHtml = "";
				
				if (uname === myNick) {
				      messageHtml = "<div style='text-align:right;'>[" + uname + "] " + cnote + "</div>";
				} else {
				      messageHtml = "<div>[" + uname + "] " + cnote + "</div>";
				}
				
				$("#chatMsg").append(messageHtml);
				last_cno = cno;			
				
			});
		}
	});		
}
