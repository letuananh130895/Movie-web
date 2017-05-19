package Utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Bean.Account;
import Bean.Movie;
import Bean.Contact;

public class DBUtility {
	
	public static void addAccount(Connection conn, Account account) throws SQLException {
	       String sql = "insert into Account values (?,?,?,?,unix_timestamp(?),?)";
	       String sql1 = "insert into History(USER_NAME, ACTION, LOG_TIME) values ('"+account.getUserName()+"','register', unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')))";
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setString(1, account.getUserName());
	       pstm.setString(2, account.getPassword());
	       pstm.setString(3, account.getEmail());
	       pstm.setInt(4, account.getPoint());
	       pstm.setString(5, account.getTime());
	       int per=0;
	       if (account.getPer().equals("admin")) per=1;
	       pstm.setInt(6, per);
	       pstm.executeUpdate();
	       pstm = conn.prepareStatement(sql1);
	       pstm.executeUpdate();
	   }
	
	
	public static Account findAccount(Connection conn, String userName) throws SQLException {
	       String sql = "select USER_NAME, PASSWORD, EMAIL from Account where USER_NAME=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setString(1, userName);
	 
	       ResultSet rs = pstm.executeQuery();
	 
	       while (rs.next()) {
	           String password = rs.getString(2);
	           String email = rs.getString(3);
	           Account account = new Account(userName, password, email);
	           return account;
	       }
	       return null;
	   }
	
	public static Movie findMovie(Connection conn, int id) throws SQLException {
	       String sql = "select * from Movie where ID=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setInt(1, id);
	 
	       ResultSet rs = pstm.executeQuery();
	 
	       while (rs.next()) {
	           String name = rs.getString(2);
	           String img = rs.getString(3);
	           int year=rs.getInt(4);
	           String type=rs.getString(5);
	           String des=rs.getString(6);
	           String url=rs.getString(7);
	           int view=rs.getInt(8);
	           Movie movie = new Movie(id, name, img, year, type, des, url, view);
	           return movie;
	       }
	       return null;
	   }
	
	
	public static Account ADfindAccount(Connection conn, String userName) throws SQLException {
	       String sql = "select PASSWORD, EMAIL, VIP_POINT, date_format(from_unixtime(VIP_TIME),'%H:%i:%s %d/%m/%Y'), PER from Account where USER_NAME=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setString(1, userName);
	 
	       ResultSet rs = pstm.executeQuery();
	 
	       while (rs.next()) {
	           String password = rs.getString(1);
	           String email = rs.getString(2);
	           int point = Integer.parseInt(rs.getString(3));
	           String time = rs.getString(4);
	           int permit = rs.getInt(5);
	           String per=null;
	           if (permit==0) per="user";
	           if (permit==1) per="admin";
	           Account account = new Account(userName, password, email, point, time, per);
	           return account;
	       }
	       return null;
	   }
	
	
	public static void updateAccount(Connection conn, Account account) throws SQLException {
	       String sql = "update Account set PASSWORD=?, EMAIL=? where USER_NAME=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	 
	       pstm.setString(1, account.getPassword());
	       pstm.setString(2, account.getEmail());
	       pstm.setString(3, account.getUserName());
	       pstm.executeUpdate();
	   }
	
	public static void updateMovie(Connection conn, Movie movie) throws SQLException {
	       String sql = "update Movie set NAME=?, IMG=?, YEAR=?, TYPE=?, DES=?, URL=?, VIEW=? where ID=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setString(1, movie.getName());
	       pstm.setString(2, movie.getImg());
	       pstm.setInt(3, movie.getYear());
	       pstm.setString(4, movie.getType());
	       pstm.setString(5, movie.getDes());
	       pstm.setString(6, movie.getUrl());
	       pstm.setInt(7, movie.getView());
	       pstm.setInt(8, movie.getId());
	       pstm.executeUpdate();
	   }
	
	public static void ADupdateAccount(Connection conn, Account account) throws SQLException {
	       String sql = "update Account set PASSWORD=?, EMAIL=?, VIP_POINT=?, VIP_TIME=unix_timestamp(?), PER=? where USER_NAME=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	 
	       pstm.setString(1, account.getPassword());
	       pstm.setString(2, account.getEmail());
	       pstm.setInt(3, account.getPoint());
	       pstm.setString(4, account.getTime());
	       int per=0;
	       if (account.getPer().equals("admin")) per=1;
	       pstm.setInt(5, per);
	       pstm.setString(6, account.getUserName());
	       pstm.executeUpdate();
	   }
	
	
	public static void deleteAccount(Connection conn, String userName) throws SQLException {
	       String sql = "delete from History where USER_NAME=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	 
	       pstm.setString(1, userName);
	 
	       pstm.executeUpdate();
	       
	       sql = "delete from Account where USER_NAME=?";
	  	 
	       pstm = conn.prepareStatement(sql);
	 
	       pstm.setString(1, userName);
	 
	       pstm.executeUpdate();
	   }
	
