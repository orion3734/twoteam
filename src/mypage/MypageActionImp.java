package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MypageActionImp {
	public void execute(HttpServletRequest req);

	public void execute(HttpServletRequest req, HttpServletResponse resp);
}
