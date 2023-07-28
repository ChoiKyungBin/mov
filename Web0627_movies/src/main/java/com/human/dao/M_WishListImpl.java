package com.human.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.M_wishListVO;

@Repository
public class M_WishListImpl implements IF_M_WishListDAO {
	private static String mapperQuery = "com.human.dao.IF_M_WishListDAO";
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insert(String u_id, String m_name) throws Exception {
		Map<String, String> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("m_name", m_name);
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery + ".insert", params);
	}

	@Override
	public List<M_wishListVO> myWishList(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".myWishList", u_id);
	}

	@Override
	public int countWishList(String u_id, String m_name) throws Exception {
		Map<String, String> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("m_name", m_name);
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".countWishList", params);
	}

	@Override
	public void selectDelete(String u_id, String m_name) throws Exception {
		Map<String, String> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("m_name", m_name);
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery + ".selectDelete", params);

	}
}
