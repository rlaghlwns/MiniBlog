package com.pro.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pro.dao.Member;
import com.pro.service.MemberService;

@Controller
public class ProfileController {

	@Autowired
	private MemberService ms;

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public ModelAndView profile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/profile");
		return mv;
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public ModelAndView profile(MultipartHttpServletRequest mpRequest, HttpSession session) throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/update");
		MultipartFile mpfile = mpRequest.getFile("file");
		System.out.println("pcon의 mpfile:" + mpfile);
		Member vo = (Member) session.getAttribute("login");

		if (mpfile.isEmpty() == false) {
			System.out.println("1실행");
			ms.updateProfile(mpfile, vo);
		} else {
			System.out.println("2실행");
			ms.updateProfile(null, vo);
		}

		return mv;
	}

	@RequestMapping("LoadImg*")
	public void viewBlob(HttpSession session, HttpServletResponse response, String usernickname) throws IOException {
		byte[] bytes = null;

		Member vo = (Member) session.getAttribute("login");
		if (usernickname != null) {
			vo = ms.selectMemberByNick(usernickname);
		}
		bytes = vo.getProfile();
		System.out.println("bytes?" + bytes);

		InputStream is = null;
		ServletOutputStream sos = null;
		OutputStream os = null;
		String contentType = "image/jpeg";
		response.setContentType(contentType);

		// 기본값
		if (bytes == null) {
			// path를 ctx로 지정해야함
//			String impagePath = "D:/자바기반 웹 개발자 8월 개강/spring/workspace/bbbbbbbbbbbbbbbbbbbbbb/src/main/webapp/resources/images/imageDefault.jpg";
			String rootPath = session.getServletContext().getRealPath("resources/images/");
			String imagePath = rootPath + "imageDefault.jpg";
			File file = new File(imagePath);

			FileItem fileItem = new DiskFileItem("mainFile", Files.probeContentType(file.toPath()), false,
					file.getName(), (int) file.length(), file.getParentFile());

			try {
				is = new FileInputStream(file);
				os = fileItem.getOutputStream();
				IOUtils.copy(is, os);

			} catch (IOException ex) {
			}

			MultipartFile multipartFile = new CommonsMultipartFile(fileItem);
			bytes = multipartFile.getBytes();

		}

		// 프로필 있을 경우, 없을 경우 공통 작업
		is = new ByteArrayInputStream(bytes);

		sos = response.getOutputStream();
		int binaryRead;
		while ((binaryRead = is.read()) != -1) {
			sos.write(binaryRead);
		}

	}
}
