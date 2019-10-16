package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertAction extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/* int num = Integer.parseInt(req.getParameter("num")); */
		userDAO dao = userDAO.getInstance();
		userDTO dto = new userDTO();
	

			dto.setId(req.getParameter("id"));
			dto.setName(req.getParameter("name"));
			dto.setPw(req.getParameter("pw"));
			dto.setEmail(req.getParameter("email"));
			dto.setGender(Integer.parseInt(req.getParameter("gender")));
			dao.insertMethod(dto);
	}
}
