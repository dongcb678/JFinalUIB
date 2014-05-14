<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<c:if test='${empty no_visible_elements || no_visible_elements == false }'>
			<!-- content ends -->
			</div><!--/#content.span10-->
		</c:if>
		
		</div><!--/fluid-row-->
		<c:if test='${empty no_visible_elements || no_visible_elements == false }'>
		
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>

		<footer>
			<p class="pull-left">&copy; <a href="http://usman.it" target="_blank">Muhammad Usman</a> </p>
			<p class="pull-right">Powered by: <a href="http://usman.it/free-responsive-admin-template">Charisma</a></p>
		</footer>
		</c:if>

	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="${pageScope.cxt}/ui/charisma/js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='${pageScope.cxt}/ui/charisma/js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='${pageScope.cxt}/ui/charisma/js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="${pageScope.cxt}/ui/charisma/js/excanvas.js"></script>
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.flot.min.js"></script>
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.flot.pie.min.js"></script>
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.flot.stack.js"></script>
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="${pageScope.cxt}/ui/charisma/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="${pageScope.cxt}/ui/charisma/js/charisma.js"></script>
	
</body>
</html>
