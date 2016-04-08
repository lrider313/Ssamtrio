package com.genius.mapper;

import com.genius.model.Member;

public interface MemberMapper {
	Member signinCheck(Member member);
	int signupPro(Member member);
}
