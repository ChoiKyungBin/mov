package com.human.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.PageVO;
import com.human.vo.UserVO;

@Repository
public class UserImpl implements IF_UserDAO {
	private static String mapperQuery = "com.human.dao.IF_UserDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertUser(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery + ".insertUser", uvo);

	}

	@Override
	public UserVO loginCheck(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".loginCheck", uvo);
	}

	@Override
	public String u_findId(String u_email, String u_pw) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> params = new HashMap<>();
		params.put("u_email", u_email);
		params.put("u_pw", u_pw);
		return sqlSession.selectOne(mapperQuery + ".u_findId", params);
	}

	@Override
	public String u_findPw(String u_id, String u_email) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("u_email", u_email);
		return sqlSession.selectOne(mapperQuery + ".u_findPw", params);
	}

	@Override
	public int idDuplicateCheck(String checkId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".idDuplicateCheck", checkId);
	}

	@Override
	public UserVO myInformation(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".myInformation", id);
	}

	@Override
	public void myupdate(UserVO uvo) throws Exception {
		sqlSession.update(mapperQuery + ".myupdate", uvo);

	}

	@Override
	public void delUser(String u_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery + ".delUser", u_id);

	}

	@Override
	public List<UserVO> inUserAllList(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".inUserAllList", pvo);
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".listCount");
	}

}
