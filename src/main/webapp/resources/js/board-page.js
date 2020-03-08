function selChange(nowPage,visit,bnum) {
	var sel = document.getElementById('cntPerPage').value;
	if(bnum == null||bnum) {
		location.href="blog?menu=board&nickname="+visit+"&nowPage="+nowPage+"&cntPerPage="+sel;
	}else if(bnum==0){
		location.href="blog?menu=board&nickname="+visit+"&nowPage="+nowPage+"&cntPerPage="+sel;
	}
	location.href="blog?menu=board&nickname="+visit+"&bnum="+bnum+"&nowPage="+nowPage+"&cntPerPage="+sel;
}
function selChange2(nowPage,visit) {
	var sel = document.getElementById('cntPerPage').value;	
		location.href="blog?menu=board&nickname="+visit+"&nowPage="+nowPage+"&cntPerPage="+sel;
}
function selChangeMain(nowPage) {
	var sel = document.getElementById('cntPerPage').value;
	location.href="?menu=board&nowPage="+nowPage+"&cntPerPage="+sel;
}