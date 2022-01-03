<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		table{
			border: 1px solid black;
			margin: 0 auto;
		}tr,th,td{
			border: 1px solid gray;
		}button{
			background-color: darkgray;
		}
		
		#bookinfo_S_Table tr{
			height: 20px;
		}
		#bookinfo_S_Table tr:FIRST-CHILD{
			height: 30px;
		}
		#bookinfo_S_Table th{
			text-align: center;
		}
		#bookinfo_S_Table td{
			background-color: lightgray;
			text-align: center;
		}
		.btn{
			margin: 1% auto;
			display: block;
			height: 30px;
			width: 200px;
		}
		.sec_p{
			margin-left: 20%;
		}
		
	</style>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int bookCount = 0;
		try{
			String sql = "select count(bookno) from bookinfo1229";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				bookCount = rs.getInt(1);
			}else{
				System.out.println("no search bookno");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>도서 정보 조회 화면</h2>
		<p class="sec_p">총 <%=bookCount %>권의 도서정보가 있습니다.</p>
		<table id="bookinfo_S_Table">
			<tr>
				<th width="50">no</th>
				<th width="250">도서코드</th>
				<th width="250">저자</th>
				<th width="400">도서이름</th>
				<th width="100">구분</th>
			</tr>
			<%
				int no = 0;
				try{
					String sql = "select * from bookinfo1229 order by bookno asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String bookno = rs.getString(1);
						String author = rs.getString(2);
						String bookname = rs.getString(3);
						
						%>
						<tr>
							<td><%=no %></td>
							<td><a href="bookinfo1229_update.jsp?send_bookno=<%=bookno%>"><%=bookno %></a></td>
							<td><%=author %></td>
							<td><%=bookname %></td>
							<td><a href="bookinfo1229_delete.jsp?send_bookno=<%=bookno%>" 
							onclick="if(!confirm('삭제하시겠습니까?')){return false;}">삭제</a></td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>			
		</table>
		<button class="btn" type="button" onclick="location.href='/HRD_1229/bookinfo1229/bookinfo1229_insert.jsp'">도서정보추가</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
