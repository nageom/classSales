package com.test.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.OrderVO;
import com.test.board.domain.ReplyList;
import com.test.board.domain.VendorVO;
import com.test.board.service.ContentService;
import com.test.board.service.MypageService;
import com.test.mypage.domain.IdPasswordNotMatchingException;
import com.test.mypage.domain.LoginCommand;
import com.test.mypage.domain.LoginCommandValidator;



@Controller
public class VendorController {

	private MypageService mypageService;
	@Autowired
	private ContentService contentService;


	@Autowired 
	public VendorController( MypageService mypageService) {
		this.mypageService = mypageService; 

	}

	// 관리자 로그인 
	@RequestMapping(value="/vendorLogin", method=RequestMethod.GET)
	public String vendorHome(LoginCommand loginComand ) {		
		return "vendorLogin";

	}

	//관리자 로그인 입력시
	@RequestMapping(value="/vendorLogin",method=RequestMethod.POST) 
	public String submit(LoginCommand loginCommand, Errors errors,
			HttpSession session) {

		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors()) {
			return "vendorLogin";
		}
		try {
			//이메일로 where "EMAIL" =#{email} and "VERIFICATION" = 3 인 MemberVO를 찾아와야지 
			MemberVO vendor = mypageService.vendorSelect(loginCommand.getEmail());

			//AuthInfo authInfo = authService.authenticate(loginCommand);
			if (loginCommand.checkPassword(vendor.getPassword())) {

				//int uid = mypageService.selectUID(loginCommand.getEmail());
				//이메일로 관리자 정보 MemberVO가져오기 


				//TODO세션에 authInfo 저장
				session.setAttribute("authInfo", vendor);
				session.setMaxInactiveInterval(30*60);
				//여기에 로그인 하고 갈 곳 주소 적어야해
				return "redirect:/manager/managePage";//관리자 게시물 리스트 주소도 괜찮고 메인 있으면 그것도 좋고 


			}else {
				throw new IdPasswordNotMatchingException();

			}		



		}catch (IdPasswordNotMatchingException e) {
			errors.reject("IdPasswordMatching");
			return "vendorLogin";
		}
	}
	@RequestMapping(value="/manager/managePage")
	public String managePage() {
		return "manager/managePage";
	}
	// 새 글 작성 요청
	@RequestMapping(value = "/manager/write", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("contentVO", new ContentVO()); // Board 객체를 생성하여 Model에 추가하여 객체가 없을 떄 예외 제거
		return "manager/write";
	}
	//판매 글 삭제
	@RequestMapping(value="/manager/delete", method = RequestMethod.POST)

	public String deleteCon(@RequestParam(value="value")int cid, Model model) {
		contentService.delete(cid);
		System.out.println(cid);
		List contentList = new ArrayList<>();
		contentList = contentService.manageList();
		model.addAttribute("manage", contentList);
		return "/manager/manageList";

	}

	// 새 글 등록 요청
	@RequestMapping(value = "manager/write", method = RequestMethod.POST)
	public String write(@ModelAttribute ContentVO contentVO, MultipartHttpServletRequest request, 
			@RequestParam("file") MultipartFile[] file, BindingResult bindingResult) throws Exception {
		if (bindingResult.hasErrors()) { // 사용자가 입력한 값 중 타입이 맞지 않거나 null 값인 경우 예외처리
			return "manager/write";
		}
		System.out.println(file[0]);

		String uploadPath = ("C:/Study/images"); 
		System.out.println(uploadPath);
		String fileOriginName = ""; 
		String fileMultiName = ""; 
		String thumbnail="";
		for(int i=0; i<file.length; i++) { 
			fileOriginName = file[i].getOriginalFilename(); 
			System.out.println("기존 파일명 : "+fileOriginName); 

			//확장자명
			String extension = fileOriginName.split("\\.")[1]; //fileOriginName에 날짜+.+확장자명으로 저장시킴. 
			//fileOriginName = formatter.format(now.getTime())+"."+extension; 
			System.out.println(extension);
			System.out.println("변경된 파일명 : "+fileOriginName);
			File f = new File(uploadPath+"\\"+fileOriginName); 
			file[i].transferTo(f); 
			if(i==0) { 
				fileMultiName += fileOriginName; 
				thumbnail += fileOriginName;
			} else{ fileMultiName += "/"+fileOriginName; 
			}
			System.out.println(fileMultiName);
		}
		contentVO.setCthumbnail(thumbnail);
		contentVO.setVthumbnail(fileMultiName);
		contentService.uploadContent(contentVO);
		return "redirect:managePage";
	}


	// 관리자 페이지
	@RequestMapping(value = "/manager/changeMenu", method=RequestMethod.POST)
	public String changeMenuUpload(@RequestParam(value="value")String value, Model model) {
		System.out.println(value);
		String value1 = "1";
		String value2 = "2";
		if(value.equals(value1)) {
			return "manager/write";
		}
		else if(value.equals(value2)) {
			List contentList = new ArrayList<>();
			contentList = contentService.manageList();
			model.addAttribute("manage", contentList);
			return "manager/manageList";
		}
		return "manager/managePage";
	}

	//판매자별 검색
	@RequestMapping(value="/manager/search", method=RequestMethod.POST)
	public String search(@RequestParam(value="value")String search,@RequestParam(value="on_off_option")String on_off, Model model) {

		if(on_off == null) {
			List contentList = new ArrayList<>();
			contentList = contentService.manageListByVendor(search);
			model.addAttribute("manage", contentList);
			model.addAttribute("search", search);
		}else if(on_off.equals("1")){

		}
		return "manager/manageList";
	}



	//////////판매자 마이페이지 요청

	@RequestMapping(value="/seller/myClass", method=RequestMethod.GET)
	public String myClass( Model model, HttpSession session) {

		MemberVO id = (MemberVO) session.getAttribute("sessionId");
		
		System.out.println("myClass 시작");
		List<ContentVO> list =mypageService.selectContents(id.getUid());
		
		System.out.println("myClass 의 list :"+ list);
		for (ContentVO contentVO : list) {
			System.out.println("LIST 확인 :"+ contentVO.getTitle());

		}

		model.addAttribute("list", list);

		return "seller/myClass";

	}

	//내클래스 예약 현황s
	@RequestMapping(value="/seller/myOrder",  method=RequestMethod.GET)
	public String myOrder(Model model, HttpSession session) {
		MemberVO id = (MemberVO) session.getAttribute("sessionId");
		
		List<ContentVO> list =mypageService.selectContents(id.getUid());
		System.out.println("myOrder의 list :"+ list);
		for (ContentVO contentVO : list) {  
			System.out.println("LIST 확인 :"+ contentVO.getTitle());

		}

		model.addAttribute("list", list);

		return "seller/myOrder";
	}

	//환불 현황 메서드 사라짐
	
	
	
	
	//클래스별 예약현황 리스트
	@RequestMapping(value="/seller/resState/{cid}",  method=RequestMethod.GET)
	public String resState(@PathVariable int cid, Model model) {
		try {
			List<OrderVO> list = mypageService.orderAll(cid);
			model.addAttribute("list", list);

		}catch(Exception e) {
			e.printStackTrace();
		}

		return "seller/resState";
	}


	//판매자 수정
	@RequestMapping(value="/seller/changeComplete", method=RequestMethod.POST)
	public String changeComplete(VendorVO vendorVO) {
		System.out.println("vendorVO 확인 :"+  vendorVO);
		//db에서 수정
		try {
			mypageService.updateVendor(vendorVO);

		}catch(Exception e) {
			e.printStackTrace();
		}
		return "seller/changeComplete";

	}


	//판매자 수정
	@RequestMapping(value="/seller/changeComment", method=RequestMethod.GET)
	public String vendorHome( Model model, HttpSession session) {	
		try {
			MemberVO id = (MemberVO) session.getAttribute("sessionId");
			VendorVO vendorVO = mypageService.selectVendor(id.getUid());
			System.out.println("vendorVO : "+ vendorVO);
			model.addAttribute("vendorVO", vendorVO);

		}catch(Exception e) {
			e.printStackTrace();
		}

		return "seller/changeComment";

	}




	@RequestMapping("/vendor/logout") 
	public String logout(HttpSession session) {

		session.invalidate();//세션 해제
		return "redirect:/";

	}



	@RequestMapping(value="/seller/request")
	public String registerRequest() {
		return "seller/request";
	}










	//////////////////구매자 마이페이지


	// 구매자 마이페이지
	@RequestMapping("/mypage/mypageMain")
	public String mypageMain(Model model) throws Exception {

		return "mypage/mypageMain";
	}


	// 구매자 구매목록 리스트
	@RequestMapping("/mypage/mypageOrderList")
	public String orderList(Model model, HttpSession session) throws Exception {
		MemberVO id = (MemberVO) session.getAttribute("sessionId");
		List<OrderVO> orderlist = mypageService.orderList(id.getUid());
		model.addAttribute("orderlist", orderlist);
		System.out.println(orderlist);

		return "mypage/mypageOrderList";
	}


	// 구매자 취소목록 리스트
	@RequestMapping("/mypage/mypageCancleList")
	public String mypageCancleList(Model model, HttpSession session) throws Exception {
		MemberVO id = (MemberVO) session.getAttribute("sessionId");
		List<OrderVO> canclelist = mypageService.cancleList(id.getUid());
		model.addAttribute("canclelist", canclelist);

		System.out.println(canclelist);

		return "mypage/mypageCancleList";
	}


	// 구매자 후기목록 리스트
	@RequestMapping("/mypage/mypageReplyList")
	public String mypageReplyList(Model model, HttpSession session) throws Exception {
		// uid로 REPLY 테이블에서 contents 테이블과 조인해서 
		MemberVO id = (MemberVO) session.getAttribute("sessionId");

		List<ReplyList> repList = mypageService.replyList(id.getUid());



		model.addAttribute("repList", repList);

		System.out.println(repList);

		return "mypage/mypageReplyList";
	}


	@RequestMapping("/mypage/updateStep1")
	public String mypagePassCheck() throws Exception {

		return "mypage/updateStep1";

	}



	@RequestMapping("/mypage/updateStep2")
	public String mypageManageInfo(@RequestParam String password, HttpSession session)throws Exception {
		try {
			MemberVO member= (MemberVO)session.getAttribute("sessionId");
			String realPass = member.getPassword();
			if (realPass.equals(password)) {
				return "mypage/updateStep2";

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "mypage/failed";
	}

	@RequestMapping(value="/mypage/updateStep3", method=RequestMethod.POST)
	public String mypageManageComplete(MemberVO memberVO) throws Exception {
		mypageService.updateMember(memberVO);
		return "mypage/updateStep3";

	}

	//이건 현정씨 프로젝트에서 메인을 말함
	@RequestMapping(value="/mypage/logout")
	public String mypageLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";

	}

	@RequestMapping(value="/mypage/repDelete/{rid}")
	public String repDelete(@PathVariable int rid) {
		System.out.println("rid는 "+ rid);
		try {
			mypageService.replyDelete(rid);
		}catch(Exception e){

			e.printStackTrace();
			System.out.println("catch");

		}
		return "redirect:/mypage/mypageReplyList";
	}



	//환불은 PayController 쪽이다



	/////////////////////////////




















	/////////////////////////






}
