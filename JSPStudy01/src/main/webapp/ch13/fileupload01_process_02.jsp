<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.*" %>    
<%@ page import="com.oreilly.servlet.multipart.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%
	String fileUrl = "c:/upload-zone";
	int sizeLimit = 10 * 1024 * 1024;
	
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest mt = new MultipartRequest(request, fileUrl, sizeLimit,"utf-8", policy);

	Enumeration ps = mt.getParameterNames();
	
	while(ps.hasMoreElements()){
		String name = (String)ps.nextElement();
		String value = mt.getParameter(name);
		out.println(name + " : " + value + "<br>");
	}
	out.println("<hr>");
	
	Enumeration files = mt.getFileNames();
	
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();
		String original = mt.getOriginalFileName(name);
		String filename = mt.getFilesystemName(name);
		String type = mt.getContentType(name);
		File file = mt.getFile(name);
		
		out.print("1.요청 파라미터명 : " + name + "<br>");
		out.print("2.실제 파일명 : " + original + "<br>");
		out.print("3.저장 파일명 : " + filename + "<br>");
		out.print("4.컨텐츠 유형 : " + type + "<br>");
		
		if(file != null){
			out.println("5.파일 크기 : " + file.length() + "<br>");
		}
	}
%>