<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/ui/charisma/java-version/header.jsp"%>

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Gallery</a>
					</li>
				</ul>
			</div>

			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-picture"></i> Gallery</h2>
						<div class="box-icon">
							
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<p class="center">
							<button id="toggle-fullscreen" class="btn btn-large btn-primary visible-desktop" data-toggle="button">Toggle Fullscreen</button>
						</p>
						<br/>
						<ul class="thumbnails gallery">
							<% for(int i=1; i<=24; i++) { %>
							<li id="image-<%=i%>" class="thumbnail">
								<a style="background:url(${pageScope.cxt}/ui/charisma/img/gallery/thumbs/<%=i%>.jpg)" title="Sample Image <%=i%>" href="${pageScope.cxt}/ui/charisma/img/gallery/<%=i%>.jpg"><img class="grayscale" src="${pageScope.cxt}/ui/charisma/img/gallery/thumbs/<%=i%>.jpg" alt="Sample Image <%=i%>"></a>
							</li>
							<% } %>
						</ul>
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
    
<%@ include file="/ui/charisma/java-version/footer.jsp"%>
