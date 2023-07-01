<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<% 
   String dept_time = request.getParameter("dept_time");
   String arr_time= request.getParameter("arr_time");
   String dept_port = request.getParameter("dept_port");
   String arr_port = request.getParameter("arr_port");
   String distributor = request.getParameter("distributor");
   String buy_link = request.getParameter("buy_link");
   String s_grade = request.getParameter("s_grade");

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
   try{
 	 String jdbcUrl="jdbc:mysql://localhost:3306/trip_flight_result";
     String dbId="Malkaviang";
     String dbPass="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";
 	 
 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 	
 	 String sql= "insert into member values (?,?,?,?,?,?,?)";
 	 pstmt=conn.prepareStatement(sql);
 	 pstmt.setString(1,dept_time);
     pstmt.setString(2,arr_time);
 	 pstmt.setString(3,dept_port);
 	 pstmt.setString(4,arr_port);
 	 pstmt.setString(5,distributor);
 	 pstmt.setString(6,buy_link);
 	 pstmt.setString(7,s_grade);
 	 pstmt.executeUpdate();
 	 
 	 out.println("flights 테이블에 새로운 레코드를 추가했습니다.");

 	}catch(Exception e){ 
 		e.printStackTrace();
 		out.println("flights 테이블에 새로운 레코드를 추가에 실패했습니다");
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>