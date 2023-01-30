package paw.togaether.chat.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import paw.togaether.chat.handler.ChattingHandler;
/*
@Configuration 		//설정파일을 만들기 위한 어노테이션
@EnableWebSocket	//웹소켓에 대해 대부분 자동설정
public class WebSocketConfig implements WebSocketConfigurer {

	@Autowired
	ChattingHandler chattingHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chattingHandler, "/chat");
	}
}
*/

@Configuration              //설정파일을 만들기 위한 어노테이션    
@RequiredArgsConstructor          
@EnableWebSocket			//웹소켓에 대해 대부분 자동설정   
@Log4j
public class WebSocketConfig implements WebSocketConfigurer {
/*
	@Autowired
    private final ChattingHandler chattingHandler;
*/
	@Bean
	public ChattingHandler chattingHandler() {
		return new ChattingHandler();
	}
	
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//        registry.addHandler(chattingHandler, "/chat.paw").setAllowedOrigins("*");
    	registry.addHandler(chattingHandler(), "/chat.paw").withSockJS();
    	log.info("=============================");
    	log.info("config 접근");
    }
}