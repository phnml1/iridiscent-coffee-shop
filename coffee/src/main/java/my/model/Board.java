package my.model;

import java.util.Date;

public class Board {
   private int boardId;
   private String title;
   private String memo;
   private String userId;
   private Date bdate;
   private String userPw;
   
   public Board() { }
   
   public Board(String title, String memo, String userId, Date bdate, String userPw) {
      super();
      this.title = title;
      this.memo = memo;
      this.userId = userId;
      this.bdate = bdate;
      this.userPw = userPw;
   }
    public Board(int boardId, String title, String memo, String userId, Date bdate, String userPw) {
        super();
        this.boardId = boardId;
        this.title = title;
       this.memo = memo;
       this.userId = userId;
       this.bdate = bdate;
       this.userPw = userPw;
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

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
}