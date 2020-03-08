package com.pro.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pro.dao.Design;
import com.pro.dao.Member;
import com.pro.dao.PagingVO;
import com.pro.dao.QNAVO;
import com.pro.service.BoardService;
import com.pro.service.MemberService;
import com.pro.service.QNAService;
import com.pro.service.designService;

@Controller
public class HomeController {

	@Autowired
	private MemberService memberservice;
	@Autowired
	private BoardService boardservice;
	@Autowired
	private QNAService qs;

	@RequestMapping("test")
	public ModelAndView test() {
		return new ModelAndView("my");
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpSession session,
			HttpServletRequest req, String menu, QNAVO qna, String qnum) {
		ModelAndView mv = new ModelAndView("login/mainlogin");
		if (session.getAttribute("login") != null) {
			List<Member> list = memberservice.getlist();
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i));
			}
			mv.addObject("list", list);
			if (menu != null) {
				if (menu.equals("board")) {
					int total = boardservice.countBoard();
					if (nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "5";
					} else if (nowPage == null) {
						nowPage = "1";
					} else if (cntPerPage == null) {
						cntPerPage = "5";
					}
					PagingVO page = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					mv.addObject("paging", page);
					mv.addObject("viewAll", boardservice.selectBoard(page));
				} else if (menu.equals("qna")) {
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
				} else if (menu.equals("qnawrite")) {
					if (qna.getQtitle() == null || "".equals(qna.getQtitle())) {
						mv.setViewName("qna/newQNA");
					} else {
						qna = qs.insert(qna, req);
						mv.setViewName("redirect:/?menu=view?qnum=" + qs.getMaxQnum());
						mv.addObject("qna", qna);
					}
				} else if (menu.equals("view")) {
					QNAVO qnavo = qs.selectOne(Integer.parseInt(qnum));
					mv.addObject("qnavo", qnavo);
				}
		}
		System.out.println("login");
		mv.setViewName("home2");
	}

	return mv;

	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView home(Member m, HttpSession session, HttpServletRequest req, HttpServletResponse response,
			String auto) {
		ModelAndView mv = new ModelAndView("home2");
		Member member = memberservice.login(m);
		if (member != null) {
			session.setAttribute("ctx", req.getContextPath());
			session.setAttribute("login", member);
			List<Member> list = memberservice.getlist();
			mv.addObject("list", list);
			if (auto != null) {
				Cookie c = new Cookie("JSESSIONID", session.getId());
				c.setMaxAge(60 * 60 * 12 * 7);
				response.addCookie(c);
				session.setMaxInactiveInterval(60 * 60 * 12 * 7);
				session.setAttribute("login", member);
			}

		} else {
			mv.setViewName("login/mainlogin");
			mv.addObject("fail", "로그인 실패");
		}

		return mv;

	}

