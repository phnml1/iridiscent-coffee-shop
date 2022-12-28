package my.model;

import java.util.List;

public class BoardListView {

	private int boardTotalCount; //��ü ��ǰ ����
	private int currentPageNumber; //���� ������ ��ȣ
	private List<Board> boardList; //�� �������� �������� ��ǰ ����Ʈ
	private int pageTotalCount; //��ü ������ ��
	private int boardCountPerPage; //�������� ������ ��ǰ ����
	
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
