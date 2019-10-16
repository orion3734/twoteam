$(document).ready(function(){
	$('#delete').click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#updateform").attr("action", "ad_delete.do");
			$('#updateform').submit();
			alert("삭제되었습니다");
		}else{
			alert("취소되었습니다");
			return false;
		}
	})
	$('#update').click(function(){
		$('#updateform').attr("action","ad_update.do");
		$('#updateform').submit();
	})
});