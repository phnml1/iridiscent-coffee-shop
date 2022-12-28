package my.model;

import java.util.List;
public class PictureListView {
		private int pictureTotalCount;	//전체상품갯수
		private int currentPageNumber; 	//현재페이지번호
		private List<Picture> pictureList;  //한페이지에보여지는 상품리스트
		private int pageTotalCount;		//전체페이지수
		private int pictureCountPerPage;	//페이지당 보여줄 상품 갯수
		
		
		public PictureListView(int pictureTotalCount, int currentPageNumber, List<Picture> pictureList,
				 int pictureCountPerPage) {
			super();
			this.pictureTotalCount = pictureTotalCount;
			this.currentPageNumber = currentPageNumber;
			this.pictureList = pictureList;
			this.pictureCountPerPage = pictureCountPerPage;
			calculatePageTotalCount();
		}

		public int getPictureTotalCount() {
			return pictureTotalCount;
		}

		public void setPictureTotalCount(int pictureTotalCount) {
			this.pictureTotalCount = pictureTotalCount;
		}

		public int getCurrentPageNumber() {
			return currentPageNumber;
		}

		public void setCurrentPageNumber(int currentPageNumber) {
			this.currentPageNumber = currentPageNumber;
		}

		public List<Picture> getPictureList() {
			return pictureList;
		}

		public void setPictureList(List<Picture> pictureList) {
			this.pictureList = pictureList;
		}

		public int getPageTotalCount() {
			return pageTotalCount;
		}

		public void setPageTotalCount(int pageTotalCount) {
			this.pageTotalCount = pageTotalCount;
		}

		public int getPictureCountPerPage() {
			return pictureCountPerPage;
		}

		public void setPictureCountPerPage(int pictureCountPerPage) {
			this.pictureCountPerPage = pictureCountPerPage;
		}
		
		private void calculatePageTotalCount() {
			if (pictureTotalCount == 0) {
				pageTotalCount = 0;
			} else {
				pageTotalCount = pictureTotalCount / pictureCountPerPage;
				if (pictureTotalCount % pictureCountPerPage > 0) {
					pageTotalCount++;
				}
			}
		}

		
		
		
}
