package kr.co.godtrip.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberCont {
	public MemberCont() {
		System.out.println("----MemberCont() 객체생성됨");
	}

	@Autowired
	MemberDAO memberDao;

	// 기존 코드 충돌 -> mapping 연결시도시 에러가 다수 발생

	// 로그인 페이지
	@RequestMapping("/memberlogin")
	public String memberlogin() {
		return "member/memberlogin";

	}

	@RequestMapping(value = "/login.do")
	public ModelAndView login(@RequestParam("id") String id, @RequestParam("passwd") String passwd,
			HttpServletRequest request, HttpSession session) { // 회원 정보 조회하기 MemberDTO dto = memberDao.loginProc(id);
		MemberDTO dto = memberDao.loginProc(id, passwd);

		if (dto != null) {

			// id에 대한 설정이 필요하다 String id=dto.getId(); // mlevel 값 가져오기
			String mlevel = dto.getMlevel();

			if (!(mlevel.equals("F1"))) {
				ModelAndView mav = new ModelAndView("redirect:/home.do");
				// 로그인 성공시 이동 페이지
				// 로그인 성공한 경우 세션 부여하기

				session.setAttribute("s_id", dto.getId());
				session.setAttribute("s_passwd", dto.getPasswd());
				session.setAttribute("mname", dto.getMname());
				session.setAttribute("s_mlevel", dto.getMlevel());
				mav.addObject("message", "로그인 성공"); // 추후 메시지 수정
				return mav;
			} else {
				ModelAndView mav = new ModelAndView("/member/memberlogin");
				mav.addObject("message", "<a href='javascript:history.back()'>다시시도</a>");
				return mav;
			}
		} else {
			ModelAndView mav = new ModelAndView("/member/memberloginfail");
			mav.addObject("message", "<a href='javascript:history.back()'>다시시도</a>");
			return mav;
		}
	}

	// 약관동의
	@RequestMapping("/agreement")
	public String memberregister() {
		return "member/agreement";
	}

	// 약관 동의시 회원가입 페이지 이동
	@RequestMapping("/memRegister")
	public String memRegister() {
		return "member/memRegister";
	}

	// 회원가입, post방식으로 데이터를 받은경우 insert
	@RequestMapping(value = "/Register", method = RequestMethod.POST)
	public String memRegister(MemberDTO dto) {
		memberDao.insert(dto);
		return "redirect:/member/memberlogin";
	}

	// 아이디 찾기 이동

	@RequestMapping("/findId")
	public String findid() {
		return "member/findId";
	}

	// 아이디 중복확인 페이지 이동
	@RequestMapping("/idCheckForm")
	public String idCheckForm() {
		return "member/idCheckForm";
	}

	// 아이디 중복 확인 처리
	@RequestMapping("/idCheckProc")
	public ModelAndView duplicateId(@RequestParam("id") String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/idCheckProc");
		int cnt = memberDao.duplicateId(id);
		session.setAttribute("id", id);
		session.setAttribute("cnt", cnt);
		return mav;
	}

	// 이메일 중복확인페이지 이동
	@RequestMapping("/emailCheckForm")
	public String emailCheckForm() {
		return "member/emailCheckForm";
	}

	@RequestMapping("/duplicateemail")
	public ModelAndView emailduplicate(@RequestParam("email") String email, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/duplicateemail");
		int cnt = memberDao.duplicateemail(email);
		session.setAttribute("email", email);
		session.setAttribute("cnt", cnt);
		return mav;
	}

	// 로그아웃 처리
	// session.invalidate() 모든 세션을 제거시킴
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/member/memberlogin";
	}

	// 회원 정보 수정
	@RequestMapping("/memberModify")
	public String memberModify() {
		return "member/memberModify";
	}

}// controller
