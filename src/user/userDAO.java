package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

public class userDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private userDAO() {

	}

	private static userDAO dao = new userDAO();

	public static userDAO getInstance() {

		return dao;
	}

	private Connection init() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");

		String url = "jdbc:oracle:thin://@127.0.0.1:1521:xe";
		String user = "hr";
		String password = "a1234";
		return DriverManager.getConnection(url, user, password);
	}// end init()

	private void exit() throws SQLException {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}// end exit()

	public int insertMethod(userDTO dto) {
		int cnt = 0;
		try {
			conn = init();
			String sql = "insert into user_info values(?, ?, ?, ?, ?, null, 0,null,null)";
//			프사 이미지 넣을때 ? 추가 해줘야 하고 밑의 주석 해제 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setInt(4, dto.getGender());
			pstmt.setString(5, dto.getEmail());

			// pstmt.setString(5, dto.getFaceimg());
			cnt = pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				exit();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}
		return cnt;
	}

	public userDTO loginMethod(String id, String pw) {
		userDTO dto= new userDTO();
		try {
			conn = init();
			String sql = "select * from user_info where id=? and pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setFaceimg(rs.getString("face_img"));
				dto.setGender(rs.getInt("gender"));
				dto.setLvl(rs.getInt("lvl"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dto;
	}
	public int insertcheckMethod(String id) {
		int chk=0;
		try {
			conn= init();
			String sql= "select count(*) as cnt from user_info where id=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				chk=rs.getInt("cnt");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return chk;
	}
}
