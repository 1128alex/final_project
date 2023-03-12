<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<div id="typeHolder" data-type="${type}"></div>
		<div class="d-flex justify-content-between align-items-end">
			<h1 class="mt-3">Timetable</h1>
			<c:choose>
				<c:when test="${type eq 'student'}">
					<div>
						<a href="/univ/course/register_class" class="btn button mb-2">Register
							Class</a>
					</div>
				</c:when>
				<c:when test="${type eq 'professor'}">
					<div>
						<a href="/univ/course/create_class" class="btn button mb-2">Create
							Class</a>
					</div>
				</c:when>
			</c:choose>
		</div>
		<table class="table table-bordered border-grey colFixedTable">
			<thead class="text-center">
				<tr>
					<th>Time</th>
					<th>Monday</th>
					<th>Tuesday</th>
					<th>Wednesday</th>
					<th>Thursday</th>
					<th>Friday</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach var="i" begin="6" end="20">
					<tr>
						<td>
							<div class="h-100">
								<div
									class="h-100 d-flex justify-content-center align-items-center">${i}:00</div>
							</div>
						</td>
						<td id="mon${i}" class="p-0"><c:set var="count" value="0" />
							<div class="h-100">
								<c:forEach var="combined" items="${combinedList}">
									<c:choose>
										<c:when test="${combined.monStartTime eq i}">
											<c:if test="${type eq 'student'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}<br>${combined.firstName += " " += combined.lastName}
												</div>
											</c:if>
											<c:if test="${type eq 'professor'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}</div>
											</c:if>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${count eq 0}">
									<div
										class="h-100 d-flex justify-content-center align-items-center"></div>
								</c:if>
							</div></td>
						<td id="tue${i}" class="p-0"><c:set var="count" value="0" />
							<div class="h-100">
								<c:forEach var="combined" items="${combinedList}">
									<c:choose>
										<c:when test="${combined.tueStartTime eq i}">
											<c:if test="${type eq 'student'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}<br>${combined.firstName += " " += combined.lastName}
												</div>
											</c:if>
											<c:if test="${type eq 'professor'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}</div>
											</c:if>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${count eq 0}">
									<div
										class="h-100 d-flex justify-content-center align-items-center"></div>
								</c:if>
							</div></td>
						<td id="wed${i}" class="p-0"><c:set var="count" value="0" />
							<div class="h-100">
								<c:forEach var="combined" items="${combinedList}">
									<c:choose>
										<c:when test="${combined.wedStartTime eq i}">
											<c:if test="${type eq 'student'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}<br>${combined.firstName += " " += combined.lastName}
												</div>
											</c:if>
											<c:if test="${type eq 'professor'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}</div>
											</c:if>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${count eq 0}">
									<div
										class="h-100 d-flex justify-content-center align-items-center"></div>
								</c:if>
							</div></td>
						<td id="thu${i}" class="p-0"><c:set var="count" value="0" />
							<div class="h-100">
								<c:forEach var="combined" items="${combinedList}">
									<c:choose>
										<c:when test="${combined.thuStartTime eq i}">
											<c:if test="${type eq 'student'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}<br>${combined.firstName += " " += combined.lastName}
												</div>
											</c:if>
											<c:if test="${type eq 'professor'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}</div>
											</c:if>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${count eq 0}">
									<div
										class="h-100 d-flex justify-content-center align-items-center"></div>
								</c:if>
							</div></td>
						<td id="fri${i}" class="p-0"><c:set var="count" value="0" />
							<div class="h-100">
								<c:forEach var="combined" items="${combinedList}">
									<c:choose>
										<c:when test="${combined.friStartTime eq i}">
											<c:if test="${type eq 'student'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}<br>${combined.firstName += " " += combined.lastName}
												</div>
											</c:if>
											<c:if test="${type eq 'professor'}">
												<c:set var="count" value="1"></c:set>
												<div
													class="classFilledTime classFilledTimeHover hover-pointer h-100 d-flex justify-content-center align-items-center"
													data-class-id="${combined.id}">${combined.courseCode}</div>
											</c:if>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${count eq 0}">
									<div
										class="h-100 d-flex justify-content-center align-items-center"></div>
								</c:if>
							</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-3"></div>
</div>

<script>
	$(document).ready(function() {
		let typeHolder = $('#typeHolder').data('type');
		if (type != 'student') {
			$('.classFilledTime').on('click', function() {
				let classId = $(this).data('class-id');
				location.href = "/univ/course/edit_class?classId=" + classId;
			});
		}
	});
</script>
