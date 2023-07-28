package com.human.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.vo.PageVO;
import com.human.vo.ServiceCenterVO;

@Repository
public class ServiceCenterImpl implements IF_ServiceCenterDAO {

	private static String mapperQuery = "com.human.dao.IF_ServiceCenterDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void scinsert(ServiceCenterVO scvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery + ".scInsert", scvo);
	}

	@Override
	public List<ServiceCenterVO> scSelect(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".scSelect", pvo);
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".listCount");
	}

	@Override
	public void scUpdate(ServiceCenterVO scvo) throws Exception {

		sqlSession.update(mapperQuery + ".scUpdate", scvo);
	}

	// 미완성
	@Override
	public List<ServiceCenterVO> scSearch(String Sword) throws Exception {
		return sqlSession.selectList(mapperQuery + ".scSearch", Sword);
	}

	@Override
	public void cntplus(int sc_num) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery + ".cntplus", sc_num);
	}

	@Override
	public List<ServiceCenterVO> cntList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".cntList");
	}

}