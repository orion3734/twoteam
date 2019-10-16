package mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.userDTO;

public class AccountUpdateAction extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String bank= req.getParameter("bank");
	System.out.println(bank);
	String account= req.getParameter("acc");
	userDTO dto=new userDTO();
	dto.setAccount(account);
	dto.setBank_name(bank);
	mypageDAO dao= mypageDAO.getInstance();
	HttpSession session = req.getSession();
	String id =session.getAttribute("id").toString();
	int cnt = dao.accUpdateMethod(dto, id);
	req.setAttribute("cnt", cnt);
	}

}//end class 
