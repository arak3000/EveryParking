<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col mx-3">
<form name="costUpdateForm" action="${path}/profitCost/costUpdateForm?no=${data.no}" method="POST">
	<!--Top title-->
	<div class="row">
		<div class="col px-0 text-start">
			<h1 style="font-size: 40px; font-weight: bold;">
			유지 비용 수정<span class="fs-6 fw-light"> 주차장 관리비용을 수정할 수 있습니다.</span>
			</h1>
		</div>

		<div class="col-2 mt-3 text-end">
			
			
		</div>
	</div>
	<!-- 테이블 -->
	<div
		class="row mt-2 mb-3 backgroundColorwhite adminBorder borderBottom"
		style="min-height: 600px;">
		<div class="col">
			<div class="row">
				<div class="col"></div>
				<div class="col-8">
						<div class="row mt-5">
							<div class="col-3">주차장명</div>
							<div class="col">
								<input class="form-control" type="text" name="park_name" id="park_name" value="${PARK_NAME}">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-3">비용 금액</div>
							<div class="col">
								<input class="form-control priceBox" name="cost" value="${COST_CONT}"  type="text"
									onkeypress="onlyNum();">
							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="col-3">사유 작성</div>
						</div>
						<div class="row">
							<div class="col">
								<textarea class="form-control" type="text" name="" rows="15" placeholder="비용이 발생된 사유를 작성해주세요."> ${pc.COST_CONT}</textarea>
							</div>
						</div>
				
				</div>
				<div class="col"></div>
			</div>
			<div class="row my-3">
				<div class="col"></div>
				<div class="col-8 text-end">
					<button type="button" class="modalBtn btn btn-secondary"
						style="background-color: #e0e0e0; color: #000;" onclick="location.href='./costTable'">취소</button>
					<button type="button" class="modalBtn btn btn-primary">등록</button>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
	</form>
</div>
<script type="text/javascript" src="/js/costManage/costTable.js"></script>

