package com.pro.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.ReReplyDAO;
import com.pro.dao.ReReply;

@Service
public class ReReplyService {
	@Autowired private ReReplyDAO dao;
	
	public ReReply insert(String visit, ReReply vo) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		vo.setRrdate(time);
		dao.insert(visit, vo);
 		return vo;
	}

	
	public List<ReReply> selectAll(String visit, String bnum) {
		return dao.selectAll(visit, bnum);
	}
	
	public void update(String visit, ReReply vo) {
		dao.update(visit, vo);
	}
	
	public void delete(String visit, String rrnum) {
		dao.delete(visit, rrnum);
	}
	
}
