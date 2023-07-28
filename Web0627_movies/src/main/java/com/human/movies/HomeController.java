package com.human.movies;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.human.service.IF_M_CommentService;
import com.human.service.IF_MoviesService;
import com.human.service.IF_UserService;
import com.human.util.FileDataUtil;
import com.human.vo.MoviesVO;
import com.human.vo.PageVO;
import com.human.vo.m_commentVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// 홈

	@Inject
	FileDataUtil util;
	@Inject
	IF_MoviesService msvs;
	@Inject
	IF_UserService usvs;
	@Inject
	IF_M_CommentService mcsvs;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {

		model.addAttribute("comedyview", msvs.comedyView());
		model.addAttribute("animationview", msvs.animationView());
		model.addAttribute("horrorview", msvs.horrorView());
		model.addAttribute("actionview", msvs.actionView());
		model.addAttribute("romanceview", msvs.romanceView());

		return "home";
	}



	// 영화등록 폼
	@RequestMapping(value = "/m_input", method = RequestMethod.GET)
	public String m_input(Locale locale, Model model) {
		return "m_input";
	}

	// 영화등록_저장
	@RequestMapping(value = "/m_input_save", method = RequestMethod.POST)
	public String m_input_save(Locale locale, Model model, @ModelAttribute("") MoviesVO mvo,
			@ModelAttribute("") MultipartFile file) throws Exception {
		String newName = util.fileUpload(file);
		mvo.setM_filename(newName);
		msvs.insertMovie(mvo);
		return "m_input";
	}

	// 메인홈에서 영화클릭
	@RequestMapping(value = "/list_view", method = RequestMethod.GET)
	public String list_view(Locale locale, Model model, PageVO pvo) throws Exception {
		if (pvo.getPage() == null) {
			pvo.setPage(1);
		} else {
		}
		pvo.setPerPageNum(6);
		pvo.setTotalCount(msvs.listCount());
		pvo.calcPage();
		List<MoviesVO> movies = msvs.movieList(pvo);
		model.addAttribute("pageVO", pvo);
		model.addAttribute("movies", movies);
		return "list_view";
	}

	// 영화검색_영화제목
	@RequestMapping(value = "/m_search", method = RequestMethod.GET)
	public String search_m(Locale locale, Model model, @RequestParam("m_word") String Sword) throws Exception {
		if (msvs.searchMovie(Sword) != null) {
			model.addAttribute("smovie", msvs.searchMovie(Sword));
		} else {
			model.addAttribute("falseList", "테스트용");
		}
		return "list_view";
	}

	// 영화삭제_영화제목
	@RequestMapping(value = "/m_delete", method = RequestMethod.GET)
	public String delete_m(Locale locale, Model model) {
		return "redirect:list_view";
	}

	// 영화수정 폼
	@RequestMapping(value = "/m_mod", method = RequestMethod.GET)
	public String mod_m(Locale locale, Model model) {

		return "m_mod";
	}

	// 영화수정 _저장
	@RequestMapping(value = "/m_mod_save", method = RequestMethod.GET)
	public String mod_m_save(Locale locale, Model model) {

		return "redirect:list_view";
	}

	// 영화자세히보기
	@RequestMapping(value = "/m_detail", method = RequestMethod.GET)
	public String m_detail(Locale locale, Model model, @RequestParam("m_name") String m_name, HttpSession session,
			PageVO pvo) throws Exception {

		// 영화 제목이 있어야됨
		String userId = (String) session.getAttribute("userId");
		if (pvo.getPage() == null) {
			pvo.setPage(1);
			pvo.setTotalCount(mcsvs.listCount(m_name));
		} else {
		}
		model.addAttribute("m_detail", msvs.m_detail(m_name));
		pvo.setTotalCount(mcsvs.listCount(m_name));
		pvo.calcPage();
		model.addAttribute("listSize", mcsvs.listCount(m_name));
		model.addAttribute("u_id", userId); // 세션에 저장된 아이디 jsp 파일로 넘겨줌,
		model.addAttribute("commentList", mcsvs.selectComment(pvo));
		model.addAttribute("pageVO", pvo);
		// 총 리스트의 사이즈를 구하는 매퍼를 만들어야됨.
		return "m_detail_view";
	}

	// 영화자세히보기 _ 댓글달기
	@RequestMapping(value = "/m_detail_c", method = RequestMethod.GET)
	public String movie_input_c(Locale locale, Model model, @ModelAttribute("") m_commentVO mcvo) throws Exception {
		mcsvs.insert(mcvo);
		String encodedMName = URLEncoder.encode(mcvo.getM_name(), "UTF-8");
		System.out.println("댓글달기 후 영화이름 " + mcvo.getM_name());
		return "redirect:/m_detail?m_name=" + encodedMName;
	}

	// 영화자세히보기 _ 댓글삭제
	@RequestMapping(value = "/m_detaile_c_remove", method = RequestMethod.GET)
	public String m_detaile_c_remove(Locale locale, Model model, @ModelAttribute("") @RequestParam("u_id") String u_id,
			@RequestParam("c_comment") String c_comment, @RequestParam("m_name") String m_name) throws Exception {
//		System.out.println("삭제 확인용입니다" + u_id);
//		System.out.println("삭제 확인용입니다" + c_comment);
//		System.out.println("삭제 시 영화 이름 : " + m_name);
		mcsvs.delC(u_id, c_comment);
		String encodedMName = URLEncoder.encode(m_name, "UTF-8");
		return "redirect:/m_detail?m_name=" + encodedMName;
	}

	// 주변 영화관 검색.
	@RequestMapping(value = "/m_nearbyCinema", method = RequestMethod.GET)
	public String m_nearbyCinema(Locale locale, Model model, HttpSession s) throws Exception {
		String nowId = (String) s.getAttribute("userId");
		String nowId_addr = usvs.myInformation(nowId).getU_addr().split(",")[1];
		model.addAttribute("loginUser", usvs.myInformation(nowId));
		model.addAttribute("nowId_addr", nowId_addr);
		return "m_nearbyCinema";
	}

	@RequestMapping(value = "/viewview", method = RequestMethod.GET)
	public String test3(Locale locale, Model model) throws Exception {
		return "viewview";
	}

}