package my.model;

import java.util.Date;

public class Review {
   private int boardId;
   private String title;
   private String memo;
   private String userId;
   private Date bdate;
   private int score;
   private String image;
   private String kind;
   
   public Review() { }

public Review(String title, String memo, String userId, Date bdate, int score, String image, String kind) {
	super();
	this.title = title;
	this.memo = memo;
	this.userId = userId;
	this.bdate = bdate;
	this.score = score;
	this.image = image;
	this.kind = kind;
}

public Review(int boardId, String title, String memo, String userId, Date bdate, int score, String image, String kind) {
	super();
	this.boardId = boardId;
	this.title = title;
	this.memo = memo;
	this.userId = userId;
	this.bdate = bdate;
	this.score = score;
	this.image = image;
	this.kind = kind;
}

public int getBoardId() {
	return boardId;
}

public void setBoardId(int boardId) {
	this.boardId = boardId;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getMemo() {
	return memo;
}

public void setMemo(String memo) {
	this.memo = memo;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public Date getBdate() {
	return bdate;
}

public void setBdate(Date bdate) {
	this.bdate = bdate;
}

public int getScore() {
	return score;
}

public void setScore(int score) {
	this.score = score;
}

public String getImage() {
	return image;
}

public void setImage(String image) {
	this.image = image;
}

public String getKind() {
	return kind;
}

public void setKind(String kind) {
	this.kind = kind;
}
   
   
   
}