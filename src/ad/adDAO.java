package ad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class adDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd");
	private adDAO() {

	}
	private static adDAO dao= new adDAO();
	public static adDAO getInstance() {
		return dao;
	}
	private Connection init() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		String url="jdbc:oracle:thin://@127.0.0.1:1521:xe";
		String user="hr";
		String password="a1234";
		return DriverManager.getConnection(url, user, password);
	}
	private void exit() throws SQLException {
		if(rs!=null) {
			rs.close();
		}
		if(pstmt!=null) {
			pstmt.close();
		}
		if(conn!=null) {
			conn.close();
		}
	}
	public List<adDTO> listMethod(String id, PageDTO pdto){
		List<adDTO> alist=new ArrayList<adDTO>();
		try {
			conn=init();
			String sql="select b.* from(select rownum as rm, a.* from(select * from advertising where id=? order by ad_num desc)a)b where b.rm>=? and b.rm<=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pdto.getStartRow());
			pstmt.setInt(3, pdto.getEndRow());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				adDTO dto= new adDTO();
				dto.setAdnum(rs.getInt("ad_num"));
				/* 제목 내용 기간 답변 */
				dto.setTitle(rs.getString("ad_title"));
				dto.setDateS(date.format(rs.getDate("ad_dateS")));
				dto.setDateE(date.format(rs.getDate("ad_dateE")));
				alist.add(dto);
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
		return alist;
	}
	public List<adDTO> masterlistMethod(PageDTO pdto){
		List<adDTO> alist=new ArrayList<adDTO>();
		try {
			conn=init();
			String sql="select b.* from(select rownum as rm, a.* from(select* from advertising a order by ad_num desc)a)b where b.rm>=? and b.rm<=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pdto.getStartRow());
			pstmt.setInt(2, pdto.getEndRow());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				adDTO dto= new adDTO();
				dto.setAdnum(rs.getInt("ad_num"));
				/* 제목 내용 기간 답변 */
				dto.setTitle(rs.getString("ad_title"));
				dto.setDateS(date.format(rs.getDate("ad_dateS")));
				dto.setDateE(date.format(rs.getDate("ad_dateE")));
				alist.add(dto);
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
		return alist;
	}
	public int adv(adDTO dto) {
		int cnt = 0;
		try {
			conn=init();
			String sql="insert into advertising values(?,ad_Seq.nextval,?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getTag());
			pstmt.setString(2, dto.getCy());
			pstmt.setString(3, dto.getNm());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getTitle());
			pstmt.setString(6, dto.getDateS());
			pstmt.setString(7, dto.getDateE());
			pstmt.setString(8, dto.getMoney());
			pstmt.setString(9, dto.getCont());
			pstmt.setString(10, dto.getImg());
			pstmt.setString(11, dto.getId());
			cnt=pstmt.executeUpdate();
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
		return cnt;
	}
	public adDTO viewMethod(int adnum) {
		adDTO dto= null;
		try {
			conn= init();
			String sql= "select * from advertising where ad_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, adnum);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				dto= new adDTO();
				dto.setAdnum(rs.getInt("ad_num"));
				dto.setTitle(rs.getString("ad_title"));
				dto.setCont(rs.getString("ad_cont"));
				dto.setNm(rs.getString("ad_nm"));
				dto.setCy(rs.getString("ad_cy"));
				dto.setTel(rs.getString("ad_tel"));
				dto.setMoney(rs.getString("ad_money"));
				
				dto.setDateS(date.format(rs.getDate("ad_dateS")));
				dto.setDateE(date.format(rs.getDate("ad_dateE")));
				SimpleDateFormat date2 = new SimpleDateFormat("yyyy-mm-dd");
				Date start = date2.parse(date2.format(rs.getDate("ad_dateS")));
				Date end= date2.parse(date2.format(rs.getDate("ad_dateE")));
				long time = start.getTime()-end.getTime();
				long day = time / (24 * 60 * 60 * 1000);
				dto.setDateSE(Math.abs(day));
				dto.setImg(rs.getString("ad_img"));
				dto.setTag(rs.getInt("ad_tag"));
				dto.setId(rs.getString("id"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
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
	public void anwInsertMethod(anwDTO dto) {
		try {
			conn=init();
			String sql= "insert into adanw values(?,?,?,adanw_Seq.nextval,sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAd_num());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getAd_cont_aw());
			pstmt.executeUpdate();
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
	}
	public List<anwDTO> adcomment(int adnum) {
		List<anwDTO> alist= new ArrayList<anwDTO>();
		try {
			conn=init();
			String sql="select* from adanw where ad_num=? order by num desc";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, adnum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				anwDTO dto= new anwDTO();
				SimpleDateFormat simple= new SimpleDateFormat("yy-MM-dd");
				dto.setId(rs.getString("id"));
				dto.setAd_cont_aw(rs.getString("ad_cont_aw"));
				dto.setAd_num(rs.getInt("ad_num"));
				dto.setAnwdate(simple.format(rs.getDate("anwdate")));
				dto.setNum(rs.getInt("num"));
				alist.add(dto);
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
		return alist;
	}
	public int rowTotalCount(HashMap<String,String> map) {
		int cnt = 0;
		try {
			conn = init();
			String sql ="select count(*) from advertising";
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
	}
	public void ad_deleteMethod(int ad_num) {
		try {
			conn=init();
			String sql="delete from advertising where ad_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ad_num);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public adDTO ad_updateform(int ad_num) {
		adDTO dto=null;
		try {
			conn=init();
			String sql="select * from advertising where ad_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ad_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto= new adDTO();
				dto.setAdnum(rs.getInt("ad_num"));
				dto.setTitle(rs.getString("ad_title"));
				dto.setCont(rs.getString("ad_cont"));
				dto.setNm(rs.getString("ad_nm"));
				dto.setCy(rs.getString("ad_cy"));
				dto.setTel(rs.getString("ad_tel"));
				dto.setMoney(rs.getString("ad_money"));
				dto.setDateS(date.format(rs.getDate("ad_dateS")));
				dto.setDateE(date.format(rs.getDate("ad_dateE")));
				dto.setImg(rs.getString("ad_img"));
				dto.setTag(rs.getInt("ad_tag"));
				dto.setId(rs.getString("id"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	public void ad_updatepro(adDTO dto) {
		try {
			conn=init();
			String sql="update advertising set ad_tag=?, ad_cy=? ,ad_nm=?, ad_tel=?, ad_title=?, ad_dateS=?, ad_dateE=?, ad_money=?, ad_cont=?, ad_img=? where ad_num = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getTag());
			pstmt.setString(2, dto.getCy());
			pstmt.setString(3, dto.getNm());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getTitle());
			pstmt.setString(6, dto.getDateS());
			pstmt.setString(7, dto.getDateE());
			pstmt.setString(8, dto.getMoney());
			pstmt.setString(9, dto.getCont());
			pstmt.setString(10, dto.getImg());
			pstmt.setInt(11, dto.getAdnum());
			pstmt.executeUpdate();
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
	}
	public String fileMethod(int adnum) {
		String fileName = null;
		try {
			conn = init();
			String sql = "select ad_img from advertising where ad_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, adnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				fileName = rs.getString("ad_img");
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
		return fileName;
	}
	public void anwdel(int num) {
		try {
			conn=init();
			String sql="delete from adanw where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
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
	}
	public List<anwDTO> anwcount() {
		List<anwDTO> alist= new ArrayList<anwDTO>();
		try {
			conn=init();
			String sql="select ad_num, count(*) as a from adanw group by ad_num";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				anwDTO dto= new anwDTO();
				dto.setAd_num(rs.getInt("ad_num"));
				dto.setA(rs.getInt("a"));
				alist.add(dto);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return alist;
	}
	
}
