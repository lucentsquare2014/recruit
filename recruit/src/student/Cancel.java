package student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.AccessDB;

/**
 * Servlet implementation class Cancel
 */
@WebServlet("/Cancel")
public class Cancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cancel() {
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
		String mail = request.getParameter("mail");
		String id = request.getParameter("session_id");
		AccessDB access = new AccessDB();
		Connection con = access.openDB();
		String del = "DELETE FROM student WHERE name = '" + name + "' AND mail = '" + mail + "'";
		String up = "UPDATE session SET entry_count = entry_count - 1 WHERE id = ?";
		Statement stmt;
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(del);
			PreparedStatement pstmt = con.prepareStatement(up);
			pstmt.setInt(1, Integer.valueOf(id));
			pstmt.executeUpdate();
			response.sendRedirect("/recruit/session.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			access.closeDB(con);
		}
	}

}
