package com.tayo.www.util;

public class PageInfo {

	private int nowPage;

	private int totalList;

	private int pageList;

	private int pageGroup;

	private int startPage;

	private int endPage;

	private int totalPage;

//	public PageInfo(int nowPage, int totalList, int pageList, int pageGroup ) {
//		this(nowPage, totalList, 10, 5);
//	}

	public PageInfo(int nowPage, int totalList, int pageList, int pageGroup) {
		this.nowPage = nowPage;
		this.totalList = totalList;
		this.pageList = pageList;
		this.pageGroup = pageGroup;

		calcTotalPage();
		clacStartPage();
		calcEndPage();
	}

	public void calcTotalPage() {
		if (totalList % pageList == 0) {
			totalPage = totalList / pageList;
		} else {
			totalPage = (totalList / pageList) + 1;
		}
	}

	public void clacStartPage() {

		int tempGroup = ((nowPage - 1) / pageGroup) + 1;

		startPage = (tempGroup - 1) * pageGroup + 1;
	}

	public void calcEndPage() {

		endPage = startPage + pageGroup - 1;

		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalList() {
		return totalList;
	}

	public void setTotalList(int totalList) {
		this.totalList = totalList;
	}

	public int getPageList() {
		return pageList;
	}

	public void setPageList(int pageList) {
		this.pageList = pageList;
	}

	public int getPageGroup() {
		return pageGroup;
	}

	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
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

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

}
