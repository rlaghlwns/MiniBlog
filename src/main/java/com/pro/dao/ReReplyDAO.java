package com.pro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReReplyDAO {
	@Autowired private SqlSessionTemplate template;
	
	public int insert(String visit, ReReply vo) {
		String sql = "insert into "+visit+"rereply (rrwriter, rrcontext, rrdate, rnum, bnum, rrnum)" + 
				" values ( '"+vo.getRrwriter()+"', '"+vo.getRrcontext()+"', '"+vo.getRrdate()+"', "+vo.getRnum()+", "+vo.getBnum()+", "+visit+"_rrnum.nextval)";
		Map<String, String> map = new HashMap<>();
		map.put("sql", sql);
		return template.insert("ReReplyDAO.create", map);
	}
	
	public List<ReReply> selectAll(String visit, String bnum) {
		visit += "rereply";
		String sql = "select * from " +visit+ " where bnum="+bnum+" order by rrnum desc";
		Map<String, String> map = new HashMap<>();
		map.put("sql", sql);
		return template.selectList("ReReplyDAO.readAll", map);
	}
	
	public void delete(String visit, String rrnum) {
		visit += "rereply";
		String sql = "delete from " +visit+ " where rrnum = "+rrnum;
		Map<String, String> map = new HashMap<>();
		map.put("sql", sql);
		template.delete("ReReplyDAO.delete", map);
	}
	
	public void update(String visit, ReReply vo) {
		visit += "rereply";
		String sql = "update "+visit+" set rrcontext = '" +vo.getRrcontext()+ "' where rrnum = "+vo.getRrnum();
		Map<String, String> map = new HashMap<>();
		map.put("sql", sql);
		template.update("ReReplyDAO.update", map);
	}

}
