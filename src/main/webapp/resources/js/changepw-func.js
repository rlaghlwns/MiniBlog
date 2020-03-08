var pwResult;
var cfResult;

function pwcheck(id) {
	var str = document.getElementById('userpw').value;
    if (str == "") {
        pwResult = document.querySelector(`'#${id}'`);
        pwResult.text("비밀번호를 입력해주세요");
    }
	else {
        pwResult.text("");
    }
    return pwResult.text;
}

function cfcheck(id) {
	var str = document.getElementById('cfpw').value;
	var str2 = document.getElementById('userpw').value;
    if (str == "") {
        cfResult = document.querySelector(`'#${id}'`);
        cfResult.text("비밀번호를 입력해주세요");
    }
	else if (str != str2)
        cfResult.text("비밀번호가 일치하지 않습니다");
	else {
        cfResult.text("");
    }
    return cfResult.text;
}

function handleClick(formId, pwResultId, cfResultId) {
    var formName = document.querySelector(`'.${formId}'`);

	var pw = pwcheck(pwResultId);
	var confirm = cfcheck(cfResultId);
    
	if (pw == "" && confirm == "") {
        formName.submit();
	}
}