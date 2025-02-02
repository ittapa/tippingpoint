<%@ page import="java.util.Enumeration" %>
<%@ page import="kr.pe.tippingpoint.vo.TpFunder" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<style type = "text/css">
.Buttona{
float: left;
margin-left: auto;
}
#delete{
clear: both;

}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<script>
    function button() { //주소 찾기
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('tpfZipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('tpfAddress').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('tpfAddressD').focus();
            }
        }).open();
    }
</script>

<script>
function checkPwd(){ //비밀번호 확인
	var tpfPassword = document.tpFunder.tpfPassword.value; //비밀번호입력
	var passwordConfirm = document.tpFunder.passwordConfirm.value; //비밀번호확인
	if(tpfPassword!=passwordConfirm){
		document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
	}else{
		document.getElementById('checkPwd').innerHTML = "확인되었습니다.";
	}
}
</script>

<script>
$(document).ready(function() {
   $("#modify").on("click",function(){
      tpfunder = document.tpFunder;
      if(tpfunder.tpfPassword.value != tpfunder.passwordConfirm.value){
			alert("비밀번호를 확인하세요");
			return false;
	  }
      tpfunder.submit();
   });
});
</script>

<script type="text/javascript">
//이미지 관련 삭제 및 호출
$(document).ready(function() {
	var defaultImg = "/TippingPoint/defaultImg/tpProfileDefault.png"
	$("#tpfMainImgDelete").on("click", function(){
		var imgconfirm = confirm("기본이미지로 변경합니다.");
		if(imgconfirm){
			$("#upfile").val("");
			document.getElementById('imgView').src=defaultImg;
			$("#tpfProfileImg").val("default");
			alert($("#tpfProfileImg").val());
		}else{
			return false;
		}
	});
	
	
	var originImag = '<%=((TpFunder)request.getAttribute("tpFunder")).getTpfProfileImg()%>';
	$("#tpfMainImgOrigin").on("click",function(){
		$("#upfile").val("");
		document.getElementById('imgView').src=originImag;
		$("#tpfProfileImg").val(originImag);
		alert($("#tpfProfileImg").val());
	});
});
</script>

<script type="text/javascript">
function imgChange(evt) {
	alert("대표 이미지를 업로드합니다.");
	var tgt = evt.target || window.event.srcElement,
	files = tgt.files;
	
	// 파일리더를 지원하는 경우
	if (FileReader && files && files.length) {
		var fr = new FileReader();
		fr.onload = function () {
			document.getElementById('imgView').src = fr.result;
		}
		fr.readAsDataURL(files[0]);
	}
					
	// Not supported 아닌경우 아이프레임..ㅠㅠ
	else {
	// fallback -- perhaps submit the input to an iframe and temporarily store
	// them on the server until the user's session ends.
	}
} //imgChange function 종료
</script>


<script>
$(document).ready(function dropOut(){
	$("#dropOutBtn").on("click", function(){
		 $("#dropOutBtn").hide();
		 $.btnDropId = $(document.createElement("input"));
         $.btnDropId.attr({
             name : "dropOutId",
             type : "text" ,
             id : "dropId"
         });
         $.btnDropPwd = $(document.createElement("input"));
         $.btnDropPwd.attr({
             name : "dropOutPwd",
             type : "password" ,
             id : "dropPw"
         });
         $.btnDelete = $(document.createElement("input"));
         $.btnDelete.attr({
             class : "btn btn-danger",
             type : "button" ,
             value : "회원탈퇴하기",
      
             
         }).on('click', function(){
        	var param = "dropOutId" + "=" + $("#dropId").val() + "&" +"dropOutPwd" + "="+ $("#dropPw").val();
     		$.ajax({
    			"url" : "/TippingPoint/dropOutFunder.tp", //로그인 체크 컨트롤러
    			"type" : "POST",
    			"data" : param,// ID 및 password
    			"dataType" : "text",//응답 데이터 타입 text,json,jsonp,xml
    			"beforeSend":function(){// 아이디 공백체크
    				if(!$("#dropId").val()){
    					alert("ID를 입력해 주세요");
    					$("#dropId").focus();
    					return false;
    				}
    				if(!$("#dropPw").val()){// 비밀번호 공백체크
    					alert("비밀번호를 입력해 주세요");
    					$("#dropPw").focus();
    					return false;
    				}
    			},	
    			"success" : function(txt){
    				if(txt=="success"){
    					if (confirm("회원 탈퇴틑 하시면  데이터를 복구 할수 없습니다. 탈퇴 하시겠습니까??") == true){//확인
    						$("#form").submit();
    					}else{//취소
    					 	return;
    					}
    				}else{
    					alert(txt);
    					return false;
    				}
    			}		
    		});
    	});
         $("#delete").append("회원탈퇴를 원하시면 ID와 비밀번호를 다시 한번 입력해주세요<br>");
         $("#delete").append("ID : ");
         $("#delete").append($.btnDropId);
         $("#delete").append("<br>비밀번호 : ");
         $("#delete").append($.btnDropPwd);
         $("#delete").append("<br>");
         $("#delete").append($.btnDelete);
	});
});
</script>

