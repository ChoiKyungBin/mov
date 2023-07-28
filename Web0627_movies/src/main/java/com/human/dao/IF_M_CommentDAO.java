package com.human.dao;

import java.util.List;

import com.human.vo.PageVO;
import com.human.vo.m_commentVO;

public interface IF_M_CommentDAO {
	public void insert(m_commentVO mvo) throws Exception;

	public List<m_commentVO> selectComment(PageVO pvo) throws Exception;

	public int listCount(String m_name) throws Exception;

	public void delC(String u_id, String c_comment) throws Exception;

}