	public static void deleteMovie(Connection conn, int id) throws SQLException {
	       String sql = "delete from Movie where ID=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	 
	       pstm.setInt(1, id);
	 
	       pstm.executeUpdate();
	   }
	
	public static void countView(Connection conn, int id) throws SQLException {
	       String sql1 = "update Movie set VIEW=VIEW+1 where ID=?";
	       PreparedStatement pstm1 = conn.prepareStatement(sql1);
	       pstm1.setInt(1, id);
	       pstm1.executeUpdate();
	   }
	
	public static Movie getUrl(Connection conn, int id) throws SQLException {
	       String sql = "select * from Movie where ID=?";
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setInt(1, id);
	       ResultSet rs = pstm.executeQuery();
	       String url=rs.getString(1);
	       Movie movie=new Movie();
	       movie.setUrl(url);
	       return movie;
	   }
	
	
	public static List<Account> queryAccount(Connection conn, String userName) throws SQLException {
	       String sql = "Select * from Account where USER_NAME=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setString(1, userName);
	       ResultSet rs = pstm.executeQuery();
	       List<Account> list = new ArrayList<Account>();
	       while (rs.next()) {
	           String password=rs.getString(2);
	           String email=rs.getString(3);
	           int point=Integer.parseInt(rs.getString(4));
	           String time=rs.getString(5);
	           Account account = new Account();
	           account.setUserName(userName);
	           account.setPassword(password);
	           account.setEmail(email);
	           account.setPoint(point);
	           account.setTime(time);
	           list.add(account);
	       }
	       return list;
	   }
	
	
	public static List<Account> ADqueryAccount(Connection conn) throws SQLException {
	       String sql = "select * from Account";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	 
	       ResultSet rs = pstm.executeQuery();
	       List<Account> list = new ArrayList<Account>();
	       while (rs.next()) {
	           String userName=rs.getString(1);
	           String password=rs.getString(2);
	           String email=rs.getString(3);
	           int point=Integer.parseInt(rs.getString(4));
	           String time=rs.getString(5);
	           int permit=rs.getInt(6);
	           String per=null;
	           if (permit==0) per="user";
	           if (permit==1) per="admin";
	           Account account = new Account(userName, password, email, point, time, per);
	           list.add(account);
	       }
	       return list;
	   }
	
	public static void addMovie(Connection conn, Movie movie) throws SQLException {
	       String sql = "insert into Movie(NAME, IMG, YEAR, TYPE, DES, URL, VIEW) values (?,?,?,?,?,?,?)";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	 
	       pstm.setString(1, movie.getName());
	       pstm.setString(2, movie.getImg());
	       pstm.setInt(3, movie.getYear());
	       pstm.setString(4, movie.getType());
	       pstm.setString(5, movie.getDes());
	       pstm.setString(6, movie.getUrl());
	       pstm.setInt(7, movie.getView());
	 
	       pstm.executeUpdate();
	   }
	
	public static void delHistory(Connection conn) throws SQLException {
	       String sql = "delete from History";
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.executeUpdate();
	   }
	
	public static void deleteMessage(Connection conn, int time) throws SQLException {
	       String sql = "delete from Contact where TIME=?";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	 
	       pstm.setInt(1, time);
	 
	       pstm.executeUpdate();
	   }
	
	public static int checkCaptcha(Connection conn, String img, String code) throws SQLException {
	       String sql = "select img from Captcha where img=? and code=?";
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setString(1, img);
	       pstm.setString(2, code);
	       ResultSet rs = pstm.executeQuery();
	       if (rs.next()) return 1;
	       else return 0;
	   }
	
	public static int checkAccountExist(Connection conn, String userName) throws SQLException {
	       String sql = "select PER from Account where USER_NAME=?";
	       PreparedStatement pstm = conn.prepareStatement(sql);
	       pstm.setString(1, userName);
	       ResultSet rs = pstm.executeQuery();
	       if (rs.next()) return 1;
	       else return 0;
	   }
	
	public static void sendMessage(Connection conn, Contact contact) throws SQLException {
	       String sql = "insert into Contact(NAME, EMAIL, MESSAGE, TIME) values (?,?,?,unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')))";
	 
	       PreparedStatement pstm = conn.prepareStatement(sql);
	 
	       pstm.setString(1, contact.getName());
	       pstm.setString(2, contact.getEmail());
	       pstm.setString(3, contact.getMessage());
	       pstm.executeUpdate();
	   }
	
}
