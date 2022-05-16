<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 파일 업로드 </title>
</head>
<body>
	Home > 파일 업로드 
	<hr>
	<form name="fileForm" action="fileupload01_process.jsp"
		method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="userName"> <br><br>
		제목 : <input type="text" name="userTitle"> <br><br>
		파일 : <input type="file" name="fileName"> <br><br>
		<hr>
		<input type="submit" value=" 파일 업로드 ">
	</form> 
</body>
</html>