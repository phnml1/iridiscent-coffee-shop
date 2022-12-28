package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Board;
import my.model.BoardListView;
import my.util.JdbcUtil;

public class BoardDao {


   public void insert(Connection conn, Board board) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("insert into board (title, userId, bdate, memo, userPw)"
               + " values(?,?,?,?,?)");
         pstmt.setString(1, board.getTitle());
         pstmt.setString(2, board.getUserId());
         pstmt.setTimestamp(3, new Timestamp(board.getBdate().getTime()));
         pstmt.setString(4, board.getMemo());
         pstmt.setString(5, board.getUserPw());
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public Board selectById(Connection conn, int boardId) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Board board = null; 
      try {
         pstmt = conn.prepareStatement
         ("select * from board where boardId = ?");
         pstmt.setInt(1, boardId);
         rs = pstmt.executeQuery();
         if (rs.next()){
            board = new Board(); 
            board.setBoardId(rs.getInt(1));
            board.setTitle(rs.getString(2));
            board.setUserId(rs.getString(3));
            board.setBdate(rs.getTimestamp(4));
            board.setMemo(rs.getString(5));;
            board.setUserPw(rs.getString(6));
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return board;
   }
   
   public List<Board> selectLike(Connection conn, String target, String keyword) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Board board = null; 
      List<Board> boards = new ArrayList<Board>();
      try {
         pstmt = conn.prepareStatement
         ("select * from board where " +target +" like ?");
         pstmt.setString(1, "%"+keyword+"%");
         rs = pstmt.executeQuery();
         while (rs.next()){
            board = new Board(); 
            board.setBoardId(rs.getInt(1));
            board.setTitle(rs.getString(2));
            board.setUserId(rs.getString(3));
            board.setBdate(rs.getTimestamp(4));
            board.setMemo(rs.getString(5));;
            board.setUserPw(rs.getString(6));
            boards.add(board);
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return boards;
   }
   
   public void update(Connection conn, Board board) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update board set title=?,memo=?,userId=?, "+"    "
					+ "bdate=? where boardId=?");
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getMemo());
			pstmt.setString(3, board.getUserId());
			pstmt.setTimestamp(4, new Timestamp(board.getBdate().getTime()));
			pstmt.setInt(5, board.getBoardId());
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
         ("delete from board where boardId = ?");
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
         rs = stmt.executeQuery("select count(*) from board");
         rs.next();
         return rs.getInt(1);
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(rs);
      }
   }
   
   public List<Board> selectList(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Board> boardList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from board ");         
         rs  = pstmt.executeQuery(); 
         boardList = new ArrayList<Board>();
         while (rs.next()){
            Board board = new Board(); 
            board.setBoardId(rs.getInt(1));
            board.setTitle(rs.getString(2));
            board.setUserId(rs.getString(3));
            board.setBdate(rs.getTimestamp(4));
            board.setMemo(rs.getString(5));;
            board.setUserPw(rs.getString(6));
            boardList.add(board);
         }
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return boardList;
   }


   public int deleteBoard(Connection conn, int boardId)
   throws SQLException{
   try {
      PreparedStatement pstmt = conn.prepareStatement
            ("update board set boardAvailable = 0 where boardId=?");
           pstmt.setInt(1, boardId);
           return pstmt.executeUpdate();
   }catch(SQLException e) {
      e.printStackTrace();
   }
   return -1;
   }
   
  
	public List<Board> selectListByLimit(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from board limit ?,?");
			pstmt.setInt(1,  firstRow);
			pstmt.setInt(2, endRow);
			rs  = pstmt.executeQuery(); 
			boardList = new ArrayList<Board>();
			while (rs.next()){
				Board board = new Board();
				board = new Board();
				board.setBoardId(rs.getInt(1));
	            board.setTitle(rs.getString(2));
	            board.setUserId(rs.getString(3));
	            board.setBdate(rs.getTimestamp(4));
	            board.setMemo(rs.getString(5));;
	            board.setUserPw(rs.getString(6));
				boardList.add(board);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return boardList;
	}
	private static final int boardCountPerPage = 7;

   
   public BoardListView getBoardList(Connection conn, int pageNumber)
			throws SQLException {
		int currentPageNumber = pageNumber;
		BoardListView plv = null;
		try {
			int boardTotalCount = selectCount(conn);
			List<Board> boardList = null;
			int firstRow = 0; 
			int endRow = 0; 
			if (boardTotalCount > 0) {
				firstRow = (pageNumber - 1) * boardCountPerPage;
				endRow = boardCountPerPage; //2page->5, 5 (������ �� 6,10����)
				boardList = selectListByLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				boardList = Collections.emptyList();
			}
			plv = new BoardListView(boardTotalCount, currentPageNumber, boardList,
					 boardCountPerPage);
		} catch (SQLException e) {
		} finally {
			//JdbcUtil.close(conn);
		}
		return plv;
	}
}