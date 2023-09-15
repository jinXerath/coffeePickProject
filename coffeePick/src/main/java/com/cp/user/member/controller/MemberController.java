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
@SessionAttributes({"member","business_member"})//일반사용자,기업사용자구분
@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService service;
	@Autowired
	private final MailService mailService;
	
	//이메일 인증번호 발송 메소드
	@PostMapping("/mail")
	public ResponseEntity<Integer> MailSend(@RequestParam("memberEmail") String email){
	    log.info("여기까진도착");
	    int randomNumber=mailService.CreateMail(email);
	    return ResponseEntity.ok(randomNumber);//인증번호발송
	 }	
	/*
	 * @Setter(onMethod_=@Autowired)//이부분이문제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * @@@@@@@@@@@@@@@@@@@@@ private MailService MailService;
	 */
	//이메일 인증 페이지
	@GetMapping("exemail")
	public String emails() {
		return "member/exemail";
	}
	
	//회원 아이디 찾기 페이지 이동
	@GetMapping("member_id_find")
	public String move_member_id_find() {
		return "member/member_id_find";		
	}
	//핸드폰 번호로 회원 아이디찾기 이동 
	@GetMapping("member_id_find_phone")
	public String move_member_id_find_phone() {
		return "member/member_id_find_phone";
	}	
	//이메일로 회원 아이디찾기 이동 
	@GetMapping("member_id_find_email")
	public String move_member_id_find_email() {
		return "member/member_id_find_email";
	}
	
	//회원 비밀번호 찾기 페이지 이동
	@GetMapping("member_pw_find")
	public String movi_member_pw_find() {
		return "member/member_pw_find";		
	}
	//핸드폰 번호로 회원 비밀번호 찾기 이동
	@GetMapping("member_pw_find_phone")
	public String move_member_pw_find_phone() {
		return "/member/member_pw_find_phone";
	}
	//이메일로 회원 비밀번호 찾기 페이지 이동
	@GetMapping("member_pw_find_email")
	public String move_member_pw_find_email() {
		return "/member/member_pw_find_email";
	}
	
	
	//로그인폼이동
	@GetMapping("loginForm")
	public String LoginForm() {
		return "member/loginForm";
		
	}	
	//회원가입폼이동
	@GetMapping("memberJoinForm")
	public String memberJoinPage() {
		return "member/memberJoinForm";
	}
	
	
	/*
	 * @PostMapping("login") public String Login(@RequestParam("id") String
	 * id, @RequestParam("pw") String pw,HttpSession session,Model model) {
	 * log.info("로그인컨트롤러 진입,아이디값:"+id+"비밀번호"+pw);
	 * 
	 * System.out.println("멤버체크 시작"); int
	 * member_check=service.member_check(id,pw);//아이디비번
	 * 맞으면1,아이디만맞으면2,아이디비번둘다틀리면(존재하지않으면)0 // try {
	 * System.out.println("멤버체크 성공 값은?"+member_check);
	 * 
	 * if(member_check==1) {// 아이디 비번 둘다맞으면 로그인진행 memberVO member
	 * =service.login(id,pw);//로그인 session.setAttribute("member", member); // 세션에
	 * 로그인한 사용자 정보 저장 return "member/loginSuccess";
	 * 
	 * }else if(member_check==2) {//비밀번호가틀렷습니다출력 log.info("비밀번호가 틀렸습니다"); String
	 * errorMessage = "비밀번호가 틀렸습니다"; model.addAttribute("errorMessage",
	 * errorMessage); // 실패 메시지 추가
	 * 
	 * return "member/loginForm"; }else if(member_check==0) {//아이디비번둘다틀리면(존재하지않으면)0
	 * log.info("존재하지 않는 회원입니다"); String errorMessage = "존재하지 않는 회원입니다";
	 * model.addAttribute("errorMessage", errorMessage); // 실패 메시지 추가
	 * 
	 * return "member/loginForm"; } //}catch(Exception e) { //
	 * log.error("에러가 발생했습니다"+e.getMessage());
	 * 
	 * //}
	 * 
	 * return "member/loginForm";
	 * 
	 * }
	 */
	
	/**   로그인 기능 구현  **/
	@PostMapping("login")
	public String Login(@RequestParam("id") String id, @RequestParam("pw") String pw,HttpSession session,Model model) {
		
		log.info("로그인컨트롤러 진입,아이디값:"+id+"비밀번호"+pw);	
				try {		
					
				MemberVO member =service.login(id,pw);//로그인
			System.out.println(member);
				if(member!=null) {
				log.info("로그인 성공!");
				
			  
	           session.setAttribute("member", member); // 세션에 로그인한 사용자 정보 저장
				return "member/loginSuccess";
			}else if(member==null) {
				log.info("로그인 실패");
				String loginfail="fail";
				model.addAttribute("loginfail", "fail");
				return "member/loginForm";
			}
				log.info(session.getId());
			
				log.info(member.getMember_name());
					
		}catch(Exception e) {
				log.error("에러가 발생했습니다"+e.getMessage());
				
			}
		
		return "member/loginForm";
		
		/**				세션값 가져오는 예시**************************
		 * // 세션에서 member 객체 가져오기 memberVO a = (memberVO)
		 * session.getAttribute("a");
		 * 
		 * // 이메일 값 가져오기 String email = a.getMember_email();
		 */
		
	}
	
	/** 로그아웃 기능 구현*/
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request,SessionStatus sessionStatus) {		 
	    String url = request.getHeader("Referer");
	    System.out.println("url값:"+url);
	    sessionStatus.setComplete();
	   
	 session.invalidate(); // 세션 무효화
		    
		
		//  if(session.getAttribute("member")!=null) { log.info("세션 있음!"); } else {
	//	  log.info("세션 없음..."); }
		  
	//	  log.info("로그아웃 함수");
		  
		//  if(session.getAttribute("member")==null) { log.info("로그아웃 성공!"); }
		 
	    
	//    return "redirect:"+url; // 로그아웃 후 로그아웃 요청한 페이지로 이동
	 
	// return "성공";
	//	 return "member/loginForm"; 
	
	// return null;
	 
	 return "member/memberJoinForm";
	// return "redirect:/member/loginForm";
	}
	
	
	//회원가입기능구현,(구현완료)
	@PostMapping("memberjoin")
	public String memberJoin(@ModelAttribute MemberVO vo,Model model) {//@ModelAttribute는 멤버VO객체를 만듬과 동시에 그 객체에 전송한 값을 할당
		log.info("실행됨");
		log.info("이메일은"+vo.getMember_email());
		
		System.out.println("실행됬다구");
		
		try {
			boolean result=service.memberJoin(vo);
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
			    return "member/memberJoinForm";
			    
		}

		return "member/loginForm";
	}
	/**
	 *중복닉네임체크함수 
	 */
	@ResponseBody
	@GetMapping("nick_check")
	public int nick_check(@ModelAttribute MemberVO vo,Model model) {
		log.info("닉네임 중복체크컨트롤러 실행");
		int result=service.nick_check(vo.getMember_nickname());
		log.info("중복체크 실행완료 result="+result);
	
		if(result==0) {
			log.info("중복없음"+result);
		}else {
			log.info("중복닉네임 있음"+result);
		}	
		return result; 	
	}
	/**
	 *중복아이디체크함수 
	 */
	@ResponseBody
	@GetMapping("id_check")
	public int id_check(@ModelAttribute MemberVO vo,Model model) {
		log.info("아이디 중복체크컨트롤러 실행");
		int result=service.id_check(vo.getMember_id());
		log.info("아이디 중복체크 실행완료 result="+result);
	
		if(result==0) {
			log.info("중복없음"+result);
		}else {
			log.info("중복아이디 있음"+result);
		}	
		return result; 	
	}
	
	
	// 핸드폰 인증메세지 보내기
	@GetMapping("phoneNumberMsg")
	public ResponseEntity<Integer> phoneNumberMsg(@RequestParam ("member_phone")String member_phone) {
		log.info("폰메세지인증번호실행!컨트롤러진입!");
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSV5TACBYQBTRZO", "C5KVATXAOVXNMHDBD3OEAFIH7A8VJVLU", "https://api.coolsms.co.kr");
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
	@GetMapping("/member/memberIdFind_phone")
	public ResponseEntity<String> memberIdFind(@RequestParam("member_phone") String phoneNumber){		
		String result=service.memberIdFind(phoneNumber);
		log.info("현재 컨트롤러부분"+result);
		/* return result; */
		if(result==null) {
			return ResponseEntity.ok(null);
		}
		return  ResponseEntity.ok(result);
	}

	
	//회원 아이디 찾기(이메일로)
	@GetMapping("/member/memberIdFind_email")
	public ResponseEntity<String> memberIdFind_email(@RequestParam("member_email") String member_email){		
		String result=service.memberIdFind_email(member_email);
		log.info("현재 컨트롤러부분"+result);
		/* return result; */
		if(result==null) {
			return ResponseEntity.ok(null);
		}
		return  ResponseEntity.ok(result);
	}
	
	//회원 비밀번호찾기(전화번호로)
	@PostMapping("memberPwFind_phone")
	public String memberPwFind_phone(@ModelAttribute MemberVO vo,Model model) {
		log.info("폰번호로비밀번호찾기 실행중.."+vo.getMember_phone());
		vo=service.memberPwFind_phone(vo);
		log.info("서비스 실행 완료");
	    // vo 객체를 모델에 추가
	    model.addAttribute("vo", vo);
		/* return result; */
		if(vo==null) {
			 model.addAttribute("errorMessage", "해당 아이디,이름,전화번호와 일치하는 회원이 없습니다.");
			return "/member/member_pw_find_phone";
		}
		return "/member/pw_alter";
	}
	
	//회원 비밀번호 변경
	//pwAlter
	public int pwAlter(@RequestParam("member_id")String member_id,@RequestParam("member_pw")String member_pw) {
		log.info("비밀번호변경 진입시작");
		log.info(member_pw);
		int result=service.pwAlter(member_id,member_pw);
		log.info("비밀번호서비스실행완료 컨트롤러부분임");
		return result;	
	} 
}

