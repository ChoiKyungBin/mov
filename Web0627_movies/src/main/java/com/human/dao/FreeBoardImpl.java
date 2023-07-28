package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.FreeBoardVO;
import com.human.vo.PageVO;

@Repository
public class FreeBoardImpl implements IF_FreeBoardDAO {
	private static String mapperQuery = "com.human.dao.IF_FreeBoardDAO";
	@Inject
	SqlSession sqlsession;

	@Override
	public void insert(FreeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert(mapperQuery + ".insert", vo);
	}

	@Override
	public List<FreeBoardVO> selectList(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery + ".selectList", pvo);
	}

	@Override
	public FreeBoardVO detailView(int f_num) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery + ".detailView", f_num);
	}

	@Override
	public int countList() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(mapperQuery + ".countList");
	}

	@Override
	public List<FreeBoardVO> searchTitle(String f_title) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapperQuery + ".searchTitle", f_title);
	}

	@Override
	public void updateView(int f_num) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery + ".updateView", f_num);
	}

	@Override
	public void selectDelete(int f_num) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.delete(mapperQuery + ".selectDelete", f_num);
	}

	@Override
	public void modifyBoard(FreeBoardVO pvo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(mapperQuery + ".modifyBoard", pvo);
	}

}
