package com.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.AddFriend;
import com.pro.dao.AddFriendDAO;
import com.pro.dao.Member;

@Service
public class AddfriendService {

	@Autowired AddFriendDAO dao;

	public Member myid(String nickname) {
		return dao.myid(nickname);
	}

	public int find(String myid, String user) {
		return dao.find(myid, user);
	}

	public int addmydb(String myid, String mynick, String user) {
		return dao.addmydb(myid, mynick, user);
	}

	public int adduser(String user, String usernick, String mynick) {
		return dao.adduser(user, usernick, mynick);
	}

	public List<AddFriend> joinfriend(String userid, String mynick) {
		return dao.joinfriend(userid, mynick);
	}
	
	public List<AddFriend> myfriend(String userid, String mynick) {
		return dao.myfriend(userid, mynick);
	}

	public int mysure(String myid, String mynick, String friend) {
		System.out.println("mysure ser");
		return dao.mysure(myid, mynick, friend);
	}

	public int del(String myid,String mynick,String friend) {
	      return dao.del(myid, mynick, friend);
	   }

	public Member mynick(String friend) {
		return dao.mynick(friend);
	}

	public int check(String userid, String nickname, String visit) {
	      return dao.check(userid,nickname, visit);
	   }
	
}
