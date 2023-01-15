package paw.togaether.search.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import paw.togaether.search.dao.searchDAO;

@Service("searchService")
public class searchServiceImpl implements searchService {
	
	@Resource(name = "searchDAO")
	private searchDAO searchDAO;

	@Override
	public List<Map<String, Object>> search_board_list(Map<String, Object> map) throws Exception {
		return searchDAO.search_board_list(map);
	}
	

}
