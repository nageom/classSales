<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 지도 -->
<div class="bigmap">
	<img src="/board/resources/map.jpg" usemap="#test" width="364"
		height="512">
	<map name="test">
		<area id="jeju" shape="poly"
			coords="98,434 130,443 123,462 76,475 57,455"
			href="<c:url value="/arealist?area=제주&on_off=${param.on_off}" />">
		<area id="jeunnam" shape="poly"
			coords="82,317 86,311 87,306 97,320 116,308 147,321 172,319 197,375 171,385 172,399 163,402 159,399 142, 406 139,414 81,405 66,411 66,419 45,425 39,414 56,388 45,385 51,355 59,349 58,337 77,335 74,324 100,326 120,326 130,336 112,348 97,337"
			href="<c:url value="/arealist?area=전남&on_off=${param.on_off}" />">
		<area id="gwangju" shape="poly"
			coords="100,326 120,326 130,336 112,348 97,337"
			href="<c:url value="/arealist?area=광주&on_off=${param.on_off}" />">
		<area id="jeunbuk" shape="poly"
			coords="87,306 97,320 116,308 147,321 172,319 181,310 176,296 191,272 196,272 195,261 176,263 163,263 155,252 146,251 137,258 120,257 109,263 91,255 100,273 88,290"
			href="<c:url value="/arealist?area=전북&on_off=${param.on_off}" />">
		<area id="gyungnam" shape="poly"
			coords="172,319 172,319 181,310 176,296 191,272 196,272 210,277 221,293 267,297 284,291 282,299 297,310 298,316 270,330 269,337 244,344 250,351 265,349 267,354 254,379 239,375 231,367 215,367 210,379 197,375"
			href="<c:url value="/arealist?area=경남&on_off=${param.on_off}" />">
		<area id="busan" shape="poly"
			coords="297,316 271,329 269,337 243,345 251,352 264,348 267,352 300,336 305,329 297,316"
			href="<c:url value="/arealist?area=부산&on_off=${param.on_off}" />">
		<area id="ulsan" shape="poly"
			coords="306,329 299,317 298,311 283,301 285,292 296,287 320,292 313,319"
			href="<c:url value="/arealist?area=울산&on_off=${param.on_off}" />">
		<area id="degu" shape="poly"
			coords="234,295 236,282 233,273 252,261 263,273 246,296"
			href="<c:url value="/arealist?area=대구&on_off=${param.on_off}" />">
		<area id="gyungbuk" shape="poly"
			coords="234,295 236,282 233,273 252,261 263,273 246,296 269,299 296,286 319,291 326,270 324,252 315,254 319,190 310,177 307,150 297,164 252,166 246,164 239,189 222,186 197,205 194,233 205,242 197,261 198,273 210,276 224,294"
			href="<c:url value="/arealist?area=경북&on_off=${param.on_off}" />">
		<area id="chungbuk" shape="poly"
			coords="246,164 239,189 222,186 197,205 194,233 205,242 197,261 177,264 177,256 171,229 159,218 153,197 161,192 155,178 174,164 190,157 195,159 221,150 245,164"
			href="<c:url value="/arealist?area=충북&on_off=${param.on_off}" />">
		<area id="deajeon" shape="poly"
			coords="159,217 171,228 172,242 161,243 148,233"
			href="<c:url value="/arealist?area=대전&on_off=${param.on_off}" />">
		<area id="chungnam" shape="poly"
			coords="156,179 161,191 154,197 158,217 148,233 160,244 172,242 177,254 176,263 164,264 157,252 147,252 138,260 122,257 110,264 92,257 91,245 96,235 77,226 54,228 61,240 74,231 64,205 62,188 89,165 106,170 116,179"
			href="<c:url value="/arealist?area=충남&on_off=${param.on_off}" />">
		<area id="gyungi" shape="poly"
			coords="108,171 116,179 156,178 190,157 186,155 192,123 174,117 173,95 148,73 144,59 120,71 120,76 105,83 110,98 98,102 93,108 97,120 114,116 114,121 127,112 147,122 146,130 129,134 116,131 106,137 100,154 106,160"
			href="<c:url value="/arealist?area=경기&on_off=${param.on_off}" />">
		<area id="seoul" shape="poly"
			coords="127,112 146,121 146,130 129,135 115,131 114,122"
			href="<c:url value="/arealist?area=서울&on_off=${param.on_off}" />">
		<area id="incheon" shape="poly"
			coords="83,93 98,101 94,108 97,120 113,116 116,132 105,139 88,137 71,107"
			href="<c:url value="/arealist?area=인천&on_off=${param.on_off}" />">
		<area id="kangwon" shape="poly"
			coords="143,59 148,73 173,94 173,116 192,124 186,155 195,159 220,151 250,167 296,165 307,149 241,42 232,39 230,46 214,48 209,57 177,62"
			href="<c:url value="/arealist?area=강원&on_off=${param.on_off}" />">
	</map>
</div>