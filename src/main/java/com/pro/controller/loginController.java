package com.pro.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pro.dao.Member;
import com.pro.service.MemberService;

@Controller
public class loginController {
	@Autowired private MemberService memberservice;

	@RequestMapping("idcheck")
	@ResponseBody
	public String loginCheck(String userid) {
		String str = memberservice.checkedID(userid);
		return str;
	}

	@RequestMapping("idnumrow")
	@ResponseBody
	public String idnumrow(String front, String back) {
		
		int row = memberservice.getidnum(front, back);
		System.out.println(row);
		if (row == 0) {
			return "new";
		} else {
			System.out.println("이미존재");
			return "exist";
		}
	}

	@RequestMapping("idNumcheck")
	@ResponseBody
	public String idNumCheck(String front, String back) {

		String str = front + back;
		if (str.length() != 13) {
			return "false";
		}
		int logic[] = { 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 };
		int sum = 0, num = 0;
		for (int i = 0; i < 12; i++) {
			sum += logic[i] * Integer.parseInt(str.substring(i, i + 1));
		}
		num = 11 - sum % 11;
		num = num % 10;
		if (num == Integer.parseInt(str.substring(12, 13))) {
			System.out.println("true");
			return "true";
		} else
			return "false";
	}

	@RequestMapping(value = "nickcheck", method = RequestMethod.GET)
	@ResponseBody
	public int nickcheck(@RequestParam("nickname") String nickname) {
		System.out.println("nick중복체크:" + memberservice.checkedNick(nickname));
		return memberservice.checkedNick(nickname);
	}

	@RequestMapping(value = "nickcheck2", method = RequestMethod.GET)
	@ResponseBody
	public String nickcheck2(@RequestParam("nickname") String nickname, HttpSession session) {
		Member vo = (Member) session.getAttribute("login");
		if (vo.getNickname().equals(nickname)) {
			System.out.println("true");
			return "true";
		} else {
			System.out.println("false");
			return "false";
		}
	}
	
	
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public ModelAndView info() {
		return new ModelAndView("login/info");
	}
	// 2020 02 05 김회준 수정 - info
	@RequestMapping(value = "info", method = RequestMethod.POST)
	public ModelAndView info(String userpw, HttpSession session) {
		ModelAndView mv = new ModelAndView("login/info");
		Member member = (Member) session.getAttribute("login");
		if (member.getUserpw().equals(userpw)) {
			mv.setViewName("login/update");
			return mv;
		}
		mv.addObject("fail", "비밀번호가 일치하지 않습니다.");
		return mv;
	}
	
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String changeinfo() {
		return "login/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView changeinfo(Member m, HttpSession session) {
		ModelAndView mv = new ModelAndView("login/updateresult");
		
		Member vo = (Member) session.getAttribute("login");

		int row = memberservice.update(m, vo.getUserid());
		Member member = memberservice.login(vo);
		if (row == 1) {
			session.setAttribute("login", member);
		}
		return mv;
	}

	@RequestMapping(value = "delmember", method = RequestMethod.GET)
	public ModelAndView delmember() {
		return new ModelAndView("login/delmember");
	}

	@RequestMapping(value = "delmember", method = RequestMethod.POST)
	public ModelAndView delmember(String name, String userid, String userpw, HttpSession session,
			HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		Member vo = (Member) session.getAttribute("login");
		String oldname = vo.getName();
		String oldid = vo.getUserid();
		String oldpw = vo.getUserpw();
		if (oldname.equals(name) && oldid.equals(userid) && oldpw.equals(userpw)) {
			memberservice.delmember(vo);
			session = request.getSession();
			session.invalidate();
			mv.setViewName("redirect:/");
			return mv;
		} else {
			mv.setViewName("login/delmember");
			return mv;
		}
	}
	
}
