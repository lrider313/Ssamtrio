package com.genius.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.mapper.CartMapper;
import com.genius.mapper.StrumnMapper;
import com.genius.model.Cart;
import com.genius.model.Member;
import com.genius.model.Strumn;

@Service
public class CartService {
	Log log = LogFactory.getLog(CartService.class);
	
	@Autowired
	CartMapper cartmapper;
	
	@Autowired
	StrumnMapper strumnmapper;
	
	@Transactional
	public int addCart(HttpSession session, Cart cart) {
		int state = -1;
		List<Cart> cartList = null;
		//로그인한 상태라면
		if(session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			cart.setMemid(member.getMemid());
			state = cartmapper.addCart(cart);
			//세션에 cartList가 존재한다면(로그인 안한 상태에서 장바구니에 저장한 값이 있다면)
			if(session.getAttribute("cartList") != null) {
				System.out.println("cartList가 존재: 장바구니 정보 session->db");
				@SuppressWarnings("unchecked")
				//세션에 저장된 장바구니 정보를 불러옴
				List<Cart> scart = (List<Cart>) session.getAttribute("cartList");
				//cartList세션에 있는 값을 하나씩 가져와서 DB에 저장.
				for(Cart c: scart) {
					cart.setMapid(c.getMapid());
					//insert문이 실패했다면 프린트
					if(cartmapper.addCart(cart) != 1) {
						System.out.println("cartList세션값 insert실패 실패한 mapid:" + c.getMapid());
						state=0;
					}
				}
				//세션에 있는 값을 DB로 다 옮긴 후 cartList세션 제거.
				session.removeAttribute("cartList");
				state = 1;
			}
		} else {
			if(session.getAttribute("cartList") == null){
				System.out.println("cartListIsNull");
				cartList = new ArrayList<>();
				cartList.add(cart);
			}
			System.out.println("addCartListToSession");
			session.setAttribute("cartList", cartList);
		}
		return state;
	}
	
	@Transactional
	public Map<String,String> addCartList(HttpSession session, List<String> cartList){
		Map<String,String> message = new HashMap<String, String>();
		message.put("state", "success");
		//로그인 됐다면 DB로 저장
		if(session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			Cart cart = new Cart();
			cart.setMemid(member.getMemid());
			//세션에 넣어놓은 장바구니 정보가 있다면 걔부터 DB로 저장.
			if(session.getAttribute("cartList") != null) {
				@SuppressWarnings("unchecked")
				List<String> cartListTemp = (List<String>) session.getAttribute("cartList"); 
				for(String s : cartListTemp) {
					cart.setMapid(Integer.parseInt(s));
					if(cartmapper.addCart(cart) != 1) {
						message.clear();
						message.put("state", "fail");
						log.info("mapid가 " + s + "인 부분에서 장바구니 추가 실패");
					}
				}
			}
			//인자로 받아온 장바구니 정보가 있다면 DB로 저장
			if(cartList != null) {
				for(String s: cartList) {
					cart.setMapid(Integer.parseInt(s));
					if(cartmapper.addCart(cart) != 1) {
						message.clear();
						message.put("state", "fail");
						log.info("mapid가 " + s + "인 부분에서 장바구니 추가 실패");
					}
				}
			}
		} 
		//로그인 하지 않았다면 session에 장바구니 정보 저장.
		else {
			//기존의 cartList세션에 장바구니를 새로 추가하는 경우.
			if(session.getAttribute("cartList") != null) {
				@SuppressWarnings("unchecked")
				List<String> cartListTemp = (List<String>) session.getAttribute("cartList");
				//임시변수에 기존의 장바구니 리스트를 넣고 새로운 장바구니 리스트도 추가.
				for(String s : cartList) {
					cartListTemp.add(s);
				}
				//TreeSet을 통해 중복제거
				List<String> cartListTemp2 = new ArrayList<>(new TreeSet<>(cartListTemp));
				//중복 제거한 list를 session에 새로이 담는다.
				session.setAttribute("cartList", cartListTemp2);
			} 
			//세션에 처음 cartList를 저장한다면
			else {
				session.setAttribute("cartList", cartList);
			}
		}
		return message;
	}

	@Transactional
	public List<Strumn> getCartList(String memid) {
		List<Strumn> list = new ArrayList<>(); 
		List<Cart> cartList = cartmapper.getCartList(memid);
		for(Cart s : cartList) {
			list.add(strumnmapper.getListByMI(s.getMapid()));
		}
		System.out.println(list);
		return list;
	}
}
