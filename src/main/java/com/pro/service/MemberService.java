package com.pro.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pro.dao.Member;
import com.pro.dao.MemberDAO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO Mdao;

	public Member login(Member m) {
		return Mdao.login(m);
	}

	public int seq1(String id) {
		return Mdao.createSEQ(id);
	}

	public int seq2(String id) {
		return Mdao.createSEQ2(id);
	}

	public int seq3(String id) {
		return Mdao.createSEQ3(id);
	}

	public int create(String id) {
		return Mdao.create(id);
	}

	public int create2(String id) {
		return Mdao.create2(id);
	}

	public int create3(String id) {
		return Mdao.create3(id);
	}

	public int create4(String id) {
		return Mdao.create4(id);
	}

	public int join(Member m) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		m.setDate(time);
		return Mdao.join(m);
	}

	public String checkedID(String id) {
		return Mdao.checkedID(id);
	}

	public int checkedNick(String nick) {
		return Mdao.checkedNick(nick);
	}

	public int update(Member m, String userid) {
		Mdao.update(m, userid);
		return 1;
	}
	
	public int updatetitle(Member m, String userid) {
		Mdao.updatetitle(m, userid);
		return 1;
	}

	public Member findPW(String userid, int r1number, int r2number) {
		return Mdao.findPW(userid, r1number, r2number);
	}

	public Member findID(String name, int r1number, int r2number) {
		return Mdao.findID(name, r1number, r2number);
	}

	public int getidnum(String front, String back) {
		return Mdao.getidnum(front, back);
	}

	public int changepw(String userpw, String userid) {
		return Mdao.changepw(userpw, userid);
	}

	public int delmember(Member m) {
		return Mdao.delmember(m);
	}

	public void updateProfile(MultipartFile mpfile, Member vo) {
		System.out.println("us에서 mpfile:" + mpfile);
		// 수정될 사진이 없거나, 기본값으로 설정(사진 삭제)하는 경우
		if (mpfile == null) {
			vo.setProfile(null);
		} else {
			// 사진 수정할 경우
			byte[] blob;
			try {
				blob = mpfile.getBytes();
				vo.setProfile(blob);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Mdao.updateImage(vo);
	}

	public Member selectMemberByNick(String nickname) {
		return Mdao.selectMemberByNick(nickname);
	}

	public List<Member> getlist() {
		return Mdao.getlist();
	}

	public String getuserid(String visit) {
		return Mdao.getuserid(visit);
	}

	public void dropTable(String tablename) {
		Mdao.droptable(tablename);
	}

	public void dropsequence(String tablename) {
		Mdao.dropsequence(tablename);
	}
}
