package com.genius.service;

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
	public Strumf getFileInfo(Integer strid) {
		return strumfmapper.selectByStrid(strid);
	}
	
	@Transactional
	public int uploadSMF(MultipartFile mapFile, Strumf strumf) {
		return uploadSMF(strumf);
	}
}
