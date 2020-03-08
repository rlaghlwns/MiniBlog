package com.pro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class blogBoardDAO {

	@Autowired
	private SqlSessionTemplate template;

	public List<blogBoard> getBoard(String userid) {
		String sql = "select *from " + userid + " order by bnum desc";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.selectList("blogboardDAO.getboard", map);
	}

	public List<blogBoard> page(int start, String userid) {
		Map<Object, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("userid", userid);
		return template.selectList("blogboardDAO.page", map);
	}

	public List<blogBoard> selectAll(String userid) {
		String sql = "select * from " + userid + " where exist = 0 order by bnum desc";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.selectList("blogboardDAO.readAll", map);
	}

	public int maxBnum() {
		String sql = "select max(bnum) from board";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.selectOne("blogboardDAO.maxBnum", map);
	}

	public int maxnum(String visit) {
		String sql = "select max(bnum) from " + visit;
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.selectOne("blogboardDAO.maxNum", map);
	}

	public int insert(blogBoard vo, String visit) {
		String sql = "insert into " + visit + "(bnum,writer,title,context,ip,boarddate) values("+visit+"_bnum.nextval"+",'" + vo.getWriter() + "','"
				+ vo.getTitle() + "','" + vo.getContext() + "','" + vo.getIp() + "','"+vo.getBoarddate()+"')";
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.insert("blogboardDAO.boardInsert", map);

	}

	public blogBoard selectOne(int bnum, String visit, String id) {
		String sql = "select * from " + id + " where bnum=" + bnum;
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.selectOne("blogboardDAO.readOne", map);
	}

	public int update(blogBoard vo, String id) {
		String sql = "update " + id + " set title='" + vo.getTitle() + "', context='" + vo.getContext() + "', ip='"
				+ vo.getIp() + "' where bnum=" + vo.getBnum();
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.update("blogboardDAO.boardUpdate", map);
	}

	public int delete(int bnum, String id) {
		String sql = "update " + id + " set exist = 1 where bnum=" + bnum;
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.update("blogboardDAO.boardDelete", map);
	}

	public int countBoard(String id) {
		String sql="select count(*) from "+id + " where exist=0" ;
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return template.selectOne("blogboardDAO.countBlogBoard", map);
	}

	public List<blogBoard> selectBoard(PagingVO page,String id) {
		String sql="SELECT * " + 
						"FROM (" + 
							"SELECT ROWNUM RN, A.* " + 
								"FROM (" + 
									"SELECT * " + 
										"FROM " +id+ " where exist=0 ORDER BY BNUM DESC " + 
								") A " + 
						")" + 
					"WHERE RN BETWEEN "+page.getStart()+" AND "+page.getEnd();
		Map<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		System.out.println(sql);
		return template.selectList("blogboardDAO.selectBlogBoard", map);
	}

}
