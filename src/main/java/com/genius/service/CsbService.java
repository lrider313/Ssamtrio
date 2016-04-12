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
			File saveFile = new File("C:/temp", file.getOriginalFilename());
			try {
				file.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
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
	public int updateCs(Csb csb){
		return csbmapper.updateCs(csb);
	}
	
	

}
