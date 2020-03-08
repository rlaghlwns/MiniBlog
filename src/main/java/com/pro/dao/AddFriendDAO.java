package com.pro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddFriendDAO {
	
	@Autowired private SqlSessionTemplate template;
	
	public Member myid(String nickname) {
		String sql = "select * from blogmember where nickname='" + nickname + "'"
				+ "and existnum=0";
		Map<String, String> map = new HashMap<String, String>();
		map.put("myid", sql);
		System.out.println("myid : " + sql);
		return template.selectOne("myid", map);
	}

	public int find(String myid, String user) {	// user = 닉네임
		String sql = "select count(myid) from " + myid + "add where"
				 + " friend='" + user + "'";
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(sql);
		map.put("find", sql);
		int result = template.selectOne("find", map);
		System.out.println(result);
		return result;
	}

	public int addmydb(String myid, String mynick, String user) {
		String sql = "insert into " + myid + "add values ('" + mynick + "',"
				+ "'" + user + "', 0)";
		Map<String, String> map = new HashMap<String, String>();
		map.put("adddb", sql);
		return template.insert("adddb", map);
	}

	public int adduser(String user, String usernick, String mynick) {
		String sql = "insert into " + user + "add values ('" + usernick + "',"
				+ "'" + mynick + "', 1)";
		Map<String, String> map = new HashMap<String, String>();
		map.put("adddb", sql);
		return template.insert("adddb", map);
	}

	public List<AddFriend> joinfriend(String userid, String mynick) {
		String sql = "select * from " + userid + "add where myid='" + mynick + "'"
				+ "and sure=0 order by friend desc";
		Map<String, String> map = new HashMap<String, String>();
		map.put("joinfriend", sql);
		return template.selectList("joinfriend", map);
	}

	public int mysure(String myid, String mynick, String friend) {
		String sql = "update " + myid + "add set sure=1 where myid='" + mynick + "' and "
				+ "friend='" + friend + "'";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sure", sql);
		System.out.println("승락" + myid + friend);
		System.out.println("승락" + sql);
		int result = template.update("sure", map);
		System.out.println("내 db 수정 : " + result);
		return result;
	}

	public int del(String myid, String mynick, String friend) {
	      System.out.println(mynick);
	      String sql = "delete from " + myid + "add where myid='" + mynick + "' and friend='" + friend + "'"
	            + "and sure=0";
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("del", sql);
	      int result = template.delete("del", map);
	      System.out.println(sql);
	      System.out.println("�궘�젣 寃곌낵 : " + result);
	      return result;
	   }

	public List<AddFriend> myfriend(String userid, String mynick) {
		String sql = "select * from " + userid + "add where myid='" + mynick + "'"
				+ "and sure=1 order by friend desc";
		Map<String, String> map = new HashMap<String, String>();
		map.put("myfriend", sql);
		return template.selectList("myfriend", map);
	}

	public Member mynick(String friend) {
		String sql = "select * from blogmember where userid='" + friend + "'"
				+ "and existnum=0";
		Map<String, String> map = new HashMap<String, String>();
		map.put("mynick", sql);
		System.out.println("mynick : " + sql);
		return template.selectOne("mynick", map);
	}

	public int check(String userid, String nickname, String visit) {
	      String sql = "select count(friend) from " + userid + "add where " +
	               "myid='" + nickname +"'";
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("check", sql);
	      int result = template.selectOne("check", map);
	      return result;
	   }
}
