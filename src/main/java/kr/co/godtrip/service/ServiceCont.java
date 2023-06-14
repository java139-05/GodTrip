package kr.co.godtrip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/service")
public class ServiceCont {
	public ServiceCont() {
		System.out.println("-----ServiceCont() 객체생성됨");
	}

	@Autowired
	ServiceDAO serviceDao;

	@RequestMapping("/serviceList")
	public ModelAndView serviceList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/serviceList");
		mav.addObject("list", serviceDao.serviceList());
		return mav;
	}//serviceList() end
	
	@RequestMapping("/serviceList/{page}")
	public ModelAndView serviceList(@PathVariable int page) {
	    int limit = 5;
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("service/serviceList");
	    mav.addObject("list", serviceDao.serviceList(page, limit));
	    int totalCount = serviceDao.getTotalCount();
	    mav.addObject("totalPages", (totalCount + limit - 1) / limit);
	    mav.addObject("page", page);
	    return mav;
	}

	@RequestMapping("serviceDetail/{c_code}")
	public ModelAndView serviceDetail(@PathVariable int c_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/serviceDetail");
		mav.addObject("service", serviceDao.serviceDetail(c_code));
		return mav;
	}//detail() end

	
	@PostMapping("/serviceDelete/{cno}")
	public ModelAndView serviceDelete(@PathVariable int cno) {
		serviceDao.serviceDelete(cno);
		return new ModelAndView("redirect:/service/serviceList");
	}
	
//
	@RequestMapping("/serviceWrite")
	public String serviceWrite() {
	    return "service/serviceWrite";
	}

	@PostMapping("/serviceInsert")
	public ModelAndView serviceInsert(ServiceDTO dto) {
	    serviceDao.serviceInsert(dto);
	    return new ModelAndView("redirect:/service/serviceList");
	}

	@RequestMapping("/serviceUpdate/{cno}")
	public ModelAndView serviceUpdate(@PathVariable int cno) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("service/serviceUpdate");
	    mav.addObject("service", serviceDao.serviceDetail(cno));
	    return mav;
	}

	@PostMapping("/serviceUpdate")
	public ModelAndView serviceUpdate(ServiceDTO dto) {
	    serviceDao.serviceUpdate(dto);
	    return new ModelAndView("redirect:/service/serviceDetail/" + dto.getCno());
	}



}
