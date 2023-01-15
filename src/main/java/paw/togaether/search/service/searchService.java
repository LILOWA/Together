package paw.togaether.search.service;

import java.util.List;
import java.util.Map;

public interface searchService {
	
	List<Map<String, Object>> search_board_list(Map<String, Object> map) throws Exception;

}
