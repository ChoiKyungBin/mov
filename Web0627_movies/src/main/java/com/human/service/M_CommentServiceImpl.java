package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.dao.IF_M_CommentDAO;
import com.human.vo.PageVO;
import com.human.vo.m_commentVO;

@Service
public class M_CommentServiceImpl implements IF_M_CommentService {
	@Inject
	IF_M_CommentDAO dao;

	@Override
	public void insert(m_commentVO mvo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(mvo);
	}

	@Override
	public List<m_commentVO> selectComment(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectComment(pvo);
	}

	@Override
	public int listCount(String m_name) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(m_name);
	}

	@Override
	public void delC(String u_id, String c_comment) throws Exception {
		// TODO Auto-generated method stub
		dao.delC(u_id, c_comment);
	}
}