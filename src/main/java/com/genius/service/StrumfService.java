package com.genius.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.genius.mapper.StrumfMapper;
import com.genius.model.Strumf;

@Service
public class StrumfService {
	@Autowired
	StrumfMapper strumfmapper;
	
	@Transactional
	public List<Strumf> getFileInfo(Integer strid) {
		return strumfmapper.selectByStrid(strid);
	}
	
	@Transactional
	public int uploadSMF(MultipartFile mapFile, Strumf strumf) {
		if(mapFile.getSize()>0) {
			strumf.setMapname(mapFile.getOriginalFilename());
			File saveFile = new File("D:/pjt/uploads", mapFile.getOriginalFilename());
			try {
				mapFile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return strumfmapper.uploadSMF(strumf);
	}
}
