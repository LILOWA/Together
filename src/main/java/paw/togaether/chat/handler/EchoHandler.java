package paw.togaether.chat.handler;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//메세지를 주고받을 때 사용하는 핸들러 상속
public class EchoHandler extends TextWebSocketHandler {
	@Override//연결됬을 때 메소드 오버라이드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.printf("%s 연결 됨\n", session.getId());
	}

	@Override//메세지 주고받는 메소드 오버라이드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {//세션으로 데이터를 받는다
		System.out.printf("%s로부터 [%s] 받음\n", session.getId(), message.getPayload());
		//보내기. getPayload 메소드로 메세지를 꺼내 세션으로 전달한다
		session.sendMessage(new TextMessage("echo: " + message.getPayload()));
	}

	@Override//연결이 종료됬을 때 메소드 오버라이드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.printf("%s 연결 끊김\n", session.getId());
	}
}
