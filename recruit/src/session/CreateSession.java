package session;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.AccessDB;

/**
 * Servlet implementation class CreateSession
 */
@WebServlet("/CreateSession")
public class CreateSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSession() {
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
		String area = new String(request.getParameter("area").getBytes("ISO-8859-1"), "UTF-8");
		String date = request.getParameter("date");
		String start = request.getParameter("start_h") + ":" + request.getParameter("start_m");
		String end = request.getParameter("end_h") + ":" + request.getParameter("end_m");
		String capacity = request.getParameter("capacity");
		if(area != null && date != null && start != null && end != null && capacity != null){
			this.create(area, date, start, end, capacity);
			response.sendRedirect("/recruit/session_admin.jsp");
		}
	}
	
	private void create(String area, String date, String start, String end, String capacity) {
		AccessDB access = new AccessDB();
		Connection con = access.openDB();
		String sql = "INSERT INTO session (area, date, start_time, end_time, capacity) VALUES (?, ?, ?, ?, ?)";
		try {
			Timestamp datetime = new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime());
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, area);
			pstmt.setTimestamp(2, datetime);
			pstmt.setString(3, start);
			pstmt.setString(4, end);
			pstmt.setString(5, capacity);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			access.closeDB(con);
		}
	}

}
