<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오프라인 클래스 상세 페이지</title>

</head>
<body>

	<!-- 기본 정보 -->
	<div>
		<table border="1" align="center">
			<tr>
				<th colspan="2">클래스명</th>
			</tr>
			<tr>
				<td rowspan="2" align="center"><img src="images/nyang.png"
					alt="SampleImage"></td>
				<td>금액 : 100,000</td>
			</tr>
			<tr>
				<td><a href="#"> 결제하기 </a></td>
			</tr>
			<tr>
				<td colspan="2" align="center">클래스 설명</td>
			</tr>
		</table>
	</div>

	<!-- 지도 -->
	<div class="bigmap" align="center">
		<img src="/gogobigzzo/resources/map.jpg" usemap="#test" width="364"
			height="512">
		<map name="test">
			<area id="jeju" shape="poly"
				coords="98,434 130,443 123,462 76,475 57,455"
				href="http://localhost:8080/gogobigzzo/">
			<area id="jeunnam" shape="poly"
				coords="82,317 86,311 87,306 97,320 116,308 147,321 172,319 197,375 171,385 172,399 163,402 159,399 142, 406 139,414 81,405 66,411 66,419 45,425 39,414 56,388 45,385 51,355 59,349 58,337 77,335 74,324 100,326 120,326 130,336 112,348 97,337"
				href="http://localhost:8080/gogobigzzo/content">
			<area id="gwangju" shape="poly"
				coords="100,326 120,326 130,336 112,348 97,337"
				href="http://localhost:8080/gogobigzzo/">
			<area id="jeunbuk" shape="poly"
				coords="87,306 97,320 116,308 147,321 172,319 181,310 176,296 191,272 196,272 195,261 176,263 163,263 155,252 146,251 137,258 120,257 109,263 91,255 100,273 88,290"
				href="http://localhost:8080/gogobigzzo/">
			<area id="gyungnam" shape="poly"
				coords="172,319 172,319 181,310 176,296 191,272 196,272 210,277 221,293 267,297 284,291 282,299 297,310 298,316 270,330 269,337 244,344 250,351 265,349 267,354 254,379 239,375 231,367 215,367 210,379 197,375"
				href="http://localhost:8080/gogobigzzo/">
			<area id="busan" shape="poly"
				coords="297,316 271,329 269,337 243,345 251,352 264,348 267,352 300,336 305,329 297,316"
				href="http://localhost:8080/gogobigzzo/">
			<area id="ulsan" shape="poly"
				coords="306,329 299,317 298,311 283,301 285,292 296,287 320,292 313,319"
				href="http://localhost:8080/gogobigzzo/">
			<area id="degu" shape="poly"
				coords="234,295 236,282 233,273 252,261 263,273 246,296"
				href="http://localhost:8080/gogobigzzo/">
			<area id="gyungbuk" shape="poly"
				coords="234,295 236,282 233,273 252,261 263,273 246,296 269,299 296,286 319,291 326,270 324,252 315,254 319,190 310,177 307,150 297,164 252,166 246,164 239,189 222,186 197,205 194,233 205,242 197,261 198,273 210,276 224,294"
				href="http://localhost:8080/gogobigzzo/">
			<area id="chungbuk" shape="poly"
				coords="246,164 239,189 222,186 197,205 194,233 205,242 197,261 177,264 177,256 171,229 159,218 153,197 161,192 155,178 174,164 190,157 195,159 221,150 245,164"
				href="http://localhost:8080/gogobigzzo/">
			<area id="deajeon" shape="poly"
				coords="159,217 171,228 172,242 161,243 148,233"
				href="http://localhost:8080/gogobigzzo/">
			<area id="chungnam" shape="poly"
				coords="156,179 161,191 154,197 158,217 148,233 160,244 172,242 177,254 176,263 164,264 157,252 147,252 138,260 122,257 110,264 92,257 91,245 96,235 77,226 54,228 61,240 74,231 64,205 62,188 89,165 106,170 116,179"
				href="http://localhost:8080/gogobigzzo/">
			<area id="gyungi" shape="poly"
				coords="108,171 116,179 156,178 190,157 186,155 192,123 174,117 173,95 148,73 144,59 120,71 120,76 105,83 110,98 98,102 93,108 97,120 114,116 114,121 127,112 147,122 146,130 129,134 116,131 106,137 100,154 106,160"
				href="http://localhost:8080/gogobigzzo/">
			<area id="seoul" shape="poly"
				coords="127,112 146,121 146,130 129,135 115,131 114,122"
				href="http://localhost:8080/gogobigzzo/">
			<area id="incheon" shape="poly"
				coords="83,93 98,101 94,108 97,120 113,116 116,132 105,139 88,137 71,107"
				href="http://localhost:8080/gogobigzzo/">
			<area id="kangwon" shape="poly"
				coords="143,59 148,73 173,94 173,116 192,124 186,155 195,159 220,151 250,167 296,165 307,149 241,42 232,39 230,46 214,48 209,57 177,62"
				href="http://localhost:8080/gogobigzzo/">
		</map>
	</div>

	<div id="map"  style="margin:auto; width: 500px; height: 350px;" >
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
			geocoder
					.addressSearch(
							'서울특별시 종로구 돈화문로 26',
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">여기서 강의해여~</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script>
	</div>

	<!-- 댓글 -->
	<div>
		<form align="center">
			<p>
				<textarea cols="50" rows="5" ></textarea>
			</p>
			<p>
				<input type="submit" value="댓글 등록">
			</p>
		</form>
	</div>
	<div>
		<input type="submit" value="등록">&nbsp&nbsp <a href="#">목 록</a>
	</div>
</body>
</html>