<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrapper">

	<!-- 기본정보탭 & 이미지이름수정/삭제탭 -->
	<div class="tabs">
		<ul>
			<li>
				<a href="<c:url value="/comm/worldInfo.do"/>">1. 기본정보 수정 / 이미지 업로드</a>
			</li>
			<li>
				<a href="<c:url value="/comm/worldImage.do"/>">2. 이미지 이름 수정 / 삭제</a>
			</li>
		</ul>
	</div>
	
	<!-- 이미지 이름 수정/삭제 -->
	<div class="row">
		<div class="title">
			<h5>이미지 이름 수정 / 삭제</h5>
		</div>
		<div class="content">
			<table>
				<thead>
					<tr>
						<th rowspan="1" colspan="1">순위</th>
						<th rowspan="1" colspan="1">이미지</th>
						<th rowspan="1" colspan="1">이름 변경</th>
						<th rowspan="1" colspan="1">이미지 변경</th>
						<th rowspan="1" colspan="1">라인 삭제</th>
						<th rowspan="1" colspan="1">
							우승비율
							<br>
							( 최종 우승 횟수 / 전체 게임수 )
						</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td rowspan="1" colspan="1">순위</td>
						<td rowspan="1" colspan="1">이미지</td>
						<td rowspan="1" colspan="1">이름 변경</td>
						<td rowspan="1" colspan="1">이미지 변경</td>
						<td rowspan="1" colspan="1">라인 삭제</td>
						<td rowspan="1" colspan="1">우승비율</td>
					</tr>
				</tfoot>
				<tbody>
					<c:choose>
						<c:when>
							<c:forEach var="item" items="${list}" varStatus="status">
								<tr>
									<!-- 순위 -->
				                    <td>
				                    	${item.rate}
				                    </td>
				                    <!-- 이미지 표시 -->
				                    <td>
				                        <img src="${item.imageUrl}" alt="이미지">
				                    </td>
				                    <!-- 이름 변경 입력 필드 -->
				                    <td>
				                        <input type="text" name="name" value="${item.name}">
				                    </td>
				                    <!-- 이미지 변경 입력 필드 -->
				                    <td>
				                        <input type="file" name="newImage">
				                    </td>
				                    <!-- 라인 삭제 버튼 -->
				                    <td>
				                        <button type="button" class="delete-button" onclick="deleteRow(${item.id})">삭제</button>
				                    </td>
				                    <!-- 우승 비율 계산 또는 표시 -->
				                    <td>
				                        ${item.winRate}
				                    </td>
				                </tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>