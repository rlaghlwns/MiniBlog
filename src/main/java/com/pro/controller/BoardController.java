package com.pro.controller;

import java.io.UnsupportedEncodingException;
//import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pro.dao.AddFriend;
import com.pro.dao.Board;
import com.pro.dao.Design;
import com.pro.dao.Member;
import com.pro.dao.PagingVO;
import com.pro.dao.blogBoard;
import com.pro.service.AddfriendService;
import com.pro.service.BoardService;
import com.pro.service.EditerService;
import com.pro.service.MemberService;
import com.pro.service.ReReplyService;
import com.pro.service.ReplyService;
import com.pro.service.blogBoardService;
import com.pro.service.designService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardservice;
	@Autowired
	private blogBoardService blogboardservice;
	@Autowired
	private ReplyService rs;
	@Autowired
	private ReReplyService rrs;
	@Autowired
	private AddfriendService addfriendser;
	@Autowired
	private designService designservice;
	@Autowired
	private MemberService ms;

	@RequestMapping("blog")
	public ModelAndView blog(@RequestParam("nickname") String nickname,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "bnum", required = false) String bnum, HttpServletRequest request,HttpSession session)
			throws UnsupportedEncodingException {

		ModelAndView mv = new ModelAndView("board/personalBlog");
		nickname = URLDecoder.decode(nickname, "UTF-8");

		Board b = boardservice.initBoard(nickname);
		if (bnum != null) {
			blogBoard vo = blogboardservice.selectOne(Integer.parseInt(bnum), nickname, b.getUserid()); // 수정 필요
			mv.addObject("vo", vo);
			mv.addObject("reply", rs.selectAll(b.getUserid(), bnum));
			mv.addObject("rereplyarr", rrs.selectAll(b.getUserid(), bnum));
		}

		mv.addObject("blog", b);
		session.setAttribute("blog", b.getUserid());

		// paging
		int total = blogboardservice.countBoard(b.getUserid());
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
		mv.addObject("viewAll", blogboardservice.selectBoard(page, b.getUserid()));

		// 친구추가
		Member m = (Member) session.getAttribute("login");
	      String visit = m.getNickname();   // 방문한 사람 닉네임
	      String visitnick = m.getUserid();   // 방문한 사람이 나인지 아닌지 검사목적으로
	      request.getSession().setAttribute("nick", nickname);
	      request.getSession().setAttribute("visitnick", b.getNickname());
	      Member myid = addfriendser.myid(nickname); // 닉네임으로 블로그 주인 아이디 받아오기
	      String userid = myid.getUserid();
	      List<AddFriend> find = addfriendser.joinfriend(userid,nickname); // 친구신청 목록
	      mv.addObject("joinfriend", find);
	      List<AddFriend> myfriend = addfriendser.myfriend(userid,nickname);// 친구 목록
	      mv.addObject("myfriend", myfriend);
	      if(!visitnick.equals(nickname)) {         
	         int check = addfriendser.check(userid, nickname, visit );
	         mv.addObject("check", check);
	      }

		// Layout design
		Member vo = ms.selectMemberByNick(nickname);
		Design design = designservice.getstyle(vo.getUserid());
		if (design == null || "0".equals(design.getLayout())) {
			mv.setViewName("redirect:design");
		}
		mv.addObject("design", design);

		if(request.getParameter("write")!=null)
			if(request.getParameter("write").equals("update")) {	
				String id = (String)session.getAttribute("blog");
				nickname=URLEncoder.encode(nickname, "UTF-8");
				blogBoard upvo = blogboardservice.selectOne(Integer.parseInt(bnum), nickname, id);
				mv.addObject("visit", nickname);
				mv.addObject("vo", upvo);
			}
			
		return mv;
	}

	@RequestMapping(value = "newBoard", method = RequestMethod.POST)
	public ModelAndView newBoard(blogBoard vo, HttpServletRequest request, String visit,HttpSession session) throws UnsupportedEncodingException {

		ModelAndView mv = new ModelAndView();
		visit = request.getParameter("visit");
//		String visit2=ms.getuserid(visit);	
		String visit2 =(String)session.getAttribute("blog");
		blogboardservice.insert(vo, request,visit2);
		visit=URLEncoder.encode(visit, "UTF-8");
		mv.setViewName("redirect:blog?nickname=" + visit + "&bnum=" + (blogboardservice.maxnum(visit2)));
		mv.addObject("vo", vo);
		System.out.println(vo.getTitle());

		return mv;

	}

	@RequestMapping("boarddelete")
	public ModelAndView delete(String bnum, String writer, String visit, HttpSession session) throws UnsupportedEncodingException {
		if (writer.equals("writer")) {
			String id = (String)session.getAttribute("blog");
			blogboardservice.delete(Integer.parseInt(bnum), id);
		}
		visit=URLEncoder.encode(visit, "UTF-8");
		ModelAndView mv = new ModelAndView("redirect:blog?nickname=" + visit);
		return mv;
	}

	@RequestMapping(value = "boardupdate", method = RequestMethod.GET)
	public ModelAndView update(String bnum, String visit, HttpSession session) throws UnsupportedEncodingException {
		String id = (String)session.getAttribute("blog");
		ModelAndView mv = new ModelAndView("board/updateForm");
		visit=URLEncoder.encode(visit, "UTF-8");
		blogBoard vo = blogboardservice.selectOne(Integer.parseInt(bnum), visit, id);
		mv.addObject("visit", visit);
		mv.addObject("vo", vo);
		return mv;
	}

	@RequestMapping(value = "boardupdate", method = RequestMethod.POST)
	public ModelAndView update(blogBoard vo, HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		String visit = request.getParameter("visit");
		visit=URLEncoder.encode(visit, "UTF-8");
		String id=(String)session.getAttribute("blog");
		ModelAndView mv = new ModelAndView("redirect:blog?nickname=" + visit + "&bnum=" + vo.getBnum());
		mv.addObject("vo", vo);
		blogboardservice.update(vo, id, request);
		return mv;
	}

	// ck 에디터에서 파일 업로드
	@Autowired
	private EditerService es;

	@RequestMapping(value = "images", method = { RequestMethod.GET, RequestMethod.POST })
	public void CKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload)
			throws Exception {
		es.editer(req, res, upload);
	}

	@RequestMapping("add")
	@ResponseBody
	public String add(String nickname, HttpSession session) {
		Member m = (Member) session.getAttribute("login");
		String usernick = m.getNickname(); // 친구추가 건 사람(닉네임으로 받아야함)
		String userid = m.getUserid();
		System.out.println("들어옴" + userid);
		Member old = addfriendser.myid(nickname); // 닉네임으로 아이디 찾기
		String myid = old.getUserid(); // 친구추가를 받는 사람
		int find = addfriendser.find(myid, usernick); // 이미 친구인지 아닌지
		System.out.println("add " + usernick);

		if (myid == null) {
			return "notid";
		} else if (!myid.equals(userid) && find == 0) { // 내 블로그가 아니고 친추목록에도 없으면
			int b = addfriendser.addmydb(myid, nickname, usernick); // 블로그 주인 db에 아이디로  저장
			if (b == 1) {
				System.out.println(b);
				return "success";
			}
		} else if (myid.equals(userid)) {
			return "equals"; // 자기 자신에게 이웃신청 금지
		} else if (find == 1) {
			return "fail"; // 이미 신청 했거나 친구이거나
		}
		return "fail";
	}

	@RequestMapping("sure")
	@ResponseBody
	public String sure(String nickname, String friend) { // 신청 수락
		System.out.println("controllr nick : " + nickname);
		Member old = addfriendser.myid(nickname); // 닉네임으로 아이디 찾기
		String myid = old.getUserid(); // 친구추가를 받는 사람	
		Member user = addfriendser.myid(friend); // 닉네임으로 아이디 찾기
		String userid = user.getUserid(); // 친추를 건사람
		System.out.println("controller : " + friend);
		System.out.println("controller : " + userid);
		int i = addfriendser.mysure(myid, nickname, friend);
		if (i == 1) {
			i = addfriendser.adduser(userid, friend, nickname); // 성공 했다면 신청자 db에도 저장
			return "success";
		} else if (i == 0)
			return "fail";
		return "fail";
	}

	@RequestMapping("refusal")
	   @ResponseBody
	   public String refusal(String mynick, String friend) { // �떊泥� 嫄곗젅
	      Member old = addfriendser.myid(mynick);
	      String myid = old.getUserid();
	      System.out.println(myid + mynick + friend);
	      int i = addfriendser.del(myid, mynick, friend);
	      if (i == 1) {
	         return "success";
	      } else
	         return "fail";
	   }

	// 작성중
	@RequestMapping("audio")
	public ModelAndView audio() {
		return new ModelAndView("board/audio");
	}

}
