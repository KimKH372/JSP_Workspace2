

$(document).ready(function(){
	$("#send").click(function(){
		//아이디가 공백일때
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		//암호가 공백일때
		if($("#pwd").val()==""){
			alert("암호를 입력하세요");
			$("#pwd").focus();
			return false;
		}
		//암호확인이 공백일때
		if($("#pwd_check").val()==""){
			alert("암호확인 필수");
			$("#pwd_check").focus();
			return false;
		}
		//암호 일치확인
		if($("#pwd").val()!=$("#pwd_check").val()){
			alert("암호 불일치");
			$("#pwd_check").focus();
			return false;
		}
		if($("#pwd").val().length<6){
	        alert("비밀번호는 6글자 이상이어야 합니다.");
	        pw1.value="";
	        pw1.focus();
	        return false;
	    }
		//이름이 공백일때
		if($("#name").val()==""){
			alert("이름을 입력하세요");
			return false;
		}
		//이메일이 공백일때
		if($("#email").val()==""){
			alert("이메일을 입력하세요");
			return false;
		}
		//이메일 양식
		if(!$("#email").val().match(reg_email)){
			alert("이메일을 정확하게 입력하세요");
			$("#email").focus();
			return false;
		}
		$("#frm").submit();
	})//send
	
	//아이디 중복체크 버튼
	$("#idcheckBtn").click(function(){
		window.open("idCheck", "", "width=600 height=500")
	}); //idcheckBtn
	
	//id중복확인 사용버튼
	$("#useBtn").click(function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		$.ajax({
			type: "post",
			url : "idCheck",
			data: {"userid":$("#userid").val()},
			success: function(val){
				if(val.trim()=="yes"){
					alert("사용가능한 아이디");
					$(opener.document).find("#userid").val($("#userid").val());
					self.close();
				}else if(val.trim()=="no"){
					alert("중복된 아이디");
					$("#userid").val("");
				}
			},
			error: function(e){
				alert("error:"+e);
			}
		}); //ajax
	}) //useBtn
	
});//documentcript to your project