package kr.co.godtrip.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class PaymentCont {
	public PaymentCont() {
		System.out.println("-----PaymentCont() 객체생성됨");
	}
	
	@Autowired
	PaymentDAO paymentDao;
	
	@RequestMapping("/paymentForm")
	public String paymentForm() {
		return "payment/paymentForm";
	}//paymentForm() end
	
	
	
	
	
	
	
}
