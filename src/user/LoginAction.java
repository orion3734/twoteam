package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(); 
		userDAO dao = userDAO.getInstance();
		userDTO dto= new userDTO();
		String id=req.getParameter("id");
		String pw=req.getParameter("pw");
	
		dto=dao.loginMethod(id,pw);
		
		if(dto.getId()!=null) {
			System.out.println("로그인성공");
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", dto.getName());
			session.setAttribute("pw", dto.getPw());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("faceimg", dto.getFaceimg());
			session.setAttribute("lvl", dto.getLvl());
			session.setAttribute("gender", dto.getGender());
		}else {
			req.setAttribute("loginchk", 1);
			System.out.println("로그인실패");
		}
	}

}

