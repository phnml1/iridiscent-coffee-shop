package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Review;
import my.model.ReviewListView;
import my.util.JdbcUtil;

public class ReviewDao {


   public void insert(Connection conn, Review review) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("insert into review (title, userId, bdate, memo, score, image, kind)"
               + " values(?,?,?,?,?,?,?)");
         pstmt.setString(1, review.getTitle());
         pstmt.setString(2, review.getUserId());
         pstmt.setTimestamp(3, new Timestamp(review.getBdate().getTime()));
         pstmt.setString(4, review.getMemo());
         pstmt.setInt(5,review.getScore());
         pstmt.setString(6, review.getImage());
         pstmt.setString(7, review.getKind());
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public Review selectById (Connection conn, int boardId) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Review review = null; 
      try {
         pstmt = conn.prepareStatement
         ("select * from review where boardId = ?");
         pstmt.setInt(1, boardId);
         rs = pstmt.executeQuery();
         if (rs.next()){
        	review = new Review(); 
        	review.setBoardId(rs.getInt(1));
        	review.setTitle(rs.getString(2));
        	review.setUserId(rs.getString(3));
        	review.setBdate(rs.getTimestamp(4));
        	review.setMemo(rs.getString(5));
        	review.setScore(rs.getInt(6));
        	review.setImage(rs.getString(7));
        	review.setKind(rs.getString(8));
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return review;
   }
   
   public List<Review> selectLike(Connection conn, String target, String keyword) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Review review = null; 
      List<Review> reviews = new ArrayList<Review>();
      try {
         pstmt = conn.prepareStatement
         ("select * from review where " +target +" like ?");
         pstmt.setString(1, "%"+keyword+"%");
         rs = pstmt.executeQuery();
         while (rs.next()){
        	review = new Review(); 
        	review.setBoardId(rs.getInt(1));
         	review.setTitle(rs.getString(2));
         	review.setUserId(rs.getString(3));
         	review.setBdate(rs.getTimestamp(4));
         	review.setMemo(rs.getString(5));
         	review.setScore(rs.getInt(6));
         	review.setImage(rs.getString(7));
         	review.setKind(rs.getString(8));
        	reviews.add(review);
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return reviews;
   }
   
   public void update(Connection conn, Review review) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update review set title=?,userId=?,bdate=?, "+"    "
					+ "memo=?,score=?,image=?,kind=? where boardid=?");
			pstmt.setString(1, review.getTitle());
			pstmt.setString(2, review.getUserId());
			pstmt.setTimestamp(3, new Timestamp(review.getBdate().getTime()));
			pstmt.setString(4, review.getMemo());
			pstmt.setInt(5,review.getScore());
			pstmt.setString(6, review.getImage());
			pstmt.setString(7, review.getKind());
			pstmt.setInt(8,review.getBoardId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
   
   public void deleteById(Connection conn, int boardId) 
         throws SQLException {
      PreparedStatement pstmt=null;       
      try {
         pstmt = conn.prepareStatement
         ("delete from review where boardId = ?");
         pstmt.setInt(1, boardId);
         pstmt.executeUpdate();         
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public int selectCount(Connection conn) throws SQLException {
      Statement stmt = null; 
      ResultSet rs = null; 
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery("select count(*) from review");
         rs.next();
         return rs.getInt(1);
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(rs);
      }
   }
   
   public List<Review> selectList(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Review> reviewList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from review ");         
         rs  = pstmt.executeQuery(); 
         reviewList = new ArrayList<Review>();
         while (rs.next()){
            Review review = new Review(); 
            review.setBoardId(rs.getInt(1));
        	review.setTitle(rs.getString(2));
        	review.setUserId(rs.getString(3));
        	review.setBdate(rs.getTimestamp(4));
        	review.setMemo(rs.getString(5));
        	review.setScore(rs.getInt(6));
        	review.setImage(rs.getString(7));
        	review.setKind(rs.getString(8));
            reviewList.add(review);
         }
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return reviewList;
   }

   public List<Review> selectListByLimit(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> reviewList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from review limit ?,?");
			pstmt.setInt(1,  firstRow);
			pstmt.setInt(2, endRow);
			rs  = pstmt.executeQuery(); 
			reviewList = new ArrayList<Review>();
			while (rs.next()){
				Review review = new Review();
				review.setBoardId(rs.getInt(1));
	        	review.setTitle(rs.getString(2));
	        	review.setUserId(rs.getString(3));
	        	review.setBdate(rs.getTimestamp(4));
	        	review.setMemo(rs.getString(5));
	        	review.setScore(rs.getInt(6));
	        	review.setImage(rs.getString(7));
	        	review.setKind(rs.getString(8));
				reviewList.add(review);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return reviewList;
	}
	private static final int reviewCountPerPage = 5;

  
  public ReviewListView getReviewList(Connection conn, int pageNumber)
			throws SQLException {
		int currentPageNumber = pageNumber;
		ReviewListView plv = null;
		try {
			int reviewTotalCount = selectCount(conn);
			List<Review> reviewList = null;
			int firstRow = 0; 
			int endRow = 0; 
			if (reviewTotalCount > 0) {
				firstRow = (pageNumber - 1) * reviewCountPerPage;
				endRow = reviewCountPerPage; //2page->5, 5 (������ �� 6,10����)
				reviewList = selectListByLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				reviewList = Collections.emptyList();
			}
			plv = new ReviewListView(reviewTotalCount, currentPageNumber, reviewList,
					reviewCountPerPage);
		} catch (SQLException e) {
		} finally {
			//JdbcUtil.close(conn);
		}
		return plv;
	}

   public int deleteReview(Connection conn, int boardId)
   throws SQLException{
   try {
      PreparedStatement pstmt = conn.prepareStatement
            ("update review set boardAvailable = 0 where boardId=?");
           pstmt.setInt(1, boardId);
           return pstmt.executeUpdate();
   }catch(SQLException e) {
      e.printStackTrace();
   }
   return -1;
   }
   
   public List<String> getKinds(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = null;
		try {
			pstmt = conn.prepareStatement
					("select kind from Review group by kind");			
			rs  = pstmt.executeQuery(); 
			list = new ArrayList<String>();
			while (rs.next()){
				String kind = rs.getString(1);
				list.add(kind);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return list;
	}
	public List<Review> selectKindList(Connection conn, String kind) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> reviewList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from Review where kind=?");		
			pstmt.setString(1, kind);
			rs  = pstmt.executeQuery(); 
			reviewList = new ArrayList<Review>();
			while (rs.next()){
				Review review = new Review();
				review.setBoardId(rs.getInt(1));
	        	review.setTitle(rs.getString(2));
	        	review.setUserId(rs.getString(3));
	        	review.setBdate(rs.getTimestamp(4));
	        	review.setMemo(rs.getString(5));
	        	review.setScore(rs.getInt(6));
	        	review.setImage(rs.getString(7));
	        	review.setKind(rs.getString(8));
				reviewList.add(review);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return reviewList;
	}

}