package com.genius.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.genius.model.Strumf;
import com.genius.model.Strumn;
import com.genius.service.BoardService;
import com.genius.service.StrumfService;
import com.genius.service.StrumnService;

@Controller
@RequestMapping("/strboard")
public class StrController {
	
	//이 Autowired는 XML에서 설정한 Bean이 아닌 StrumnListService.java파일의 @Service Annotation을 통해 자동 주입하고 있다.
	@Autowired
	StrumnService strumnService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	StrumfService strumfService;
	
	@RequestMapping("/list.str")
	public ModelAndView list() {
		return new ModelAndView("strboard/list").addObject("list", strumnService.getList());
	}
	
	@RequestMapping("/write.str")
	public ModelAndView write() {
		return new ModelAndView("strboard/write").addObject("boardList", boardService.getBoardList());
	}
	
	@RequestMapping("/insertStrumn.str")
	public void insertStrumn(Strumn strumn, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		int state = strumnService.insertStrumn(strumn, request, session);
		response.setCharacterEncoding("EUC-KR");
		PrintWriter writer = response.getWriter();
		writer.println("<script type='text/javascript'>");
		if(state==1) {
			writer.println("alert('맵카테고리를 추가하였습니다.');");
			writer.println("location.href='/Ssamtrio/strboard/list.str';");

		} else if(state==-1){
			writer.println("alert('해당 서비스는 로그인이 필요합니다.');");
			writer.println("location.href='/Ssamtrio/sign/signinForm.str';");
		} else {
			writer.println("alert('맵카테고리를 추가하지 못했습니다.');");
			writer.println("location.href='/Ssamtrio/strboard/list.str';");
		}
		writer.println("</script>");
		writer.flush();
	}
	
	@RequestMapping("/getFileInfo.str")
	public @ResponseBody List<Strumf> getFileInfo(Integer strid) {
		return strumfService.getFileInfo(strid);
	}
	
	@RequestMapping("/upMapFileForm.str")
	public ModelAndView upMapFile() {
		return new ModelAndView("/strboard/upMapFileForm").addObject("strumnList", strumnService.getList());
	}
	
	@RequestMapping("/uploadSMF.str")
	public void uploadSMF(MultipartFile mapFile, Strumf strumf, HttpServletResponse response) throws IOException {
		int state = strumfService.uploadSMF(mapFile, strumf);
		response.setCharacterEncoding("EUC-KR");
		PrintWriter writer = response.getWriter();
		writer.println("<script type='text/javascript'>");
		if(state==1) {
			writer.println("alert('맵파일을 추가하였습니다.');");
			writer.println("location.href='/Ssamtrio/strboard/list.str';");
		} else if(state==-1){
			writer.println("alert('해당 서비스는 로그인이 필요합니다.');");
			writer.println("location.href='/Ssamtrio/sign/signinForm.str';");
		} else {
			writer.println("alert('맵파일을 추가하지 못했습니다.');");
			writer.println("location.href='/Ssamtrio/strboard/list.str';");
		}
		writer.println("</script>");
		writer.flush();
	}
	
	@RequestMapping("/downloadSMF.str")
	public void downlaodSMF(Strumf strumf, HttpServletResponse response) {
		Strumf mapFile =strumfService.selectByMapid(strumf.getMapid());
		response.setCharacterEncoding("UTF-8");
		
		File file = new File("D:/pjt/uploads/"+mapFile.getMapname());
		String downName = file.getName();

		byte[] bytes;
		try {
			bytes = downName.getBytes("euc-kr");
			downName = new String(bytes, "ISO-8859-1");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		response.setContentType("application/octet-stream"); 
		response.setHeader("Content-Disposition", "attachment;filename=\"" + downName + "\"");

		FileInputStream in = null;
		OutputStream out = null;
		try {
			in = new FileInputStream(file);
			out =  response.getOutputStream();
			FileCopyUtils.copy(in, out);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			strumfService.mapcountInc(strumf.getMapid());
		}
	}
}
