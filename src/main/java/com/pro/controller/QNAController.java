package com.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pro.dao.QNAVO;
import com.pro.service.UpdateService;
import com.pro.dao.PagingVO;
import com.pro.service.QNAService;

@Controller
public class QNAController {
@Autowired private QNAService qs;
	
	@RequestMapping(value="qnahome")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = qs.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", qs.selectQNA(vo));
		return "qna/qnahome";
	}
	
	@RequestMapping(value="newQNA", method=RequestMethod.POST)
	public ModelAndView newBoard(QNAVO vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (vo.getQtitle() == null || "".equals(vo.getQtitle())) {
			mv.setViewName("redirect:/?menu=qnawrite");
		} else {
			vo = qs.insert(vo, request);
			mv.setViewName("redirect:/?menu=view&qnum="+qs.getMaxQnum());
			mv.addObject("vo", vo);
		}
		return mv;
	}
	
//	@RequestMapping(value = "qnaresult", method = RequestMethod.GET)
//	public ModelAndView result(String qnum, HttpSession session) {
//		ModelAndView mv = new ModelAndView("qna/qnaresult");
//		QNAVO vo = qs.selectOne(Integer.parseInt(qnum));
//		mv.addObject("vo", vo);
//
//		return mv;
//	}
//	
	@RequestMapping(value="qnaresult", method=RequestMethod.POST)
	public ModelAndView result(QNAVO vo, String qnaupdate) {
		ModelAndView mv = new ModelAndView("redirect:/?menu=view&qnum="+vo.getQnum());
		if(qnaupdate == null) {
			qs.qnaReplyInsert(vo);
		} else {
			qs.qnaReplyUpdate(vo);
		}
		return mv;
	}
//
//	@RequestMapping(value = "qnaupdate", method = RequestMethod.GET)
//	public ModelAndView update(String qnum) {
//		ModelAndView mv = new ModelAndView("qna/qnaUpdateForm");
//		QNAVO vo = qs.selectOne(Integer.parseInt(qnum));
//		mv.addObject("vo", vo);
//		return mv;
//	}

	@RequestMapping(value = "qnaupdate", method = RequestMethod.POST)
	public ModelAndView update(QNAVO qnavo) {
		ModelAndView mv = new  ModelAndView("redirect:/?menu=view&qnum=" + qnavo.getQnum());
		mv.addObject("qnavo", qnavo);
		qs.update(qnavo);
		return mv;
	}

	@RequestMapping("qnadelete")
	public ModelAndView delete(String qnum) {
		System.out.println("qum:"+qnum);
		qs.delete(Integer.parseInt(qnum));
		
		ModelAndView mv = new ModelAndView("redirect:/?menu=qna");
		return mv;
	}
	
	@Autowired private UpdateService us;
	@RequestMapping(value="/qnaupdateForm", produces="application/text;charset=utf8")
	@ResponseBody
	public String qnaupdateForm(String writerdata, String contextdata, String textarea, String title) {
		return us.updateForm(writerdata, contextdata, textarea, title);
	}
	
	@RequestMapping(value="/qnareplyForm*", produces="application/text;charset=utf8")
	@ResponseBody
	public String qnareplyForm(String writerdata, String contextdata, String textarea, String title) {
		return us.updateForm(writerdata, contextdata, textarea, title);
	}


}
