<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!-- 지도가 나오는 배경 -->
<div class="kakaoMap"  id="mainMap" style="width:100%; height:92vh; position: absolute; left: 0; z-index: 1;">
    <div class="row my-3 mx-1">
        <div class="col input-group btn-group dropstart" >
            <button style="z-index: 2;" class="input-group-text bg-primary" id="basic-addon2" onclick="panTo()">
                <i class="bi bi-search text-white"></i>
            </button>
            <input style="border: 0px; z-index: 2; background-color: white;" name="postcodeName" id="postcodeName" type="text" class="form-control" placeholder="지역명, 위치를 검색하세요" onclick="DaumPostcode()" readonly>
            </div>
        <div class="col-2 d-flex flex-row-reverse" style="z-index: 2;">
            <button type="button" class="btn btn-primary" style="height: 38px;" onclick="listOpen();"><i class="bi bi-list-check"></i></button>
        </div>
    </div>
    <div class="col" id="wrap" style="display: none; position: relative; z-index: 99;">
        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
    </div>
</div>

<input type="hidden" id="postcodeX" value=${data.postcodeX }>
<input type="hidden" id="postcodeY" value=${data.postcodeY }>


<!-- 왼쪽 정보 팝업창 -->
<div class="info">
    <div class="container-fluid">
        <header>
            <div class="row headerBox py-2 px-0">
                <div class="col-1 px-0" onclick="infoClose();"><i class="bi bi-arrow-left fs-5"></i></div>
                <div class="col px-0">
                    <h5 class="title">예약 상세</h5>
                </div>
                <div class="col-1 px-0"></div>
            </div>
        </header>
        <main>
            <!-- 수정 해야되는 부분-->
            <div class="row topBox" style="margin-top: auto;">
                <div class="col">
                    <div class="row" style="margin-top: 10px;">
                        <div class="col"><span class="mainContentTitle" id="parkName"></span></div>
                    </div>
                    <div class="row">
                        <div class="col"><span class="mainContentSubNg">총 공간 : <span id="totalSectionCount"></span> 면 </span></div>
                    </div>
                    <div class="row" >
                        <div class="col px-0" style="margin-top: 10px;">
                            <img class="mainContentImg" src="/img/p1.jpg" alt="">
                        </div>
                    </div>
                    <div class="wraper" style="margin-top: 10px;">
                        <div class="row" style="margin-top: 10px;">
                            <div class="col">
                                <i class="bi bi-geo-alt"></i> <span class="cardTitleNg" id="parkingAdd"> </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <i class="bi bi-telephone"></i> <span class="cardTitleNg" id="phone"> </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <i class="bi bi-watch"></i> <span class="cardTitleNg" id="openTime"></span> ~ <span class="cardTitleNg" id="endTime"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px; border-top: 3px solid #EEEEEE;">
                        <div class="col-5 areaList align-self-center"><span class="mainContentSubTitle">시간  요금</span></div>
                        <div class="col areaList align-self-center">
                            <div class="row">
                                <div class="col-7 discountTitleNg">
                                    <span class="mainContentSubSubNg">1시간당</span>
                                </div>
                                <div class="col">
                                    <span class="mainContentSubSubNg" id="parkPrice"></span><span class="mainContentSubSubNg"> 원</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-5"><span class="mainContentSubTitle">할 인 율</span></div>
                        <div class="col align-self-center" id="section">
                            <!-- 구역 할인률 노출 -->
                        </div>
                    </div>
                    <!-- 리뷰 작성-->
                    <div class="row my-4" style="border-bottom: 3px solid #EEEEEE; border-top: 3px solid #EEEEEE; margin-top: 10px; height: 40px;">
                        <div class="col align-self-center">
                            <span class="mainContentSubSubNg">리뷰 (</span><span class="mainContentSubSubNg" id="reviewCount"></span><span class="mainContentSubSubNg">)</span>
                        </div>
                    </div>
					<!-- 리뷰 데이터 노출 -->
					<div id="review"></div>
                </div>
            </div>
        </main>
    </div>
