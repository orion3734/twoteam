package travel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TravelDAO {

	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private TravelDAO() {

	}

	private static TravelDAO dao = new TravelDAO();

	public static TravelDAO getInstance() {

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

	public void ipMethod(TravelDTO dto, int tb_num) {
		try {
			conn = init();
			String sql = "insert into ipcheck values(?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getIp());
			pstmt.setInt(2, tb_num);
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

	public int ipcheckMethod(TravelDTO dto, int tb_num) {
		int cnt = 0;
		try {
			conn = init();
			String sql = "select count(*) as cnt from ipcheck where ip=? and tb_num=? and ipdate>=TO_CHAR(SYSDATE, 'YYYYMMDD')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getIp());
			pstmt.setInt(2, tb_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(cnt);

		return cnt;
	}

	public void countMethod(int tb_num) {

		try {
			conn = init();
			String sql = "update trip_board set tb_readct=tb_readct+1  where tb_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tb_num);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}

	}

	public List<TravelDTO> top3listMethod() {
		List<TravelDTO> aList = new ArrayList<TravelDTO>();
		try {
			conn = init();
			String sql = "select * from( "
					+ "(select tb_num, tb_readct, tb_title, tb_img, RANK() over(order by tb_readct desc)from trip_board)) "
					+ "where  rownum<= 3";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TravelDTO tdto = new TravelDTO();

				tdto.setTb_num(rs.getInt("tb_num"));
				tdto.setTb_readct(rs.getInt("tb_readct"));
				tdto.setTb_title(rs.getString("tb_title"));
				tdto.setTb_img(rs.getString("tb_img"));

				aList.add(tdto);
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
		return aList;
	}

	public int rowTotalCount(HashMap<String, String> map) {
		int cnt = 0;
		try {
			conn = init();
			String sql = "select count(*) from trip_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
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
		System.out.println("cnt : " + cnt);
		return cnt;
	}// end rowtotalCount

	public void insertMethod(TravelDTO tdto) {
		try {
			conn = init();
			// SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

			String sql = "insert into trip_board(tb_num, tb_title, editordata, tb_dt_s, tb_dt_e, tb_readct, id, tb_img, tb_dt) "
					+ "values(mem_Seq2.nextval, ?,?,TO_DATE(?,'YYYY-MM-dd'),TO_DATE(?,'YYYY-MM-dd'),0,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tdto.getTb_title());
			pstmt.setString(2, tdto.getEditordata());
			pstmt.setString(3, tdto.getTb_dt_s());
			pstmt.setString(4, tdto.getTb_dt_e());
			pstmt.setString(5, tdto.getId());
			pstmt.setString(6, tdto.getTb_img());

			/* pstmt.setString(2, dto.getTb_cont()); */
			/*
			 * pstmt.setString(3, fmt.format(dto.getTb_dt_s())); pstmt.setString(4,
			 * fmt.format(dto.getTb_dt_e()));
			 */

			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				exit();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}

	}

	public List<TravelDTO> listMethod(PageDTO pdto) {
		List<TravelDTO> aList = new ArrayList<TravelDTO>();
		try {
			conn = init();
			String sql = "select b.* from " + "(select rownum as rm, a.* from "
					+ "(select * from trip_board order by tb_num desc)a)b " + "where b.rm >= ? and b.rm<=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdto.getStartRow());
			pstmt.setInt(2, pdto.getEndRow());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TravelDTO tdto = new TravelDTO();

				tdto.setTb_num(rs.getInt("tb_num"));
				tdto.setTb_title(rs.getString("tb_title"));
				tdto.setEditordata(rs.getString("editordata"));
				tdto.setTb_dt_e(rs.getString("tb_dt_s"));
				tdto.setTb_dt_s(rs.getString("tb_dt_e"));
				tdto.setTb_readct(rs.getInt("tb_readct"));
				tdto.setId(rs.getString("id"));
				tdto.setTb_img(rs.getString("tb_img"));
				tdto.setTb_dt(rs.getString("tb_dt"));

				aList.add(tdto);
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
		return aList;
	}

	/*
	 * public void insertTv(TbDTO tdto) {
	 * 
	 * List<TbDTO> aList= new ArrayList<TbDTO>();
	 * 
	 * try { conn = init(); String sql =
	 * "insert into travel_board( tv_title,tv_cont) values(?,?)"; pstmt =
	 * conn.prepareStatement(sql); pstmt.setString(1, tdto.getTv_title());
	 * pstmt.setString(2, tdto.getTv_cont());
	 * 
	 * pstmt.executeUpdate();
	 * 
	 * } catch (ClassNotFoundException | SQLException e) {
	 * 
	 * e.printStackTrace(); } finally { try { exit(); } catch (SQLException e) {
	 * 
	 * e.printStackTrace(); } }
	 * 
	 * }
	 */

	public TravelDTO ViewMethod(int tb_num) {
		TravelDTO tdto = null;

		try {
			conn = init();
			String sql = "select * FROM trip_board where tb_num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, tb_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				tdto = new TravelDTO();
				tdto.setTb_num(rs.getInt("tb_num"));
				tdto.setTb_title(rs.getString("tb_title"));
				tdto.setEditordata(rs.getString("editordata"));

				tdto.setTb_dt_e(rs.getString("tb_dt_s"));
				tdto.setTb_dt_s(rs.getString("tb_dt_e"));

				tdto.setTb_readct(rs.getInt("tb_readct"));
				tdto.setId(rs.getString("id"));
				tdto.setTb_dt(rs.getString("tb_dt"));
				System.out.println("viewMethod tb_num : " + rs.getInt("tb_num"));

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

		return tdto;

	}

	public void UpdateMethod(TravelDTO tdto) {
		try {
			conn = init();
			String sql = "update trip_board set tb_title=? , editordata=? , tb_dt_s=TO_DATE( ?, 'YYYY/MM/DD') , tb_dt_e=TO_DATE( ?, 'YYYY/MM/DD') , tb_img=? where tb_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tdto.getTb_title());
			pstmt.setString(2, tdto.getEditordata());
			pstmt.setString(3, tdto.getTb_dt_s());
			pstmt.setString(4, tdto.getTb_dt_e());
			pstmt.setString(5, tdto.getTb_img());
			pstmt.setInt(6, tdto.getTb_num());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void DeleteMethod(int tb_num) {
		TravelDTO tdto = new TravelDTO();

		try {
			conn = init();
			String sql = "delete from trip_board where tb_num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tb_num);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}
}
