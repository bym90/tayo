package SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MyDBCP {
	DataSource ds = null;

	public MyDBCP() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/mydb");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getCON() {
		Connection con = null;
		try {
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("MyDBCP.java: Connection이 안됩니다.");
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
