package paw.togaether.chat.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Component
@Log4j
public class ChattingHandler extends TextWebSocketHandler {
	
	//맵에 접속한 유저 정보를 저장하기 위해 문자열과 세션을 저장한다.
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨");
		//필드에 유저 정보 저장
		users.put(session.getId(), session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		users.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		//클라이언트 목록에 보관된 모든 클라이언트에게 메세지를 전달하는 로직
		//맵에 들어있는 값(유저들)을 이용해 세션을 만든다
		for (WebSocketSession s : users.values()) {
			s.sendMessage(message);//만든 세션에 메세지를 전달
			log(s.getId() + "에 메시지 발송: " + message.getPayload());//로그 찍기
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
}
