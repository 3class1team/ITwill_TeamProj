package adminPage;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.buf.UEncoder;

import order.MovieVO;
import user.UserDAO;
import user.UserVO;



@WebServlet("/adminPage/*")
public class AdminUserController extends HttpServlet{
	
	UserVO userVO;
	AdminUserService adminUserService;
	UserDAO userDAO;
	
	@Override
	public void init() throws ServletException {
		adminUserService = new AdminUserService();
		userVO = new UserVO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getRequestURI();
		action = action.substring(action.lastIndexOf('/'));
		System.out.println("action: " + action);
		
		if (action.equals("/dashBoard.do")) {//회원관리
			String searchKeyword = request.getParameter("searchKeyword");
			
			List userList = adminUserService.userlist(searchKeyword);
			/*System.out.println(userList);*/
			
			int total = adminUserService.total(searchKeyword);
			
			request.setAttribute("userList", userList);
			request.setAttribute("total", total);
			
			nextPage = "/admin/dist/main/adminMain.jsp";
			
		} else if (action.equals("/mainHome.do")) {
			nextPage = "/main/index.jsp";
			
		}else if(action.equals("/modUser.do")) {//수정페이지
			String userID = request.getParameter("userID");
			UserVO userVO = adminUserService.getUser(userID);
			request.setAttribute("userVO", userVO);
			
			nextPage = "/admin/dist/userPage/modUser.jsp";
			
		}else if(action.equals("/delUser.do")) {//회원삭제
			String userID = request.getParameter("userID");
			int result = adminUserService.deleteUser(userID);
			String msg ="";
			if(result > 0){
				msg ="회원을 삭제 했습니다";
			}else{
				msg ="삭제중 오류가 생겼습니다.";
			}
			request.setAttribute("msg", msg);
			nextPage = "/adminPage/dashBoard.do";
			
		}else if(action.equals("/getUser.do")) {
			
			String userID = request.getParameter("userID");
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			List userM = adminUserService.getUsermList(userNo);
			List userQ = adminUserService.getUserqList(userNo);
			UserVO userVO = adminUserService.getUser(userID);
			
			request.setAttribute("userVO", userVO);
			request.setAttribute("userM", userM);
			request.setAttribute("userQ", userQ);
			nextPage = "/admin/dist/userPage/getUser.jsp";
			
		}else if(action.equals("/updateUser.do")) {
			int result =0;
			userVO.setUserID(request.getParameter("userID"));
			userVO.setUserNickname(request.getParameter("userNickname"));
			userVO.setUserTel(request.getParameter("userTel"));
			userVO.setUserAddr1(request.getParameter("userAddr1"));
			userVO.setUserAddr2(request.getParameter("userAddr2"));
			userVO.setUserAddr3(request.getParameter("userAddr3"));
			userVO.setUserAddr4(request.getParameter("userAddr4"));
			
			
			result = adminUserService.userUpate(userVO);
			request.setAttribute("result", result);
			nextPage = "/adminPage/getUser.do";
			
		} else if (action.equals("/nickCheck.do")) {
			String userNickname = request.getParameter("userNickname");
			request.setAttribute("userNickname", userNickname);
			int check = userDAO.nickCheck(userNickname);
			
			System.out.println(userNickname);
			if (check == 1) {
				request.setAttribute("msg", "used");
				System.out.println("사용중");
			} else {
				request.setAttribute("msg", "allow");
				System.out.println("가능");
			}
			
			nextPage = "/userPage/nick.jsp";
			
		}
		
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	
}
