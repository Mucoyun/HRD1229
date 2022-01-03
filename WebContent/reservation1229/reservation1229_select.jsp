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
		
		#reservation_S_Table tr{
			height: 20px;
		}
		#reservation_S_Table tr:FIRST-CHILD{
			height: 30px;
		}
		#reservation_S_Table th{
			text-align: center;
		}
		#reservation_S_Table td{
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
		int lentCount = 0;
		try{
			String sql = "select count(lentno) from reservation1229";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				lentCount = rs.getInt(1);
			}else{
				System.out.println("no search bookno");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>도서 예약정보 조회</h2>
		<p class="sec_p">총 <%=lentCount %>권의 도서 예약 정보가 있습니다.</p>
		<table id="reservation_S_Table">
			<tr>
				<th width="50">no</th>
				<th width="100">대출번호</th>
				<th width="100">고객성명</th>
				<th width="100">도서코드</th>
				<th width="200">도서명</th>
				<th width="100">대출일자</th>
				<th width="100">반납일자</th>
				<th width="100">대출상태</th>
				<th width="100">등급</th>
				<th width="100">구분</th>
			</tr>
			<%
				int no = 0;
				try{
					String sql = "select a.lentno,a.custname,a.bookno,b.bookname,to_char(a.outdate,'yyyy-mm-dd'),to_char(a.indate,'yyyy-mm-dd'),a.status,a.class from reservation1229 a, bookinfo1229 b where a.bookno=b.bookno order by a.bookno asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String lentno = rs.getString(1);
						String custname = rs.getString(2);
						String bookno = rs.getString(3);
						String bookname= rs.getString(4);
						String outdate = rs.getString(5);
						String indate = rs.getString(6);
						String status = rs.getString(7);
						String class1 = rs.getString(8);
						
						if(outdate == null)	{outdate = "";}
						if(indate == null)	{indate = "";}
						if(class1 == null)	{class1 = "";}
						
						%>
						<tr>
							<td><%=no %></td>
							<td><a href="reservation1229_update.jsp?send_lentno=<%=lentno%>"><%=lentno %></a></td>
							<td><%=custname %></td>
							<td><%=bookno %></td>
							<td><%=bookname %></td>
							<td><%=outdate %></td>
							<td><%=indate %></td>
							<td><%=status %></td>
							<td><%=class1 %></td>
							<td><a href="reservation1229_delete.jsp?send_lentno=<%=lentno%>" 
							onclick="if(!confirm('삭제하시겠습니까?')){return false;}">삭제</a></td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>			
		</table>
		<button class="btn" type="button" onclick="location.href='/HRD_1229/reservation1229/reservation1229_insert.jsp'">도서 정보 추가</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
