package com.test.board.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.OrderVO;
import com.test.board.domain.PayProc;
import com.test.board.domain.ResDTO;
import com.test.board.service.BoardService;
import com.test.board.service.ContentService;

//결제 관련 컨트롤러
@Controller
public class PayController {
	
	
	private BoardService boardService;
	
	@Autowired
	private ContentService contentService;
	
	
	@Autowired 
	public PayController(BoardService boardService) {
		this.boardService = boardService; 

	}

	
	@RequestMapping(value="/paySuccess")
	public String paySuccess(HttpServletRequest req) {
		String msg= (String)req.getAttribute("msg");
		System.out.println(msg);
		return "payPage/paySuccess";
	}
	
	
	@RequestMapping(value="/cancelForm")
	public String payCancelForm() {
		return "payPage/cancelForm";
		
	}
	
	@RequestMapping(value="/reserveForm")
	public String reserveForm() {
		return "payPage/reserve/reserveForm";
		
	}
	
	
	//REST API로 결제환불 요청
	public int getCancel (String access_token, String oid) throws IOException {
			System.out.println("환불요청 시작 ");
			int amount = boardService.selectAmount(oid);
		
			System.out.println("amount "+ amount + "원");
			HttpURLConnection conn = null;
			int result = 0;
			URL url = new URL("https://api.iamport.kr/payments/cancel");
				
			conn = (HttpURLConnection) url.openConnection();
				
				//요청방식 : POST, Header, Data 옵션 설정
			conn.setRequestMethod("POST");
				
			// Header 설정 (application/json 형식으로 데이터를 전송 )
			conn.setRequestProperty("Content-Type","application/json" );
			conn.setRequestProperty("Accept", "application/json"); //서버로부터 받을 Data를 JSON 형식 타입으로 요청함. 
			//conn.setRequestProperty("COntent-Type", "appliation/json; charset=UTF-8");
			conn.setRequestProperty("Authorization", access_token);
			
			
			//Data 설정
			conn.setDoOutput(true);//OutputStream으로 POST 데이터를 넘겨주겠다는 옵션
				
			//3) imp_key와 imp_secret키를 JSON 형태로 넣은 후 아임 포트 서버로 Request(요청) 을 할것
			JSONObject obj = new JSONObject();
			obj.put("reason", "내 맘임");
			obj.put("imp_uid", oid);
			obj.put("amount",amount);
			
				
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj.toString());
			bw.flush();
			bw.close();
				
				//4) 아임 포트 서버로 요청한 응답을 JSON 형태로 받게 되면 JSONParser 라이브러리를 사용해 액세스 토큰을 뽑아줌.
				// 서버로부터 응답 데이터 받기 
				//int result=0;
				int responseCode = conn.getResponseCode();
				System.out.println("응답 코드 : "+ responseCode);
				
				//잘 보냈는지만 확인!! 
				if (responseCode==200) {
					//성공
					System.out.println("getCancel_ 환불요청을 일단 받았다 성공 step1 ");
					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					StringBuilder sb = new StringBuilder();
					//
					String line = null;
					//버퍼에 이미 한줄로 담김
					System.out.println("환불요청 " + br.readLine());
					
					while ((line = br.readLine()) !=null) {
						sb.append(line+"\n");

					}
					
					
					br.close();
					System.out.println("getCancel_ 환불요청에 대한 response :  sb.toString() : "+sb.toString());
					
					result = 1; // 환불 성공시 정수값 1반환
					
					//.addAttribute("result",result);
					
				}else {
					//실패
					System.out.println("환불요청을 못받았다는 응답 : "+conn.getResponseMessage());
					//환불 실패시 정수값 0 반환(응답코드 400ㅡ 404 .. 등) 
					//model.addAttribute("result",result);
					
				}
				
		return result;

		
	}
	
	
