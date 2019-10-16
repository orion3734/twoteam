package qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface QnaActionimp {
	public void execute(HttpServletRequest req);
	public void execute(HttpServletRequest req, HttpServletResponse resp);
}//end class 
