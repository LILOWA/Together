<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<script type="text/javascript" src="/resources/js/chat/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	var wsocket;
	function connect() {
		wsocket = new WebSocket("ws://localhost:8080/chat-ws");
		//처리 함수 지정
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() { wsocket.close(); }//종료
	function onOpen(evt) { appendMessage("연결되었습니다."); }
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) { appendMessage("연결을 끊었습니다."); }
	
	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		wsocket.send("msg:"+nickname+":" + msg);
		$("#message").val("");
	}

	function appendMessage(msg) {//메세지를 받기
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){//엔터면
				send();//보내기 함수 실행
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });//버튼 클릭 시 알맞는 함수 실행
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
</script>
<style>
#chatArea {
	width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}
</style>
</head>
<body>
	이름:<input type="text" id="nickname">
	<input type="button" id="enterBtn" value="입장">
	<input type="button" id="exitBtn" value="나가기">
    
    <h1>대화 영역</h1>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>