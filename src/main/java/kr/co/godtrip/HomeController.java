package kr.co.godtrip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    public HomeController() {
        System.out.println("-----HomeController()객체 생성됨");
    }
    
    /*
       spring09_myshop 프로젝트의 첫페이지 호출
       http://localhost:9095
    */  
    //http://localhost:9095/home.do
    
    
    
        @RequestMapping("/home.do")
	    public ModelAndView home() {		
        ModelAndView mav=new ModelAndView();
        //redirect : 등록한 명령어를 호출하 수 있다
        mav.setViewName("/home.do");
        return mav;
        
      
	}//home() end
    
}//class end
