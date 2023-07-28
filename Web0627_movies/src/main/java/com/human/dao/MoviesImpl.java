package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.MoviesVO;
import com.human.vo.PageVO;

@Repository
public class MoviesImpl implements IF_MoviesDAO {
	private static String mapperQuery = "com.human.dao.IF_MoviesDAO";
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertMovie(MoviesVO mvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery + ".insertMovie", mvo);

	}

	@Override
	public List<MoviesVO> movieList(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".movieList", pvo);
	}

	@Override
	public List<MoviesVO> actionView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".actionView");
	}

	@Override
	public List<MoviesVO> horrorView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".horrorView");
	}

	@Override
	public List<MoviesVO> romanceView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".romanceView");
	}

	@Override
	public List<MoviesVO> animationView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".animationView");
	}

	@Override
	public List<MoviesVO> comedyView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".comedyView");
	}

	@Override
	public MoviesVO m_detail(String m_name) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".m_detail", m_name);
	}

	@Override
	public List<MoviesVO> searchMovie(String Sword) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".searchMovie", Sword);
	}

	@Override
	public void updateCnt(String m_name) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery + ".updateCnt", m_name);

	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".listCount");
	}

	@Override
	public List<MoviesVO> moviesAllList(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".moviesAllList", pvo);
	}

}