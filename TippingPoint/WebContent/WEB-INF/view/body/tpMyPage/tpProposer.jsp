<%@ page import="java.util.Enumeration"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="UTF-8">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
.error {
	color: red;
}
</style>
<script type="text/javascript">
var unProperser = "<%=request.getAttribute("unProperser")%>";

		   	if(unProperser == "unProperser"){
		   		alert("등록 권한이 필요한 페이지 입니다.");
		   	}


//에러로 back 했을 시 메세지 호출
var errorMessage = "<%=request.getAttribute("errorMessage")%>";
	if (errorMessage != 'null') {
		alert(errorMessage);
	}

	$(document).ready(function() {

		//프로젝트등록호출하려는데 권한이 없을때 메세지 호출

	}); //ready 끝

	//submit 처리 체크

	function chekingSubmit() {

		var checkConfirm = confirm("입력하신 정보를 저장하시겠습니까?");

		if (!checkConfirm) {
			return false;
		} else {
			return true;
		}
	}
</script>

<c:choose>

	<c:when test="${requestScope.num == 0 }">
		<h2>PROPOSER 수정 양식</h2>
		<form action="updateInfoProposer.tp" method='post'
			onsubmit="return chekingSubmit()">
	</c:when>

	<c:otherwise>
		<h2>PROPOSER 가입 양식</h2>
		<form action="addInfoProposer.tp" method='post'
			onsubmit="return chekingSubmit()">
	</c:otherwise>

</c:choose>

<label> 은행 : <select name="bankListCategory">
		<option value="null">은행을 선택하세요</option>

		<c:forEach items="${requestScope.bankList }" var="tpBankList">\
									
						<option value="${tpBankList.bankEr}"
				${requestScope.proposer.bankListCategory == tpBankList.bankEr ?'selected=selected':''}>${tpBankList.bankKr}</option>
		</c:forEach>


</select> <span class=error><form:errors
			path="tpProposer.bankListCategory" delimiter="|" /></span><br /> 계좌번호 <input
	type="text" name="account" value="${requestScope.proposer.account}"
	maxlength="10" /><span class="error"></label>
<span class="error"><form:errors path="tpProposer.account"
		delimiter="|" /></span>
<label> <br /> <label> 주민 번호 : <input type="text"
		name="residentRegistrationFirstNum" maxlength="6"
		value='${requestScope.proposer.residentRegistrationFirstNum}'
		${requestScope.proposer.residentRegistrationFirstNum != null and requestScope.num == 0  ?" readonly = 'readonly' ":"" } />
		- <input type="password" name="residentRegistrationLastNum"
		maxlength="7"
		${requestScope.proposer.residentRegistrationFirstNum != null and requestScope.num == 0   ?"readonly = 'readonly' value = '*******'":""} /><span
		class="error"> <span class="error"><form:errors
					path="tpProposer.residentRegistrationFirstNum" delimiter=" | " /></span></label>
<p>
		<label>제안자 형태 : <label> <select name="proposerType">
					<option value="null">유형을 선택하세요</option>
					<option value="normal"
						${requestScope.proposer.proposerType == "normal"?"selected ='selected'":"" }>일반
						개인</option>
					<option value="business"
						${requestScope.proposer.proposerType == "business"?"selected ='selected'":"" }>개인
						사업자</option>
					<option value="corporate"
						${requestScope.proposer.proposerType == "corporate"?"selected ='selected'":"" }>법인
						사업자</option>
			</select> <span class="error"><form:errors
						path="tpProposer.proposerType" delimiter=" | " /></span>
		</label>
		</label>
	<p>
		<label>사업자 번호 : <input type="text"
			name="corporateRegistrationNumber" maxlength="10"
			value="${requestScope.proposer.corporateRegistrationNumber}" /><span
			class="error">
				<p>
					<span class="error"><form:errors
							path="tpProposer.corporateRegistrationNumber" delimiter="|" /></span></label>
	<p>
		<br /> <input type="submit" value="저장" />
	</form>