package paw.togaether.search.controller;

import java.util.List;
import java.util.Map;

/* 23.01.15 이소영 :  main 검색 기능 메소드 작성 */

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.search.service.searchService;

@Controller
public class searchController {

	@Resource(name = "searchService")
	private searchService searchService;
/*	@Resource(name = "boardService")
	private BoardService boardService;

	
	@RequestMapping(value = "/main0")
	public ModelAndView boardSearchList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/main/search");
		List<Map<String, Object>> list = searchService.search_board_list(commandMap.getMap());

		mv.addObject("list", list); //글번호,제목,조회수,작성자,작성날짜 담아줌

		return mv;
	}
*/
	
	@RequestMapping(value = "/main0")
	public ModelAndView boardSearchList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/main/search");

		return mv;
	}
	
	@RequestMapping(value = "/search")
	public ModelAndView search_list (CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsnoView");
		
		List<Map<String, Object>> list = searchService.search_board_list(commandMap.getMap());
		mv.addObject("list", list);
		
		if(list.size() > 0){
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}
		else{
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
}
