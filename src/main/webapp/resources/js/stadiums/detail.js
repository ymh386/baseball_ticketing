let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
const lat = container.getAttribute('lat');
const lng = container.getAttribute('lng');

// 인포윈도우를 생성합니다
let infowindow = new kakao.maps.InfoWindow({
});



let options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표.
	level: 4 //지도의 레벨(확대, 축소 정도)
};

let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

// 장소 검색 객체를 생성합니다
let ps = new kakao.maps.services.Places(map); 

// 카테고리로 음식점 검색합니다
ps.categorySearch('FD6', placesSearchCB, {useMapBounds:true}); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
        }       
    }
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    let marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}