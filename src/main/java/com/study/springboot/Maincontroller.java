package com.study.springboot;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.study.springboot.dao.chatDao;
import com.study.springboot.dao.diaryDao;
import com.study.springboot.dao.galleryDao;
import com.study.springboot.dao.scheduleDao;
import com.study.springboot.dao.usersDao;
import com.study.springboot.dao.visitorDao;
import com.study.springboot.dto.diaryDto;
import com.study.springboot.dto.galleryDto;
import com.study.springboot.dto.visitorDto;

@Controller
public class Maincontroller {

	@Autowired
	private diaryDao diaryDao;

	@Autowired
	private chatDao chatDao;

	@Autowired
	private galleryDao galleryDao;

	@Autowired
	private scheduleDao scheduleDao;

	@Autowired
	private usersDao usersDao;

	@Autowired
	private visitorDao visitorDao;

	@RequestMapping("/")
	public String root() {
		return "redirect:main";
	}


	// 메인
	@RequestMapping("/main")
	public String main(Model model) {

		List<diaryDto> diaryDto = diaryDao.list();
		model.addAttribute("diaryDto", diaryDto);

		List<visitorDto> visitorDto = visitorDao.visitorView();
		model.addAttribute("visitorDto", visitorDto);
		
		List<galleryDto> galleryDto = galleryDao.galleryDto();
		model.addAttribute("galleryDto", galleryDto);
		
		
		model.addAttribute("mainPage", "main.jsp");
		return "index";
	}

	@RequestMapping("/board/about")
	public String about(Model model) {
		model.addAttribute("mainPage", "board/about.jsp");
		return "index";
	}

	// 게시판
	@RequestMapping("/board/diary")
	public String diary(@RequestParam(value = "diary_idx") int diary_idx, Model model) {

		diaryDto content = diaryDao.content(diary_idx);
		model.addAttribute("content", content);

		int listCount = diaryDao.listCount();
		model.addAttribute("listCount", listCount);

		List<diaryDto> contentList = diaryDao.list();
		model.addAttribute("contentList", contentList);

		model.addAttribute("mainPage", "board/diary.jsp");
		return "index";
	}

	// 게시판 검색
	@RequestMapping("/board/diarySearch")
	public String diarySearch(@RequestBody Map<String, String> diarySearch, Model model) {
		model.addAttribute("mainPage", "board/diary.jsp");
		return "index";
	}

	// 게시판 전체조회
	@RequestMapping("/board/diaryList")
	public String diary(Model model) {

		List<diaryDto> contentlist = diaryDao.list();

		model.addAttribute("contentlist", contentlist);
		model.addAttribute("mainPage", "board/diaryList.jsp");
		return "index";
	}

	@RequestMapping("/board/chat")
	public String chat(Model model) {
		model.addAttribute("mainPage", "board/chat.jsp");
		return "index";
	}

	@RequestMapping("/board/schedule")
	public String schedule(Model model) {
		model.addAttribute("mainPage", "board/schedule.jsp");
		return "index";
	}

	// 방명록
	@RequestMapping("/board/visitor")
	public String visitor(Model model) {
		List<visitorDto> visitorView = visitorDao.visitorView();
		model.addAttribute("visitorView", visitorView);
		model.addAttribute("mainPage", "board/visitor.jsp");
		return "index";
	}

	// 방명록 등록
	@RequestMapping("/board/visitorRegister")
	public String visitorRegister(@RequestBody Map<String, String> register) {
		visitorDao.visitorRegister(register);
		return "redirect:/board/visitor";
	}

	// 방명록 삭제
	@RequestMapping("/board/deleteVisitor")
	public @ResponseBody String deleteVisitor(@RequestParam("visitor_idx") String visitor_idx, Model model) {
		int delete = visitorDao.deleteVisitor(Integer.parseInt(visitor_idx));
		if (delete == 1) {
			return "redirect:/board/visitor";
		} else {
			return "<script>alert('삭제 실패');history.back();</script>";
		}
	}

	// 방명록 수정
	@RequestMapping("/board/reviseVisitor")
	public String reviseVisitor(@RequestBody Map<String, String> revise, Model model) {
		visitorDao.reviseVisitor(revise);
		model.addAttribute("mainPage", "board/visitor");
		return "redirect:/board/visitor";
	}

	// 다이어리
	@RequestMapping("/admin/admin_diary")
	public String admin_diary(Model model) {

		List<diaryDto> contentlist = diaryDao.list();
		model.addAttribute("contentlist", contentlist);
		model.addAttribute("mainPage", "admin/admin_diary.jsp");
		return "index";
	}
	
	//다이어리 관리자
	@RequestMapping("/admin/admin_diaryWrite")
	public String admin_diaryWrite (Model model) {
		model.addAttribute("mainPage", "admin/admin_diaryWrite.jsp");
		return"index";
	}
	
	@Configuration
	public class WebConfig {

		@Bean
		MappingJackson2JsonView jsonView() {
			return new MappingJackson2JsonView();
		}
	}
	
	@RequestMapping(value = "/image/upload")
	public ModelAndView image(MultipartHttpServletRequest request) throws Exception {
    
		ModelAndView mav = new ModelAndView("jsonView");
		MultipartFile uploadFile = request.getFile("upload");
		String originalFileName = uploadFile.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.indexOf("."));
		String newFileName = UUID.randomUUID() + ext;
		String realPath = request.getServletContext().getRealPath("/");
		String savePath = realPath + "upload/" + newFileName;
		String uploadPath = "../upload/" + newFileName; 

		File file = new File(savePath);

		uploadFile.transferTo(file);

		// uploaded, url 값을 modelandview를 통해 보냄
		mav.addObject("uploaded", true); // 업로드 완료
		mav.addObject("url", uploadPath); // 업로드 파일의 경로

		return mav;
	}
	//게시글 쓰기
  	@RequestMapping("/admin/WriteAction")
  	public String WriteAction (@RequestBody Map<String, String> dto) {
  		diaryDao.insertDiary(dto);
        return "redirect:/admin/admin_diaryWrite";
    }
  	
  	//게시글 삭제
  	@RequestMapping("/admin/deleteDiary")
  	public @ResponseBody String deleteDiary(@RequestParam(value="diary_idx", required=false) String diaryIdx,  Model model) {
  		int delete = diaryDao.deleteDiary(Integer.parseInt(diaryIdx));
  	
		if (delete == 1) {
			return "redirect:/admin/admin_diary";
		} else {
			return "<script>alert('삭제 실패');history.back();</script>";
		}
  	}
  	
  	//게시글수정
  	@RequestMapping("/admin/admin_diaryRevise")
  	public String admin_diaryRevise (@RequestParam(value="diary_idx") int diary_idx, Model model) {

  		diaryDto content = diaryDao.content(diary_idx);
		model.addAttribute("content", content);
  		model.addAttribute("mainPage", "admin/admin_diaryRevise.jsp");
  		return"index";
  	}
  	
  	@RequestMapping("/admin/admin_reviseAction")
  	public String admin_reviseAction(@RequestBody Map<String,String> dto ) {
  		diaryDao.reviseDiary(dto);
  			return "redirect:/admin/admin_diary";
  	}
  	
}
