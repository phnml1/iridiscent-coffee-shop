package my.model;

import java.util.List;

public class ReviewListView {

	private int reviewTotalCount; //��ü ��ǰ ����
	private int currentPageNumber; //���� ������ ��ȣ
	private List<Review> reviewList; //�� �������� �������� ��ǰ ����Ʈ
	private int pageTotalCount; //��ü ������ ��
	private int reviewCountPerPage; //�������� ������ ��ǰ ����
	
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
