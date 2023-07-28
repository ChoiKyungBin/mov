package com.human.service;

import java.util.List;

import com.human.vo.PageVO;
import com.human.vo.ServiceCenterVO;

public interface IF_ServiceCenterService {

	public void scinsert(ServiceCenterVO scvo) throws Exception;

	public List<ServiceCenterVO> scSelect(PageVO pvo) throws Exception;

	public int listCount() throws Exception;

	public void scUpdate(ServiceCenterVO scvo) throws Exception;

	public List<ServiceCenterVO> scSearch(String Sword) throws Exception;

	public void cntplus(int sc_num) throws Exception;

	public List<ServiceCenterVO> cntList() throws Exception;
}