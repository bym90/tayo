package SQL;

import java.sql.*;

public class MyJDBC {

	public MyJDBC() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getCON() {
		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.7:1521:orcl", "scott", "tiger");
//			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public Statement getSTMT(Connection con) {
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stmt;
	}

	public PreparedStatement getPSTMT(String sql, Connection con) {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pstmt;
	}

	public void close(Object obj) {

		try {

			if (obj instanceof Connection) {
				Connection temp = (Connection) obj;
				temp.close();
			} else if (obj instanceof Statement) {
				Statement temp = (Statement) obj;
				temp.close();
			} else if (obj instanceof ResultSet) {
				ResultSet temp = (ResultSet) obj;
				temp.close();
			} else if (obj instanceof PreparedStatement) {
				PreparedStatement temp = (PreparedStatement) obj;
				temp.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}