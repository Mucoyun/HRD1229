<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String bookno = request.getParameter("bookno");
		String author = request.getParameter("author");
		String bookname = request.getParameter("bookname");

		try{
			String sql = "update bookinfo1229 set author=?,bookname=? where bookno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(3, bookno);
			pstmt.setString(1, author);
			pstmt.setString(2, bookname);
			
			pstmt.executeUpdate();
			
			%><script>
				alert("수정이 완료되었습니다.");
				location.href="/HRD_1229/bookinfo1229/bookinfo1229_select.jsp";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>
