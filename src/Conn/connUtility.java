package Conn;

import java.sql.Connection;
import java.sql.SQLException;

public class connUtility {
	
	public static Connection getConnection()
            throws ClassNotFoundException, SQLException {
		return mysqlConn.getMySQLConnection();
}
   
  public static void closeQuietly(Connection conn) {
      try {
          conn.close();
      } catch (Exception e) {
      }
  }

  public static void rollbackQuietly(Connection conn) {
      try {
          conn.rollback();
      } catch (Exception e) {
      }
  }

}