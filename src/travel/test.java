package travel;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class test implements Travel_ActionImp {
	@Override
	public void execute(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		MultipartRequest multi = null;
		String saveDirectory = req.getSession().getServletContext().getRealPath("/") + "adinsertimg/";
		System.out.println(saveDirectory);
		File file = new File(saveDirectory);
		if (!file.exists())
			file.mkdirs();

		int maxPostSize = 10 * 1024 * 1024; // 10MB
		String fileName = "";
		String encoding = "UTF-8";
		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file2 = (String) files.nextElement();
			fileName = multi.getFilesystemName(file2);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fileName=multi.getFilesystemName("uploadFile");
		System.out.println(fileName);
		
	req.setAttribute("img", "/twoteam/adinsertimg/"+fileName);

		
	}
}
