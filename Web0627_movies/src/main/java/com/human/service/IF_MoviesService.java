package com.human.service;

import java.util.List;

import com.human.vo.MoviesVO;
import com.human.vo.PageVO;

public interface IF_MoviesService {
	public void insertMovie(MoviesVO mvo) throws Exception;

	public List<MoviesVO> movieList(PageVO pvo) throws Exception;

	// 액션장르만 담은 리스트
	public List<MoviesVO> actionView() throws Exception;

	// 스릴러
	public List<MoviesVO> horrorView() throws Exception;

	// 로맨스
	public List<MoviesVO> romanceView() throws Exception;

	// 애니메이션
	public List<MoviesVO> animationView() throws Exception;

	// 코미디
	public List<MoviesVO> comedyView() throws Exception;

// 디테일보기.
	public MoviesVO m_detail(String m_name) throws Exception;

	public List<MoviesVO> searchMovie(String Sword) throws Exception;

	public int listCount() throws Exception;

	public List<MoviesVO> moviesAllList(PageVO pvo) throws Exception;
}