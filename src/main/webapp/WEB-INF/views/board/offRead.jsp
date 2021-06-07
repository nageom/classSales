<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3> 위치 </h3>
<div id="map" style="width: 500px; height: 350px;">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=062fe57b44c7fdd60281e5f0bfbb8d1e&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.570961, 126.992670), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다	
		geocoder.addressSearch('서울특별시 종로구 돈화문로 26', function(result, status) {
		// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
			
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({ map : map,	position : coords });
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow(
					{ content : '<div style="width:150px;text-align:center;padding:6px 0;">여기서 강의해여~</div>'});
						infowindow.open(map, marker);
						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords); }
			});
	</script>
</div>