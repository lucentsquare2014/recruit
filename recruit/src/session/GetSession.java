package session;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import db.AccessDB;

public class GetSession {
	
	public ArrayList<HashMap<String, String>> getSessionList(){
		AccessDB access = new AccessDB();
		Connection con = access.openDB();
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		Statement stmt;
		String sql = "SELECT id, area, to_char(date, 'YYYY/MM/DD') AS date, start_time, end_time," +
				" capacity, number FROM session ORDER BY date DESC";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				HashMap<String, String> map = new HashMap<String, String>();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					String field = rsmd.getColumnName(i);
					String getdata = rs.getString(field);
					if (getdata == null) {
						getdata = "";
					}
					map.put(field, getdata);
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			access.closeDB(con);
		}
		return list;
	}
	
	public HashMap<String, String> getSession(String id){
		AccessDB access = new AccessDB();
		Connection con = access.openDB();
		HashMap<String, String> map = new HashMap<String, String>();
		Statement stmt;
		String sql = "SELECT area, to_char(date, 'YYYY-MM-DD') AS date, start_time, end_time," +
				" capacity, number FROM session WHERE id = '" + id + "'";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					String field = rsmd.getColumnName(i);
					String getdata = rs.getString(field);
					if (getdata == null) {
						getdata = "";
					}
					map.put(field, getdata);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			access.closeDB(con);
		}
		return map;
	}
	
}
