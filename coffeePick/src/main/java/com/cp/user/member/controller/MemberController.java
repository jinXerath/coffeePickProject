//package com.cp.user.member.controller;
//
//import java.util.Random;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.bind.support.SessionStatus;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.cp.mail.service.MailService;
//import com.cp.user.member.service.MemberService;
//import com.cp.user.member.vo.MemberVO;
//
//import lombok.RequiredArgsConstructor;
//import lombok.Setter;
//import lombok.extern.slf4j.Slf4j;
//import net.nurigo.sdk.NurigoApp;
//import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
//import net.nurigo.sdk.message.model.Message;
//import net.nurigo.sdk.message.service.DefaultMessageService;
//
//
//
//@RequestMapping("/member/*")
//@SessionAttributes({"member","corp"})//일반사용자,기업사용자구분
//@Slf4j
//@Controller
//@RequiredArgsConstructor
//public class MemberController {
//	
//	@Setter(onMethod_=@Autowired)
//	private MemberService memberService;
//	@Autowired
//	private final MailService mailService;
//	
//	//이메일 인증번호 발송 메소드
//	@PostMapping("/mail")
//	public ResponseEntity<Integer> MailSend(@RequestParam("memberEmail") String email){
//	    log.info("여기까진도착");
//	    int randomNumber=mailService.CreateMail(email);
//	    return ResponseEntity.ok(randomNumber);//인증번호발송
//	 }	
//	//사업자,사용자 아이디찾기 선택 페이지 이동
//	@GetMapping("dataIdFind")
//	public String move_dataIdFind() {
//		return "member/find/dataIdFind";
//	}
//	//사업자,사용자 비밀번호 찾기 선택 페이지 이동
//	@GetMapping("dataPwFind")
//	public String move_dataPwFind() {
//		return "member/find/dataPwFind";
//	}
//	
//	//회원 아이디 찾기 페이지 이동
//	@GetMapping("memberIdFind")
//	public String moveMemberIdFind() {
//		return "member/find/memberIdFind";		
//	}
//	
//	//핸드폰 번호로 회원 아이디찾기 이동 
//	@GetMapping("memberIdFindPhonePage")
//	public String move_memberIdFindPhone() {
//		log.info("멤버폰");
//		return "member/find/memberIdFindPhonePage";
//	}	
//	//이메일로 회원 아이디찾기 이동 
//	@GetMapping("memberIdFindEmailPage")
//	public String move_memberIdFindEmail() {
//		return "member/find/memberIdFindEmailPage";
//	}
//	
//	//회원 비밀번호 찾기 페이지 이동
//	@GetMapping("memberPwFind")
//	public String movi_memberPwFind() {
//		return "member/find/memberPwFind";		
//	}
//	//핸드폰 번호로 회원 비밀번호 찾기 이동
//	@GetMapping("memberPwFindPhonePage")
//	public String move_memberPwFindPhone() {
//		return "member/find/memberPwFindPhonePage";
//	}
//	//이메일로 회원 비밀번호 찾기 페이지 이동
//	@GetMapping("memberPwFindEmailPage")
//	public String move_memberPwFindEmail() {
//		return "member/find/memberPwFindEmailPage";
//	}
//	
//	
//	//로그인폼이동
//	@GetMapping("loginForm")
//	public String LoginForm() {
//		log.info("이동");
//		return "member/login/loginForm";
//		
//	}	
//	//마이페이지이동
//	@GetMapping("mypage")
//	public String mypage() {
//	    log.info("마이페이지 이동");
//	    return "mypage/mypage"; // 뷰 이름을 반환합니다.
//	}	
//	//회원가입폼이동
//	@GetMapping("memberJoinForm")
//	public String memberJoinPage() {
//		return "member/join/memberJoinForm";
//	}
//	//회원삭제할떄 비밀번호 확인페이지로 이동
//	@GetMapping("userDeleteCheck")
//	public String userDeleteCheck() {
//		return "member/userDeleteCheck";
//	}
//	//회원 정보수정 버튼 누르면 회원정보수정 페이지로 이동
//	@GetMapping("memberDataUpdatePage")
//	public String memberDataUpdatePage() {
//		return "member/update/memberDataUpdatePage";
//	}
//		
//	@GetMapping("loginSuccess")
//	public String esaes() {
//		return "/member/login/loginSuccess";
//	}
//
//	/**   로그인 기능 구현  **/
///*	@PostMapping("login")
//	public String Login(@RequestParam("id") String id, @RequestParam("pw") String pw,HttpSession session,Model model) {		
//		log.info("로그인컨트롤러 진입,아이디값:"+id+"비밀번호"+pw);	
//				try {							
//				MemberVO member =memberService.login(id,pw);//로그인
//			System.out.println(member);
//				if(member!=null) {
//				log.info("로그인 성공!");						  
//	            session.setAttribute("member", member); // 세션에 로그인한 사용자 정보 저장	        
//				return "member/loginSuccess";
//			}else if(member==null) {
//				log.info("로그인 실패");
//				String loginfail="fail";
//				model.addAttribute("loginfail", "fail");
//				return "member/login/loginForm";
//			}
//				log.info(session.getId());
//			
//				log.info(member.getMember_name());
//					
//		}catch(Exception e) {
//				log.error("에러가 발생했습니다"+e.getMessage());
//				
//			}
//				
//	}*/
//		@PostMapping("/login")
//		public String Login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session, Model model, RedirectAttributes ras) {
//		log.info("일반회원 로그인메소드 호출");
//		String url = "";
//			MemberVO member = memberService.login(id,pw);
//				if(member != null) {
//						if(member.getMember_status().equals("N")) {
//							ras.addFlashAttribute("errorMessage","탈퇴한 회원입니다.");
//							url = "member/loginForm";
//						} else {
//						model.addAttribute("member", member);
//						url = "/";
//						}
//					}else {
//						ras.addFlashAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
//						url = "/member/loginForm";
//					}
//					return "redirect:"+url;
//				}		
//		
//	
//	
//	/** 로그아웃 기능 구현*/
//	@GetMapping("logout")
//	public String logout(HttpSession session, HttpServletRequest request,SessionStatus sessionStatus) {		 
//	    String url = request.getHeader("Referer");
//	    System.out.println("url값:"+url);
//	    sessionStatus.setComplete();	   
//	    session.invalidate(); // 세션 무효화
//		    
//
//	 
//	 return "member/login/loginForm";
//	// return "redirect:/member/loginForm";
//	}
//	
//	
//	//회원가입기능구현,(구현완료)
//	@PostMapping("/memberJoin")
//	public String memberJoin(@ModelAttribute MemberVO vo,Model model) {//@ModelAttribute는 멤버VO객체를 만듬과 동시에 그 객체에 전송한 값을 할당
//		log.info("실행됨");
//		log.info("이메일은"+vo.getMember_email());
//		
//		System.out.println("실행됬다구");
//		
//		try {
//			boolean result=memberService.memberJoin(vo);
//				
//			
//				MemberVO mvo=new MemberVO();
//				mvo.setMember_id(vo.getMember_id());
//				memberService.cartInsert(mvo);
//				memberService.pointInsert(mvo);
//				memberService.pickmoneyInsert(mvo);
//			
//				log.info("서비스까지실행끝나고컨트롤러부분으로 돌아온지점");
//				log.info("서비스끝나고 이메일은"+vo.getMember_email());
//				
//				if(result==true) {
//					log.info("회원가입 성공!");
//				}
//				if(result==false) {
//					log.info("회원가입 실패...");
//		    model.addAttribute("errorMessage", "회원가입 실패. 다시 시도해주세요."); // 실패 메시지 추가  
//				}
//		}catch(Exception e) { 
//			   log.error("회원가입 중 예외 발생: " + e.getMessage());
//			    String errorMessage = "회원가입 실패, 입력값이 잘못되었습니다, 다시 시도해주세요."; // 줄바꿈 추가
//			    model.addAttribute("errorMessage", errorMessage); // 실패 메시지 추가  
//			    
//			    
//		}
//
//		return "member/login/loginForm";
//	}
//	//닉네임중복 확인
//	@ResponseBody
//	@GetMapping("nickCheck")
//	public int nickCheck(@ModelAttribute MemberVO vo,Model model) {
//		log.info("닉네임 중복체크컨트롤러 실행");
//		int result=memberService.nickCheck(vo.getMember_nickname());
//		log.info("중복체크 실행완료 result="+result);
//	
//		if(result==0) {
//			log.info("중복없음"+result);
//		}else {
//			log.info("중복닉네임 있음"+result);
//		}	
//		return result; 	
//	}
//	
//	//아이디 중복확인
//	@ResponseBody
//	@GetMapping("idCheck")
//	public int idCheck(@ModelAttribute MemberVO vo,Model model) {
//		log.info("아이디 중복체크컨트롤러 실행");
//		int result=memberService.idCheck(vo.getMember_id());
//		log.info("아이디 중복체크 실행완료 result="+result);
//	
//		if(result==0) {
//			log.info("중복없음"+result);
//		}else {
//			log.info("중복아이디 있음"+result);
//		}	
//		return result; 	
//	}
//	
//	//@ResponseBody
//	// 핸드폰 인증메세지 보내기
//	@GetMapping("phoneNumberMsg")
//	public ResponseEntity<Integer> phoneNumberMsg(@RequestParam ("member_phone")String member_phone) {
//		log.info("폰메세지인증번호실행!컨트롤러진입!");
//		log.info("핸드폰번호는"+member_phone);
//		log.info("메세지발송종료전!!");		
//		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSV5TACBYQBTRZO", "C5KVATXAOVXNMHDBD3OEAFIH7A8VJVLU", "https://api.coolsms.co.kr");
//		log.info("메세지발송종료후");
//		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
//		Message message = new Message();
//		message.setFrom("01071692498");//계정에서 등록한 발신번호입력
//		Random random=new Random();
//		int randomNumber=random.nextInt(900000)+100000;//6자리 랜덤숫자
//		
//		message.setTo(member_phone);//받는사람 번호입력
//		
//		message.setText("인증번호는 ["+randomNumber+"] 입니다");//보낼메세지
//		
//		
//		System.out.println("랜덤번호는?:"+randomNumber+"입니다!");
//
//		try {
//		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
//		  messageService.send(message);
//		} catch (NurigoMessageNotReceivedException exception) {
//		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
//		  System.out.println(exception.getFailedMessageList());
//		  System.out.println(exception.getMessage());
//		} catch (Exception exception) {
//		  System.out.println(exception.getMessage());
//		  System.out.println("오류 발생: " + exception.getMessage());//임시
//		}
//		
//		return ResponseEntity.ok(randomNumber);//인증번호발송
//
//	}
//	
//	//회원 아이디 찾기(전화번호로)
//	@GetMapping("/member/memberIdFindPhone")
//	public ResponseEntity<String> memberIdFind(@RequestParam("member_phone") String phoneNumber){		
//		String result=memberService.memberIdFind(phoneNumber);
//		log.info("현재 컨트롤러부분"+result);
//		/* return result; */
//		if(result==null) {
//			return ResponseEntity.ok(null);
//		}
//		return  ResponseEntity.ok(result);
//	}
//
//	
//	//회원 아이디 찾기(이메일로)
//	@GetMapping("/member/memberIdFindEmail")
//	public ResponseEntity<String> memberIdFind_email(@RequestParam("member_email") String member_email){		
//		String result=memberService.memberIdFindEmail(member_email);
//		log.info("현재 컨트롤러부분"+result);
//		/* return result; */
//		if(result==null) {
//			return ResponseEntity.ok(null);
//		}
//		return  ResponseEntity.ok(result);
//	}
//	
//	//회원 비밀번호찾기(이메일로)
//	@PostMapping("memberPwFindEmail")
//	public String memberPwFind_email(@ModelAttribute MemberVO vo,Model model) {
//		log.info("이메일로 비밀번호찾기 실행중..이메일"+vo.getMember_email());
//		log.info("이메일로 비밀번호찾기 실행중..아이디"+vo.getMember_id());
//		log.info("이메일로 비밀번호찾기 실행중..본명"+vo.getMember_name());
//		
//		vo=memberService.memberPwFindEmail(vo);
//		log.info("서비스 실행 완료");
//	    // vo 객체를 모델에 추가
//	    model.addAttribute("vo", vo);
//		/* return result; */
//		if(vo==null) {
//			 model.addAttribute("errorMessage", "해당 아이디,이름,이메일과 일치하는 회원이 없습니다.");
//			return "/member/memberPwFindEmail";
//		}
//		return "/member/pwAlter";
//		
//	}
//	//회원 비밀번호찾기(전화번호로)
//	@PostMapping("memberPwFindPhone")
//	public String memberPwFind_phone(@ModelAttribute MemberVO vo,Model model) {
//		log.info("폰번호로비밀번호찾기 실행중.."+vo.getMember_phone());
//		vo=memberService.memberPwFindPhone(vo);
//		log.info("서비스 실행 완료");
//	    // vo 객체를 모델에 추가
//	    model.addAttribute("vo", vo);
//		/* return result; */
//		if(vo==null) {
//			 model.addAttribute("errorMessage", "해당 아이디,이름,전화번호와 일치하는 회원이 없습니다.");
//			return "/member/memberPwFindPhone";
//		}
//		return "/member/pwAlter";
//	}
//	
//	//회원 비밀번호 변경
//	@PostMapping("pwAlter")
//	public ResponseEntity<Integer> pwAlter(@RequestParam("member_id")String member_id,@RequestParam("member_pw")String member_pw) {
//		log.info("비밀번호변경 진입시작");
//		System.out.println("비밀번호변경진입시작했음");
//		log.info(member_pw);
//		int result=memberService.pwAlter(member_id,member_pw);
//		log.info("비밀번호서비스실행완료 컨트롤러부분임");
//		return ResponseEntity.ok(result);	
//	}
//
//	//회원 삭제시 회원 비밀번호 확인
//	@GetMapping("memberPwCheck")
//	public ResponseEntity<Integer> memberPwCheck(@RequestParam("member_id")String member_id,@RequestParam("member_pw")String member_pw) {
//		log.info("컨트롤러시작");
//		log.info(member_pw);
//		log.info(member_id);
//		int result=memberService.memberPwCheck(member_id,member_pw);
//		log.info("서비스실행후"+result);
//	//	return result;
//		return ResponseEntity.ok(result);
//	}
//	//회원탈퇴
//	@GetMapping("memberDelete")
//	public ResponseEntity<Integer> memberDelete(@RequestParam("member_id")String member_id,@RequestParam("member_pw")String member_pw) {
//		log.info("삭제컨트롤러시작");
//		log.info(member_pw);
//		log.info(member_id);
//		int result=memberService.memberDelete(member_id,member_pw);
//		log.info("서비스실행후"+result);
//		return ResponseEntity.ok(result);
//	}
//	//회원정보 수정
//	@GetMapping("memberDataUpdate")
//	public ResponseEntity<Integer> memberDataUpdate(
//			@RequestParam("member_id")String member_id,
//			@RequestParam("member_name")String member_name,
//			@RequestParam("member_nickname")String member_nickname,
//			@RequestParam("member_email")String member_email,
//			@RequestParam("member_addr")String member_addr,
//			@RequestParam("member_phone")String member_phone) {
//		log.info("업데이트컨트롤러시작");
//		log.info(member_phone);
//		log.info(member_addr);
//		log.info(member_email);
//		log.info(member_nickname);
//		log.info(member_name);
//		log.info(member_id);
//		int result=memberService.memberDataUpdate(member_id,member_name,member_nickname,member_addr,member_phone,member_email);
//		log.info("서비스실행후 리턴전 컨트롤러부분이다,리설트값은? "+result);
//		return ResponseEntity.ok(result);
//	}
//	
//	//이메일중복 확인
//		@ResponseBody
//		@GetMapping("emailCheck")
//		public int emailCheck(@RequestParam("member_email")String member_email) {
//			log.info("이메일 중복체크컨트롤러 실행");
//			int result=memberService.emailCheck(member_email);
//			log.info("중복체크 실행완료 result="+result);
//		
//			if(result==0) {
//				log.info("이메일중복없음"+result);
//			}else {
//				log.info("이메일중복 있음"+result);
//			}	
//			log.info("컨트롤러부분실행끝!");
//			return result; 	
//		}
//
//	
//		@GetMapping("phoneCheck")
//		public ResponseEntity<Integer> phoneCheck(@RequestParam("member_phone")String member_phone) {
//			log.info("이메일 중복체크컨트롤러 실행");
//			int result=memberService.phoneCheck(member_phone);
//			log.info("중복체크 실행완료 result="+result);
//		
//			if(result==0) {
//				log.info("핸드폰중복없음"+result);
//			}else {
//				log.info("핸드폰중복 있음"+result);
//			}	
//			log.info("컨트롤러부분실행끝!");
//			return ResponseEntity.ok(result); 	
//		}
//}
//
package com.cp.user.member.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.mail.service.MailService;
import com.cp.user.member.service.MemberService;
import com.cp.user.member.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;



