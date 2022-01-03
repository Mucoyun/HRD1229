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
			background-color: lightgray;
		}
		
		#reservation_IU_Table tr{
			height: 30px;
		}#reservation_IU_Table th{
			width: 200px;
		}#reservation_IU_Table td{
			width: 250px;
		}#reservation_IU_Table input[type="text"], #reservation_IU_Table select{
			height: 30px;
			width: 200px;
		}#reservation_IU_Table button{
			height: 30px;
			width: 150px;
		}
		.btn_td{
			text-align: center;
		}
		#reservation_IU_Table input:readOnly{
			background-color: gray;
		}
		
	</style>
	<script>
		function Click() {
			if(document.reservation_U_form.lentno.value==""){
				alert("대출번호가 입력되지 않았습니다.");
				document.reservation_U_form.lentno.focus();
			}else if(document.reservation_U_form.custname.value==""){
				alert("고객성명이 입력되지 않았습니다.");
				document.reservation_U_form.custname.focus();
			}else if(document.reservation_U_form.bookno.value==""){
				alert("도서코드가 입력되지 않았습니다.");
				document.reservation_U_form.bookno.focus();
			}else if(document.reservation_U_form.bookname.value==""){
				alert("도서이름이 입력되지 않았습니다.");
				document.reservation_U_form.bookname.focus();
			}else if(document.reservation_U_form.status.value==""){
				alert("대출상태가 선택되지 않았습니다.");
				document.reservation_U_form.status.focus();
			}else if(document.reservation_U_form.class1.value==""){
				alert("등급이 선택되지 않았습니다.");
				document.reservation_U_form.class1.focus();
			}else{
				alert("수정이 완료되었습니다.");
				document.reservation_U_form.action="reservation1229_update_process.jsp";
				document.reservation_U_form.submit();
			}
		}
		
		function Search() {
			document.reservation_U_form.submit();
		}

		function chk_status() {
			if(document.reservation_U_form.indate.value.length==0){
				document.getElementById("status1").checked=true;
			}else{
				document.getElementById("status2").checked=true;
			}
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_lentno = request.getParameter("send_lentno");
	
		String bookname = "";	
		
		String lentno = request.getParameter("lentno");
		String custname = request.getParameter("custname");
		String bookno = request.getParameter("bookno");
		String outdate = request.getParameter("outdate");
		String indate = request.getParameter("indate");
		String status = request.getParameter("status");
		String class1 = request.getParameter("class1");
		
		try{
			String sql = "select lentno,custname,bookno,to_char(outdate,'yyyy-mm-dd'),to_char(indate,'yyyy-mm-dd'),status,class from reservation1229 where lentno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_lentno);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				lentno = rs.getString(1);
				custname = rs.getString(2);
				bookno = rs.getString(3);
				outdate = rs.getString(4);
				indate = rs.getString(5);
				status = rs.getString(6);
				class1 = rs.getString(7);
			}
			
			sql = "select bookname from bookinfo1229 where bookno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bookname = rs.getString(1);
			}else{
				if(bookno != null){
					%><script>
						alert("등록된 도서코드가 아닙니다.");
					</script><%
					bookno="";
					
				}else{
					bookname="";
				}
			}
			
			if(lentno == null){lentno = "";}
			if(custname == null){custname = "";}
			if(bookno == null){bookno = "";}
			if(outdate == null){outdate = "";}
			if(indate == null){indate = "";}
			if(status == null){status = "1";}
			if(class1 == null){class1 = "S";}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
	<section>
		<h2>도서 정보 등록 화면</h2>
		<form name="reservation_U_form" method="post" action="reservation1229_update.jsp">
			<table id="reservation_IU_Table">
				<tr>
					<th>대출번호</th>
					<td><input type="text" name="lentno" value="<%=lentno %>" readonly></td>
					<th>고객성명</th>
					<td><input type="text" name="custname" value="<%=custname %>"></td>
				</tr>
				<tr>
					<th>도서코드</th>
					<td><input type="text" name="bookno" onchange="Search();" value="<%=bookno %>"></td>
					<th>도서이름</th>
					<td><input type="text" name="bookname" value="<%=bookname %>" readonly></td>
				</tr>
				<tr>
					<th>대출일자</th>
					<td><input type="text" name="outdate" value="<%=outdate %>"></td>
					<th>반납일자</th>
					<td><input type="text" name="indate" value="<%=indate %>" onchange="chk_status();"></td>
				</tr>
				<tr>
					<th>대출상태</th>
					<td>
						<input id="status1" type="radio" name="status" value="1" <%if(status.equals("1")){%> checked <%} %> readonly>대출 
						<input id="status2" type="radio" name="status" value="2" <%if(status.equals("2")){%> checked <%} %> readonly>반납 
					</td>
					<th>등급</th>
					<td>
						<select name="class1">
							<option value="S" <%if(class1.equals("S")){%> selected <%} %>>S</option>
							<option value="A" <%if(class1.equals("A")){%> selected <%} %>>A</option>
							<option value="B" <%if(class1.equals("B")){%> selected <%} %>>B</option>
							<option value="C" <%if(class1.equals("C")){%> selected <%} %>>C</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="btn_td" colspan="4">
						<button type="button" onclick="Click();">수정</button>
						<button type="button" onclick="location.href='/HRD_1229/reservation1229/reservation1229_select.jsp'">뒤로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
