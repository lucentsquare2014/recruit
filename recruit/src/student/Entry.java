package student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.AccessDB;

/**
 * Servlet implementation class entry
 */
@WebServlet("/Entry")
public class Entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Entry() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
		String university = new String(request.getParameter("university").getBytes("ISO-8859-1"), "UTF-8");
		String mail = request.getParameter("mail");
		String tel = request.getParameter("tel");
		if(tel == null){
			tel = "";
		}
		String session_id = request.getParameter("session_id");
		if(existCheck(name, university) && overCheck(session_id)){
			this.insertEntry(name, university, mail, session_id, tel);
			HttpSession session = request.getSession(true);
			session.setAttribute("session_id", session_id);
			session.setAttribute("name", name);
			session.setAttribute("mail", mail);
			response.sendRedirect("/recruit/confirm.jsp");
		}else{
			response.sendRedirect("/recruit/error.jsp");
		}
		
	}
	
	//もう予約したのかをチェック
	private boolean existCheck(String name, String university){
		AccessDB access = new AccessDB();
		Connection con = access.openDB();
		Statement stmt;
		String sql = "SELECT * FROM student WHERE name = '" + name + 
				"' AND university = '" + university + "'";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				return false;
			}else{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			access.closeDB(con);
		}
	}
	
	//エントリ情報保存
	private void insertEntry(String name, String university, String mail, String session_id, String tel){
		AccessDB access = new AccessDB();
		Connection con = access.openDB();
		String create = "INSERT INTO student (name, university, mail, tel, session_id)" +
				" VALUES (?, ?, ?, ?, ?)";
		String count = "UPDATE session SET entry_count = entry_count + 1 WHERE id = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(create);
			pstmt.setString(1, name);
			pstmt.setString(2, university);
			pstmt.setString(3, mail);
			pstmt.setString(4, tel);
			pstmt.setInt(5, Integer.valueOf(session_id));
			pstmt.executeUpdate();
			PreparedStatement pstmt2 = con.prepareStatement(count);
			pstmt2.setInt(1, Integer.valueOf(session_id));
			pstmt2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			access.closeDB(con);
		}
	}
	
	private boolean overCheck(String id){
		AccessDB access = new AccessDB();
		Connection con = access.openDB();
		boolean check = false;
		String sql = "SELECT capacity, entry_count FROM session WHERE id = ?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.valueOf(id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int n = Integer.valueOf(rs.getString("capacity"));
				int m = rs.getInt("entry_count");
				if(n == m || n < m){
					check =  false;
				}else{
					check =  true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			access.closeDB(con);
		}
		return check;
	}
	
}