@RequestMapping("/member/*")
@SessionAttributes({"member","corp"})//일반사용자,기업사용자구분
@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService memberService;
	@Autowired
	private final MailService mailService;
	
	//이메일 인증번호 발송 메소드
	@PostMapping("/mail")
	public ResponseEntity<Integer> MailSend(@RequestParam("memberEmail") String email){
	    log.info("여기까진도착");
	    int randomNumber=mailService.CreateMail(email);
	    return ResponseEntity.ok(randomNumber);//인증번호발송
	 }	
	//사업자,사용자 아이디찾기 선택 페이지 이동
	@GetMapping("dataIdFind")
	public String move_dataIdFind() {
		return "member/find/dataIdFind";
	}
	//사업자,사용자 비밀번호 찾기 선택 페이지 이동
	@GetMapping("dataPwFind")
	public String move_dataPwFind() {
		return "member/find/dataPwFind";
	}
	
	//회원 아이디 찾기 페이지 이동
	@GetMapping("memberIdFind")
	public String moveMemberIdFind() {
		return "member/find/memberIdFind";		
	}
	
	//핸드폰 번호로 회원 아이디찾기 이동 
	@GetMapping("memberIdFindPhonePage")
	public String move_memberIdFindPhone() {
		log.info("멤버폰");
		return "member/find/memberIdFindPhonePage";
	}	
	//이메일로 회원 아이디찾기 이동 
	@GetMapping("memberIdFindEmailPage")
	public String move_memberIdFindEmail() {
		return "member/find/memberIdFindEmailPage";
	}
	
	//회원 비밀번호 찾기 페이지 이동
	@GetMapping("memberPwFind")
	public String movi_memberPwFind() {
		return "member/find/memberPwFind";		
	}
	//핸드폰 번호로 회원 비밀번호 찾기 이동
	@GetMapping("memberPwFindPhonePage")
	public String move_memberPwFindPhone() {
		return "member/find/memberPwFindPhonePage";
	}
	//이메일로 회원 비밀번호 찾기 페이지 이동
	@GetMapping("memberPwFindEmailPage")
	public String move_memberPwFindEmail() {
		return "member/find/memberPwFindEmailPage";
	}
	
	
	//로그인폼이동
	@GetMapping("loginForm")
	public String LoginForm() {
		log.info("이동");
		return "member/login/loginForm";
		
	}	
	//마이페이지이동
	@GetMapping("mypage")
	public String mypage() {
	    log.info("마이페이지 이동");
	    return "mypage/mypage"; // 뷰 이름을 반환합니다.
	}	
	//회원가입폼이동
	@GetMapping("memberJoinForm")
	public String memberJoinPage() {
		return "member/join/memberJoinForm";
	}
	//회원삭제할떄 비밀번호 확인페이지로 이동
	@GetMapping("userDeleteCheck")
	public String userDeleteCheck() {
		return "member/userDeleteCheck";
	}
	//회원 정보수정 버튼 누르면 회원정보수정 페이지로 이동
	@GetMapping("memberDataUpdatePage")
	public String memberDataUpdatePage() {
		return "member/update/memberDataUpdatePage";
	}
		
	@GetMapping("loginSuccess")
	public String esaes() {
		return "/member/login/loginSuccess";
	}

	/**   로그인 기능 구현  **/
