package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.dao.IF_M_WishListDAO;
import com.human.vo.M_wishListVO;

@Service
public class M_WishListServiceImpl implements IF_M_WishListService {
	@Inject
	private IF_M_WishListDAO dao;

	@Override
	public void insert(String u_id, String m_name) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(u_id, m_name);
	}

	@Override
	public List<M_wishListVO> myWishList(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.myWishList(u_id);
	}

	@Override
	public int countWishList(String u_id, String m_name) throws Exception {
		// TODO Auto-generated method stub
		return dao.countWishList(u_id, m_name);
	}

	@Override
	public void selectDelete(String u_id, String m_name) throws Exception {
		// TODO Auto-generated method stub
		dao.selectDelete(u_id, m_name);

	}
}
