package my.model;

import java.util.List;

public class BoardListView {

	private int boardTotalCount; //전체 상품 갯수
	private int currentPageNumber; //현재 페이지 번호
	private List<Board> boardList; //한 페이지에 보여지는 상품 리스트
	private int pageTotalCount; //전체 페이지 수
	private int boardCountPerPage; //페이지당 보여줄 상품 갯수
	
	public BoardListView(int boardTotalCount, int currentPageNumber, List<Board> boardList,
			int boardCountPerPage) {
		super();
		this.boardTotalCount = boardTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.boardList = boardList;
		this.boardCountPerPage = boardCountPerPage;
		calculatePageTotalCount();
	}

	public int getBoardTotalCount() {
		return boardTotalCount;
	}

	public void setBoardTotalCount(int boardTotalCount) {
		this.boardTotalCount = boardTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Board> getPictureList() {
		return boardList;
	}

	public void setBoardList(List<Board> boardList) {
		this.boardList = boardList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getBoardCountPerPage() {
		return boardCountPerPage;
	}

	public void setBoardCountPerPage(int boardCountPerPage) {
		this.boardCountPerPage = boardCountPerPage;
	}

	private void calculatePageTotalCount() {
		if (boardTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = boardTotalCount / boardCountPerPage;
			if (boardTotalCount % boardCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	
}
