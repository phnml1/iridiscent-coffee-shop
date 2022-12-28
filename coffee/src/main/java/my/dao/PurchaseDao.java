package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Purchase;
import my.util.JdbcUtil;

public class PurchaseDao {
	
	public void insert(Connection conn, Purchase purchase) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into purchase (buyerId,pid,amount,price,pdate)"
					+ " values(?,?,?,?,?)");
			pstmt.setString(1, purchase.getBuyerId());
			pstmt.setInt(2, purchase.getPid());
			pstmt.setInt(3, purchase.getAmount());
			pstmt.setInt(4, purchase.getPrice());
			pstmt.setTimestamp(5, new Timestamp(purchase.getPdate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	

	public List<Purchase> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Purchase> purchaseList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from purchase ");			
			rs  = pstmt.executeQuery(); 
			purchaseList = new ArrayList<Purchase>();
			while (rs.next()){
				Purchase purchase = new Purchase();
				purchase.setPurchaseId(rs.getInt(1));
				purchase.setBuyerId(rs.getString(2));
				purchase.setPid(rs.getInt(3));
				purchase.setAmount(rs.getInt(4));
				purchase.setPrice(rs.getInt(5));
				purchase.setPdate(rs.getTimestamp(6));
				purchaseList.add(purchase);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return purchaseList;
	}
}




















