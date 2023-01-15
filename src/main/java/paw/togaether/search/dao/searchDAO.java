package paw.togaether.search.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("searchDAO")
public class searchDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> search_board_list(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("search.search_board_list", map);
	}
	
}
