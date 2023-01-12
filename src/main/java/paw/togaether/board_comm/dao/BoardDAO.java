package paw.togaether.board_comm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	
	//멍멍왈왈 게시판 글쓰기
	public void boardWrite(Map<String, Object> map) throws Exception {
		insert("Board.boardWrite", map);
	}
	
	//멍멍왈왈 게시판 리스트 띄우기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("Board.boardList", map);
	}
	

}