//	// 2020 02 05 源��쉶以� �닔�젙
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public ModelAndView home(@RequestParam(value="nowPage", required=false)String nowPage,
//			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
//			HttpSession session, HttpServletRequest req) {
//		ModelAndView mv = new ModelAndView("home");
//		
//		session.setAttribute("ctx", req.getContextPath());
//		
//		// paging
//		int total = boardservice.countBoard();
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) { 
//			cntPerPage = "5";
//		}
//		PagingVO page = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		mv.addObject("paging", page);
//		mv.addObject("viewAll", boardservice.selectBoard(page));
//		
//		return mv;
//	}
//	
//	// 2020 02 05 源��쉶以� �닔�젙
//	@RequestMapping(value = "/", method = RequestMethod.POST)
//	public ModelAndView home(Member m, HttpSession session) {
//		ModelAndView mv = new ModelAndView("redirect:/");
//
//		Member member = memberservice.login(m);
//		
//		if (member != null) { 									// 濡쒓렇�씤 �꽦怨�
//			session.setAttribute("login", member);				// 濡쒓렇�씤 �꽦怨� �떆 �꽭�뀡�뿉 濡쒓렇�씤 �젙蹂� ���옣
//		} else {												// 濡쒓렇�씤 �떎�뙣
//			session.setAttribute("login", "login fail");		// 濡쒓렇�씤 �꽦怨� �떆 �꽭�뀡�뿉 濡쒓렇�씤 �젙蹂� ���옣
//		}
//		return mv;
//	}

	// 2020 02 05 源��쉶以� �닔�젙
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public ModelAndView join() {
		return new ModelAndView("login/joinform");
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public ModelAndView join(Member m, Model model) {
		int row = memberservice.join(m);
		if (row == 1) {
			row = memberservice.create(m.getUserid());
			if (row == 1) {
				row = memberservice.create2(m.getUserid());
				if (row == 1) {
					row = memberservice.create3(m.getUserid());
					if (row == 1) {
						row = memberservice.create4(m.getUserid());
						if (row == 1) {
							row = memberservice.seq1(m.getUserid());
							row = memberservice.seq2(m.getUserid());
							row = memberservice.seq3(m.getUserid());
							return new ModelAndView("login/joinresult");
						} else {
							try {
								memberservice.dropsequence(m.getUserid() + "_bnum");
							} catch (Exception e) {
							}
							try {
								memberservice.dropsequence(m.getUserid() + "_rnum");
							} catch (Exception e) {
							}
							try {
								memberservice.dropsequence(m.getUserid() + "_rrnum");
							} catch (Exception e) {
							}
						}
					} else {
						try {
							memberservice.dropTable(m.getUserid() + "add");
						} catch (Exception e) {
						}
					}
				} else {
					try {
						memberservice.dropTable(m.getUserid() + "rereply");
					} catch (Exception e) {
					}
				}
			} else {
				try {
					memberservice.dropTable(m.getUserid() + "reply");
				} catch (Exception e) {
				}
			}
		} else {
			try {
				memberservice.dropTable(m.getUserid());
			} catch (Exception e) {
			}
		}
		return new ModelAndView("login/joinform");

	}

	@RequestMapping(value = "findid", method = RequestMethod.GET)
	public ModelAndView findid() {
		return new ModelAndView("login/findID");
	}

	@RequestMapping(value = "findid", method = RequestMethod.POST)
	public ModelAndView findid(Member m) {
		ModelAndView mv = new ModelAndView("login/findid_result");
		if (m.getName() != null) {
			mv.addObject("result", memberservice.findID(m.getName(), m.getFront(), m.getBack()));
		}
		return mv;
	}

	@RequestMapping(value = "findpw", method = RequestMethod.GET)
	public ModelAndView findpw() {
		return new ModelAndView("login/findPW");
	}

	@RequestMapping(value = "findpw", method = RequestMethod.POST)
	public ModelAndView findpw(Member m) {
		ModelAndView mv = new ModelAndView("login/changepw");
		Member vo = memberservice.findPW(m.getUserid(), m.getFront(), m.getBack());
		if (vo == null) {
			mv.setViewName("login/findPW");
			mv.addObject("result", "�씪移섑븯�뒗 �젙蹂닿� �뾾�쓬");
		} else {
			mv.addObject("userid", vo.getUserid());
		}
		return mv;
	}

	// 2020 02 05 源��쉶以� �닔�젙
	@RequestMapping(value = "chagepw")
	public ModelAndView changepw(Member m) {
		ModelAndView mv = new ModelAndView("login/changepw_result");
		int row = memberservice.changepw(m.getUserpw(), m.getUserid());
		System.out.println(row);
		if (row != 1) {
			mv.setViewName("login/changepw");
		}
		return mv;
	}

	@Autowired
	private designService designservice;

	@RequestMapping(value = "design", method = RequestMethod.GET)
	public ModelAndView design(HttpSession session) {
		ModelAndView mv = new ModelAndView("board/design");
		Member member = (Member) session.getAttribute("login");
		Design design = designservice.getstyle(member.getUserid());
		mv.addObject("design", design);
		return mv;
	}

	@RequestMapping(value = "design", method = RequestMethod.POST)
	public ModelAndView design(Design design, HttpSession session, String title) {
		Member member = (Member) session.getAttribute("login");
		member.setBlogname(title);
		memberservice.updatetitle(member, member.getUserid());
		Member m = (Member) session.getAttribute("login");
		designservice.design(design, m.getUserid());
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}

}
