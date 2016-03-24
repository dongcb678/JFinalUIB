var Animation = function() {
	"use strict";
	function testAnim(x) {
		$('#animationSandbox').removeClass().addClass(x + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
			$(this).removeClass();
		});
	};
	//function to initiate CSS3 Animation
	var runAnimation = function() {
		$('.js--triggerAnimation').click(function() {
			var anim = $('.js--animations').val();
			testAnim(anim);
		});

		$('.js--animations').change(function() {
			var anim = $(this).val();
			testAnim(anim);
		});
	};
	return {
		init : function() {
			runAnimation();
		}
	};
}();
