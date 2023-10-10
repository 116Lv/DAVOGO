<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="replaceSrc"><spring:eval expression="@environment.getProperty('file.replaceSrc')"></spring:eval></c:set>
<c:set var="replaceTrg"><spring:eval expression="@environment.getProperty('file.replaceTrg')"></spring:eval></c:set>

<!-- 이미지 이름 수정/삭제 -->
<form id="imageNameForm" name="imageNameForm" method="post" action="/comm/saveImageName.do" onsubmit="return false;">
	<input type="hidden" name="comm_id" value="${param.commId}"/>
	<input type="hidden" id="delFileNos" name="delFileNos" value="">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="my-2">이미지 이름 수정 / 삭제
						<span class="float-right">
							<button type="submit" id="imageName_submit" name="submit">저장하기</button>
						</span>
					</h5>
					<table class="table">
						<thead>
							<tr>
								<th>순위</th>
								<th>이미지</th>
								<th>이미지 이름</th>
								<th>이미지 삭제</th>
								<th>
									우승비율
									<br>
									( 최종 우승 횟수 / 전체 게임수 )
								</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty fileList}">
								<c:forEach var="file" items="${fileList}" varStatus="status">
									<tr>
										<!-- 순번 -->
					                    <td>
					                    	${status.count}
					                    </td>
					                    <!-- 이미지 표시 -->
					                    <td>
					                        <img style="max-width:120px; max-height:120px;" src="${fn:replace(file.storeLocate, replaceSrc, replaceTrg)}/${file.storeTname}" alt="${file.orgFname}">
					                    </td>
					                    <!-- 이미지 이름 변경 입력 필드 -->
					                    <td>
					                    	<input type="hidden" name="worldId" value="${file.worldId}" />
					                        <input type="text" name="item" value="${file.item}" maxlength="300" size="100">
					                    </td>
					                    <!-- 삭제 버튼 -->
					                    <td>
					                        <button type="button" class="delete-button" onclick="deleteImageRow(${file.worldId}, this)">삭제</button>
					                    </td>
					                    <!-- 우승 비율 계산 또는 표시 -->
					                    <td>
					                        ${file.winRate}
					                    </td>
					                </tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
$(document).ready(function() {
	$("#imageNameForm").validate({
		submitHandler: function (form) {
			var isEmpty = false;
			console.log($(form).find("input[name=item]").length);
			$(form).find("input[name=item]").each(function(idx, item) {
				if ($(item).val() == '') {
					console.log("값이 없어서 isEmpty true")
					isEmpty = true;
					return false;
				}
			});
			
			console.log("isEmpty=", isEmpty);
			if (isEmpty) {
				alert("이미지 이름은 모두 입력하셔야 합니다.");
				return false;
			}
			
			//if (!confirm("저장하시겠습니까?")) {
			//	return false;
			//}
			
			$.ajax({
				type : "post",
				url  : "/comm/saveImageName.do",
				data : $(form).serialize(),
				dataType : "json",
				success:function(result){
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
		                return;
		        	}
	
					alert("저장되었습니다");
				}
			});
		}
	});
	
});

//이미지 삭제
function deleteImageRow(worldId, obj) {
	var delFileNos = $("#imageNameForm").find("[name=delFileNos]").val();
	if (delFileNos != ""){
		$("#imageNameForm").find("[name=delFileNos]").val(delFileNos + "," + worldId);
	} else {
		$("#imageNameForm").find("[name=delFileNos]").val(worldId);
	}
	
	$(obj).closest('tr').remove();
}
</script>