</div>
<!-- 오른쪽 리스트 팝업창  -->
<div class="list" id="list">
	<div class="container-fluid">
	    <header>
	        <div class="row headerBox py-2 px-0">
	            <div class="col-1 px-0" onclick="listClose();"><i class="bi bi-arrow-left fs-5"></i></div>
	            <div class="col px-0">
	                <h5 class="title">주차장 목록</h5>
	            </div>
	            <div class="col-1 px-0"></div>
	        </div>
	    </header>
	    <main>
	        <div class="row pt-3 mb-3 topBox">
	            <div class="col listCountBox">
	                <i class="bi bi-layers"></i>총<span class="listCountNum">12</span>건
	            </div>
	        </div>
	        <div class="row parkingImageBox">
	            <div class="col pb-2">
	                <div class="row mb-3">
	                    <div class="col p-0">
	                        <img class="imageInfoBox" src="/img/p6.jpeg">
	                    </div>
	                </div>
	                <div class="row mb-2">
	                    <div class="col parkingSpotName">
	                    	강남 지나주차장
	                    </div>
	                </div>
	                <div class="row mb-3">
	                    <div class="col parkingSpotInfo">
	                       	총 공간 : 50면 | 주차면 : 일반 여성 장애인
	                    </div>
	                </div>
	                <div class="row soptBox mb-3">
	                    <div class="col">
	                        <img src="/img/womanIcon.png" style="width:16px;height:16px"><span class="sopt">8면</span>
	                    </div>
	                    <div class="col">
	                        <img src="/img/disabledPerson.png" style="width:16px;height:16px;vertical-align: text-bottom;"><span class="sopt">20면</span>
	                    </div>
	                    <div class="col">
	                        <i class="bi bi-lightning" style="vertical-align: text-top;"></i><span class="sopt">15면</span>
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-geo-alt"></i><span class="parkingSpotIconEx">위치</span>
	                    </div>
	                    <div class="col parkingSpotEx">
							서울특별시 강남구 선릉로...
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-credit-card"></i><span class="parkingSpotIconEx">주차요금</span>
	                    </div>
	                    <div class="col parkingSpotEx">
	                        1시간 4,800원
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-stopwatch"></i><span class="parkingSpotIconEx">문의시간</span>
	                    </div>
	                    <div class="col parkingSpotEx">
	                        07:00 ~ 24:00
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="row parkingImageBox">
	            <div class="col pb-2">
	                <div class="row mb-3">
	                    <div class="col p-0">
	                        <img class="imageInfoBox" src="/img/p6.jpeg">
	                    </div>
	                </div>
	                <div class="row mb-2">
	                    <div class="col parkingSpotName">
							강남 지나주차장
	                    </div>
	                </div>
	                <div class="row mb-3">
	                    <div class="col parkingSpotInfo">
							총 공간 : 50면 | 주차면 : 일반 여성 장애인
	                    </div>
	                </div>
	                <div class="row soptBox mb-3">
	                    <div class="col">
	                        <img src="/img/womanIcon.png" style="width:16px;height:16px"><span class="sopt">8면</span>
	                    </div>
	                    <div class="col">
	                        <img src="/img/disabledPerson.png" style="width:16px;height:16px;vertical-align: text-bottom;"><span class="sopt">20면</span>
	                    </div>
	                    <div class="col">
	                        <i class="bi bi-lightning" style="vertical-align: text-top;"></i><span class="sopt">15면</span>
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-geo-alt"></i><span class="parkingSpotIconEx">위치</span>
	                    </div>
	                    <div class="col parkingSpotEx">
							서울특별시 강남구 선릉로...
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-credit-card"></i><span class="parkingSpotIconEx">주차요금</span>
	                    </div>
	                    <div class="col parkingSpotEx">
	                        1시간 4,800원
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-stopwatch"></i><span class="parkingSpotIconEx">문의시간</span>
	                    </div>
	                    <div class="col parkingSpotEx">
	                        07:00 ~ 24:00
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="row parkingImageBox">
	            <div class="col pb-2">
	                <div class="row mb-3">
	                    <div class="col p-0">
	                        <img class="imageInfoBox" src="/img/p6.jpeg">
	                    </div>
	                </div>
	                <div class="row mb-2">
	                    <div class="col parkingSpotName">
							s강남 지나주차장
	                    </div>
	                </div>
	                <div class="row mb-3">
	                    <div class="col parkingSpotInfo">
							총 공간 : 50면 | 주차면 : 일반 여성 장애인
	                    </div>
	                </div>
	                <div class="row soptBox mb-3">
	                    <div class="col">
	                        <img src="/img/womanIcon.png" style="width:16px;height:16px"><span class="sopt">8면</span>
	                    </div>
	                    <div class="col">
	                        <img src="/img/disabledPerson.png" style="width:16px;height:16px;vertical-align: text-bottom;"><span class="sopt">20면</span>
	                    </div>
	                    <div class="col">
	                        <i class="bi bi-lightning" style="vertical-align: text-top;"></i><span class="sopt">15면</span>
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-geo-alt"></i><span class="parkingSpotIconEx">위치</span>
	                    </div>
	                    <div class="col parkingSpotEx">
							서울특별시 강남구 선릉로...
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-credit-card"></i><span class="parkingSpotIconEx">주차요금</span>
	                    </div>
	                    <div class="col parkingSpotEx">
	                        1시간 4,800원
	                    </div>
	                </div>
	                <div class="row parkingSpotExRowBox">
	                    <div class="col-4">
	                        <i class="bi bi-stopwatch"></i><span class="parkingSpotIconEx">문의시간</span>
	                    </div>
	                    <div class="col parkingSpotEx">
	                        07:00 ~ 24:00
	                    </div>
	                </div>
	            </div>
	        </div>
	    </main>
	</div>
</div>

