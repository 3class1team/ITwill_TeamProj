package customerService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class NoticeDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/team");
		conn = ds.getConnection();
		return conn;
	}
	
	public void closeAll() {
		try {
			if(pstmt != null) {
				pstmt.close();
			}
			if(rs != null) {
				rs.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNoticeListCount(Map searchMap) {
		
		int getNoticeListCount = 0;
		String search = (String)searchMap.get("search");
		
		try {
			conn = getConnection();
			String sql = "select count(noticeNo) from notice";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {  
				getNoticeListCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return getNoticeListCount;
	}
	
	public List getNoticeList(Map searchMap) {
		List noticeList = new ArrayList();
		
		int section = (int)searchMap.get("section");
		int pageNo = (int)searchMap.get("pageNo"); 
		int startNum = (section - 1)*27 + (pageNo - 1)*10;
		String search = (String)searchMap.get("search");
	
		try {
			conn = getConnection();
			String sql = "select * from notice";
						
			if(search != null && search.length() != 0){
				sql += " where noticeTitle like ?"
					+ " order by noticeNo desc limit ?, 10";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, startNum);
			} else {
				sql += " order by noticeNo desc limit ?, 10";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNoticeNo(rs.getInt("noticeNo"));
				noticeVO.setNoticeTitle(rs.getString("noticeTitle"));
				noticeVO.setNoticeContent(rs.getString("noticeContent"));
				noticeVO.setNoticeFile(rs.getString("noticeFile"));
				noticeVO.setNoticeCategory(rs.getString("noticeCategory"));
				noticeVO.setNoticeReadCount(rs.getInt("noticeReadCount"));
				noticeVO.setNoticeWriteDate(rs.getTimestamp("noticeWriteDate"));
				
				noticeList.add(noticeVO);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return noticeList;
	}
	
	public List getNoticeList() {
		List noticeList = new ArrayList();
		
		try {
			conn = getConnection();
			String sql = "select * from notice order by noticeNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNoticeNo(rs.getInt("noticeNo"));
				noticeVO.setNoticeCategory(rs.getString("noticeCategory"));
				noticeVO.setNoticeTitle(rs.getString("noticeTitle"));
				noticeVO.setNoticeContent(rs.getString("noticeContent"));
				noticeVO.setNoticeWriteDate(rs.getTimestamp("noticeWriteDate"));
				noticeVO.setNoticeReadCount(rs.getInt("noticeReadcount"));
				noticeVO.setNoticeFile(rs.getString("noticeFile"));
				
				noticeList.add(noticeVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return noticeList;
	}
	
	public int getNoticeListCount() {
		int noticeListCount = 0;
		
		try {
			conn = getConnection();
			String sql = "select count(noticeNo) from notice";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeListCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return noticeListCount;
	}
	
	public int insertNotice(NoticeVO notice) {
		
		int noticeNo = 0;
		try {
			conn = getConnection();
			String sql = "insert into notice (noticeTitle, noticeContent, noticeWriteDate, noticeCategory, noticeFile, noticeReadCount)"
					+ " values (?, ?, now(), ?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setString(3, notice.getNoticeCategory());
			pstmt.setString(4, notice.getNoticeFile());
			pstmt.setInt(5, 0);
			
			pstmt.executeUpdate();
			
			sql = "select noticeNo from notice order by noticeNo desc limit 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeNo = rs.getInt("noticeNo");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return noticeNo;
	}
	
	public void increaseNoticeReadCount(int noticeNo) {
		
		try {
			conn = getConnection();
			String sql = "update notice set noticeReadCount = noticeReadCount+1"
						+ " where noticeNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public NoticeVO getNotice(int noticeNo) {
		
		NoticeVO noticeVO = new NoticeVO();
		
		try {
			conn = getConnection();
			String sql = "select * from notice where noticeNo = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				noticeVO.setNoticeNo(rs.getInt("noticeNo"));
				noticeVO.setNoticeTitle(rs.getString("noticeTitle"));
				noticeVO.setNoticeContent(rs.getString("noticeContent"));
				noticeVO.setNoticeWriteDate(rs.getTimestamp("noticeWriteDate"));
				noticeVO.setNoticeReadCount(rs.getInt("noticeReadCount"));
				noticeVO.setNoticeFile(rs.getString("noticeFile"));
				noticeVO.setNoticeCategory(rs.getString("noticeCategory"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return noticeVO;
	}
	
	public PrevNextVO getPrevNext(int noticeNo) {
		PrevNextVO prevNextVO = new PrevNextVO();
		String sql = "";
		try {
			conn = getConnection();
			sql = "select noticeNo, noticeTitle, noticeCategory from notice"
					+ " where noticeNo = ( select max(noticeNo) from notice where noticeNo < ? );";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				prevNextVO.setPrevNo(rs.getInt("noticeNo"));
				prevNextVO.setPrevTitle(rs.getString("noticeTitle"));
				prevNextVO.setPrevCategory(rs.getString("noticeCategory"));
			}
			
			sql = "select noticeNo, noticeTitle, noticeCategory from notice"
				+ " where noticeNo = ( select min(noticeNo) from notice where noticeNo > ? );";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				prevNextVO.setNextNo(rs.getInt("noticeNo"));
				prevNextVO.setNextTitle(rs.getString("noticeTitle"));
				prevNextVO.setNextCategory(rs.getString("noticeCategory"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return prevNextVO;
	}
	
	public List<NoticeVO> noticeCategoryList(){
		List<NoticeVO> noticeCategoryList = new ArrayList<NoticeVO>();
		try {
			conn = getConnection();
			String sql = "select noticeCategory from notice"
						+" group by noticeCategory";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String noticeCategory = rs.getString("noticeCategory");
				NoticeVO noticeCategoryVO = new NoticeVO(noticeCategory);
				noticeCategoryList.add(noticeCategoryVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return noticeCategoryList;
	}
	
	public void updateNotice(NoticeVO noticeVO, String deleteFile) {
		
		String noticeFile = noticeVO.getNoticeFile();
		try {
			conn = getConnection();
			
			if(noticeFile != null && noticeFile.length() != 0) {
				String sql = "update notice set noticeTitle=?, noticeContent=?, noticeFile=?, noticeCategory=?"
						+ " where noticeNo= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, noticeVO.getNoticeTitle());
				pstmt.setString(2, noticeVO.getNoticeContent());
				pstmt.setString(3, noticeVO.getNoticeFile());
				pstmt.setString(4, noticeVO.getNoticeCategory());
				pstmt.setInt(5, noticeVO.getNoticeNo());	
			} else if(deleteFile != null) {
				String sql = "update notice set noticeTitle=?, noticeContent=?, noticeFile=?, noticeCategory=?"
						+ " where noticeNo= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, noticeVO.getNoticeTitle());
				pstmt.setString(2, noticeVO.getNoticeContent());
				pstmt.setString(3, null);
				pstmt.setString(4, noticeVO.getNoticeCategory());
				pstmt.setInt(5, noticeVO.getNoticeNo());
			} else {
				String sql = "update notice set noticeTitle=?, noticeContent=?, noticeCategory=?"
						+ " where noticeNo= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, noticeVO.getNoticeTitle());
				pstmt.setString(2, noticeVO.getNoticeContent());
				pstmt.setString(3, noticeVO.getNoticeCategory());
				pstmt.setInt(4, noticeVO.getNoticeNo());
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void deleteNotice(int noticeNo) {
		
		try {
			conn = getConnection();
			String sql = "delete from notice"
						+ " where noticeNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
	}
	
}
