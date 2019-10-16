package ad;



import java.io.File;
import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class AdvInsertAction implements Exe{

@Override
public MultipartRequest executeMulti(HttpServletRequest req, HttpServletResponse resp) {
		MultipartRequest multi = null;
		String saveDirectory= req.getSession().getServletContext().getRealPath("/")+"adinsertimg/";
		System.out.println(saveDirectory);
		File file = new File(saveDirectory);
		if (!file.exists())
			file.mkdirs();
		
int maxPostSize = 10 * 1024 * 1024 ; // 10MB
		
		String encoding = "UTF-8";
		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/* String id = req.getParameter("id"); */
		int tag = Integer.parseInt(multi.getParameter("tag"));
		String nm = multi.getParameter("nm");
		String tel=multi.getParameter("tel");
		String title=multi.getParameter("title");
		String money=multi.getParameter("money");
		String cont=multi.getParameter("cont");
		String img=multi.getFilesystemName("img");
		String cy=multi.getParameter("cy");
		String dateS=multi.getParameter("dateS");
		String dateE=multi.getParameter("dateE");
		adDTO dto= new adDTO();
		adDAO dao= adDAO.getInstance();
		HttpSession session=req.getSession();
		
		 dto.setId(session.getAttribute("id").toString());
		dto.setTag(tag);
		dto.setNm(nm);
		dto.setTel(tel);
		dto.setTitle(title);
		dto.setMoney(money);
		dto.setCont(cont);
		dto.setImg(img);
		dto.setCy(cy);
		dto.setDateE(dateE);
		dto.setDateS(dateS);
		dao.adv(dto);
		return multi;
	}
	
}
