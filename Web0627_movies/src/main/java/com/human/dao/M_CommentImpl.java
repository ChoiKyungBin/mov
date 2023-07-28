package com.human.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.PageVO;
import com.human.vo.m_commentVO;

@Repository
public class M_CommentImpl implements IF_M_CommentDAO {
	private static String mapperQuery = "com.human.dao.IF_M_CommentDAO";
	@Inject
	SqlSession sqlsession;

	@Override
	public void insert(m_commentVO mvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(mapperQuery + ".insert", mvo);
	}

	@Override
	public List<m_commentVO> selectComment(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery + ".selectComment", pvo);

	}

	@Override
	public int listCount(String m_name) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery + ".listCount", m_name);
	}

	@Override
	public void delC(String u_id, String c_comment) throws Exception {
	    Map<String, String> params = new HashMap<>();
	    params.put("u_id", u_id);
	    params.put("c_comment", c_comment);
		sqlsession.delete(mapperQuery + ".delC", params);

	}

}
