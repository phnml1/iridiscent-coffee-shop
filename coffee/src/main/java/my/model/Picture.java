package my.model;

import java.util.Date;

public class Picture {
	private int pictureId;
	private String title;
	private String name;
	private String memo;
	private String image;
	private int price;
	private Date rdate;
	private int favorate;
	private String kind;
	
	public Picture() {}

	public Picture(int pictureId, String title, String name, String memo, String image, int price, Date rdate, int favorate,String kind) {
		super();
		this.pictureId = pictureId;
		this.title = title;
		this.name = name;
		this.memo = memo;
		this.image = image;
		this.price = price;
		this.rdate = rdate;
		this.favorate = favorate;
		this.kind = kind;
	}
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public int getFavorate() {
		return favorate;
	}

	public void setFavorate(int favorate) {
		this.favorate = favorate;
	}

	public int getPictureId() {
		return pictureId;
	}

	public void setPictureId(int pictureId) {
		this.pictureId = pictureId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
	
}
