package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Picture;
import my.model.PictureListView;
import my.util.JdbcUtil;

public class PictureDao {
	
	public void insert(Connection conn, Picture picture) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into picture (title,name,memo,image,price,rdate,favorate,kind)"
					+ " values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, picture.getTitle());
			pstmt.setString(2, picture.getName());
			pstmt.setString(3, picture.getMemo());
			pstmt.setString(4, picture.getImage());
			pstmt.setInt(5, picture.getPrice());
			pstmt.setTimestamp(6, new Timestamp(picture.getRdate().getTime()));
			pstmt.setInt(7, picture.getFavorate());
			pstmt.setString(8, picture.getKind());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Picture selectById(Connection conn, int pictureId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Picture picture = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from picture where pictureId = ?");
			pstmt.setInt(1, pictureId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				picture = new Picture(); 
				picture.setPictureId(rs.getInt(1));
				picture.setTitle(rs.getString(2));
				picture.setName(rs.getString(3));
				picture.setMemo(rs.getString(4));
				picture.setImage(rs.getString(5));
				picture.setPrice(rs.getInt(6));
				picture.setRdate(rs.getTimestamp(7));
				picture.setFavorate(rs.getInt(8));
				picture.setKind(rs.getString(9));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return picture;
	}
	
	public List<Picture> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Picture picture = null; 
		List<Picture> pictures = new ArrayList<Picture>();
		String sql = "select * from picture ";
		if(keyword !=null && !keyword.equals("")) {
			sql += "where "+target+" like '%"+keyword+"%'";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				picture = new Picture(); 
				picture.setPictureId(rs.getInt(1));
				picture.setTitle(rs.getString(2));
				picture.setName(rs.getString(3));
				picture.setMemo(rs.getString(4));
				picture.setImage(rs.getString(5));
				picture.setPrice(rs.getInt(6));
				picture.setRdate(rs.getTimestamp(7));
				picture.setFavorate(rs.getInt(8));
				picture.setKind(rs.getString(9));
				pictures.add(picture);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return pictures;
	}
	public List<Picture> selectTheme(Connection conn, String theme,String kind) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		List<Picture> pictures = new ArrayList<Picture>();
		Picture picture= null;
	 //order by favorate desc, order by rdate desc ...
		List<Picture> pictureList = null;
		try {
			pstmt = conn.prepareStatement("select * from picture where kind=? "+theme);
			pstmt.setString(1, kind);
			rs  = pstmt.executeQuery(); 
			while (rs.next()){
				picture = new Picture(); 
				picture.setPictureId(rs.getInt(1));
				picture.setTitle(rs.getString(2));
				picture.setName(rs.getString(3));
				picture.setMemo(rs.getString(4));
				picture.setImage(rs.getString(5));
				picture.setPrice(rs.getInt(6));
				picture.setRdate(rs.getTimestamp(7));
				picture.setFavorate(rs.getInt(8));
				picture.setKind(rs.getString(9));
				pictures.add(picture);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return pictures;
	}
	
	public void update(Connection conn, Picture picture) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update picture set title=?,name=?,memo=?, "
					+ "   image=?, price=? where pictureId=?");
			pstmt.setString(1, picture.getTitle());
			pstmt.setString(2, picture.getName());
			pstmt.setString(3, picture.getMemo());
			pstmt.setString(4, picture.getImage());
			pstmt.setInt(5, picture.getPrice());
			pstmt.setInt(6, picture.getPictureId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void updateFav(Connection conn, int pid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update picture set favorate = favorate+1 where pictureId=?");
			pstmt.setInt(1, pid);
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int pictureId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from picture where pictureId = ?");
			pstmt.setInt(1, pictureId);
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
			rs = stmt.executeQuery("select count(*) from picture");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Picture> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Picture> pictureList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from picture ");			
			rs  = pstmt.executeQuery(); 
			pictureList = new ArrayList<Picture>();
			while (rs.next()){
				Picture picture = new Picture();
				picture = new Picture(); 
				picture.setPictureId(rs.getInt(1));
				picture.setTitle(rs.getString(2));
				picture.setName(rs.getString(3));
				picture.setMemo(rs.getString(4));
				picture.setImage(rs.getString(5));
				picture.setPrice(rs.getInt(6));
				picture.setRdate(rs.getTimestamp(7));
				picture.setFavorate(rs.getInt(8));
				picture.setKind(rs.getString(9));
				pictureList.add(picture);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return pictureList;
	}
	public List<Picture> selectKindList(Connection conn,String kind) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Picture> pictureList = null;
		try {
			pstmt = conn.prepareStatement("select * from picture where kind=?");
			pstmt.setString(1, kind);
			rs  = pstmt.executeQuery(); 
			pictureList = new ArrayList<Picture>();
			while (rs.next()){
				Picture picture = new Picture();
				picture = new Picture(); 
				picture.setPictureId(rs.getInt(1));
				picture.setTitle(rs.getString(2));
				picture.setName(rs.getString(3));
				picture.setMemo(rs.getString(4));
				picture.setImage(rs.getString(5));
				picture.setPrice(rs.getInt(6));
				picture.setRdate(rs.getTimestamp(7));
				picture.setFavorate(rs.getInt(8));
				picture.setKind(rs.getString(9));
				pictureList.add(picture);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return pictureList;
	}
	public List<String> getKinds(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = null;
		try {
			pstmt = conn.prepareStatement("select kind from picture group by kind");			
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
	public List<Picture> selectListByLimit(Connection conn,int firstRow ,int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Picture> pictureList = null;
		try {
			pstmt = conn.prepareStatement ("select * from picture limit ?,?");
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			rs  = pstmt.executeQuery(); 
			pictureList = new ArrayList<Picture>();
			while (rs.next()){
				Picture picture = new Picture();
				picture = new Picture(); 
				picture.setPictureId(rs.getInt(1));
				picture.setTitle(rs.getString(2));
				picture.setName(rs.getString(3));
				picture.setMemo(rs.getString(4));
				picture.setImage(rs.getString(5));
				picture.setPrice(rs.getInt(6));
				picture.setRdate(rs.getTimestamp(7));
				picture.setFavorate(rs.getInt(8));
				picture.setKind(rs.getString(9));
				pictureList.add(picture);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return pictureList;
	}
	
	private static final int pictureCountPerPage = 5;

	public PictureListView getPictureList(Connection conn,int pageNumber)
			throws SQLException {
		
		int currentPageNumber = pageNumber;
		PictureListView plv = null;
		try {
			
			int pictureTotalCount = selectCount(conn);
			List<Picture> pictureList = null;
			int firstRow = 0; //2page -> 5
			int endRow = 0;	//2page -> 5
			if (pictureTotalCount > 0) {
				firstRow =  (pageNumber - 1) * pictureCountPerPage;
				endRow = pictureCountPerPage; //2page -> 5, 5(가져올때 6,10까지)
				pictureList =selectListByLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				pictureList = Collections.emptyList();
			}
			plv =  new PictureListView(pictureTotalCount,
					currentPageNumber, pictureList,
					pictureCountPerPage);
		} catch (SQLException e) {
		} finally {
			//JdbcUtil.close(conn);
		}
		return plv;
	}

}




















