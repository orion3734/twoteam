package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;

import ad.AdReqListAction;
import ad.AdViewAction;
import ad.AdanwInsertAction;
import ad.AdvInsertAction;
import ad.adCommentListAction;
import ad.adUpdate;
import ad.adUpdatepro;
import ad.ad_Delete_Action;
import ad.anwdelAction;
import main.MainAction;
import mypage.AccountUpdateAction;
import mypage.MypageListAction;
import mypage.PwcheckAction;
import mypage.UpdateFormAction;
import mypage.UpdateProAction;
import qna.QnaDeleteAction;
import qna.QnaListAction;
import qna.QnaUpdateFormAction;
import qna.QnaUpdateProAction;
import qna.QnaViewAction;
import qna.QnaWriteAction;
import travel.Travel_DeleteAction;
import travel.Travel_ListAction;
import travel.Travel_UpdateAction;
import travel.Travel_UpdateFormAction;
import travel.Travel_ViewAction;
import travel.Travel_WriteAction;
import user.InsertAction;
import user.LoginAction;
import user.LogoutAction;
import user.insertchk;

@WebServlet("/main/*")
public class Controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doprocess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doprocess(req, resp);
	}

	protected void doprocess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		String action = uri.substring(uri.lastIndexOf("/"));
		PrintWriter out = resp.getWriter();
		JSONObject object = new JSONObject();
		// 이동할 페이지
		String path = "";
		// 메인
		if (action.equals("/*") || action.equals("/main.do")) {
			MainAction main = new MainAction();
			main.execute(req, resp);
			path = "/index/main01.jsp";
		} else if (action.equals("/iu.do")) {
			MainAction action2 = new MainAction();
			action2.execute(req, resp);
			object.put("url", "/twoteam/index/iu.jsp");
			out.print(object);
			out.flush();
		}

		else if (action.equals("/login.do")) {
			path = "/login/login.jsp";
		} else if (action.equals("/join.do")) {
			path = "/index/signUpForm.jsp";
		} else if (action.equals("/insert.do")) {
			InsertAction userin = new InsertAction();
			userin.doPost(req, resp);
			resp.sendRedirect("login.do");
		} else if (action.equals("/loginaction.do")) {
			LoginAction loginaction = new LoginAction();
			loginaction.doPost(req, resp);
			object.put("res", req.getAttribute("loginchk"));
			out.print(object);
			out.flush();
		} else if (action.equals("/idchk.do")) {
			insertchk chk = new insertchk();
			chk.doGet(req, resp);
			object.put("res", req.getAttribute("idchk"));
			out.print(object);
			out.flush();
		} else if (action.equals("/logout.do")) {
			LogoutAction logoutaction = new LogoutAction();
			logoutaction.doPost(req, resp);
			resp.sendRedirect("main.do");
		}

		// 메인끝

		// 광고
		else if (action.equals("/ad.do") || action.equals("/ad_side1.do")) {// 처음노출페이지,사이드광고페이지

			path = "/ad/ad_side1.jsp";

		} else if (action.equals("/ad_bottom.do")) {// 하단 광고페이지 양식

			path = "/ad/ad_bottom.jsp";

		} else if (action.equals("/ad_show.do")) {// 관광상품양식

			path = "/ad/ad_show.jsp";

		} else if (action.equals("/ad_req.do")) {// 광고신청
			path = "/ad/ad_req.jsp";
		} else if (action.equals("/adInsert.do")) {// 광고신청넣기
			AdvInsertAction adinsert = new AdvInsertAction();
			adinsert.executeMulti(req, resp);
			resp.sendRedirect("ad_myreq.do");
		} else if (action.equals("/ad_myreq.do")) {// 내광고신청보기
			AdReqListAction adlist = new AdReqListAction();
			adlist.doGet(req, resp);
			path = "/ad/ad_myreq.jsp";
		} else if (action.equals("/view.do")) {// 내광고신청자세히
			AdViewAction adview = new AdViewAction();
			adCommentListAction adcomment = new adCommentListAction();
			adcomment.doGet(req, resp);
			adview.doGet(req, resp);
			path = "/ad/ad_view.jsp";
		} else if (action.equals("/adanw.do")) {
			AdanwInsertAction anw = new AdanwInsertAction();
			anw.doGet(req, resp);
			resp.sendRedirect("view.do?adnum=" + req.getParameter("anwnum"));

		} else if (action.equals("/ad_delete.do")) {
			ad_Delete_Action addel = new ad_Delete_Action();
			addel.doGet(req, resp);
			resp.sendRedirect("ad_myreq.do");
		} else if (action.equals("/ad_update.do")) {
			adUpdate adup = new adUpdate();
			adup.doGet(req, resp);
			path = "/ad/ad_update.jsp";
		} else if (action.equals("/ad_updatepro.do")) {
			adUpdatepro aduppro = new adUpdatepro();
			aduppro.executeMulti(req, resp);
			resp.sendRedirect("view.do?adnum=" + req.getAttribute("adnum"));
		} else if (action.equals("/anwdel.do")) {
			anwdelAction del = new anwdelAction();
			del.doGet(req, resp);
		}
		// 광고끝

		// 여행상품
		else if (action.equals("/trip2.do")) {
			path = "/product/product2.jsp";
		} else if (action.equals("/trip.do")) {
			path = "/product/product.jsp";
		}
