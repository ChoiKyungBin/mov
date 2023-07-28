package com.human.movies;

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

import com.human.service.IF_ServiceCenterService;
import com.human.vo.PageVO;
import com.human.vo.ServiceCenterVO;

@Controller
public class ServiceCenterController {

	@Inject
	IF_ServiceCenterService scsvs;

	// 질문게시판 게시글 내역
	@RequestMapping(value = "/serviceCenter", method = RequestMethod.GET)
	public String serviceCenter(Locale locale, Model model, PageVO pvo) throws Exception {
		if (pvo.getPage() == null) {
			pvo.setPage(1);
		}
		pvo.setTotalCount(scsvs.listCount());
		pvo.calcPage();
		model.addAttribute("cntList", scsvs.cntList());
		model.addAttribute("sclist", scsvs.scSelect(pvo));
		model.addAttribute("pageVO", pvo);

		return "serviceCenter";
	}

	// 문의하기 폼
	@RequestMapping(value = "/sc_questions", method = RequestMethod.GET)
	public String sc_questions(Locale locale, Model model) throws Exception {
		return "sc_questions";
	}

	// 문의 저장
	@RequestMapping(value = "/sc_questions_input", method = RequestMethod.POST)
	public String sc_questions_input(Locale locale, Model model, @ModelAttribute("") ServiceCenterVO scvo,
			HttpSession session) throws Exception {
		String userId = (String) session.getAttribute("userId");
		scvo.setU_id(userId);
		System.out.println("아이디: " + scvo.getU_id());
		System.out.println(scvo.getSc_title());
		scsvs.scinsert(scvo);
		return "redirect:/serviceCenter";
	}

	// 질문 답변
	@RequestMapping(value = "/scUpdate", method = RequestMethod.POST)
	public String scUpdate(Locale locale, Model model, @ModelAttribute("scvo") ServiceCenterVO scvo) throws Exception {
		System.out.println("번호: " + scvo.getSc_num());
		System.out.println("답변: " + scvo.getSc_answer());
		scsvs.scUpdate(scvo);
		return "redirect:/serviceCenter";
	}

	// 검색기능(미완성)
	@RequestMapping(value = "/scSearch", method = RequestMethod.GET)
	public String scSearch(Locale locale, Model model, @RequestParam("sWord") String sWord) throws Exception {
//		System.out.println(Sword);
		model.addAttribute("searchList", scsvs.scSearch(sWord));
		return "serviceCenter";
	}

}