<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Members List </title>
</head>
<style>

admin {
	
	align : 
}

</style>
<body>
	Home > 등록 회원 관리
	<hr>
	<h1>회원 관리 페이지</h1>
	<div class = "admin">
	<table border="1">
	<% 
		String u_id = request.getParameter("userID");
		String u_pw = request.getParameter("userPW");
		String u_mail = request.getParameter("userMAIL");
		
		Statement sm = conn.createStatement();
		ResultSet rs = sm.executeQuery("SELECT id, email, signuptime FROM members");
		
		String str = "";
		int count = 1;
		
		while(rs.next()){
            str += "<tr>" + "<td align = 'center'>"+ count + "</td>" +"<td>" + rs.getString("id") + "</td>" + "<td>" + rs.getString("email")
               + "</td>" + "<td>" + rs.getString("signuptime") + "</td>" + "<td><center><a href='drawCheck.jsp?userID=" + rs.getString("id") + "'> X </a></center></td>" + "<td><center><a href='drawCheck.jsp?userID=" + rs.getString("id") + "'> □ </a></center></td>" + "</tr>";
            count++;
         }
         out.print("<tr> <td> 번호 </td> <td>아이디</td> <td>이메일</td> <td>가입 시간</td> <td>삭제</td> <td>수정</td> </tr>");
         out.print(str);

		
		rs.close();
		sm.close();
		conn.close();	
	%>
	<div class = "admin">
	<hr>
	<table border="0">
		<tr>
			<td>
				<form action="withdraw.jsp" method="post" >
					<input type="submit" value=" ◀ 회원 탈퇴시키기 " >
				</form>
			</td>	 
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" 로그 아웃 ▶" >
				</form>
			</td>
		</tr>
	</table>  		
</body>
</html>	