package com.human.service;

import java.util.List;

import com.human.vo.PageVO;
import com.human.vo.UserVO;

public interface IF_UserService {
	public void insertUser(UserVO vo) throws Exception;

	public UserVO loginCheck(UserVO uvo) throws Exception;

	public String u_findId(String u_email, String u_pw) throws Exception;

	public String u_findPw(String u_id, String u_email) throws Exception;

	public int idDuplicateCheck(String checkId) throws Exception;

	public UserVO myInformation(String u_id) throws Exception;

	public void myupdate(UserVO uvo) throws Exception;

	public void delUser(String u_id) throws Exception;

	public List<UserVO> inUserAllList(PageVO pvo) throws Exception;

	public int listCount() throws Exception;
}
