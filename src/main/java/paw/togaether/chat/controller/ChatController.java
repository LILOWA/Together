package paw.togaether.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import paw.togaether.common.domain.CommandMap;

@Controller
@Log4j
public class ChatController {

	@RequestMapping("/chat")
	public ModelAndView chat(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("chat/chat");
		
		session = request.getSession(false);
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + commandMap.get(""));
		
		model.addAttribute("userid", user.getUsername());
		
		return mv;
	}
}
