package com.human.dao;

import java.util.List;

import com.human.vo.FreeBoardVO;
import com.human.vo.PageVO;

public interface IF_FreeBoardDAO {
	public void insert(FreeBoardVO vo) throws Exception;

	public List<FreeBoardVO> selectList(PageVO pvo) throws Exception;

	public FreeBoardVO detailView(int f_num) throws Exception;

	public int countList() throws Exception;

	public List<FreeBoardVO> searchTitle(String f_title) throws Exception;

	public void updateView(int f_num) throws Exception;

	public void selectDelete(int f_num) throws Exception;

	public void modifyBoard(FreeBoardVO pvo) throws Exception;
}
