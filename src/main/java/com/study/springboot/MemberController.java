package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.springboot.service.UsersService;

@Controller
public class MemberController {

	@Autowired
	private UsersService UsersService; 

	// 로그인화면
	@RequestMapping("member/login")
	public String login(Model model) {
		model.addAttribute("mainPage", "member/login.jsp");
		return "index";
	}

	//로그인
	
	/*
	 * @RequestMapping("member/loginAction") public String
	 * loginAction(@RequestParam("user_id") String userId, @RequestParam("user_pw")
	 * String userPw, HttpServletRequest request, Model model) {
	 * 
	 * int result = 0; result = usersDao.loginAction(userId, userPw);
	 * 
	 * if (result == 1) { System.out.println("로그인되었습니다.");
	 * request.getSession().setAttribute("userId", userId);
	 * request.getSession().setAttribute("userPw", userPw); return "member/login"; }
	 * else { System.out.println("로그인 실패하였습니다."); return "member/login";
	 * 
	 * } }
	 */
	 
	/*
	 * @PostMapping(path="member/login") public String
	 * login(@RequestParam(value="user_id") String
	 * user_id, @RequestParam(value="user_pw") String user_pw, HttpSession session)
	 * { System.out.println(user_id);
	 * if(UsersService.isUesrsInfoChk(user_id,user_pw,session)) {
	 * System.out.println("로그인되었습니다."); return "redirect:/main"; }else {
	 * System.out.println("로그인에 실패하였습니다."); return "member/login"; } }
	 */
	
	// 아이디.비밀번호 찾기
	@RequestMapping("member/idFind")
	public String idFind(Model model) {
		model.addAttribute("mainPage", "member/idFind.jsp");
		return "index";
	}

	// 회원가입
	@RequestMapping("member/join")
	public String join(Model model) {
		model.addAttribute("mainPage", "member/join.jsp");
		return "index";
	}
}
