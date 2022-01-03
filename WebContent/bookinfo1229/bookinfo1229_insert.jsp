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
		
		#bookinfo_IU_Table tr{
			height: 30px;
		}#bookinfo_IU_Table th{
			width: 200px;
		}#bookinfo_IU_Table td{
			width: 500px;
		}#bookinfo_IU_Table input[type="text"]{
			height: 30px;
			width: 500px;
		}#bookinfo_IU_Table button{
			height: 30px;
			width: 150px;
		}
		.btn_td{
			text-align: center;
		}
	</style>
	<script>
		function Click() {
			if(document.bookinfo_I_form.bookno.value==""){
				alert("도서코드가 입력되지 않았습니다.");
				document.bookinfo_I_form.bookno.focus();
			}else if(document.bookinfo_I_form.author.value==""){
				alert("저자가 입력되지 않았습니다.");
				document.bookinfo_I_form.author.focus();
			}else if(document.bookinfo_I_form.bookname.value==""){
				alert("도서이름이 입력되지 않았습니다.");
				document.bookinfo_I_form.bookname.focus();
			}else{
				alert("등록이 완료되었습니다.");
				document.bookinfo_I_form.submit();
			}
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>도서 정보 등록 화면</h2>
		<form name="bookinfo_I_form" method="post" action="bookinfo1229_insert_process.jsp">
			<table id="bookinfo_IU_Table">
				<tr>
					<th>도서코드</th>
					<td><input type="text" name="bookno"></td>
				</tr>
				<tr>
					<th>저자</th>
					<td><input type="text" name="author"></td>
				</tr>
				<tr>
					<th>도서이름</th>
					<td><input type="text" name="bookname"></td>
				</tr>
				<tr>
					<td class="btn_td" colspan="2">
						<button type="button" onclick="Click();">등록</button>
						<button type="button" onclick="location.href='/HRD_1229/index.jsp'">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
