$(document).ready(function() {
	$('#fe').on('change',function(){
		 var fileSize = document.getElementById("fe").files[0].size;
		    var maxSize = 10 * 1024 * 1024;//10MB
		 
		    if(fileSize > maxSize){
		       alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
		       return false;
		    }
		
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name; 
			} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				} 

		$('#here').val(filename);
	})
		$("#cn").click(function(){
			window.history.back();
		});
	var type;
	function typeSelect(){
		if($('input[name=type]').val()==1){
			type="양쪽";
		}else if($('input[name=type]').val()==2){
			type="세로"; 
		}else if($('input[name=type]').val()==3){
			type="노출";
		}
	}

	$('#in').click(function(){
		if($("#cy").val()==""){
			alert("회사명을 확인해주세요");
			return false;
		}else if($('#nm').val()==""){
				alert("담당자명을 확인해주세요");
				return false;
		}else if($("#tel").val()==""){
			alert("연락처를 확인해주세요");
			return false;
		}else if($('#title').val()==""){
			alert("제안명을 확인해주세요");
			return false;
		}else if($('#cont').val()==""){
			alert("내용을 확인해주세요");
			return false;
		}else if($('#from').val()==""){
			alert("시작 기간을 확인해주세요");
			return false;
		}else if($('#to').val()==""){
			alert("종료 기간을 확인해주세요");
			return false;
		}
		else if(!($('#here').val())){
			alert("첨부파일을 확인해주세요");
			return false;
		}else if(!($('#con1').is(":checked"))){
			alert("1 체크 확인해주세요");
			return false;
		}else if(!($('#con2').is(":checked"))){
			alert("2 체크 확인해주세요");
			return false;
		}
		typeSelect();
		if(confirm("타입 : "+type+"\n회사명 : "+$("#cy").val()+"\n담당자명 : "+$("#nm").val()+"\n연락처 : "+$("#tel").val()+"\n제안명 : "+$("#title").val()+"\n내용 : "+$("#cont").val()+"\n광고기간 : "+$("#from").val()+" / "+$("#to").val()+"\n등록 하시겠습니까?")==true){
		$('#advInsert').submit();
			alert("등록되었습니다");
			return false;
		}else{
			alert("취소되었습니다");
			return false;
		};
	}); 
});
$(function() {
	var dates = $("#from, #to ")
			.datepicker(
					{
						prevText : '이전 달',
						nextText : '다음 달',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
								'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						dateFormat : 'yy.mm.dd',
						showMonthAfterYear : true,
						yearSuffix : '년',
						minDate:"+3D",
						maxDate : '+90d',
						onSelect : function(selectedDate) {
							var option = this.id == "from" ? "minDate"
									: "maxDate", instance = $(this).data(
									"datepicker"), date = $.datepicker
									.parseDate(
											instance.settings.dateFormat
													|| $.datepicker._defaults.dateFormat,
											selectedDate, instance.settings);
							dates.not(this).datepicker("option", option,
									date);
						}
					});
});