package kr.co.godtrip.attraction;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.godtrip.member.MemberDAO;
import kr.co.godtrip.member.MemberDTO;

@Controller
@RequestMapping
public class AttractionCont {

	public AttractionCont() {
		System.out.println("----AttractionCont() 객체생성됨");
	}
	

	@Autowired
	AttractionDAO attractionDao;
	
	
	@RequestMapping("/attraction/attractionList")
	public String attractionList(){
		return "attraction/attractionList";
	}
	
	@RequestMapping("/attraction/attractionForm")
	public String attractionForm(){
		return "attraction/attractionForm";
	}
	
	
//////////////////////////////////////////////////////////
	@RequestMapping("/attraction/attractioninsert")
	public String insert(
						 @RequestParam Map<String, Object> map //map이 text정보 받는다(form.jsp에서 만든 text)
						,HttpServletRequest req
						,@RequestParam MultipartFile img)throws Exception {
		//AttractionDTO 객체에 입력된 값들이 자동으로 바인딩됨
		
		String filename="-";
		long filesize=0;
		if(img !=null&& !img.isEmpty()) {//파일존재한다면
			filename=img.getOriginalFilename();
    		filesize=img.getSize();
    		try {
    			ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("/storage");  //실제 물리적인 경로
    			img.transferTo(new File(path + "\\" + filename)); //파일저장

			} catch (Exception e) {
				e.printStackTrace();   //System.out.println(e);과 같은 명령어

			}//try end 
		
		}//if end 
		map.put("filename", filename);
		map.put("filesize", filesize);
		
		attractionDao.attractioninsert(map);
		
		System.out.println(filename);
		System.out.println(filesize);
		
		
		
		return "redirect:/attraction/attractionList";  //행추가 완료 후 목록이동
	}//insert() end 
	
	
	
	
	//목록list
		@PostMapping("/attraction/attractionList")
		public ModelAndView list() {
			ModelAndView mav=new ModelAndView();
			mav.setViewName("attraction/attractionList");
			mav.addObject("attractionList", attractionDao.list());
			return mav;
		}//list() end 
	

	//상세보기
	@RequestMapping("/attractionDetail")
	public ModelAndView attractionDetail(@RequestParam int tour_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("attraction/attractionDetail");
		mav.addObject("attraction", attractionDao.detail(tour_code));
		return mav;
	}//attractionDetail() end 
	
	
	//삭제
	@RequestMapping("/delete")
	public String delete(int tour_code, HttpServletRequest req) {
		//삭제하고자 하는 파일명 가져오기
		String filename=attractionDao.filename(tour_code);
		
		//첨부된 파일 삭제하기
		if(filename != null && !filename.equals("-")){  //파일이 존재한다면~
			ServletContext application=req.getSession().getServletContext();
			String path=application.getRealPath("/storage");   //실제 물리적인 경로
			File file=new File(path + "\\" + filename);
			if(file.exists()) {        //파일에 다 모아놓고 -> 파일이존재한다면
				file.delete();			//그 파일 다 삭제해라~
			}//if end 
		}//if end 
		
		attractionDao.delete(tour_code);  //테이블 행 삭제
		
		return "redirect:/attraction/attractionList";
		
	}//delete() end 
	
	
	
	
	
	///////////////////////////////
	//수정
	@RequestMapping("/attraction/attractionUpdate")

	public String update(@RequestParam Map<String, Object> map
						, @RequestParam MultipartFile img
						,HttpServletRequest req) {

		String filename="-";
		long filesize=0;
		if(img !=null && !img.isEmpty()) {//파일이 존재한다면
			filename=img.getOriginalFilename();
			filesize=img.getSize();
			try {
				ServletContext application=req.getSession().getServletContext();
				String path=application.getRealPath("/storage");   //실제 물리적인 경로
				img.transferTo(new File(path+ "\\" + filename));   //파일저장
				
				
			}catch (Exception e) {
				e.printStackTrace();   //System.out.println(e);과 같은 명령어
			}//try end 
		}else{
			int tour_code=Integer.parseInt(map.get("tour_code").toString());
			Map<String, Object>attraction=attractionDao.detail(tour_code);
			filename=attraction.get("FILENAME").toString();
			filesize=Long.parseLong(attraction.get("FILESIZE").toString());
	
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		attractionDao.update(map);
		return "redirect:/attraction/attractionList";
	}//update()end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class end 
