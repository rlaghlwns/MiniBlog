package com.pro.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QNADAO {
	@Autowired private SqlSessionTemplate sql;
	
	public int insert(QNAVO vo) {
		int result = sql.insert("QNADAO.create", vo);
		return result;
	}
	
	public int maxQnum() {
		int result = sql.selectOne("QNADAO.maxQnum");
		return result;
	}

	public int countBoard() {
		return sql.selectOne("QNADAO.countQNA");
	}

	public List<QNAVO> selectQNA(PagingVO vo) {
		return sql.selectList("QNADAO.selectQNA", vo);
	}
	
	public List<QNAVO> selectAll() {
		return sql.selectList("QNADAO.readAll");
	}

	public QNAVO selectOne(int qnum) {
		return sql.selectOne("QNADAO.readOne", qnum);
	}
	
	public void update(QNAVO vo) {
		sql.update("QNADAO.update", vo);
	}
	
	public void delete(int qnum) {
		sql.update("QNADAO.delete", qnum);
	}

	public void qnaReplyInsert(QNAVO vo) {
		sql.update("QNADAO.replyinsert", vo);
	}

	public void qnaReplyUpdate(QNAVO vo) {
		sql.update("QNADAO.replyupdate", vo);
	}

	public void qnaDelete(int qnum) {
		sql.update("QNADAO.replydelete", qnum);
	}
}