<body>

<h2>회원정보수정</h2>
<spring:hasBindErrors name="tpFunder"/>
<form action="${initParam.rootPath }/funderModifyRegister.tp" method="post" name="tpFunder" enctype="multipart/form-data">
<table class="table table-bordered">
	<input type="hidden" name="tpfId" id="tpfId" value="${requestScope.tpFunder.tpfId }">
   <tr>
      <td>이름</td>
      <td>
         ${requestScope.tpFunder.tpfName }
         <input type="hidden" name="tpfName" id="tpfName"
         value="${requestScope.tpFunder.tpfName }">
      </td>
   </tr>
   <tr>
      <td>비밀번호</td>
      <td>
         <input type="password" id="tpfPassword" name="tpfPassword" size="20" value="${requestScope.tpFunder.tpfPassword }">
         <form:errors path="tpFunder.tpfPassword" delimiter=" | "/>
      </td>
   </tr>
   <tr>
      <td>비밀번호 확인</td>
      <td>
         <input type="password" name="passwordConfirm" onkeyup="checkPwd()">
		<div id="checkPwd">동일한 암호를 입력하세요.</div>        
      </td>
   </tr>
   <tr>
      <td>이메일</td>
      <td>
         <input type="text" id="tpfEmail" name="tpfEmail" value="${requestScope.tpFunder.tpfEmail }">
         <form:errors path="tpFunder.tpfEmail" delimiter=" | "/>
      </td>
   </tr>
   <tr>
       <td>휴대폰번호</td>
      <td>

         <select name="tpfPhoneNum1">
            <option value="010">010</option>
            <option value="011">011</option>
         </select>
         -
         <input type="text" name="tpfPhoneNum2" id="tpfPhoneNum2" maxlength="4" value="${requestScope.tpfPhoneNum2 }" readonly="readonly">
         -
         <input type="text" name="tpfPhoneNum3" id="tpfPhoneNum3" maxlength="4" value="${requestScope.tpfPhoneNum3 }" readonly="readonly">
         <input type="hidden" name="tpfPhoneNum"/>
      </td>
   </tr>
   <tr>
      <td>우편번호</td>
      <td>
      <input type="text" readonly="readonly" name="tpfZipcode" id="tpfZipcode" placeholder="우편번호" value="${requestScope.tpFunder.tpfZipcode }"> 
      <input type="button" onclick="button()" value="우편번호 찾기" class="btn btn-default">
      <form:errors path="tpFunder.tpfZipcode" delimiter=" | "/>
      </td>
   </tr>
   <tr>
      <td>주소</td>
      <td>
      <input type="text" readonly="readonly" name="tpfAddress" id="tpfAddress" placeholder="주소" value="${requestScope.tpFunder.tpfAddress }">
      <form:errors path="tpFunder.tpfAddress" delimiter=" | "/>
      </td>
   </tr>
   <tr>
      <td>상세주소</td>
      <td>
      <input type="text" name="tpfAddressD" id="tpfAddressD" placeholder="상세주소" value="${requestScope.tpFunder.tpfAddressD }">
      <form:errors path="tpFunder.tpfAddressD" delimiter=" | "/>
      </td>
   </tr>
   <tr>
   		<td>대표 이미지</td>
   		<td>
   		<img src ="${requestScope.tpFunder.tpfProfileImg}" width ="150"  height = "150" id = "imgView" name="imgView"><br>
   		<input type="hidden" id="tpfProfileImg" name="tpfProfileImg" value="${requestScope.tpFunder.tpfProfileImg }">
   		<div class="mainImgfileBox">
					<label>
						사진 업로드 <input type="file" name="upfile" id="upfile" onchange="imgChange(this);"><br>						
					</label>
					<input type="button" id="tpfMainImgDelete" value="기본 이미지" class="btn btn-default">
					<input type="button" id="tpfMainImgOrigin" value="원래 이미지" class="btn btn-default">
				</div>
				<br>
				대표이미지는 가로/세로 150px 이하를 권장합니다.
   		</td>
   </tr>
   
      
       
      
  </form>
</table>
	<div class = "Buttona"><input type="button" value="등록" id="modify" class="btn btn-primary">&nbsp;&nbsp;</div>

<div id="Button">
<form id="form" action="${initParam.rootPath }/removeFunder.tp" method="post">
	<input type="button" value="회원탈퇴" id="dropOutBtn" class="btn btn-danger">
</form>

</div>

<div id="delete"><br/>
</div>
</body>
</html>