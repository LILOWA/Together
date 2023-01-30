<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<!-- 부트 스트랩보다 css가 더 우선적으로 작동할 수 있도록 css를 나중에 작성 -->
<link href="resources/css/mbti/style.css" rel="stylesheet"> 

<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> -->
<script type="text/javascript" src="/resources/js/chat/sockjs.js"></script>
<script type="text/javascript">
	var wsocket;
	
	function connect() {
		wsocket = new SockJS("http://localhost:8080/chat");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	
	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		wsocket.send("msg:"+nickname+":" + msg);
		$("#message").val("");
	}
	
	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}
	
	$(document).ready(function() {
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
</script>

<style>
#chatArea {
	width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}
</style>

<main class="layoutCenter">
	<div id="container" class="container2">
		<h1>채팅</h1>
		<div id="chating" class="chating"></div>

		이름:<input type="text" id="nickname"> 
			<input type="button" id="enterBtn" value="입장"> 
			<input type="button" id="exitBtn" value="나가기">

		<h1>대화 영역</h1>
		<div id="chatArea">
			<div id="chatMessageArea"></div>
		</div>
		<br /> 
		<input type="text" id="message"> 
		<input type="button" id="sendBtn" value="전송">


	</div>
</main>


