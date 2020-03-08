package com.pro.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.PagingVO;
import com.pro.dao.blogBoard;
import com.pro.dao.blogBoardDAO;

@Service
public class blogBoardService {
	@Autowired
	private blogBoardDAO dao;

	public List<blogBoard> getBoard(String userid) {
		return dao.getBoard(userid);
	}


	public List<blogBoard> selectAll(String userid) {
		return dao.selectAll(userid);
	}
	public int maxbnum() {
		return dao.maxBnum();
	}
	public int maxnum(String visit) {
		return dao.maxnum(visit);
	}

	public blogBoard insert(blogBoard vo, HttpServletRequest request, String visit) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		vo.setBoarddate(time);	
		String ip = request.getRemoteAddr();
		vo.setIp(ip);	
		dao.insert(vo,visit);
		
 		return vo;
	}

	public blogBoard selectOne(int bnum,String visit, String id) {	
		return dao.selectOne(bnum,visit, id);
	}

	public int update(blogBoard vo,String id, HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		return dao.update(vo, id);		
	}

	public int delete(int bnum, String id) {
		return dao.delete(bnum,id);
		
	}

	public int countBoard(String id) {
		return dao.countBoard(id);
	}

	public List<blogBoard> selectBoard(PagingVO page,String id) {
		return dao.selectBoard(page,id);
	}

	
	//===================
	
	
//	public blogBoard insert(blogBoard vo, HttpServletRequest request) {
//		Date date = new Date();
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String time = format.format(date);
//		vo.setBoarddate(time);
//		String ip = request.getRemoteAddr();
//		vo.setIp(ip);
//		dao.insert(vo);
// 		return vo;
//	}
//	
//	public List<blogBoard> selectAll() {
//		return dao.selectAll();
//	}
//	
//	public blogBoard selectOne(int bnum) {
//		return dao.selectOne(bnum);
//	}
//	
//	public void update(blogBoard vo) {
//		dao.update(vo);
//	}
//	
//	public void delete(int bnum) {
//		dao.delete(bnum);
//	}
//	
//	public int countBoard() {
//		return dao.countBoard();
//	}
//	
//	public List<blogBoard> selectBoard(PagingVO vo){
//		return dao.selectBoard(vo);
//	}
//	
//	public int getMaxBnum() {
//		return dao.maxBnum();
//	}
//
//	public List<blogBoard> searchAll(String search,String select) {
//		return dao.searchAll(search,select);
//		
//	}
	

}
