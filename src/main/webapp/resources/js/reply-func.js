function updateForm(id,writerdata,contextdata, textarea) {
	var request = new XMLHttpRequest();
	request.open("GET", "" + id + "?writerdata=" + writerdata + "&contextdata=" + contextdata
			+ "&textarea=" + textarea);
	request.onreadystatechange = function(){
		if ( request.readyState == 4 && request.status == 200) {
			
			document.getElementById(id).innerHTML = request.responseText;
		}
	}
	request.send();
}

function QNAupdateForm(id,writerdata,contextdata, textarea, title) {
	var request = new XMLHttpRequest();
	request.open("GET", "" + id + "?writerdata=" + writerdata + "&contextdata=" + contextdata
			+ "&textarea=" + textarea + "&title=" + title);
	request.onreadystatechange = function(){
		if ( request.readyState == 4 && request.status == 200) {
			
			document.getElementById(id).innerHTML = request.responseText;
		}
	}
	request.send();
}
