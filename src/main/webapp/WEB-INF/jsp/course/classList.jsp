<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div>
	<div class="d-flex justify-content-center">
		<div class="col-11">
			<div>
				<h1 class="mt-4 ml-4">My Classes</h1>
			</div>
			<hr>
			<div class="box d-flex noneSelectable">
				<c:forEach var="combined" items="${combinedList}" varStatus="status">
					<div class="classBox mx-3 mt-4 mb-2">
						<a href="/univ/course/class_detail?classId=${combined.id}"
							id="classBox${status.count}" data-id="${combined.id}">
							<div class="classBoxTitle">
								<div class="d-flex justify-content-center">
									<h4 class="text-white m-0">${combined.courseCode}</h4>
								</div>
								<div class="d-flex justify-content-center">
									<h4 id="courseNameBox" class="text-center text-white m-0">${combined.courseName}</h4>
								</div>
								<div class="text-right text-white mr-3">${combined.firstName += ' ' += combined.lastName}</div>
							</div>
						</a>
						<div class="m-2">
							<c:set var="loop_flag" value="false" />
							<c:forEach var="assignment" items="${assignmentList}">
								<c:if test="${not loop_flag}">
									<c:if test="${assignment.classId eq combined.id}">
										<div class="noDecoA lastAssignment hover-pointer"
											data-class-id="${assignment.classId}"
											data-asgmt-id="${assignment.asgmtId}">
											Due:
											<fmt:formatDate value="${assignment.dueDate}" pattern="d MMM" />
											<div class="ml-2">${assignment.asgmtName}</div>
										</div>
										<c:set var="loop_flag" value="true" />
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="my-3"></div>
		</div>
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						$('.lastAssignment')
								.on(
										'click',
										function() {
											let classId = $(this).data(
													"class-id");
											let asgmtId = $(this).data(
													"asgmt-id");

											location.href = "/univ/assignment/assignment_detail?classId="
													+ classId
													+ "&asgmtId="
													+ asgmtId;

										})
					})
</script>
