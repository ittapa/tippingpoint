<%@page import="kr.pe.tippingpoint.vo.TpProject"%>
<%@page import="java.nio.charset.CodingErrorAction"%>
<%@page import="org.apache.catalina.util.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



		


<!--small footer start -->
	<footer class="footer-small">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-sm-6 pull-right">
					<ul class="social-link-footer list-unstyled">
						<li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".1s">
							<a href="javascript:snsShare.shareFb()"><i class="fa fa-facebook"></i></a>
						</li>
						<li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".2s">
							<a href="javascript:snsShare.shareGp()"><i class="fa fa-google-plus"></i></a>
						</li>
						<li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".3s">
							<a href="javascript:snsShare.shareTw()"><i class="fa fa-twitter"></i></a>
						</li>
					</ul>
				</div>
				<div class="col-md-4">
					<div class="copyright">
						<p>&copy; Copyright - TippingPoint.
						<c:if test="${sessionScope.adminId != null}">									
							&nbsp;<a href="${initParam.rootPath}/tpAdministrator/tpAdminMain.tp">ADMIN PAGE</a>
							&nbsp;<a href="${initParam.rootPath}/logout.tp">ADMIN LOGOUT</a>
						</c:if>
						<c:if test="${sessionScope.adminId == null}">
							&nbsp;<a href="${initParam.rootPath}/tpAdminAccess.tp">ADMIN LOGIN</a>
						</c:if>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--small footer end-->

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="${initParam.rootPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${initParam.rootPath}/js/hover-dropdown.js"></script>
	<script type="text/javascript" src="${initParam.rootPath}/assets/bxslider/jquery.bxslider.js"></script>

	<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&AMP;sensor=false"></script> -->

	<!--common script for all pages-->
	<script src="${initParam.rootPath}/js/common-scripts.js"></script>
	<script src="${initParam.rootPath}/js/wow.min.js"></script>
	
<%String strCurrentUrl = request.getScheme() + "://tippingpoint.pe.kr" +request.getAttribute("url");%>
	
		<c:choose>
			<c:when test="${not empty requestScope.polist }" >
				<%strCurrentUrl = request.getScheme() + "://tippingpoint.pe.kr" +request.getAttribute("url")+"?tppId="+
			((TpProject)request.getAttribute("polist")).getTppId();%>
			</c:when>
		</c:choose>
	
	<script>
	   	
	    var orginUrl = "<%=strCurrentUrl%>";
	    var encodeUrl = encodeURIComponent(orginUrl);
	    
	
		
		wow = new WOW({
			boxClass : 'wow', // default
			animateClass : 'animated', // default
			offset : 0
		// default
		})
		wow.init();

		var snsShare = {
				shareFb : function(){ //페이스북
				
					    window.open("http://www.facebook.com/sharer/sharer.php?u="+encodeUrl, 'shareOn2', "width=600, height=500, scrollbars=no");
				},
				shareTw : function(){ // 트위터
				    //https://twitter.com/intent/tweet?text=TEXT&url=PAGE_URL
				    window.open("https://twitter.com/intent/tweet?text="+jQuery("#og_title").attr("content")+"&url=<%=strCurrentUrl%>", "_blank","toolbar=0,status=0,width=626,height=436");
				},
				shareGp : function(){ // 구글 플러스
					window.open("https://plus.google.com/share?url=<%=strCurrentUrl%>", "sharer","toolbar=0,status=0,width=626,height=436");
				}				
			};
	</script>


	<script>
		$(document).ready(function() {
			//Set the carousel options
			$('#quote-carousel').carousel({
				pause : true,
				interval : 4000,
			});
		});
	</script>
