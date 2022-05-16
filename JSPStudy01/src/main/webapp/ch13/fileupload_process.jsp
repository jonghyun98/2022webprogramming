<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>     
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="org.apache.commons.fileupload.disk.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.*" %> 

<%
	String u_name = null;
	String u_title = null;
	String u_file = null;
	byte[] u_cont = null;
	
	request.setCharacterEncoding("utf-8");
	
	DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
	List items = upload.parseRequest(request);
	
	Iterator iter = items.iterator();
	while(iter.hasNext()){
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName();
		if(item.isFormField()){
			String value = item.getString("utf-8");
			if(name.equals("userName")) u_name = value;
			else if(name.equals("userTitle")) u_title = value;
		}else{
			if(name.equals("fileName")){
				u_file = item.getName();
				u_cont=item.get();
			}
		}
	}
%>