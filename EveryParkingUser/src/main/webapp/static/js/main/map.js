
/** main map 관련 스크립트 **/

const mainMap = document.getElementById("mainMap");
const mainMapX = document.getElementById("postcodeX");
const mainMapY = document.getElementById("postcodeY");
if(mainMap){
	var valueX = parseFloat(mainMapX.value);
	var valueY = parseFloat(mainMapY.value);
	var showFstX = "";
	var showSecX = "";
	var showFstY = "";
	var showSecY = "";
}


// 주차장 정보 넣을 element 생성
var parkNameBox = document.getElementById("parkName");
var totalSectionCountBox = document.getElementById("totalSectionCount");
var parkingAddBox = document.getElementById("parkingAdd");
var phoneBox = document.getElementById("phone");
var openTimeBox = document.getElementById("openTime");
var endTimeBox = document.getElementById("endTime");
var parkPriceBox = document.getElementById("parkPrice");
var reviewCountBox = document.getElementById("reviewCount");
var section = document.getElementById("section");
var review = document.getElementById("review");


// 지도 생성
if(mainMap) {

    var mapContainer = document.getElementById('mainMap'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.49966168796031, 127.03007039430118), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    
    // 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'dragend', function() {             
    	getInfoByMap();
    });
    kakao.maps.event.addListener(map, 'zoom_changed', function() {             
    	getInfoByMap();
    });
    

};

function getInfoByMap() {
    // 지도 영역정보를 얻어옵니다 
	var bounds = map.getBounds();
	
	// 지도의 남서쪽 좌표 가져오기
	var swLatLng = bounds.getSouthWest(); 
    
	// 지도의 북동쪽 좌표 가져오기
	var neLatLng = bounds.getNorthEast(); 
	
	
	var result = new Map();
	
	result = {'x1' : swLatLng.La, 'y1' : swLatLng.Ma, 'x2' : neLatLng.La, 'y2' : neLatLng.Ma};
	
	
    ajaxCall("/main/selectParkingInfoListByMap", result, function(data){
    	console.log(data);
    	
    	// 이후 여기서부터 데이터를 가공하고 list 부분에 정보 노출을 위한 html 작성
    })
}

var listData = "";

