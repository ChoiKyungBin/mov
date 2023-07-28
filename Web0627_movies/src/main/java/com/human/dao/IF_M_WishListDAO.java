package com.human.dao;

import java.util.List;

import com.human.vo.M_wishListVO;

public interface IF_M_WishListDAO {

	public void insert(String u_id, String m_name) throws Exception;

	public List<M_wishListVO> myWishList(String u_id) throws Exception;

	public int countWishList(String u_id, String m_name) throws Exception;

	public void selectDelete(String u_id, String m_name) throws Exception;

}
