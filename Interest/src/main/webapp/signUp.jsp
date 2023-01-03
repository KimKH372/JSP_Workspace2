<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
img{
	display: inline-block;
	float: right;
}
#frm{
	width: 60%;
	height: auto;
	position: absolute;
	top: 50%;
	left: 35%;
	transform: translate(-50%, -50%);
}
.button{
	text-align: center;
	margin: 0 auto;
	padding: 20px;
}
</style>
<body>
<%@include file= "header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-5">
			<form action="insert" method="post" id="frm">
			  <br/><br/>
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">아이디</span>
			    </div>
			      <input type="text" class="form-control" id="userid" name="userid" readonly="readonly" size=20>
			    <div class="col align-self-end" >
			          <button  type="button"  id="idcheckBtn"  class="btn btn-primary">중복확인</button>
			   	</div>
			  </div>
			  <br/>
			   
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">이름</span>
			    </div>
			      <input type="text" class="form-control" id="name" name="name">
			  </div>
			  <br/>
			  
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">비밀번호</span>
			    </div>
			    <input type="password" class="form-control" placeholder="6자리 이상" id="pwd" name="pwd">
			    <input type="password" class="form-control" placeholder="비밀번호 확인" id="pwd_check" name="pwd_check">
			  </div>
			  <br/>
			  
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">이메일</span>
			    </div>
			      <input type="text" class="form-control" id="email" name="email" placeholder="email@email.com">
			  </div>
			  <br/>
			    
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">우편번호</span>
			    </div>
			      <input type="text" id="sample6_postcode" name="sample6_postcode" readonly="readonly" class="form-control">
			    <div class="col align-self-end" >
			      <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호" class="btn btn-primary"><br>
			   	</div>
			  </div>
			  <br/>  
			
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">주소</span>
			    </div>
			    <input type="text" id="sample6_address" name="sample6_address" placeholder="주소" class="form-control"><br>
			  </div>
			
			  <div class="input-group mb-3">
				<input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소" class="form-control">
				<input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목" class="form-control">
			  </div>
			    
			  <div class="button">
			 	  <input type="reset" class="btn btn-gray" value="취소">
			 	  <button  id="send"  class="btn btn-primary">회원가입</button>
			  </div>
			  
	  </div>
	  
	</form>
		
	</div>
	<%@include file= "footer.jsp" %>
</div>

</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

