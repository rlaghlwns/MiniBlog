package com.pro.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pro.dao.Reply;
import com.pro.service.ReplyService;
import com.pro.service.UpdateService;

@Controller
public class ReplyController {
	@Autowired private ReplyService replyservice;
	@RequestMapping(value = "reply")
	public ModelAndView reply(Reply reply,HttpSession session) throws UnsupportedEncodingException {
		String nickname = reply.getVisit();
		nickname = URLEncoder.encode(nickname, "UTF-8");
		ModelAndView mv=new ModelAndView("redirect:blog?nickname="+nickname+"&bnum="+reply.getBnum());
		String visit=(String)session.getAttribute("blog");
		replyservice.insert(reply,visit);
		return mv;
	}
	
	@RequestMapping(value="rupdate")
	public ModelAndView replyupdate(Reply reply,HttpSession session) throws UnsupportedEncodingException {
		String nickname = reply.getVisit();
		nickname = URLEncoder.encode(nickname, "UTF-8");
		ModelAndView mv=new ModelAndView("redirect:blog?nickname="+nickname+"&bnum="+reply.getBnum());
		String visit=(String)session.getAttribute("blog");
		replyservice.update(reply,visit);
		return mv;
	}
	
	@RequestMapping(value="rdelete")
	public ModelAndView reply(String rnum, String bnum, String visit, HttpSession session) throws UnsupportedEncodingException {
		visit = URLEncoder.encode(visit, "UTF-8");
		ModelAndView mv=new ModelAndView("redirect:blog?nickname="+visit+"&bnum="+bnum);
		String visit2=(String)session.getAttribute("blog");
		replyservice.delete(visit2, rnum);
		return mv;
	}
	
	@Autowired private UpdateService us;
	@RequestMapping(value="updateForm*", produces="application/text;charset=utf8")
	@ResponseBody
	public String updateForm(String writerdata, String contextdata, String textarea) {
		return us.updateForm(writerdata, contextdata, textarea);
	}
	
	@RequestMapping(value="replyForm*", produces="application/text;charset=utf8")
	@ResponseBody
	public String replyForm(String writerdata, String contextdata, String textarea) {
		return us.updateForm(writerdata, contextdata, textarea);
	}
	
}
