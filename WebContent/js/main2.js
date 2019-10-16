$(document).ready(function(){
	var didScroll;
	// 스크롤시에 사용자가 스크롤했다는 것을 알림
	$(window).scroll(function(event){
		didScroll = true;
		setInterval(function(){
			if(didScroll){
				hasCrolled();
				didScroll = false;
			}
		});
	});
	
	// 스크롤 시에 동작
	function hasCrolled(){
		var height = $(document).scrollTop();
		console.log('스크롤 높이 '+height);
		if(height >=10){
			$('.headerimg').css({
				'display':'block'
			});
		}else{
			$('.headerimg').css({
				'display':'none'
			});
		}
	}
	
});