//환불 요청
	@RequestMapping(value="/cancelResult")
	public String payCancelPro(Model model,String oid) throws IOException, ParseException {
	
		System.out.println("oid :" + oid);
		//1) 엑세스 토큰을 받을 변수와 엑세스 코큰을 받아올 요청 주소 입력
		HttpURLConnection conn = null;
		String access_token = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");//엑세스 토큰을 받아올 주소
		JSONObject responseJson = null;
		
		conn = (HttpURLConnection) url.openConnection();
		
		//요청방식 : POST, Header, Data 옵션 설정
		conn.setRequestMethod("POST");
		
		// Header 설정 (application/json 형식으로 데이터를 전송 )
		conn.setRequestProperty("Content-Type","application/json" );
		conn.setRequestProperty("Accept", "application/json"); //서버로부터 받을 Data를 JSON 형식 타입으로 요청함. 
		//conn.setRequestProperty("COntent-Type", "appliation/json; charset=UTF-8");
		
		//Data 설정
		conn.setDoOutput(true);//OutputStream으로 POST 데이터를 넘겨주겠다는 옵션
		
		//3) imp_key와 imp_secret키를 JSON 형태로 넣은 후 아임 포트 서버로 Request(요청) 을 할것
		JSONObject obj = new JSONObject();
		obj.put("imp_key", "9874796019563343");
		obj.put("imp_secret", "fAJMTYGNQrfDrUFAPchdyKxteHfzSlP8WzUPyBDo3S2uNH5DUnRs7oWm5cWYxM6ul1kTCXiFQkaD1ggW");
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		
		//4) 아임 포트 서버로 요청한 응답을 JSON 형태로 받게 되면 JSONParser 라이브러리를 사용해 액세스 토큰을 뽑아줌.
		// 서버로부터 응답 데이터 받기 
		int result=0;
		int responseCode = conn.getResponseCode();
		
		System.out.println("응답 코드 : "+ responseCode);
		
		if (responseCode==200) {
			System.out.println("토큰 요청만 성공");
			//System.out.println(conn.getInputStream());
			//System.out.println("conn.getInputStream().toString =   "+(conn.getInputStream()).toString() );
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			//JSONParser jsonParse = new JSONParser();
			//System.out.println("br : "+ br);
			
			StringBuilder sb = new StringBuilder();
			
			String line = null;
		
			while ((line = br.readLine()) !=null) {
				sb.append(line+"\n");
				//System.out.println("line:"+ line+"\n");
				System.out.println("토큰요청에 대한 응답"+sb.toString()); 
			}
			
			
			//자바에서 json 데이터 받는법
			JSONParser jsonParse = new JSONParser(); //JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			
			responseJson = (JSONObject) jsonParse.parse(sb.toString()); //JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
			JSONArray jasonArray = (JSONArray)responseJson.get("Persons");
			
			System.out.println("이게뭐지?"+responseJson.get("code").getClass());
			System.out.println("json형태 응답 : "+ responseJson);
			
			
			
			
			//0. 응답코드 확인 
			JSONObject response = (JSONObject)responseJson.get("response");
			Long code = (Long)responseJson.get("code");
			System.out.println("code:"+code);
			System.out.println(response);

			
			//String code =(String) responseJson.get("code");
			//String responseDetailCodeString = code.toString();
			//System.out.println("code확인:"+ responseDetailCodeString);
			
			//1. 받은 json 형식 응답에서 response: 부분 빼오기
			if (code==0) {
	
			//2. response : 안에 access_token: 부분 추출
				access_token = (String)response.get("access_token");
				System.out.println("access_token : "+access_token);
			
				br.close();

			
				result = getCancel(access_token, oid);
				if (result == 1) {
					model.addAttribute("result",result);
					//취소 되면 Order테이블의 state를 2로 바꿔줌
					try {
						boardService.updateState(oid);
						return "mypage/mypageCancleComplete";
						
					}catch(Exception e) {
						e.printStackTrace();
						System.out.println("updateState 에러");
					}
				}
				
				
			} else {//환불실패
				
				model.addAttribute("result",result);
				return "mypage/mypageCancleComplete";

			}
			
		}else {
			//실패
			System.out.println(conn.getResponseMessage());
			//환불 실패시 정수값 0 반환(응답코드 400ㅡ 404 .. 등) 
			//model.addAttribute("result",result);
			
		}
		
		model.addAttribute("result",result);
			
		return "mypage/mypageCancleComplete";
		
	}
	
	
	
	
	@RequestMapping(value="/payData")
	public String payData() {

		return "payPage/payData";
	}
	
	
	//첫 결제 클릭시 
	@RequestMapping(value="/payStep1", method=RequestMethod.POST )
	public String payStep1(@ModelAttribute OrderVO OrderVO, Model model, HttpSession session) {
		//1. session 안 객체 Member.uid 얻어오기 .
		MemberVO sessionId = (MemberVO) session.getAttribute("sessionId");
		//2. 주문테이블에 추가시켜줌																										// 결제 전 = 0
		// 현재 ->  OrderVO: OrderVO [oid=null, uid= {mem.getUid()}, cid=6, amount=2200, quantity=1, paydate=null, resday=2021-06-05, state=0, title=가죽지갑]
		OrderVO.setUid(sessionId.getUid()); 

		//cid로 content가져오기. 
		ContentVO content = contentService.select(OrderVO.getCid());
		
		System.out.println("OrderVO: "+OrderVO.toString());
		System.out.println("contentVO: "+ content.toString());
	
		model.addAttribute("OrderVO",OrderVO);
		model.addAttribute("contentVO", content);
		return "payPage/payStep1";
	}
	
	
	
	
	
	
	
	
	
	
	//결제완료. 
	@RequestMapping(value="/payComplete")
	@ResponseBody
	public void complete( @RequestBody OrderVO OrderVO/* @RequestBody String jjson*/ ) {
		// json 형태로 데이터 받아

		// 주분번호 oid(imp_uid) 
		// 사용자 uid 
		// 상품 cid
		// 결제금액 amount
		// 예약 인원 quantity..등
		System.out.println(OrderVO.toString());
		try {
			boardService.insertOrder(OrderVO);
			String[] date = OrderVO.getResday().split("-");
			String checkDate =null;
			checkDate=date[0]+"/"+date[1]+"/"+date[2];
			System.out.println("checkDate :"+ checkDate.toString());
			ResDTO resDTO = new ResDTO(OrderVO.getQuantity(), checkDate, OrderVO.getCid());
			System.out.println("resDTO: "+ resDTO.toString());
			
			//예약 날짜에다가 예약인원수 바꿔주기 
			boardService.updateRes(resDTO);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			//주문 order테이블 insert 실패
			System.out.println("주문 order테이블 insert or update 실패");
		}
		
		
		
	}
	
	
	
	
	
}
