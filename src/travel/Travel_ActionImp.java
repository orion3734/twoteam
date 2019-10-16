package travel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Travel_ActionImp {
	public void execute(HttpServletRequest req);

	public void execute(HttpServletRequest req, HttpServletResponse resp);
}
