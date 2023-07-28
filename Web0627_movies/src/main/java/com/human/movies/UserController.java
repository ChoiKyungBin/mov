package com.human.movies;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.service.IF_M_WishListService;
import com.human.service.IF_UserService;
import com.human.vo.UserVO;

@Controller
public class UserController {

	@Inject
	IF_UserService usvs;
	@Inject
	IF_M_WishListService wsvs;

	// 회원가입_save
	@RequestMapping(value = "/u_input", method = RequestMethod.GET)
	public String u_input(Locale locale, Model model) throws Exception {
		// 여기에 작성.
		return "u_input";
	}

	// 회원가입_save
	@RequestMapping(value = "/u_input_save", method = RequestMethod.POST)
	public String u_input_save(Locale locale, Model model, @ModelAttribute("") UserVO uvo) throws Exception {
		// 여기에 작성.
		usvs.insertUser(uvo);
		return "login";
	}

	// 로그인.
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) throws Exception {

		// 여기에 작성.
		return "login";
	}

	// 로그인. 아이디입력
	@RequestMapping(value = "/login_save", method = RequestMethod.POST)
	public String login_save(Locale locale, Model model, @ModelAttribute() UserVO uvo, HttpSession s) throws Exception {

		if (usvs.loginCheck(uvo) == null) {
			// 로그인 실패
			model.addAttribute("loginFaul", "가입된 아이디가 없습니다.");
			return "login";
		} else {
			// 로그인 성공
			s.setAttribute("userId", usvs.loginCheck(uvo).getU_id()); // 세션에 유저아이디 저장.
			s.setAttribute("userName", usvs.loginCheck(uvo).getU_name()); // 세션에 유저 이름.
			s.setAttribute("grade", usvs.loginCheck(uvo).getU_grade()); // 세션에 유저 등급 저장.
			return "redirect:/";
			// redirect:
		}

	}

	// 아이디찾기.
	@RequestMapping(value = "/u_findId", method = RequestMethod.GET)
	public String u_foundId(Locale locale, Model model) throws Exception {
		// 여기에 작성.
		return "u_findId";
	}

	// 아이디찾기_save
	// 이메일 과 비밀번호 입력시 아이디 찾아내줌
	@RequestMapping(value = "/u_findId_save", method = RequestMethod.GET)
	public String u_foundId_save(Locale locale, Model model, @RequestParam("u_email") String u_email,
			@RequestParam("u_pw") String u_pw) throws Exception {
//			System.out.println(usvs.u_findId(uvo).getU_id());
//			System.out.println(usvs.u_findId(uvo).getU_pw());
		String findId = usvs.u_findId(u_email, u_pw);
		if (findId == null) {
			// 찾는 아이디가 없는경우
			model.addAttribute("findId", "아이디를 찾지 못했습니다.");
		} else {
			// 찾는 아이디가 있는경우
			model.addAttribute("findId", "찾으시는 아이디 : " + findId);
		}

		return "u_findId";
	}

	@RequestMapping(value = "/u_information", method = RequestMethod.GET)
	public String u_information(Locale locale, Model model, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("userId");
		UserVO myInfo = usvs.myInformation(id);
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("myWishList", wsvs.myWishList(id));
		return "u_information";
	}

	@RequestMapping(value = "/selectDelete", method = RequestMethod.GET)
	public String selectDelete(Locale locale, Model model, @RequestParam("u_id") String u_id,
			@RequestParam("m_name") String m_name, HttpSession session) throws Exception {
		System.out.println("ada" + u_id);
		System.out.println("dsd" + m_name);
		wsvs.selectDelete(u_id, m_name);
		String id = (String) session.getAttribute("userId");
		UserVO myInfo = usvs.myInformation(id);
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("myWishList", wsvs.myWishList(id));
		return "u_information";
	}

	// 비밀번호찾기.
	@RequestMapping(value = "/u_findPw", method = RequestMethod.GET)
	public String u_foundPw(Locale locale, Model model) throws Exception {

		return "u_findPw";
	}

	// 비밀번호찾기_save
	@RequestMapping(value = "/u_findPw_save", method = RequestMethod.GET)
	public String u_foundPw_save(Locale locale, Model model, @RequestParam("u_id") String u_id,
			@RequestParam("u_email") String u_email) throws Exception {
//		System.out.println(u_id);
//		System.out.println(u_email);
		String findPw = usvs.u_findPw(u_id, u_email);
		System.out.println("찾으시는 비밀번호는  : " + findPw);
		if (findPw == null) {
			// 찾는 아이디가 없는경우
			model.addAttribute("findPw", "비밀번호를 찾지 못했습니다.");
		} else {
			// 찾는 아이디가 있는경우
			model.addAttribute("findPw", "찾으시는 비밀번호는 : " + findPw);
		}
		return "u_findPw";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/myupdate", method = RequestMethod.POST)
	public String myupdate(Locale locale, Model model, @ModelAttribute("") UserVO uvo) throws Exception {
		usvs.myupdate(uvo);
		return "redirect:/";
	}

	@RequestMapping(value = "/delUser", method = RequestMethod.GET)
	public String delUser(Locale locale, Model model, @RequestParam("u_id") String u_id, HttpSession session)
			throws Exception {
		usvs.delUser(u_id);
		session.invalidate();
		return "redirect:/";
	}

	// int result = usvs.idDuplicateCheck(checkId);
	// result = 아이디가 중복되면 1 중복이없으면 0

}
