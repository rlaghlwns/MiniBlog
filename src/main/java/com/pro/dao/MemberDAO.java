package com.pro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate tamplate;

	public Member login(Member m) {
		String sql = "select * from blogmember where userid='" + m.getUserid() + "' and userpw='" + m.getUserpw() + "'"
				+ " and existnum=0";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return tamplate.selectOne("login", map);
	}

	public int create(String id) {
		String sql = "create table " + id
				+ "(bnum number,title varchar2(100),writer varchar2(30),context varchar2(2000),boarddate varchar2(20),ip varchar2(20),exist number DEFAULT 0 NOT NULL ENABLE,rcm number DEFAULT 0 NOT NULL ENABLE,views number DEFAULT 0 NOT NULL ENABLE)";
		Map<String, String> map = new HashMap<String, String>();
		map.put("create", sql);
		try {
			tamplate.update("memberDAO.create", map);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	public int create2(String id) {
		id = id + "reply";
		String sql = "create table " + id
				+ "(rnum number,bnum number,exist NUMBER DEFAULT 0 NOT NULL ENABLE,rcontext varchar2(2000),rwriter varchar2(30),rdate varchar2(20))";
		Map<String, String> map = new HashMap<String, String>();
		map.put("create2", sql);
		try {
			System.out.println(sql);
			tamplate.update("create2", map);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	public int create3(String id) {
		id = id + "rereply";
		String sql = "create table " + id
				+ "(rrnum number,bnum number,rnum number,exist NUMBER DEFAULT 0 NOT NULL ENABLE,rrcontext varchar2(2000),rrwriter varchar2(30),rrdate varchar2(20))";
		Map<String, String> map = new HashMap<String, String>();
		map.put("create3", sql);
		try {
			System.out.println(sql);
			tamplate.update("create3", map);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	public int create4(String id) {
		id = id + "add";
		String sql = "create table " + id + "(myid varchar2(30), friend varchar2(30), sure NUMBER DEFAULT 0)";
		Map<String, String> map = new HashMap<String, String>();
		map.put("create4", sql);
		try {
			tamplate.update("create4", map);
			System.out.println("create4 ����");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	public int createSEQ(String id) {
		id = id + "_bnum";
		String sql = "create sequence " + id + " start with 0 increment by 1 maxvalue 10000 minvalue 0";
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq1", sql);
		try {
			tamplate.update("seq1", map);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	public int createSEQ2(String id) {
		id = id + "_rnum";
		String sql = "create sequence " + id + " start with 0 increment by 1 maxvalue 10000 minvalue 0";
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq2", sql);
		try {
			tamplate.update("seq2", map);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	public int createSEQ3(String id) {
		id = id + "_rrnum";
		String sql = "create sequence " + id + " start with 0 increment by 1 maxvalue 10000 minvalue 0";
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq3", sql);
		try {
			tamplate.update("seq3", map);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	public int join(Member m) {
		String sql = "insert into blogmember(userid,userpw,name,phone,birth,address,nickname,r1number,r2number,email,to_date) values('"
				+ m.getUserid() + "','" + m.getUserpw() + "','" + m.getName() + "','" + m.getPhone() + "','"
				+ m.getBirth() + "','" + m.getAddress() + "','" + m.getNickname() + "'," + m.getFront() + ","
				+ m.getBack() + ",'" + m.getEmail() + "','" + m.getDate() + "')";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return tamplate.insert("join", map);
	}

	public String checkedID(String id) {
		String sql = "select * from blogmember where userid='" + id + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		Member m = tamplate.selectOne("checkid", map);
		try {
			m.getUserid();
			return "success";
		} catch (NullPointerException e) {
			return "fail";
		}

	}

	public int checkedNick(String nick) {
		String sql = "select count(*) from blogmember where nickname='" + nick + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return tamplate.selectOne("checknick", map);
	}

	public int update(Member m, String userid) {
		String sql = "update blogmember set userpw ='" + m.getUserpw() + "' , phone ='" + m.getPhone() + "',address='"
				+ m.getAddress() + "' where userid ='" + userid + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println(sql);
		return tamplate.update("changeinfo", map);
	}
	
	public int updatetitle(Member m, String userid) {
		String sql = "update blogmember set blogname ='" + m.getBlogname() + "' where userid ='" + userid + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println(sql);
		return tamplate.update("changeblogname", map);
	}

	public Member findID(String name, int r1number, int r2number) {
		String sql = "select *from blogmember where name='" + name + "' and r1number=" + r1number + " and r2number="
				+ r2number + " and existnum=0";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println("dao" + sql);
		return tamplate.selectOne("findID", map);
	}

	public Member findPW(String userid, int r1number, int r2number) {
		String sql = "select *from blogmember where userid='" + userid + "' and r1number=" + r1number + " and r2number="
				+ r2number + " and existnum=0";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return tamplate.selectOne("findPW", map);
	}

	public int getidnum(String front, String back) {
		String sql = "select count(*) from blogmember where r1number=" + front + " and r2number=" + back;
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println(sql);
		return tamplate.selectOne("getidnumC", map);
	}

	public int changepw(String userpw, String userid) {
		String sql = "update blogmember set userpw ='" + userpw + "' where userid ='" + userid + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println(sql);
		return tamplate.update("changepw", map);
	}

	public Board initBoard(String nickname) {
		String sql = "select *from blogmember where nickname='" + nickname + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println(sql);
		return tamplate.selectOne("init", map);
	}

	public int delmember(Member m) {
		String sql = "update blogmember set existnum=1 where userid='" + m.getUserid() + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return tamplate.delete("delmember", map);
	}

	public int design(String style, String userid) {

		return 0;
	}

	public int updateImage(Member vo) {
		return tamplate.update("updateImage", vo);
	}

	public int design(Design design, String userid) {
		String sql = "update blogmember set style='" + design.getLayout() + ":" + design.getShow1box() + ":"
				+ design.getShow2box() + ":" + design.getShow3box() + ":" + design.getShow4box() + ":"
				+ design.getShow1font() + ":" + design.getShow2font() + ":" + design.getShow3font() + ":"
				+ design.getShow4font() + ":" + design.getShow1style() + ":" + design.getShow2style() + ":"
				+ design.getShow3style() + ":" + design.getShow4style() + ":" + design.getShow1size() + ":"
				+ design.getShow2size() + ":" + design.getShow3size() + ":" + design.getShow4size() + ":"
				+ design.getShow1align() + ":" + design.getShow2align() + ":" + design.getShow3align() + ":"
				+ design.getShow4align() + "' where userid='" + userid + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println("styleslq : " + sql);
		return tamplate.update("design", map);
	}

	public Member getstyle(String userid) {
		String sql = "select style from blogmember where userid='" + userid + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return tamplate.selectOne("getstyle", map);
	}

	public Member selectMemberByNick(String nick) {
		return tamplate.selectOne("selectByNick", nick);
	}

	public List<Member> getlist() {
		
		String sql = "select * from(select * from blogmember where  userid!='admin' and style!='0' order by DBMS_RANDOM.RANDOM) where rownum < 9";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return tamplate.selectList("memberDAO.getlist", map);
	}

	public String getuserid(String visit) {
		String sql = "select userid from blogmember where nickname='" + visit + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return tamplate.selectOne("getuserid", map);
	}

	public void droptable(String tablename) {
		String sql = "drop TABLE " + tablename;
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		tamplate.update("memberDAO.droptable", map);
	}

	public void dropsequence(String tablename) {
		String sql = "drop sequence " + tablename;
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		tamplate.update("memberDAO.dropsequence", map);
	}
}
