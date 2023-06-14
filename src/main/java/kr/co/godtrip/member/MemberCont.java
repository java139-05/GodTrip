package kr.co.godtrip.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class MemberCont {
		public MemberCont() {
			System.out.println("----MemberCont() 객체생성됨");
		}
		
		@Autowired
		MemberDAO memberDao;
	
	
		//회원가입 정보입력
		@RequestMapping("/memberForm")
		public String memberForm() {
		return "member/memberForm";
	}
		
		
		@PostMapping("/insert")
		public String Memberinsert(MemberDTO dto) {
			//MemberDTO 객체에 입력된 값들이 자동으로 바인딩됨
			memberDao.insert(dto);
			return "redirect:/member/memberForm";
		}
		
}
