package com.study.springboot;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.study.springboot.dao.galleryDao;
import com.study.springboot.dto.galleryDto;
import com.study.springboot.service.GalleryService;

@Controller
public class UploadController {
	@Autowired
	GalleryService galleryService;
	@Autowired
	galleryDao galleryDao;

	// 관리자 사진첩
	@RequestMapping("/admin/admin_photo")
	public String admin_photo(Model model) {

		List<galleryDto> galleryList = galleryDao.galleryDto();
		model.addAttribute("galleryList", galleryList);

		model.addAttribute("mainPage", "admin/admin_photo.jsp");
		return "index";
	}

	// 파일업로드 설정
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(200000000); // 200MB
		multipartResolver.setMaxInMemorySize(200000000);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}

	// 사진첩 등록
	@RequestMapping(value = "admin/uploadOk", method = RequestMethod.POST)
	@ResponseBody
	public String uploadOk(@RequestParam(value = "gallery_title") String galleryTitle,
						   @RequestParam(value = "gallery_content") String galleryContent,
						   @RequestParam(value = "image", required = false) MultipartFile file, galleryDto dto,
							HttpServletRequest request, Model model) {

		String galleryId = (String) request.getSession().getAttribute("user_id");

		dto.setGallery_id(galleryId);
		dto.setGallery_title(galleryTitle);
		dto.setGallery_content(galleryContent);

		System.out.println("gallery_title:" + galleryTitle);
		System.out.println("gallery_content:" + galleryContent);
		System.out.println("filename:" + file);

		// 업로드 파일 처리
		if (file.getOriginalFilename() != "") {
			String image = galleryService.restore(file, galleryId);
			System.out.println(image);
			if (image != null) {
				if (image.length() > 0) {
					dto.setGallery_image(image);
					System.out.println("업로드 성공!");
				} else {
					System.out.println("업로드 실패!");
				}
			} else {
				System.out.println("업로드 실패!");
			}
		}

		int result = galleryService.insertGallery(dto);

		if (result != 1) {
			System.out.println("글작성을 실패했습니다.");
			return "<script>alert('작성 실패');history.back();</script>";
		} else {
			System.out.println("글작성을 성공했습니다.");
			return "<script>alert('사진첩이 등록되었습니다.'); location.href='/admin/admin_photo';</script>";
		}
	}

	// 사진첩 조회
	@RequestMapping("/admin/admin_photoView")
	public String admin_photoView(@RequestParam("gallery_idx") int galleryIdx, Model model) {

		galleryDto galleryView = galleryService.gallery(galleryIdx);
		model.addAttribute("galleryView", galleryView);

		List<galleryDto> galleryList = galleryDao.galleryDto();
		model.addAttribute("galleryList", galleryList);

		model.addAttribute("mainPage", "admin/admin_photoView.jsp");
		return "index";
	}

	// 사진첩 수정
	
	 @RequestMapping("/admin/admin_photoRevise")
	 public String admin_photoRevise(@RequestBody Map<String, String> revise, Model model) { 
		 galleryDao.photoRevise(revise); 
		 model.addAttribute("mainPage", "admin/admin_photoView"); 
		 return "redirect:/board/visitor"; 
		 }

		/*
		 * // UploadController
		 * 
		 * @RequestMapping("/uploadAjaxAction") public void
		 * uploadAjaxPost(MultipartFile[] uploadFile) {
		 * 
		 * String uploadFolder = "C:\\upload_data\\temp";
		 * 
		 * for(MultipartFile multipartFile : uploadFile) {
		 * 
		 * String uploadFileName = multipartFile.getOriginalFilename();
		 * 
		 * uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +
		 * 1);
		 * 
		 * File saveFile = new File(uploadFolder, uploadFileName);
		 * 
		 * try { multipartFile.transferTo(saveFile); } catch(Exception e) {
		 * System.out.println(e); } }
		 * 
		 * }
		 * 
		 */
	// 사진첩
	@RequestMapping("/board/photo")
	public String photo(@RequestParam("gallery_idx") int galleryIdx, Model model) {

		galleryDto galleryView = galleryService.gallery(galleryIdx);
		model.addAttribute("galleryView", galleryView);

		List<galleryDto> galleryList = galleryDao.galleryDto();
		model.addAttribute("galleryList", galleryList);

		model.addAttribute("mainPage", "board/photo.jsp");
		return "index";
	}

	// 사진첩
	@RequestMapping("/board/photoList")
	public String photoList(Model model) {

		List<galleryDto> photoList = galleryDao.galleryDto();
		model.addAttribute("photoList", photoList);
		model.addAttribute("mainPage", "board/photoList.jsp");
		return "index";
	}

}