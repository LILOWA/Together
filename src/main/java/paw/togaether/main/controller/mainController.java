package paw.togaether.main.controller;

import java.util.List;
import java.util.Map;

/* 23.01.15 이소영 :  main 검색 기능 메소드 작성 */

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.main.service.mainService;

@Controller
public class mainController {

	@Resource(name = "mainService")
	private mainService mainService;
	
	@RequestMapping(value = "/search/")
	public ModelAndView searchList (CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsnoView");
		
		List<Map<String, Object>> list = mainService.searchBoardList(commandMap.getMap());
		mv.addObject("list", list);
		
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
}
