<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원정보추가</title>
</head>
<body>
<h1>여기에 CSS나 부트스트랩 먹이기</h1>
	<div>
		<form action="/detail/addEmpProc.do" name="f" onsubmit="return doRegEmpCheck(this);">
			<div id="#"> 직원번호 : <input type="text" id="empnoAjax" name="empno" value=""/> </div>
			<div id="empnoCheck"></div>
			<div id="#"> 직원이름 : <input type="text" name="ename"/> </div>
			<div id="#"> 직급 : 
				<select id="rank" name="rank">
					  <option selected>직급 선택</option>
                      <option value="0">매니저</option>
                      <option value="1">알바생</option>
				</select>
			</div>
			<div id="#"> 전화번호 : <input type="text" name="phone"/> </div>
			<div id="#"> 이메일 : <input type="text" name="email"/> </div>
			<div id="#"> 주소 : <input type="text" name="adress"/> </div>
			<div id="#"> 출근시간 : <input type="time" id="att_time" name="att_time"></div>
			<div id="#"> 퇴근시간 : <input type="time" id="off_time" name="off_time"></div>
			<div>직원 얼굴 학습 <input type="button" value="얼굴학습하기"  onclick="faceHakSep();"> </div>
			<button type="submit" id="addEmpSubmit"> 등록하기 </button>
		</form>
	</div>
<script src="/resource/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function faceHakSep() {
		console.log("이미지 학습 진입");
		let empno = $('#empnoAjax').val();
		$.ajax({
			url : '/detail/faceHakSepToFlask.do?empno=' + empno,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				if(data == 1){
					alert('이미지 학습 완료');
					$('#addEmpSubmit').attr('disabled', false);
				}else{
					alert('이미지 학습 실패...');
					$('#addEmpSubmit').attr('disabled', true);
				}
				
			}
			
		});
	};
</script>
<!--유효성 검사 로직-->
 <script type="text/javascript">
    $('#empnoAjax').blur(function () {
		let empno = $('#empnoAjax').val();
		$.ajax({
			url : '/detail/empCheck.do?empno=' + empno,
			type : 'get',
			dataType : 'text',
			success : function (data) {
				if(data == 1){
					$('#empnoCheck').text('이미 등록된 사원번호 입니다.');
					$('#empnoCheck').css('color', 'red');
					$('#addEmpSubmit').attr('disabled', true);
				}else{
					$('#empnoCheck').text('이상없습니다.');
					$('#empnoCheck').css('color', 'blue');
					$('#addEmpSubmit').attr('disabled', false);
				}
			}
		})
	});
</script>
<script type="text/javascript">
	//null 방지를 위한 유효성 체크하기
	function doRegEmpCheck(f){
		
		if (f.att_time.value==""){
			alert("출근시간을 입력하세요.");
			f.att_time.focus();
			return false;
		}
		
		if (f.off_time.value==""){
			alert("퇴근시간을 입력하세요.");
			f.off_time.focus();
			return false;
		}
		
		if (f.empno.value==""){
			alert("직원번호를 입력하세요.");
			f.empno.focus();
			return false;
		}
		
		if (f.ename.value==""){
			alert("이름을 입력하세요.");
			f.ename.focus();
			return false;
		}
		
		if (f.rank.value==""){
			alert("직급을 입력하세요.");
			f.rank.focus();
			return false;
		}
		
		if (f.phone.value==""){
			alert("전화번호를 입력하세요.");
			f.phone.focus();
			return false;
		}
		
		if (f.email.value==""){
			alert("이메일을 입력하세요.");
			f.email.focus();
			return false;
		}
		
		if (f.adress.value==""){
			alert("주소를 입력하세요.");
			f.adress.focus();
			return false;
		}
	}
</script>
		
</body>
</html>