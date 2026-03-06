<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="admin-content">

	<div class="facility-header">
		<h2>qna 관리</h2>
		<a
			href="${pageContext.request.contextPath}/admin/board/qnaManage.do"
			class="facility-add-btn"> + 시설 추가 </a>
	</div>

	<table class="facility-table">
		<thead>
			<tr>
							
				<th>ID</th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>상태</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty facilityList}">
				<tr>
					<td colspan="6" class="empty">게시글이 없습니다.</td>
				</tr>
			</c:if>

			<c:forEach var="f" items="${boardList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${f.boardType}</td>
					<td>${f.boardName}</td>					
					<td><a
						href="${pageContext.request.contextPath}/admin/facility/updateForm.do?id=${f.facilityId}"
						class="facility-btn-edit">수정</a> <a
						href="${pageContext.request.contextPath}/admin/facility/delete.do?id=${f.facilityId}"
						onclick="return confirm('정말 삭제하시겠습니까?');" class="facility-btn-delete">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>