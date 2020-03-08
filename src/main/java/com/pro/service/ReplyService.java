package com.pro.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.Reply;
import com.pro.dao.ReplyDAO;

@Service
public class ReplyService {
	@Autowired private ReplyDAO dao;

	public Reply insert(Reply reply, String visit) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		reply.setRdate(time);
		dao.insert(reply,visit);
		return reply;

	}

	public List<Reply> selectAll(String visit, String bnum) {
		return dao.selectAll(visit, bnum);
	}
	
	public void delete(String visit, String rnum) {
		dao.delete(visit, rnum);
	}
	
	public void update(Reply reply, String visit) {
		dao.update(reply, visit);
	}
}
