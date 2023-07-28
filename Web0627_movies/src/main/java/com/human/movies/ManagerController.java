package com.human.movies;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.human.service.IF_MoviesService;
import com.human.service.IF_UserService;
import com.human.vo.PageVO;
import com.human.vo.UserVO;

@Controller
public class ManagerController {
	@Inject
	IF_UserService usvs;
	@Inject
	IF_MoviesService msvs;

	@RequestMapping(value = "/Manager", method = RequestMethod.GET)
	public String Manager(Locale locale, Model model, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("userId");
		UserVO myInfo = usvs.myInformation(id);
		model.addAttribute("myInfo", myInfo);
		return "manager";
	}

	@RequestMapping(value = "/MoviesManagerMent", method = RequestMethod.GET)
	public String MoviesManagerMent(Locale locale, Model model, HttpSession session, PageVO pvo) throws Exception {
		if (pvo.getPage() == null) {
			pvo.setPage(1);
		}
		pvo.setTotalCount(msvs.listCount());
		pvo.calcPage();

		model.addAttribute("MoviesList", msvs.moviesAllList(pvo));
		model.addAttribute("pageVO", pvo);
		return "MoviesManagerMent";
	}

	@RequestMapping(value = "/InUserManagerMent", method = RequestMethod.GET)
	public String InUserManagerMent(Locale locale, Model model, PageVO pvo) throws Exception {
		if (pvo.getPage() == null) {
			pvo.setPage(1);
		} else {
		}
		pvo.setTotalCount(usvs.listCount());
		pvo.calcPage();
		model.addAttribute("UsersList", usvs.inUserAllList(pvo));
		model.addAttribute("pageVO", pvo);
		return "InUserManagerMent";
	}
}
