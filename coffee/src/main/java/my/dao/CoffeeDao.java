package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Coffee;
import my.model.CoffeeListView;
import my.model.PictureListView;
import my.util.JdbcUtil;

public class CoffeeDao {
	
	public void insert(Connection conn, Coffee coffee) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into coffee (title,name,memo,image,price,rdate,favorate,kind,detailimage)"
					+ " values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, coffee.getTitle());
			pstmt.setString(2, coffee.getName());
			pstmt.setString(3, coffee.getMemo());
			pstmt.setString(4, coffee.getImage());
			pstmt.setInt(5, coffee.getPrice());
			pstmt.setTimestamp(6, new Timestamp(coffee.getRdate().getTime()));
			pstmt.setString(7, coffee.getFavorate());
			pstmt.setString(8, coffee.getKind());
			pstmt.setString(9, coffee.getDetailimage());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Coffee selectById(Connection conn, int coffeeId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Coffee coffee = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from coffee where coffeeId = ?");
			pstmt.setInt(1, coffeeId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				coffee = new Coffee(); 
				coffee.setCoffeeId(rs.getInt(1));
				coffee.setTitle(rs.getString(2));
				coffee.setName(rs.getString(3));
				coffee.setMemo(rs.getString(4));
				coffee.setImage(rs.getString(5));
				coffee.setPrice(rs.getInt(6));
				coffee.setRdate(rs.getTimestamp(7));
				coffee.setFavorate(rs.getString(8));
				coffee.setKind(rs.getString(9));
				coffee.setDetailimage(rs.getString(10));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return coffee;
	}
	
	public List<Coffee> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Coffee coffee = null; 
		List<Coffee> coffees = new ArrayList<Coffee>();
		String sql = "select * from coffee ";
		if(keyword !=null && !keyword.equals("")) {
			sql += "where "+target+" like '%"+keyword+"%'";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				coffee = new Coffee(); 
				coffee.setCoffeeId(rs.getInt(1));
				coffee.setTitle(rs.getString(2));
				coffee.setName(rs.getString(3));
				coffee.setMemo(rs.getString(4));
				coffee.setImage(rs.getString(5));
				coffee.setPrice(rs.getInt(6));
				coffee.setRdate(rs.getTimestamp(7));
				coffee.setFavorate(rs.getString(8));
				coffee.setKind(rs.getString(9));
				coffee.setDetailimage(rs.getString(10));
				coffees.add(coffee);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return coffees;
	}
	public List<Coffee> selectTheme(Connection conn, String theme,String kind) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		List<Coffee> coffees = new ArrayList<Coffee>();
		Coffee coffee= null;
	 //order by favorate desc, order by rdate desc ...
		List<Coffee> coffeeList = null;
		try {
			pstmt = conn.prepareStatement("select * from coffee where kind=? "+theme);
			pstmt.setString(1, kind);
			rs  = pstmt.executeQuery(); 
			while (rs.next()){
				coffee = new Coffee(); 
				coffee.setCoffeeId(rs.getInt(1));
				coffee.setTitle(rs.getString(2));
				coffee.setName(rs.getString(3));
				coffee.setMemo(rs.getString(4));
				coffee.setImage(rs.getString(5));
				coffee.setPrice(rs.getInt(6));
				coffee.setRdate(rs.getTimestamp(7));
				coffee.setFavorate(rs.getString(8));
				coffee.setKind(rs.getString(9));
				coffee.setDetailimage(rs.getString(10));
				coffees.add(coffee);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return coffees;
	}
	
	public void update(Connection conn, Coffee coffee) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update coffee set title=?,name=?,memo=?, "
					+ "   image=?, price=? where coffeeId=?");
			pstmt.setString(1, coffee.getTitle());
			pstmt.setString(2, coffee.getName());
			pstmt.setString(3, coffee.getMemo());
			pstmt.setString(4, coffee.getImage());
			pstmt.setInt(5, coffee.getPrice());
			pstmt.setInt(6, coffee.getCoffeeId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void updateFav(Connection conn, int pid,String fav) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update coffee set favorate = ? where coffeeId=?");
			pstmt.setString(1, fav);
			pstmt.setInt(2, pid);
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int coffeeId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from coffee where coffeeId = ?");
			pstmt.setInt(1, coffeeId);
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
			rs = stmt.executeQuery("select count(*) from coffee");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Coffee> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Coffee> coffeeList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from coffee ");			
			rs  = pstmt.executeQuery(); 
			coffeeList = new ArrayList<Coffee>();
			while (rs.next()){
				Coffee coffee = new Coffee();
				coffee = new Coffee(); 
				coffee.setCoffeeId(rs.getInt(1));
				coffee.setTitle(rs.getString(2));
				coffee.setName(rs.getString(3));
				coffee.setMemo(rs.getString(4));
				coffee.setImage(rs.getString(5));
				coffee.setPrice(rs.getInt(6));
				coffee.setRdate(rs.getTimestamp(7));
				coffee.setFavorate(rs.getString(8));
				coffee.setKind(rs.getString(9));
				coffee.setDetailimage(rs.getString(10));
				coffeeList.add(coffee);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return coffeeList;
	}
	public List<Coffee> selectKindList(Connection conn,String kind) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Coffee> coffeeList = null;
		try {
			pstmt = conn.prepareStatement("select * from coffee where kind=?");
			pstmt.setString(1, kind);
			rs  = pstmt.executeQuery(); 
			coffeeList = new ArrayList<Coffee>();
			while (rs.next()){
				Coffee coffee = new Coffee();
				coffee = new Coffee(); 
				coffee.setCoffeeId(rs.getInt(1));
				coffee.setTitle(rs.getString(2));
				coffee.setName(rs.getString(3));
				coffee.setMemo(rs.getString(4));
				coffee.setImage(rs.getString(5));
				coffee.setPrice(rs.getInt(6));
				coffee.setRdate(rs.getTimestamp(7));
				coffee.setFavorate(rs.getString(8));
				coffee.setKind(rs.getString(9));
				coffee.setDetailimage(rs.getString(10));
				coffeeList.add(coffee);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return coffeeList;
	}
	public List<String> getKinds(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = null;
		try {
			pstmt = conn.prepareStatement("select kind from coffee group by kind");			
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
	public List<Coffee> selectListByLimit(Connection conn,int firstRow ,int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Coffee> coffeeList = null;
		try {
			pstmt = conn.prepareStatement ("select * from coffee limit ?,?");
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			rs  = pstmt.executeQuery(); 
			coffeeList = new ArrayList<Coffee>();
			while (rs.next()){
				Coffee coffee = new Coffee();
				coffee = new Coffee(); 
				coffee.setCoffeeId(rs.getInt(1));
				coffee.setTitle(rs.getString(2));
				coffee.setName(rs.getString(3));
				coffee.setMemo(rs.getString(4));
				coffee.setImage(rs.getString(5));
				coffee.setPrice(rs.getInt(6));
				coffee.setRdate(rs.getTimestamp(7));
				coffee.setFavorate(rs.getString(8));
				coffee.setKind(rs.getString(9));
				coffee.setDetailimage(rs.getString(10));
				coffeeList.add(coffee);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return coffeeList;
	}
	
	private static final int coffeeCountPerPage = 5;

	public CoffeeListView getCoffeeList(Connection conn,int pageNumber)
			throws SQLException {
		
		int currentPageNumber = pageNumber;
		CoffeeListView plv = null;
		try {
			
			int coffeeTotalCount = selectCount(conn);
			List<Coffee> coffeeList = null;
			int firstRow = 0; //2page -> 5
			int endRow = 0;	//2page -> 5
			if (coffeeTotalCount > 0) {
				firstRow =  (pageNumber - 1) * coffeeCountPerPage;
				endRow = coffeeCountPerPage; //2page -> 5, 5(가져올때 6,10까지)
				coffeeList =selectListByLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				coffeeList = Collections.emptyList();
			}
			plv = new CoffeeListView(coffeeTotalCount,
					currentPageNumber, coffeeList,
					coffeeCountPerPage);
		} catch (SQLException e) {
		} finally {
			//JdbcUtil.close(conn);
		}
		return plv;
	}

}




















