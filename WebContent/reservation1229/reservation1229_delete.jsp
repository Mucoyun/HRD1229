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
		String send_lentno = request.getParameter("send_lentno");
		
		try{
			String sql = "delete from reservation1229 where lentno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_lentno);
			
			pstmt.executeUpdate();
			
			%><script>
				alert("삭제가 완료되었습니다.");
				location.href="/HRD_1229/reservation1229/reservation1229_select.jsp";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>