//여행상품끝

		// 여행 페이지
		else if (action.equals("/travel.do")) {

			Travel_ListAction tl = new Travel_ListAction();
			tl.execute(req);

			path = "/travel/travel_list.jsp";

		} else if (action.equals("/travel_writeForm.do")) {

			path = "/travel/travel_write.jsp";

		} else if (action.equals("/travel_write.do")) {
			System.out.println("성공하게 해주세요");
			Travel_WriteAction write = new Travel_WriteAction();
			MultipartRequest multi = write.executeMulti(req);
			resp.sendRedirect("travel.do");

		} else if (action.equals("/travel_view.do")) {
			Travel_ViewAction view = new Travel_ViewAction();
			view.execute(req);
			path = "/travel/travel_view.jsp";
		} else if (action.equals("/travel_updateForm.do")) {
			System.out.println("수정폼 jsp 으로 넘어갔음");
			Travel_UpdateFormAction upForm = new Travel_UpdateFormAction();
			upForm.execute(req);
			path = "/travel/travel_update.jsp";
		} else if (action.equals("/travel_updatePro.do")) {
			Travel_UpdateAction up = new Travel_UpdateAction();
			up.execute(req);
			resp.sendRedirect("travel.do?pageNum=" + req.getParameter("pageNum"));

		} else if (action.equals("/tavel_delete.do")) {
			System.out.println("삭제 시작");
			Travel_DeleteAction delete = new Travel_DeleteAction();
			delete.execute(req);
			resp.sendRedirect("travel.do?pageNum=" + req.getParameter("pageNum"));
			System.out.println("삭제 성공");

		}

		// 여행페이지 끝
		// 마이페이지
		else if (action.equals("/mypage.do")) {
			MypageListAction mypagelist = new MypageListAction();
			mypagelist.execute(req);
			path = "/mypage/mypage_main.jsp";
		} else if (action.equals("/mypagepwcheck.do")) {
			path = "/mypage/pwcheck.jsp";
		} else if (action.equals("/mypagepw.do")) {
			PwcheckAction pwcheck = new PwcheckAction();
			pwcheck.doPost(req, resp);
			object.put("res", req.getAttribute("pwchk"));
			out.print(object);
			out.flush();
		} else if (action.equals("/updateForm.do")) {
			UpdateFormAction upform = new UpdateFormAction();
			upform.execute(req);
			path = "/mypage/update.jsp";
		} else if (action.equals("/updatePro.do")) {
			UpdateProAction uppro = new UpdateProAction();
			uppro.executeMulti(req);
			/* path = "/mypage/mypage_main.jsp"; */
			resp.sendRedirect("mypage.do");
		} else if(action.equals("/accountForm.do")) {
	         AccountUpdateAction accUpdate = new AccountUpdateAction();
	         accUpdate.doPost(req, resp);
	         object.put("res", req.getAttribute("cnt"));
	         out.print(object);
	         out.flush();
	    }
		// 마이페이지

		// qna
		else if (action.equals("/qna.do")) {
			path = "/qna_page/Qna_page_main.jsp";
		} else if (action.equals("/qna_list.do")) {
			QnaListAction list = new QnaListAction();
			list.execute(req);
			path = "/qna_page/Qna_list.jsp";
		} else if (action.equals("/qna_view.do")) {
			QnaViewAction view = new QnaViewAction();
			view.execute(req);
			path = "/qna_page/Qna_view.jsp";
		} else if (action.equals("/qna_writeForm.do")) {
			path = "/qna_page/Qna_write.jsp";
		} else if (action.equals("/qna_write.do")) {
			QnaWriteAction write = new QnaWriteAction();
			write.execute(req);
			resp.sendRedirect("qna_list.do?pageNum=" + req.getAttribute("pageNum"));
		} else if (action.equals("/qna_updateForm.do")) {
			QnaUpdateFormAction upForm = new QnaUpdateFormAction();
			upForm.execute(req);
			path = "/qna_page/Qna_update.jsp";
		} else if (action.equals("/qna_updatePro.do")) {
			QnaUpdateProAction uppro = new QnaUpdateProAction();
			uppro.execute(req);
			resp.sendRedirect("qna_list.do?pageNum=" + req.getParameter("pageNum"));
		} else if (action.equals("/qna_delete.do")) {
			QnaDeleteAction delete = new QnaDeleteAction();
			delete.execute(req);
			resp.sendRedirect("qna_list.do?pageNum=" + req.getParameter("pageNum"));
		} else if (action.equals("/qna_comon.do")) {
			path = "/qna_page/Qna_comon.jsp";
		} else if (action.equals("/qna_terms_service.do")) {
			path = "/qna_page/Qna_Terms_of_service.jsp";
		} else if (action.equals("/qna_money.do")) {
			path = "/qna_page/Qna_money.jsp";
		} else if (action.equals("/qna_writeUse.do")) {
			path = "/qna_page/Qna_writeUse.jsp";
		}

		if (path != "") {
			RequestDispatcher dis = req.getRequestDispatcher(path);
			dis.forward(req, resp);
		}

	}
}
