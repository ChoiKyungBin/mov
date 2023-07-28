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
import org.springframework.web.multipart.MultipartFile;

import com.human.service.IF_FreeBoardService;
import com.human.util.FileDataUtil;
import com.human.vo.FreeBoardVO;
import com.human.vo.PageVO;
import com.human.vo.PageVO;

@Controller
public class FreeBoardController {
	@Inject
	IF_FreeBoardService svs;
	@Inject
	FileDataUtil util;

	@RequestMapping(value = "/freeBoard", method = RequestMethod.GET)
	public String freeBoard(Locale locale, Model model, PageVO pvo) throws Exception {
		if (pvo.getPage() == null) {
			pvo.setPage(1);
		}

		pvo.setPerPageNum(20);
		pvo.setTotalCount(svs.countList());
		pvo.calcPage();
		model.addAttribute("List", svs.selectList(pvo));
		model.addAttribute("pageVO", pvo);
		//

		return "freeBoard";
	}

	@RequestMapping(value = "/f_input", method = RequestMethod.GET)
	public String f_input(Locale locale, Model model) throws Exception {

		return "f_input";
	}

	@RequestMapping(value = "/f_input_save", method = RequestMethod.POST)
	public String f_input_save(Locale locale, Model model, MultipartFile file, @ModelAttribute("") FreeBoardVO fvo,
			HttpSession session) throws Exception {
		String filename = util.fileUpload(file);
		fvo.setF_filename(filename);
		String u_id = (String) session.getAttribute("userId");
		String u_name = (String) session.getAttribute("userName");
		model.addAttribute("u_id", u_id);
		model.addAttribute("u_name", u_name);
		svs.insert(fvo);
		return "freeBoard";
	}

	@RequestMapping(value = "/detailBoard", method = RequestMethod.GET)
	public String detailBoard(Locale locale, Model model, @RequestParam("f_num") int f_num) throws Exception {
		model.addAttribute("datile", svs.detailView(f_num));
		return "detailBoard";
	}

	@RequestMapping(value = "/modifyBoard", method = RequestMethod.GET)
	public String modifyBoard(Locale locale, Model model, @RequestParam("f_num") int f_num) throws Exception {
		model.addAttribute("datile", svs.detailView(f_num));
		return "modifyBoard";
	}

	@RequestMapping(value = "/modifyBoard_save", method = RequestMethod.GET)
	public String modifyBoard_save(Locale locale, Model model, @ModelAttribute("") FreeBoardVO fvo) throws Exception {
		svs.modifyBoard(fvo);
		return "redirect:freeBoard";
	}

	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(Locale locale, Model model, @RequestParam("f_num") int f_num) throws Exception {
		svs.selectDelete(f_num);
		return "redirect:freeBoard";
	}

}
