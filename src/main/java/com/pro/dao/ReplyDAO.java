package com.pro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	@Autowired private SqlSessionTemplate template;

	public void insert(Reply reply, String visit) {
		String sql="insert into "+visit+"reply (rwriter, rcontext, rdate, bnum, rnum) values('"+reply.getRwriter()+"','"+reply.getRcontext()+"','"+reply.getRdate()+"','"+reply.getBnum()+"',"+visit+"_rnum.nextval)";
		Map<String, String> map = new HashMap<>();
		map.put("sql", sql);
		template.insert("ReplyDAO.create", map);
	}

	public List<Reply> selectAll(String visit, String bnum) {
		visit += "reply";
		String sql = "select * from " +visit+ " where bnum="+bnum+" order by rnum desc";
		Map<String, String> map = new HashMap<>();
		map.put("sql", sql);
		return template.selectList("ReplyDAO.readAll", map);

	}

	public void delete(String visit, String rnum) {
		visit += "reply";
		String sql = "delete from " +visit+ " where rnum = "+rnum;
		Map<String, String> map = new HashMap<>();
		map.put("sql", sql);
		template.delete("ReplyDAO.delete", map);
	}
	
	public void update(Reply reply, String visit) {
		String visittable = visit + "reply";
		
		String sql = "update "+visittable+" set rcontext = '" +reply.getRcontext()+ "' where rnum = "+reply.getRnum();
		Map<String, String> map = new HashMap<>();
		map.put("sql", sql);
		template.update("ReplyDAO.update", map);
	}

}
