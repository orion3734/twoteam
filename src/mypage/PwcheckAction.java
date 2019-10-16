package mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PwcheckAction extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(); 
		String pw=req.getParameter("pw");
		
		if(pw.equals(session.getAttribute("pw").toString())) {
			System.out.println("비밀번호정확");
		}else {
			req.setAttribute("pwchk", 1);
			System.out.println("비밀번호불일치");
		}
	}
}
