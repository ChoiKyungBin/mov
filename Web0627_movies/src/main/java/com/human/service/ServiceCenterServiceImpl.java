package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.dao.IF_ServiceCenterDAO;
import com.human.vo.PageVO;
import com.human.vo.ServiceCenterVO;

@Service
public class ServiceCenterServiceImpl implements IF_ServiceCenterService {

	@Inject
	private IF_ServiceCenterDAO dao;

	@Override
	public void scinsert(ServiceCenterVO scvo) throws Exception {
		// TODO Auto-generated method stub
		dao.scinsert(scvo);
	}

	@Override
	public List<ServiceCenterVO> scSelect(PageVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.scSelect(pvo);

	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}

	@Override
	public void scUpdate(ServiceCenterVO scvo) throws Exception {
		// TODO Auto-generated method stub
		dao.scUpdate(scvo);
		;
	}

	// 미완성
	@Override
	public List<ServiceCenterVO> scSearch(String Sword) throws Exception {
		// TODO Auto-generated method stub
		return dao.scSearch(Sword);
	}

	@Override
	public void cntplus(int sc_num) throws Exception {
		// TODO Auto-generated method stub
		dao.cntplus(sc_num);
	}

	@Override
	public List<ServiceCenterVO> cntList() throws Exception {
		// TODO Auto-generated method stub
		return dao.cntList();
	}

}