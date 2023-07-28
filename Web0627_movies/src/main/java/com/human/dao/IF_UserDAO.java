package com.human.dao;

import java.util.List;

import com.human.vo.PageVO;
import com.human.vo.UserVO;

public interface IF_UserDAO {
	// 회원가입
	public void insertUser(UserVO uvo) throws Exception;

	// DB에 있는 데이터인지 확인 후 중복 유저 없으면 가입.
	public UserVO loginCheck(UserVO uvo) throws Exception;

	// 아이디 찾기 (이메일,비밀번호)
	public String u_findId(String u_email, String u_pw) throws Exception;

	// 비밀번호찾기 (이메일,아이디)
	public String u_findPw(String u_id, String u_email) throws Exception;

	// 회원가입아이디중복체크 ajax 비동기식 사용
	public int idDuplicateCheck(String checkId) throws Exception;

	// 내정보보기
	public UserVO myInformation(String id) throws Exception;

	// 내정보 수정
	public void myupdate(UserVO uvo) throws Exception;

	// 회원 탈퇴.
	public void delUser(String u_id) throws Exception;
	
	// 회원 삭제
	public List<UserVO> inUserAllList(PageVO pvo) throws Exception;
	
	public int listCount() throws Exception;
}

