/**
 * 
 */

function idcheck(){
	idvalue = $('#empid').val().trim();
	
	//공백 체크
	if(idvalue.length <1) {
		$("#idCk").html("ID입력하세요").css("color","red")
		return false;
	}
	
	//id길이(4~12)
	if(idvalue.length < 4 || idvalue.length > 12){
		$("#idCk").html("Id 4~12사이").css("color","red")
		return false;
	}
	//id 정규식 - 소문자로 시작하고 대문자와 숫자로 조합가능
	idreg=/^[a-z][a-zA-Z0-9]{3,11}$/;//전체는4~8자(길이[a-z]{3,11}==>4~12)
	if(!(idreg.test(idvalue))){
		$("#idCk").html("입력형식오류").css("color","red")
		return false;
	}
	
	return true;
}

function pwdcheck(){
	//비밀번호(공백,길이,정규식)
	pwdvalue = $('#pass').val().trim();
	pwd2value =$('#pass2').val().trim();
	
	//비밀번호 확인
	if(pwd2value.length < 1){
		$("#pwreCk").text("password입력").css("color","red")
		return false;
	}
	if(pwdvalue != pwd2value){
		$("#pwreCk").text("❌불일치❌").css("color","red")
		return false;
	}else{
		$("#pwreCk").text("✔일치✔").css("color","green")
	}
	return true;
}


function phonecheck(){
	//전화번호(공백,정규식)
	phonevalue = $('#per_pn').val().trim();
	
	//공백
	if(phonevalue.length<1){
		$('#phCk').html("개인번호를 입력").css('color', 'red');
		return false;
	}
	//정규식
	phreg = /^\d{3}-\d{3,4}-\d{4}$/;
	if(!(phreg.test(phonevalue))){
		$('#phCk').html("형식오류").css('color', 'red');
		return false;
	}else{
		$('#phCk').text("✔").css("color", "green");
	}
	return true;
}

function deptphonecheck(){
	//전화번호(공백,정규식)
	phonevalue = $('#dept_pn').val().trim();
	
	//공백
	if(phonevalue.length<1){
		$('#dphCk').html("");
		return false;
	}
	//정규식
	phreg = /^\d{3}-\d{3,4}-\d{4}$/;
	if(!(phreg.test(phonevalue))){
		$('#dphCk').html("형식오류").css('color', 'red');
		return false;
	}else{
		$('#dphCk').text("✔").css("color", "green");
	}
	return true;
}

function mailcheck(){
	//이메일(공백,정규식)
	emailvalue = $('#per_email').val().trim();
	//공백
	if(emailvalue.length <1){
		$('#emailCk').html("");
		return false;
	}
	//정규식
	emailreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(!(emailreg.test(emailvalue))){
		$('#emailCk').html("email 형식오류").css('color', 'red');
		return false;
	}else{
		$('#emailCk').text("✔").css("color", "green");
	}
	return true;
}

function deptmailcheck(){
	//이메일(공백,정규식)
	emailvalue = $('#dept_email').val().trim();
	//공백
	if(emailvalue.length <1){
		$('#deptemailCk').html("");
		return false;
	}
	//정규식
	emailreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(!(emailreg.test(emailvalue))){
		$('#deptemailCk').html("email 형식오류").css('color', 'red');
		return false;
	}else{
		$('#deptemailCk').text("✔").css("color", "green");
	}
	return true;
}


//정규식 체크(일반)
function regcheck(){
	idcheck();
	pwdcheck();
	phonecheck();
	mailcheck();
	return true;
}

function passwordcheck(){
	//비밀번호(공백,길이,정규식)
	passwordValue = $('#pass').val().trim();
	passwordReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,12}$/;
	password2Value =$('#pass2').val().trim();
	
	$('#pwCk').text("*필수항목").css("color", "red");
	
	//공백
	if(passwordValue.length < 1){
		$("#passCk").text("password 입력").css("color","red")
		return false;
	}
	//길이(8~12)
	if(passwordValue.length < 8 || passwordValue.length > 12){
		$("#passCk").text("password :8~12").css("color","red")
		return false;
	}
	//정규식(영대소문자, 숫자 특수문자 1개이상씩)
	if(!(passwordReg.test(passwordValue))){
		$("#passCk").text("비밀번호형식오류").css("color","red")
		return false;
	}else {
		$('#passCk').text("✔").css("color", "green");
	}
	//비밀번호 확인
	if(password2Value.length < 1){
		$("#passwordCk").text("password입력").css("color","red")
		return false;
	}
	if(passwordValue != password2Value){
		$("#passwordCk").text("❌불일치❌").css("color","red")
		return false;
	}else{
		$("#passwordCk").text("✔일치✔").css("color","green")
	}
	return true;
}
