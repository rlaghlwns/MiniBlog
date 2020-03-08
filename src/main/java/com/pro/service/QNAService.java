package com.pro.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.QNAVO;
import com.pro.dao.PagingVO;
import com.pro.dao.QNADAO;

@Service
public class QNAService {
	@Autowired private QNADAO dao;
	public QNAVO insert(QNAVO vo, HttpServletRequest request) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		vo.setQdate(time);
		dao.insert(vo);
 		return vo;
	}
	public int getMaxQnum() {
		return dao.maxQnum();
	}
	public int countBoard() {
		return dao.countBoard();
	}
	public Object selectQNA(PagingVO vo) {
		return dao.selectQNA(vo);
	}
	
	public List<QNAVO> selectAll() {
		return dao.selectAll();
	}
	
	public QNAVO selectOne(int qnum) {
		return dao.selectOne(qnum);
	}
	
	public void update(QNAVO vo) {
		dao.update(vo);
	}
	
	public void delete(int qnum) {
		dao.delete(qnum);
	}
	
	public QNAVO qnaReplyInsert(QNAVO vo) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		vo.setQdate(time);
		dao.qnaReplyInsert(vo);
 		return vo;
	}
	
	public void qnaReplyUpdate(QNAVO vo) {
		dao.qnaReplyUpdate(vo);
	}
	
	public void qnaDelete(int qnum) {
		dao.qnaDelete(qnum);
	}

}
