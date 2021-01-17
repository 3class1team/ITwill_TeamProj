package adminPage;

import java.util.ArrayList;
import java.util.List;

import user.UserVO;

public class AdminUserService {
	
	AdminUserDAO adminUserDAO;

	
	public AdminUserService() {
		adminUserDAO = new AdminUserDAO();
	}

	public  List userlist(String searchKeyword) {
		
		List<UserVO> userList = new ArrayList<UserVO>();
		
		userList= adminUserDAO.getUserList(searchKeyword);
		System.out.println(userList);
		/*List<UserVO> userList = adminUserDAO.getUserList(searchKeyword);*/
		return userList;
	}
	
	public int total(String searchKeyword){
		
		int totalCount = adminUserDAO.getUserListCount(searchKeyword);
		
		return totalCount;
	}

}