if(mainMap) {ajaxCall("/main/selectParkingInfoList", {}, function(data){
	listData = data;
});	
};

	var carparkPositions = [];
	var parkingNumList = [];
	var carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다
	
	for(var i = 0; i < listData.list.length; i++){
		// 예시좌표 서버에서 이쪽으로 좌표값 받아와야함
		carparkPositions[i] = new kakao.maps.LatLng(listData.list[i].PARK_ADDR_Y, listData.list[i].PARK_ADDR_X);
		
		// 이쪽에는 주차장 넘버 받아와야함
		parkingNumList[i] = listData.list[i].PARK_SEQ;
		
		if(i == listData.list.length -1 ) {
			console.log(i);
			createCarparkMarkers();  // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다
			setCarparkMarkers(map);
		}
	}
    

    

    


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
    function createMarkerImage(src, size, options) {
        var markerImage = new kakao.maps.MarkerImage(src, size, options);
        return markerImage;
    }

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
    function createMarker(position, image, num) {

        var marker = new kakao.maps.Marker({
            position: position
            
        });
        marker.value=num;

        //마커 클릭 이벤트 등록
        kakao.maps.event.addListener(marker, 'click', function() {
        	
        	
            // 추후 ajax통신문을 작성하고 마지막에 스타일 변화를 주어야함
            // marker.value가 주차장 넘버를 가지고 있으니 이걸로 서버 컨트롤 들어가야함
            console.log(marker.value);									// marker.value가 주차장 번호 = params에 넣어서 ajaxCall을 이용하여 보내줘야함
            infoHandle.style.left='0%';
 
            var map = new Map();
            
            
            // params를 날릴때 ajaxCall에서 정한 방식인 Map형식을 지켜줘야함
            ajaxCall("/main/selectOneParkingInfo", {'PARK_SEQ' : marker.value}, function(data){
            	map = data;
            })
            
            
            parkNameBox.innerText = map.data.parkingInfo.PARK_NAME;
            parkingAddBox.innerText = map.data.parkingInfo.PARK_ADDR1;
            phoneBox.innerText = map.data.parkingInfo.PARK_CALL_NUM;
            openTimeBox.innerText = map.data.parkingInfo.PARK_OPEN;
            endTimeBox.innerText = map.data.parkingInfo.PARK_CLOSE;
            parkPriceBox.innerText = map.data.parkingInfo.PARK_PRICE;
            reviewCountBox.innerText = map.data.reviewCount;
            
            
            section.innerHTML = "";
            for(sectionData of map.data.sectionList){
            	if(sectionData.SUB_CODE != 'RY01'){
            		var modalHtml = ``;
                	modalHtml +=` <div class="row">`;
                	modalHtml +=` 	<div class="col-7 discountTitleNg">`;
                	modalHtml +=` 		<span class="mainContentSubSubNg">${sectionData.SUB_NAME}</span><span class="mainContentSubSubNg"> 구역</span>`;
                	modalHtml +=` 	</div>`;
                	modalHtml +=` 	<div class="col text-center">`;
                	modalHtml +=` 		<span class="mainContentSubSubNg">${sectionData.SEC_DIS}</span ><span class="mainContentSubSubNg">%</span>`;
                	modalHtml +=` 	</div>`;
                	modalHtml +=` </div>`;
                	$("#section").append(modalHtml);
                	
            	}
            	
            }
            
            review.innerHTML = "";
            for(reviewData of map.data.reviewList){
            	
            	var reviewDate = new Date(reviewData.REG_DATE);
            	// 자바스크립트는 month가 0부터 시작
            	reviewDate = reviewDate.getFullYear() + "-" + (reviewDate.getMonth() + 1) + "-" + reviewDate.getDate() + " " + String(reviewDate.getHours()).padStart(2, "0") + ":" + String(reviewDate.getMinutes()).padStart(2, "0");
            	var reviewStar = '';
            	for(let i = 1; i <= 5; i++){
            		if(reviewData.REV_STAR >= i){
            			reviewStar += '★';
            		}else{
            			reviewStar += '☆';
            		}
            	}
            	var modalHtml = ``;
            	modalHtml +=`<div class="row mt-2" style="margin: 1px;">`;
            	modalHtml +=`	<div class="col d-flex justify-content-between">`;
            	modalHtml +=`		<span class="mainContentSubSubNg">${reviewData.USER_NAME}</span>`;
            	modalHtml +=`    	<span class="mainContentSubSubNg">${reviewDate}</span>`;
            	modalHtml +=`    </div>`;
            	modalHtml +=`</div>`;
            	modalHtml +=`<div class="row" style="margin-left: 1px;">`;
            	modalHtml +=` 	<div class="col">`;
            	modalHtml +=` 		<p>${reviewStar}</p>`;
            	modalHtml +=` 	</div>`;
            	modalHtml +=`</div>`;
            	modalHtml +=`<div class="row mb-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">`;
            	modalHtml +=` 	<div class="col">`;
            	modalHtml +=` 		<span class="commentContentNg">${reviewData.REV_CONT}</span>`;
            	modalHtml +=` 	</div>`;
            	modalHtml +=` 	<div class="col d-flex justify-content-end">`;
            	modalHtml +=` 		<a class="commentBtn" href="#"><i class="bi bi-pencil-square"></i></a>`;
            	modalHtml +=`		<a class="commentBtn" href="#"><i class="bi bi-trash-fill"></i></a>`;
            	modalHtml +=`	</div>`;
            	modalHtml +=`</div>`;
            	$("#review").append(modalHtml);
            	modalHtml = ``;
            }
            
            var totalSectionCount = 0;
            for(totalSectionCountData of map.data.sectionList){
            	totalSectionCount += totalSectionCountData.SEC_COUNT;
            	
            }
            totalSectionCountBox.innerText = totalSectionCount;
                	
    });
        
        
        return marker;
    }
    
    // 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
    function createCarparkMarkers() {
        for (var i = 0; i < carparkPositions.length; i++) {

            var imageSize = new kakao.maps.Size(),
                imageOptions = {
                    spriteOrigin: new kakao.maps.Point(10, 72),
                    spriteSize: new kakao.maps.Size(50, 50)
                };

            // 마커이미지와 마커를 생성합니다
            var markerImage = createMarkerImage("../img/ping.png", imageSize, imageOptions),
                marker = createMarker(carparkPositions[i], markerImage, parkingNumList[i]);

            // 생성된 마커를 주차장 마커 배열에 추가합니다
            carparkMarkers.push(marker);
        }
    }

    // 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setCarparkMarkers(map) {
        for (var i = 0; i < carparkMarkers.length; i++) {
            carparkMarkers[i].setMap(map);
        }
    }


function panTo() {
    valueX = parseFloat(mainMapX.value);
    valueY = parseFloat(mainMapY.value);
    // 이동할 위도 경도 위치를 생성합니다
    var moveLatLon = new kakao.maps.LatLng(valueY, valueX);

    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);
}

if(valueX > -1) {
    panTo();
}

// info 창 열고 닫기
function infoClose(){
	infoHandle.style.left = "-100%";
}

var infoHandle = document.querySelector(".info");



// list 창 열고 닫기
var listHandle = document.getElementById("list");

function listOpen(){
	listHandle.style.right = "0%";
	
}

function listClose(){
	listHandle.style.right = "-100%";
}

