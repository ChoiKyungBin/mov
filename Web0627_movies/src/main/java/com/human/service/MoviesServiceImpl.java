package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.dao.IF_MoviesDAO;
import com.human.vo.MoviesVO;
import com.human.vo.PageVO;

@Service
public class MoviesServiceImpl implements IF_MoviesService {

	@Inject
	private IF_MoviesDAO dao;

	@Override
	public void insertMovie(MoviesVO mvo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertMovie(mvo);
	}

	@Override
	public List<MoviesVO> movieList(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.movieList(pvo);
	}

	@Override
	public List<MoviesVO> actionView() throws Exception {
		// TODO Auto-generated method stub
		return dao.actionView();
	}

	@Override
	public List<MoviesVO> horrorView() throws Exception {
		// TODO Auto-generated method stub
		return dao.horrorView();
	}

	@Override
	public List<MoviesVO> romanceView() throws Exception {
		// TODO Auto-generated method stub
		return dao.romanceView();
	}

	@Override
	public List<MoviesVO> animationView() throws Exception {
		// TODO Auto-generated method stub
		return dao.animationView();
	}

	@Override
	public List<MoviesVO> comedyView() throws Exception {
		// TODO Auto-generated method stub
		return dao.comedyView();
	}

	@Override
	public MoviesVO m_detail(String m_name) throws Exception {
		// TODO Auto-generated method stub
		dao.updateCnt(m_name);
		return dao.m_detail(m_name);
	}

	@Override
	public List<MoviesVO> searchMovie(String Sword) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchMovie(Sword);
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}

	@Override
	public List<MoviesVO> moviesAllList(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.moviesAllList(pvo);
	}

}