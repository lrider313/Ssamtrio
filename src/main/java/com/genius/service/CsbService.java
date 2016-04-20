package com.genius.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.genius.mapper.CsbMapper;
import com.genius.model.Csb;

@Service
public class CsbService {
	
	@Autowired
	CsbMapper csbmapper;
	
	@Transactional
	public int insertCs(MultipartFile file, HttpServletRequest request, Csb csb) {
		csb.setCsip(request.getRemoteAddr());
		csb.setCsfile(file.getOriginalFilename());
		if (file.getSize() > 0) {
			File saveFile = new File("C:/pjt/src/Ssamtrio/src/main/webapp/csImage", file.getOriginalFilename());
			try {
				file.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				System.out.println("파일이없다");
				e.printStackTrace();
			}
		}
		return csbmapper.insertCs(csb);
	}
	
	@Transactional
	public List<Csb> selectCs(){
		return csbmapper.selectCs();
	}
	
	@Transactional
	public Csb selectById(Integer csid){
		return csbmapper.selectById(csid);
	}
	
	@Transactional
	public int updateCs(MultipartFile file, HttpServletRequest request,Csb csb){
		csb.setCsip(request.getRemoteAddr());
		String needChg = request.getParameter("needChg");
		if(needChg.equals("keep")){
			csb.setCsfile(csbmapper.selectById(csb.getCsid()).getCsfile());
		} else {
			csb.setCsfile(file.getOriginalFilename());
		}
		if (file.getSize() > 0) {
			File saveFile = new File("C:/pjt/src/Ssamtrio/src/main/webapp/csImage", file.getOriginalFilename());
			try {
				file.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return csbmapper.updateCs(csb);
		//동일 하게 모델 csb 선언한거로 받음 
		//매퍼인가 먼가 여기에 업데이트cs로 던짐 
		// 굳이 왜 나눈진 모르겟음...
		//암튼 위에 임포트 시킨거로 보고 임포트시킨 매퍼에 업데이트cs로 던짐 통쨰로 
	}
	
	
	@Transactional
	public int deleteCs(Integer csid){
		return csbmapper.deleteCs(csid);
	}

}
