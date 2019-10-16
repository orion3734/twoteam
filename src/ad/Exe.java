package ad;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;


public interface Exe {
	public MultipartRequest executeMulti(HttpServletRequest req, HttpServletResponse resp);
}