/*	@PostMapping("login")
	public String Login(@RequestParam("id") String id, @RequestParam("pw") String pw,HttpSession session,Model model) {		
		log.info("로그인컨트롤러 진입,아이디값:"+id+"비밀번호"+pw);	
				try {							
				MemberVO member =memberService.login(id,pw);//로그인
			System.out.println(member);
				if(member!=null) {
				log.info("로그인 성공!");						  
	            session.setAttribute("member", member); // 세션에 로그인한 사용자 정보 저장	        
				return "member/loginSuccess";
			}else if(member==null) {
				log.info("로그인 실패");
				String loginfail="fail";
				model.addAttribute("loginfail", "fail");
				return "member/login/loginForm";
			}
				log.info(session.getId());
			
				log.info(member.getMember_name());
					
		}catch(Exception e) {
				log.error("에러가 발생했습니다"+e.getMessage());
				
			}
				
	}*/
		@PostMapping("/login")
		public String Login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session, Model model, RedirectAttributes ras) {
		log.info("일반회원 로그인메소드 호출");
		String url = "";
			MemberVO member = memberService.login(id,pw);
				if(member != null) {
						if(member.getMember_status().equals("N")) {
							ras.addFlashAttribute("errorMessage","탈퇴한 회원입니다.");
							url = "member/loginForm";
						} else {
						model.addAttribute("member", member);
						url = "/";
						}
					}else {
						ras.addFlashAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
						url = "/member/loginForm";
					}
					return "redirect:"+url;
				}		
		
	
	
	/** 로그아웃 기능 구현*/
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request,SessionStatus sessionStatus) {		 
	    String url = request.getHeader("Referer");
	    System.out.println("url값:"+url);
	    sessionStatus.setComplete();	   
	    session.invalidate(); // 세션 무효화
		    

	 
	 return "member/login/loginForm";
	// return "redirect:/member/loginForm";
	}
	
	
	//회원가입기능구현,(구현완료)
	@PostMapping("/memberJoin")
	public String memberJoin(@ModelAttribute MemberVO vo,Model model) {//@ModelAttribute는 멤버VO객체를 만듬과 동시에 그 객체에 전송한 값을 할당
		log.info("실행됨");
		log.info("이메일은"+vo.getMember_email());
		log.info(vo.getMember_name());
		System.out.println("실행됬다구");
		
		try {
			boolean result=memberService.memberJoin(vo);
				
			
				MemberVO mvo=new MemberVO();
				mvo.setMember_id(vo.getMember_id());
				memberService.cartInsert(mvo);
				memberService.pointInsert(mvo);
				memberService.pickmoneyInsert(mvo);
			
				log.info("서비스까지실행끝나고컨트롤러부분으로 돌아온지점");
				log.info("서비스끝나고 이메일은"+vo.getMember_email());
				
				if(result==true) {
					log.info("회원가입 성공!");
				}
				if(result==false) {
					log.info("회원가입 실패...");
		    model.addAttribute("errorMessage", "회원가입 실패. 다시 시도해주세요."); // 실패 메시지 추가  
				}
		}catch(Exception e) { 
			   log.error("회원가입 중 예외 발생: " + e.getMessage());
			    String errorMessage = "회원가입 실패, 입력값이 잘못되었습니다, 다시 시도해주세요."; // 줄바꿈 추가
			    model.addAttribute("errorMessage", errorMessage); // 실패 메시지 추가  
			    
			    
		}

		return "member/login/loginForm";
	}
	//닉네임중복 확인
	@ResponseBody
	@GetMapping("nickCheck")
	public int nickCheck(@ModelAttribute MemberVO vo,Model model) {
		log.info("닉네임 중복체크컨트롤러 실행");
		int result=memberService.nickCheck(vo.getMember_nickname());
		log.info("중복체크 실행완료 result="+result);
	
		if(result==0) {
			log.info("중복없음"+result);
		}else {
			log.info("중복닉네임 있음"+result);
		}	
		return result; 	
	}
	
	//아이디 중복확인
	@ResponseBody
	@GetMapping("idCheck")
	public int idCheck(@ModelAttribute MemberVO vo,Model model) {
		log.info("아이디 중복체크컨트롤러 실행");
		int result=memberService.idCheck(vo.getMember_id());
		log.info("아이디 중복체크 실행완료 result="+result);
	
		if(result==0) {
			log.info("중복없음"+result);
		}else {
			log.info("중복아이디 있음"+result);
		}	
		return result; 	
	}
	
	//@ResponseBody
	// 핸드폰 인증메세지 보내기
	@GetMapping("phoneNumberMsg")
	public ResponseEntity<Integer> phoneNumberMsg(@RequestParam ("member_phone")String member_phone) {
		log.info("폰메세지인증번호실행!컨트롤러진입!");
		log.info("핸드폰번호는"+member_phone);
		log.info("메세지발송종료전!!");		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSV5TACBYQBTRZO", "C5KVATXAOVXNMHDBD3OEAFIH7A8VJVLU", "https://api.coolsms.co.kr");
		log.info("메세지발송종료후");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01071692498");//계정에서 등록한 발신번호입력
		Random random=new Random();
		int randomNumber=random.nextInt(900000)+100000;//6자리 랜덤숫자
		
		message.setTo(member_phone);//받는사람 번호입력
		
		message.setText("인증번호는 ["+randomNumber+"] 입니다");//보낼메세지
		
		
		System.out.println("랜덤번호는?:"+randomNumber+"입니다!");

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		  System.out.println("오류 발생: " + exception.getMessage());//임시
		}
		
		return ResponseEntity.ok(randomNumber);//인증번호발송

	}
	
	//회원 아이디 찾기(전화번호로)
	@GetMapping("/member/memberIdFindPhone")
	public ResponseEntity<String> memberIdFind(@RequestParam("member_phone") String phoneNumber){		
		String result=memberService.memberIdFind(phoneNumber);
		log.info("현재 컨트롤러부분"+result);
		/* return result; */
		if(result==null) {
			return ResponseEntity.ok(null);
		}
		return  ResponseEntity.ok(result);
	}

	
	//회원 아이디 찾기(이메일로)
	@GetMapping("/member/memberIdFindEmail")
	public ResponseEntity<String> memberIdFind_email(@RequestParam("member_email") String member_email){		
		String result=memberService.memberIdFindEmail(member_email);
		log.info("현재 컨트롤러부분"+result);
		/* return result; */
		if(result==null) {
			return ResponseEntity.ok(null);
		}
		return  ResponseEntity.ok(result);
	}
	
	//회원 비밀번호찾기(이메일로)
	@PostMapping("memberPwFindEmail")
	public String memberPwFind_email(@ModelAttribute MemberVO vo,Model model) {
		log.info("이메일로 비밀번호찾기 실행중..이메일"+vo.getMember_email());
		log.info("이메일로 비밀번호찾기 실행중..아이디"+vo.getMember_id());
		log.info("이메일로 비밀번호찾기 실행중..본명"+vo.getMember_name());
		
		vo=memberService.memberPwFindEmail(vo);
		log.info("서비스 실행 완료");
	    // vo 객체를 모델에 추가
	    model.addAttribute("vo", vo);
		/* return result; */
		if(vo==null) {
			 model.addAttribute("errorMessage", "해당 아이디,이름,이메일과 일치하는 회원이 없습니다.");
			return "/member/memberPwFindEmail";
		}
		return "/member/pwAlter";
		
	}
	//회원 비밀번호찾기(전화번호로)
	@PostMapping("memberPwFindPhone")
	public String memberPwFind_phone(@ModelAttribute MemberVO vo,Model model) {
		log.info("폰번호로비밀번호찾기 실행중.."+vo.getMember_phone());
		vo=memberService.memberPwFindPhone(vo);
		log.info("서비스 실행 완료");
	    // vo 객체를 모델에 추가
	    model.addAttribute("vo", vo);
		/* return result; */
		if(vo==null) {
			 model.addAttribute("errorMessage", "해당 아이디,이름,전화번호와 일치하는 회원이 없습니다.");
			return "/member/memberPwFindPhone";
		}
		return "/member/pwAlter";
	}
	
	//회원 비밀번호 변경
	@PostMapping("pwAlter")
	public ResponseEntity<Integer> pwAlter(@RequestParam("member_id")String member_id,@RequestParam("member_pw")String member_pw) {
		log.info("비밀번호변경 진입시작");
		System.out.println("비밀번호변경진입시작했음");
		log.info(member_pw);
		int result=memberService.pwAlter(member_id,member_pw);
		log.info("비밀번호서비스실행완료 컨트롤러부분임");
		return ResponseEntity.ok(result);	
	}

	//회원 삭제시 회원 비밀번호 확인
	@GetMapping("memberPwCheck")
	public ResponseEntity<Integer> memberPwCheck(@RequestParam("member_id")String member_id,@RequestParam("member_pw")String member_pw) {
		log.info("컨트롤러시작");
		log.info(member_pw);
		log.info(member_id);
		int result=memberService.memberPwCheck(member_id,member_pw);
		log.info("서비스실행후"+result);
	//	return result;
		return ResponseEntity.ok(result);
	}
	//회원탈퇴
	@GetMapping("memberDelete")
	public ResponseEntity<Integer> memberDelete(@RequestParam("member_id")String member_id,@RequestParam("member_pw")String member_pw) {
		log.info("삭제컨트롤러시작");
		log.info(member_pw);
		log.info(member_id);
		int result=memberService.memberDelete(member_id,member_pw);
		log.info("서비스실행후"+result);
		return ResponseEntity.ok(result);
	}
	//회원정보 수정
	@GetMapping("memberDataUpdate")
	public ResponseEntity<Integer> memberDataUpdate(
			@RequestParam("member_id")String member_id,
			@RequestParam("member_name")String member_name,
			@RequestParam("member_nickname")String member_nickname,
			@RequestParam("member_email")String member_email,
			@RequestParam("member_addr")String member_addr,
			@RequestParam("member_phone")String member_phone) {
		log.info("업데이트컨트롤러시작");
		log.info(member_phone);
		log.info(member_addr);
		log.info(member_email);
		log.info(member_nickname);
		log.info(member_name);
		log.info(member_id);
		int result=memberService.memberDataUpdate(member_id,member_name,member_nickname,member_addr,member_phone,member_email);
		log.info("서비스실행후 리턴전 컨트롤러부분이다,리설트값은? "+result);
		return ResponseEntity.ok(result);
	}
	
	//이메일중복 확인
		@ResponseBody
		@GetMapping("emailCheck")
		public int emailCheck(@RequestParam("member_email")String member_email) {
			log.info("이메일 중복체크컨트롤러 실행 이메일은"+member_email);
			int result=memberService.emailCheck(member_email);
			log.info("중복체크 실행완료 result="+result);
		
			if(result==0) {
				log.info("이메일중복없음"+result);
			}else {
				log.info("이메일중복 있음"+result);
			}	
			log.info("컨트롤러부분실행끝!");
			return result; 	
		}

	
		@GetMapping("phoneCheck")
		public ResponseEntity<Integer> phoneCheck(@RequestParam("member_phone")String member_phone) {
			log.info("핸드폰 중복체크컨트롤러 실행");
			int result=memberService.phoneCheck(member_phone);
			log.info("중복체크 실행완료 result="+result);
		
			if(result==0) {
				log.info("핸드폰중복없음"+result);
			}else {
				log.info("핸드폰중복 있음"+result);
			}	
			log.info("컨트롤러부분실행끝!");
			return ResponseEntity.ok(result); 	
		}
}

