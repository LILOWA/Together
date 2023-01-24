package paw.togaether.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;
import paw.togaether.common.dao.AbstractDAO2;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO2 {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList_B("main.boardSearchList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList_T("main.togetherSearchList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> placeSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList_P("main.placeSearchList", map);
	}
	

}
