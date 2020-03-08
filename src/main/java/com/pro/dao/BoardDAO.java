package com.pro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired private SqlSessionTemplate template;
	public Board initBoard(String nickname) {
		String sql="select *from blogmember where nickname='"+nickname+"'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println(sql);
		return template.selectOne("init", map);
	}

	public List<Board> selectAll() {
		return template.selectList("boardDAO.readAll");
	}
	
	public int countBoard() {
		int i = template.selectOne("boardDAO.countBoard");
		return i;
	}
	
	public List<Board> selectBoard(PagingVO vo) {
		return template.selectList("boardDAO.selectBoard", vo);
	}

	
}
