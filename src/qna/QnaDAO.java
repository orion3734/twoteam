package qna;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class QnaDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private QnaDAO() {
		
	}
	
	private static QnaDAO dao = new QnaDAO();
	
	public static QnaDAO getInstance() {
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
	
	public int rowTotalCount(HashMap<String,String> map) {
		int cnt = 0;
		try {
			conn = init();
			String sql ="select count(*) from qna";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
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
	}//end rowtotalCount
	public int genTotalCount(String id,HashMap<String,String> map ) {
		
		int cnt = 0;
		try {
			conn = init();
			String sql ="select count(*) from qna where qa_ref in (select qa_ref from qna where id=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
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
	}//end gen////////////////
	
	public List<QnaDTO> listMethod(PageDTO pdto){
		List<QnaDTO> aList = new ArrayList<QnaDTO>();
		
		try {
			conn=init();
	String sql ="select b.* from(select rownum as rm, a.* from(select * from qna order by qa_ref desc, qa_reStep asc)a)b "
			+ "where b.rm >= ? and b.rm<=?";
	
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pdto.getStartRow());
			pstmt.setInt(2, pdto.getEndRow());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto =new QnaDTO();
				
				dto.setQa_num(rs.getInt("qa_num"));
				dto.setQa_type(rs.getString("qa_type"));
				dto.setId(rs.getString("id"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_date(rs.getDate("qa_date"));
				dto.setQa_reLevel(rs.getInt("qa_reLevel"));
				aList.add(dto);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return aList;
	}//end listMethod()
	
	public List<QnaDTO> genViewMethod(String id, PageDTO pdto) {
		List<QnaDTO> aList = new ArrayList<QnaDTO>();
		QnaDTO dto =null;
		try {
			conn=init();
			String sql="select b.* from(select rownum as rm, a.* from(select * from qna where qa_ref in (select qa_ref from qna where id=?) " + 
					"order by qa_num desc)a)b " + 
					"where b.rm >= ? and b.rm<= ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pdto.getStartRow());
			pstmt.setInt(3, pdto.getEndRow());

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				dto=new QnaDTO();
				dto.setQa_num(rs.getInt("qa_num"));
				dto.setQa_type(rs.getString("qa_type"));
				dto.setId(rs.getString("id"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_date(rs.getDate("qa_date"));
				dto.setQa_reLevel(rs.getInt("qa_reLevel"));
				aList.add(dto);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return aList;
	}//end getViewMethod()/////////////

	public QnaDTO viewMethod(int qa_num) {
		QnaDTO dto =null;
		
		try {
			conn=init();
			String sql = "select * from qna where qa_num= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qa_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto= new QnaDTO();
				dto.setQa_num(rs.getInt("qa_num"));
				dto.setId(rs.getString("id"));
				dto.setQa_type(rs.getString("qa_type"));
				dto.setQa_title(rs.getString("qa_title"));
				dto.setQa_cont(rs.getString("qa_cont"));
				dto.setQa_date(rs.getDate("qa_date"));
				dto.setQa_ref(rs.getInt("qa_ref"));
				dto.setQa_reLevel(rs.getInt("qa_reLevel"));
				dto.setQa_reStep(rs.getInt("qa_reStep"));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}//end viewMethod
	
	
	public void reStepMethod(HashMap<String, Integer> map) {
		try {
			conn=init();
			String sql="update qna set qa_reStep=qa_reStep+1 where qa_ref=? and qa_reStep > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,map.get("qa_ref"));
			pstmt.setInt(2, map.get("qa_reStep"));
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}//end restepMethod()/////////////
	
	public void insertMethod(QnaDTO dto) {
		try {
			conn=init();
			//제목글이면 
			if(dto.getQa_reLevel()==0) {
		String sql = "insert into qna(qa_num, id, qa_type, qa_title, qa_cont, qa_date, qa_ref, qa_reLevel, qa_reStep) " + 
				"values(qa_Seq.nextval,?,?,?,?,sysdate,qa_Seq.nextval,0,0) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getQa_type());
		pstmt.setString(3, dto.getQa_title());
		pstmt.setString(4, dto.getQa_cont());
			}else {
		String sql = "insert into qna(qa_num, id, qa_type, qa_title, qa_cont, qa_date, qa_ref, qa_reLevel, qa_reStep) " + 
				"values(qa_Seq.nextval,?,?,?,?,sysdate,?,?,?) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getQa_type());
		pstmt.setString(3, dto.getQa_title());
		pstmt.setString(4, dto.getQa_cont());
		pstmt.setInt(5, dto.getQa_ref());
		pstmt.setInt(6, dto.getQa_reStep());
		pstmt.setInt(7, dto.getQa_reLevel());
			}
		pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}//end insertMethod()///
	
	public void updateMethod(QnaDTO dto) {
		try {
			conn=init();
			String sql="update qna set qa_title=?, qa_type=? ,qa_cont=? where qa_num = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getQa_title());
			pstmt.setString(2, dto.getQa_type());
			pstmt.setString(3, dto.getQa_cont());
			pstmt.setInt(4, dto.getQa_num());
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}//end UpdateMehthod()
	
	public void deleteMethod(int qa_num) {
		QnaDTO dto = new QnaDTO();
		
		try {
			conn=init();
			String sql="delete from qna where qa_num =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,qa_num);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}//end DeleteMethod() 
	
}//end class 
