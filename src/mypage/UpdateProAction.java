package mypage;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import user.userDTO;

public class UpdateProAction{	
	public MultipartRequest executeMulti(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MultipartRequest multi = null;
		String saveDirectory = req.getSession().getServletContext().getRealPath("/") + "profiletemp/";
		File file = new File(saveDirectory);
		
		
		if(!file.exists())
			file.mkdir();
		int maxPostSize = 1000000000; // 1GB
		String encoding = "UTF-8";
		
		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(multi.getParameter("pw"));
		System.out.println(multi.getParameter("name"));
		System.out.println(multi.getParameter("email"));
		System.out.println(session.getAttribute("id").toString());
		
		mypageDAO dao = mypageDAO.getInstance();
		userDTO dto = new userDTO();
		
		// board 테이블에 첨부파일의 저장여부 검색
		String filename = dao.fileMethod(session.getAttribute("id").toString());
		// 수정 첨부파일이 있으면
		if(multi.getFilesystemName("face_img") != null) {
			// 기존 첨부파일이 있으면
			if(filename!= null) {
				File oldFile = new File(saveDirectory, filename);
				oldFile.delete();
			}
			
			dto.setFaceimg(multi.getFilesystemName("face_img"));
		}else {  // 수정 첨부파일이 없으면
			
			// 기존 첨부파일이 있으면
			if(filename!=null) {
				dto.setFaceimg(filename);
			}
		}
		
		dto.setPw(multi.getParameter("pw"));
		dto.setName(multi.getParameter("name"));
		dto.setEmail(multi.getParameter("email"));
		dto.setId(session.getAttribute("id").toString());
		
		dao.updateMethod(dto);
		
		return multi;
	}
}
