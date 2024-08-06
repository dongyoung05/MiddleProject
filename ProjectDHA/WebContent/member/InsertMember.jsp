<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
<title>Insert title here</title>
<style type="text/css">


body {
  background: #422700;
}
form {
  width: 60%;
  margin: 60px auto;
  background: #efefef;
  padding: 60px 120px 80px 120px;
  text-align: center;
  -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
  box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
}
label {
  display: block;
  position: relative;
  margin: 40px 0px;
}
.label-txt {
  position: absolute;
  top: -1.6em;
  padding: 10px;
  font-family: sans-serif;
  font-size: .8em;
  letter-spacing: 1px;
  color: rgb(120,120,120);
  transition: ease .3s;
}
.input {
  width: 100%;
  padding: 10px;
  background: transparent;
  border: none;
  outline: none;
}

.line-box {
  position: relative;
  width: 100%;
  height: 2px;
  background: #BCBCBC;
}

.line {
  position: absolute;
  width: 0%;
  height: 2px;
  top: 0px;
  left: 50%;
  transform: translateX(-50%);
  background: #8BC34A;
  transition: ease .6s;
}

.input:focus + .line-box .line {
  width: 100%;
}

.label-active {
  top: -3em;
}

button {
  display: inline-block;
  padding: 12px 24px;
  background: rgb(220,220,220);
  font-weight: bold;
  color: rgb(120,120,120);
  border: none;
  outline: none;
  border-radius: 3px;
  cursor: pointer;
  transition: ease .3s;
}

button:hover {
  background: #8BC34A;
  color: #ffffff;
}

</style>
<script type="text/javascript">
$(document).ready(function(){

	$('.input').focus(function(){
		$(this).parent().find(".label-txt").addClass('label-active');
	});

	$(".input").focusout(function(){
		if ($(this).val() == '') {
			$(this).parent().find(".label-txt").removeClass('label-active');
	    };
	});
	// id 정규식 최소 5글자이상 15글자이하
	$('#mem_id').on('keyup', function(){
		idvalue = $(this).val().trim();
		
			
	
		
		$.ajax({
			url : "/ProjectDHA/checkMemberId.do",
			data : {'mem_id' : idvalue},
			type : 'get',
			dataType : 'json',
			success : function(result){
				if(result.flag == "이 아이디는 사용가능 합니다."){
					
					
					$('#chkId').html(result.flag).css('color', 'blue');
				
				
				} else {
					
					
					$('#chkId').html(result.flag).css('color', 'red');
				}
				
			},
			error : function(xhr){
				alert(xhr.status);
			}
		});
			
	});// id정규식 끝
		
	
		
	  // 비밀번호 정규식 특수문자가 반드시 포함된 4글자 이상 30글자 미만 비밀번호
    $('#mem_pass').on('keyup', function(){
        passvalue = $('#mem_pass').val().trim();
        passreg = /^(?=.*[!@#$%^&*()-_=+])[A-Za-z\d!@#$%^&*()-_=+]{4,30}$/;
        if(passreg.test(passvalue)){
            $('#mem_pass').css('border', '2px solid blue');
        } else {
            $('#mem_pass').css('border', '2px solid red');
        }
    });

    $('#mem_pass2').on('keyup', function(){
        passvalue2 = $('#mem_pass2').val().trim();
        if(passvalue2 != passvalue) {
            $('#chkPass').html('비밀번호가 다릅니다.').css('color', 'red');
        } else {
            $('#chkPass').html('');
        }
    });
  	//전화번호 데이터 형식 체크
	$('#mem_tel').on('keyup', function(){
		let hpvalue = $(this).val().trim().replace(/-/g,'');	//하이폰제거해서 데이터 가져오기
		
		// hpreg는 소괄호를 기준으로 번호를 3개의 덩어리로 나누어 하이폰을 추가하는 작업.
		let hpreg = hpvalue.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, '$1-$2-$3');
		
		
		if(hpreg.length <= 13){	// 전화번호 길이는 13이어야 함...
			//	열심히 하이폰 추가한 작업을 this에 넣어준다.
			$(this).val(hpreg);
			if(/^(\d{2,3})-(\d{3,4})-(\d{4})$/.test(hpreg)){	// 전화번호 정규식 맞았을때
				$(this).css('border', '2px solid blue');
			}else{						// 전화번호 정규식 틀렸을떄
				$(this).css('border', '2px solid red');
			}
		}
		else {
			$(this).css('border', '2px solid red');	//전화번호 길이 초과
		}
	});

    // 회원가입 버튼 클릭 시 정규식에 위반된 경우 경고 표시
    $('#MemberInsert').click(function(){
        if($('#mem_pass').css('border-color') == 'rgb(255, 0, 0)') {
            alert('비밀번호를 다시 입력해주세요.');
            return false;
        }
        if($('#mem_pass2').val() != passvalue) {
            alert('비밀번호 확인이 일치하지 않습니다.');
            return false;
        }
        
    });
	
	
});
</script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>

<form id="ff" style="text-align: center;" enctype="multipart/form-data" 
  action="/ProjectDHA/insertMember.do" method="post">
  <label>
    <p class="label-txt">ENTER YOUR ID</p>
    <input type="text" class="input" name="mem_id" id="mem_id">
    
    <div class="line-box">
      <div class="line"></div>
      <span id="chkId"></span>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR PASSWORD</p><br>
    <input type="password" class="input" id="mem_pass" name="mem_pass">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR PASSWORD </p><br>
    <input type="password" class="input" id="mem_pass2">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt" >ENTER YOUR NAME </p><br>
    <input type="text" class="input" id="mem_name" name="mem_name">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR EMAIL </p><br>
    <input type="text" class="input" id="mem_email" name="mem_email">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  

  <label>
    <p class="label-txt">ENTER YOUR PHONE </p><br>
    <input type="text" class="input" id="mem_tel" name="mem_tel">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  
  <label>
    <p class="label-txt">ENTER YOUR BIRTH </p><br>
    <input type="date" class="input" name="mem_bir">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  
  <label>
    <p class="label-txt">ENTER YOUR PHOTO </p><br>
    <input type="FILE" class="input" name="mem_img" id="mem_img">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  
	<button type="button" onclick="sample4_execDaumPostcode()" >우편번호 찾기</button><br>
  <label>
  
  	 <p class="label-txt">우편번호 </p><br>
	<input type="text" id="sample4_postcode" name="mem_zip" class="input">
	 <div class="line-box">
      <div class="line"></div>
    </div>
   </label>
	
	<label>
    <p class="label-txt">도로명주소 </p><br>
   
	
	<input type="text" id="sample4_roadAddress"  name="mem_add1"  class="input">
    	<div class="line-box">
      		<div class="line"></div>
    	</div>
    </label>
    
    <label>
    	<p class="label-txt">지번주소 </p><br>
   
	
		<input type="text" id="sample4_jibunAddress"  class="input" disabled>
		<span id="guide" style="color:#999;display:none"></span><Br>
	
    	<div class="line-box">
      		<div class="line"></div>
    	</div>
    </label>
	
	<label>
 	    <p class="label-txt">상세주소 </p><br>
   
		<input type="text" id="sample4_detailAddress" name="mem_add2"  class="input">
    	<div class="line-box">
      		<div class="line"></div>
    	</div>
    </label>
  
  <label>
	<input type="text" id="sample4_extraAddress" placeholder="참고항목" class="input" disabled><br>
    <div class="line-box">
      <div class="line"></div>
    </div>
   </label>
	
	<button type="submit" value="회원가입" id="MemberInsert">회원가입</button>
	</form>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
</body>
</html>