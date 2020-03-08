package com.pro.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pro.dao.ReReply;
import com.pro.dao.Reply;
import com.pro.service.ReReplyService;
import com.pro.service.UpdateService;

@Controller
public class ReReplyController {
	@Autowired private ReReplyService rrs;
	@RequestMapping(value="rereply", method=RequestMethod.POST )
	public ModelAndView reply(ReReply rrvo, Reply rvo, HttpSession session) throws UnsupportedEncodingException {
		String nickname = rrvo.getVisit();
		nickname = URLEncoder.encode(nickname, "UTF-8");
		ModelAndView mv = new ModelAndView("redirect:blog?nickname="+nickname+"&bnum="+rvo.getBnum());
		String visit=(String)session.getAttribute("blog");
		rrs.insert(visit, rrvo);
		return mv;
	}
	
	@RequestMapping(value="rrupdate")
	public ModelAndView replyupdate(ReReply rrvo, HttpSession session) throws UnsupportedEncodingException {
		String nickname = rrvo.getVisit();
		nickname = URLEncoder.encode(nickname, "UTF-8");
		ModelAndView mv=new ModelAndView("redirect:blog?nickname="+nickname+"&bnum="+rrvo.getBnum());
		String visit=(String)session.getAttribute("blog");
		rrs.update(visit, rrvo);
		return mv;
	}
	
	@RequestMapping(value="rrdelete")
	public ModelAndView reply(String rrnum, String bnum, String visit, HttpSession session) throws UnsupportedEncodingException {
		visit = URLEncoder.encode(visit, "UTF-8");
		ModelAndView mv = new ModelAndView("redirect:blog?nickname="+visit+"&bnum="+bnum);
		visit=(String)session.getAttribute("blog");
		rrs.delete(visit, rrnum);
		return mv;
	}
	
	@Autowired private UpdateService us;
	@RequestMapping(value="rrupdateForm*", produces="application/text;charset=utf8")
	@ResponseBody
	public String updateForm(String writerdata, String contextdata, String textarea) {
		return us.updateForm(writerdata, contextdata, textarea);
	}
}
