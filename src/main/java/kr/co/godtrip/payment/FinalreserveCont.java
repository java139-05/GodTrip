package kr.co.godtrip.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/payment")
public class FinalreserveCont {
   public FinalreserveCont() {
      System.out.println("-----finalreserveCont() 객체생성됨");
   }
   
   @Autowired
   FinalreserveDAO finalreserveDao;
   
   @RequestMapping("/finalreserveForm")
   public String finalreserveForm() {
      return "payment/finalreserveForm";
   }

   @RequestMapping("/finalreserveList")
   public ModelAndView finalreserveList() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("payment/finalreserveForm");
      mav.addObject("list", finalreserveDao.finalreserveList());
      return mav;
   }
}
