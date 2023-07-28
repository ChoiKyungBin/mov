package com.human.vo;

public class PageVO {
	private int startNo; // 페이지에 출력할 게시물의 시작 번호 > 데이터베이스 정렬 후 가져올 튜플의 시작
	private int endNo; // 페이지에 출력할 게시물의 마지막 번호 > 데이터베이스 정렬후 가져올 튜플의 마지막

	// 이것은 계산 대상은 아님..
	private int perPageNum = 10; // 2가지 의미 1. 페이지에 출력할 게시물의 수, 2. 페이지그룹의 수
	private Integer page; // 현재 페이지.. 클라이언트로 부터 정보를 받는다.. 그래서 Integer로 선언함
							// 클라이언트가 텍스로 보내기 때문에 null로 인해 예외방지
	private int totalCount; // 전체 게시물 수.. select count(*) from schedule
	// ----------------------

	private int startPage; // 페이지 그룹의 시작 번호
	private int endPage; // 페이지 그룹의 마지막 번호

	private boolean prev; // 이전 페이지 그룹이 있는가?
	private boolean next; // 이후 페이지 그룹이 있는가?

	private String m_name;

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public void prt() {
		System.out.println("현재 페이지 번호 : " + page);
		System.out.println("페이지 시작 글 번호 : " + startNo);
		System.out.println("페이지 끝 번호  : " + endNo);
		System.out.println("페이지 그룹 시작 번호 : " + startPage);
		System.out.println("페이지 그룹 끝 번호 : " + endPage);
		System.out.println("prev : " + prev);
		System.out.println("next : " + next);
	}

	public void calcPage() { // 페이지 계산 알고리즘 메서드.
		// 페이지에 출력할 게시물의 시작 번호
		startNo = (page - 1) * perPageNum + 1;
		// 2페이지라고 가정했을 때 (2-1)*10+1
		// 페이지에 출력할 게시물의 시작 번호 = 현재페이지 -1 *

		// startPage 계산
		// 1. 마지막페이지를 계산...
		// 2. 마지막페이정보로 시작페이지를 계산..
		// 마지막페이지는 유동적이다. 왜냐면 게시물의 수에 따라 마지막 페이지가 달라 질 수 있다..
		int tempEndPage = (int) (Math.ceil(page / (double) perPageNum) * perPageNum);
		startPage = (tempEndPage - perPageNum) + 1;
		// endPage 보정
		if (tempEndPage * perPageNum > totalCount) {
			endPage = (int) (Math.ceil(totalCount / (double) perPageNum));
			if (endPage != page) { // 마지막 페이지가 아니란 뜻이죠..
				endNo = startNo + perPageNum - 1;
			} else {
				endNo = startNo + totalCount % 10 - 1;
			}
		} else {
			endPage = tempEndPage;
			endNo = startNo + perPageNum - 1;
		}
		prev = startPage != 1;
		next = endPage * perPageNum < totalCount;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

}
