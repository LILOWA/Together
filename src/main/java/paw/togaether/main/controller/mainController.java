package paw.togaether.main.controller;

/* 23.01.15 이소영 :  main 검색 기능 메소드 작성 */

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import paw.togaether.main.service.mainService;

@Controller
public class mainController {

	@Resource(name = "mainService")
	private mainService mainService;
	
	@RequestMapping(value = "/")
}
