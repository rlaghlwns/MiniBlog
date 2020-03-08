package com.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.Board;
import com.pro.dao.BoardDAO;
import com.pro.dao.PagingVO;

@Service
public class BoardService {
	@Autowired private BoardDAO Bdao;
	
	public Board initBoard(String nickname) {
		return Bdao.initBoard(nickname);
	}
	
	public List<Board> selectAll() {
		return Bdao.selectAll();
	}
	
	public int countBoard() {
		return Bdao.countBoard();
	}
	
	public List<Board> selectBoard(PagingVO vo){
		return Bdao.selectBoard(vo);
	}
	
	
	
	
	
	
}
