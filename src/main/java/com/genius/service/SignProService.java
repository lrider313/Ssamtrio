package com.genius.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.mapper.MemberMapper;
import com.genius.model.Member;

@Service
public class SignProService {
	@Autowired
	MemberMapper membermapper;
	
	@Transactional
	public Member checkSignin(Member member) {
		return membermapper.signinCheck(member);
	}
	
	@Transactional
	public int signupPro(Member member) {
//		System.out.println("memid" + member.getMemid());
//		System.out.println("mempw" + member.getMempw());
//		System.out.println("memname" + member.getMemname());
//		System.out.println("memnick" + member.getMemnick());
//		System.out.println("memphone" + member.getMemphone());
//		System.out.println("memaddr" + member.getMemaddr());
		return membermapper.signupPro(member);
	}
	
	@Transactional
	public String checkExistId(String memid) {
		System.out.println(memid);
		if(membermapper.checkExistId(memid)==1){
			return "false";	//중복되는 값이 있으므로 false
		} else {
			return "true";	//중복되는 값이 없을때 true
		}
	}
}