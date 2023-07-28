package com.human.dao;

import java.util.List;

import com.human.vo.PageVO;
import com.human.vo.ServiceCenterVO;

public interface IF_ServiceCenterDAO {

	public void scinsert(ServiceCenterVO scvo) throws Exception;

	public List<ServiceCenterVO> scSelect(PageVO pvo) throws Exception;

	public int listCount() throws Exception;

	public void scUpdate(ServiceCenterVO scvo) throws Exception;

	// 미완성
	public List<ServiceCenterVO> scSearch(String sWord) throws Exception;

	public void cntplus(int sc_num) throws Exception;

	public List<ServiceCenterVO> cntList() throws Exception;
}