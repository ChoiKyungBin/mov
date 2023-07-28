package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.dao.IF_FreeBoardDAO;
import com.human.vo.FreeBoardVO;
import com.human.vo.PageVO;

@Service
public class IF_FreeBoardServiceImpl implements IF_FreeBoardService {
	@Inject
	IF_FreeBoardDAO dao;

	@Override
	public void insert(FreeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public List<FreeBoardVO> selectList(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(pvo);
	}

	@Override
	public FreeBoardVO detailView(int f_num) throws Exception {
		// TODO Auto-generated method stub
		dao.updateView(f_num);
		return dao.detailView(f_num);
	}

	@Override
	public int countList() throws Exception {
		// TODO Auto-generated method stub
		return dao.countList();
	}

	@Override
	public List<FreeBoardVO> searchTitle(String f_title) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchTitle(f_title);
	}

	@Override
	public void selectDelete(int f_num) throws Exception {
		// TODO Auto-generated method stub
		dao.selectDelete(f_num);
	}

	@Override
	public void modifyBoard(FreeBoardVO pvo) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyBoard(pvo);
	}
}
