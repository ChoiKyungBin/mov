package com.human.movies;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.service.IF_M_WishListService;
import com.human.service.IF_ServiceCenterService;
import com.human.service.IF_UserService;

@Controller
public class AjaxController {

	@Inject
	IF_UserService usvs;
	@Inject
	IF_ServiceCenterService scsvs;
	@Inject
	IF_M_WishListService wsvs;

	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int u_idCheck(@RequestParam("u_id") String u_id) throws Exception {
		int result = usvs.idDuplicateCheck(u_id);
		return result;
	}

	@RequestMapping(value = "/cntplus", method = RequestMethod.POST)
	@ResponseBody
	public void cntplus(Locale locale, Model model, @RequestParam("sc_num") int sc_num) throws Exception {
		System.out.println("sc_num : " + sc_num);
		scsvs.cntplus(sc_num);
	}

	// 찜등록.
	@RequestMapping(value = "/m_wishList_insert", method = RequestMethod.POST)
	@ResponseBody
	public int m_wishList_insert(Locale locale, Model model, @RequestParam("u_id") String u_id,
			@RequestParam("m_name") String m_name) throws Exception {
		int wishListSize = wsvs.myWishList(u_id).size();

		// query = select count(*) from m_wishList where u_id = u_id and m_name = m_name
		// result가 1이라면 중복, result가 0이라면 중복없음
		int result = wsvs.countWishList(u_id, m_name);

		if (wishListSize > 4) {
			return 2;
		} else if (result == 0) {
			// 5이하 일 때
			wsvs.insert(u_id, m_name);
			return 1;
		} else {
			return 3;
		}
	}

}
