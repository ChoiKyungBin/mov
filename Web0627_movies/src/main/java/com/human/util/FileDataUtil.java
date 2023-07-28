package com.human.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileDataUtil {

	@Resource(name = "uploadPath")
	private String uploadPath; // 소스는 안건드려 설정파일만 셋팅할래.

	// private String uploadPath="/tmp";

	// 컨트롤러의 응답이 view일 수도있고,
	// 컨트롤러의 응답이 json일 수도있고,
	// 컨트롤러의 응답이 파일데이터일수도있다.

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	@ResponseBody // json또는 파일데이터일수도있다. 리턴타입이 view가 아니다 객체이다.
	public FileSystemResource download(@RequestParam("filename") String filename, HttpServletResponse re)
			throws Exception {
		File file = new File(uploadPath + "/" + filename);
		re.setContentType("application/download); utf-8");
		re.setHeader("Content-Disposition", "attatchment; filename=" + filename);
		return new FileSystemResource(file);
	}

	public String fileUpload(MultipartFile file) throws IOException {
		// 1.컨트롤러가 받은 첨부파일을 내가 원하는 곳에(servlet_context uploadPath로 지정한 곳) 저장
		// 2.파일을 유니크하게 재정의함.
		String saveName = null;
		if (file.getOriginalFilename() != "") {
			String orName = file.getOriginalFilename();
			UUID uid = UUID.randomUUID(); // 랜덤 문자
			String[] arr = orName.split("\\.");
			saveName = uid.toString() + "." + arr[arr.length - 1];
			byte[] fileData = file.getBytes();// 첨부파일을 byte[]에 저장
			File target = new File(uploadPath, saveName); // 폴더위치에 파일 생성
			FileCopyUtils.copy(fileData, target);
		}
		return saveName;
	}
}
