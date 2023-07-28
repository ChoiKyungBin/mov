package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.dao.IF_UserDAO;
import com.human.vo.PageVO;
import com.human.vo.UserVO;

@Service
public class UserServiceImpl implements IF_UserService {

	@Inject
	private IF_UserDAO dao;

	@Override
	public void insertUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertUser(vo);

	}

	@Override
	public UserVO loginCheck(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.loginCheck(uvo);
	}

	@Override
	public String u_findId(String u_email, String u_pw) throws Exception {
		// TODO Auto-generated method stub
		return dao.u_findId(u_email, u_pw);
	}

	@Override
	public String u_findPw(String u_id, String u_email) throws Exception {
		// TODO Auto-generated method stub
		return dao.u_findPw(u_id, u_email);
	}

	@Override
	public int idDuplicateCheck(String checkId) throws Exception {
		// TODO Auto-generated method stub
		return dao.idDuplicateCheck(checkId);
	}

	@Override
	public UserVO myInformation(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.myInformation(u_id);
	}

	@Override
	public void myupdate(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		dao.myupdate(uvo);
	}

	@Override
	public void delUser(String u_id) throws Exception {
		// TODO Auto-generated method stub
		dao.delUser(u_id);

	}

	@Override
	public List<UserVO> inUserAllList(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.inUserAllList(pvo);
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}

}
