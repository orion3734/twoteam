package ad;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class adUpdatepro implements Exe {
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
		adDTO dto= new adDTO();
		adDAO dao= adDAO.getInstance();
		int adnum=Integer.parseInt(multi.getParameter("adnum"));
		
		String filename= dao.fileMethod(adnum);
		
		
		if(multi.getFilesystemName("img")!=null) {
			if(filename!=null) {
				File oldFile= new File(saveDirectory, filename);
				oldFile.delete();
			}
			dto.setImg(multi.getFilesystemName("img"));
		}else {
			if(filename!=null) {
				dto.setImg(filename);
			}
		}
		
		
		
		/* String id = req.getParameter("id"); */
		int tag = Integer.parseInt(multi.getParameter("tag"));
		String nm = multi.getParameter("nm");
		String tel=multi.getParameter("tel");
		String title=multi.getParameter("title");
		String money=multi.getParameter("money");
		String cont=multi.getParameter("cont");
	
		String cy=multi.getParameter("cy");
		String dateS=multi.getParameter("dateS");
		String dateE=multi.getParameter("dateE");
		
		
		
		dto.setTag(tag);
		dto.setAdnum(adnum);
		dto.setNm(nm);
		dto.setTel(tel);
		dto.setTitle(title);
		dto.setMoney(money);
		dto.setCont(cont);
		dto.setCy(cy);
		dto.setDateE(dateE);
		dto.setDateS(dateS);
		dao.ad_updatepro(dto);
		req.setAttribute("adnum", adnum);
		return multi;
	}
	
}
