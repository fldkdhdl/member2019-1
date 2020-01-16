<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#user_id').val();
		$.ajax({
			url : 'idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
				} else {
						
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용 가능 한 아이디입니다 :p");
						$("#id_check").css("color", "green");
						$("#reg_submit").attr("disabled", true);
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
});
</script>
</head>
<body>

<div class="form-group">
	<label for="user_id">아이디</label>
		<input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" required>
<div class="check_font" id="id_check"></div>

</div>
</body>
</html>