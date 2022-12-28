package my.model;

import java.util.List;

public class ReviewListView {

	private int reviewTotalCount; //전체 상품 갯수
	private int currentPageNumber; //현재 페이지 번호
	private List<Review> reviewList; //한 페이지에 보여지는 상품 리스트
	private int pageTotalCount; //전체 페이지 수
	private int reviewCountPerPage; //페이지당 보여줄 상품 갯수
	
	public ReviewListView(int reviewTotalCount, int currentPageNumber, List<Review> reviewList,
			int reviewCountPerPage) {
		super();
		this.reviewTotalCount = reviewTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.reviewList = reviewList;
		this.reviewCountPerPage = reviewCountPerPage;
		calculatePageTotalCount();
	}

	public int getReviewTotalCount() {
		return reviewTotalCount;
	}

	public void setReviewTotalCount(int reviewTotalCount) {
		this.reviewTotalCount = reviewTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Review> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getReviewCountPerPage() {
		return reviewCountPerPage;
	}

	public void setReviewCountPerPage(int reviewCountPerPage) {
		this.reviewCountPerPage = reviewCountPerPage;
	}

	private void calculatePageTotalCount() {
		if (reviewTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = reviewTotalCount / reviewCountPerPage;
			if (reviewTotalCount % reviewCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	
}
