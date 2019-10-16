package mypage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import travel.TravelDTO;
import user.userDTO;

public class mypageDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private mypageDAO() {

	}

	private static mypageDAO dao = new mypageDAO();

	public static mypageDAO getInstance() {

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

	public userDTO listMethod() {
		userDTO udto = null;
		try {
			conn = init();
			String sql = "select id, name from user_info";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				udto = new userDTO();
				udto.setId(rs.getString("id"));
				udto.setName(rs.getString("name"));
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return udto;

	}
	
	public void updateMethod(userDTO dto) {
		try {
			conn = init();
			String sql = "update user_info set name=?, pw=?, face_img=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getFaceimg());
			pstmt.setString(4, dto.getId());
			
			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	public userDTO viewMethod(String id) {		
		userDTO dto = null;

		try {
			conn = init();
			String sql = "select * from user_info where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new userDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getInt("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setFaceimg(rs.getString("face_img"));
				dto.setLvl(rs.getInt("lvl"));
			}
			//System.out.println(num);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return dto;
	}
	
	public String fileMethod(String id) {
		String fileName = null;
		try {
			conn = init();
			String sql = "select face_img from user_info where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				fileName = rs.getString("face_img");
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return fileName;
	}
	
	public List<TravelDTO> writeviewMethod(String id) {
	      List<TravelDTO> aList = new ArrayList<TravelDTO>();
	      try {
	         conn=init();
	         String sql = "select * from trip_board where id=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            TravelDTO dto = new TravelDTO();
	            dto.setTb_num(rs.getInt("tb_num"));
	            dto.setTb_title(rs.getString("tb_title"));
	            dto.setEditordata(rs.getString("editordata"));
	            dto.setTb_dt_s(rs.getString("tb_dt_s"));
	            dto.setTb_dt_e(rs.getString("tb_dt_e"));
	            dto.setTb_readct(rs.getInt("tb_readct"));
	            dto.setId(rs.getString("id"));
	            SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
	            dto.setTb_dt(simple.format(rs.getDate("tb_dt")));
	            
	            aList.add(dto);
	         }
	         
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return aList;
	   }
	
	public int  accUpdateMethod(userDTO dto, String id) {
			int cnt = 0;
	      try {
	         conn= init();
	         String sql="update user_info set account =?, bank_name=? where id=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getAccount());
	         pstmt.setString(2, dto.getBank_name());
	         pstmt.setString(3, id);
	       cnt=  pstmt.executeUpdate();
	         
	      } catch (ClassNotFoundException | SQLException e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            exit();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return cnt;
	      
	   }//accUpdateMethod()
}
