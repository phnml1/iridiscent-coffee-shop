package my.model;

import java.util.List;
public class CoffeeListView {
	private int coffeeTotalCount;	//전체상품갯수
	private int currentPageNumber; 	//현재페이지번호
	private List<Picture> coffeeList;  //한페이지에보여지는 상품리스트
	private int pageTotalCount;		//전체페이지수
	private int coffeeCountPerPage;	//페이지당 보여줄 상품 갯수
	public CoffeeListView(int coffeeTotalCount, int currentPageNumber, List<Picture> coffeeList, int pageTotalCount,
			int coffeeCountPerPage) {
		super();
		this.coffeeTotalCount = coffeeTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.coffeeList = coffeeList;
		this.pageTotalCount = pageTotalCount;
		this.coffeeCountPerPage = coffeeCountPerPage;
	}
	public CoffeeListView(int coffeeTotalCount2, int currentPageNumber2, List<Coffee> coffeeList2,
			int coffeecountperpage2) {
		// TODO Auto-generated constructor stub
	}
	public int getCoffeeTotalCount() {
		return coffeeTotalCount;
	}
	public void setCoffeeTotalCount(int coffeeTotalCount) {
		this.coffeeTotalCount = coffeeTotalCount;
	}
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	public List<Picture> getCoffeeList() {
		return coffeeList;
	}
	public void setCoffeeList(List<Picture> coffeeList) {
		this.coffeeList = coffeeList;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	public int getCoffeeCountPerPage() {
		return coffeeCountPerPage;
	}
	public void setCoffeeCountPerPage(int coffeeCountPerPage) {
		this.coffeeCountPerPage = coffeeCountPerPage;
	}
	
	private void calculatePageTotalCount() {
		if (coffeeTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = coffeeTotalCount / coffeeCountPerPage;
			if (coffeeTotalCount % coffeeCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}
}
		
