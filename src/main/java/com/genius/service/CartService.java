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
	public Map<String, String> addCart(HttpSession session, Integer mapid) {
		int state = -1;
		Map<String, String> message = new HashMap<String, String>();
		message.put("state", "장바구니에 추가되었습니다.");
		if(session.getAttribute("member") != null) {
			Cart cart = new Cart();
			Member member = (Member) session.getAttribute("member");
			String memid = member.getMemid();
			cart.setMemid(memid);
			cart.setMapid(mapid);
			state = cartmapper.addCart(cart);
			if(state == -1) {
				message.replace("state", "장바구니에 추가할 수 없습니다.\n다시 시도해주세요.");
			}
		} else {
			if(session.getAttribute("cartList") != null) {
				@SuppressWarnings("unchecked")
				List<Integer> mapidList = (List<Integer>) session.getAttribute("cartList");
				if(mapidList.contains(mapid)==false) {
					mapidList.add(mapid);
				}
			} else {
				List<Integer> mapidList = new ArrayList<Integer>();
				mapidList.add(mapid);
				session.setAttribute("cartList", mapidList);
			}
		}
		return message;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String,String> addCartList(HttpSession session, List<Integer> mapidList){
		Map<String,String> message = new HashMap<String, String>();
		int state = -1;
		message.put("state", "장바구니에 추가되었습니다.");
		List<Integer> cartListParam = null;
		//로그인 됐다면 DB로 저장
		if(session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			String memid = member.getMemid();
			List<Integer> cartListFromDB = cartmapper.getCartList(memid); //DB에서 로그인한 ID에 대한 장바구니 정보를 전부 불러온다.

			//두 컬렉션의 합집합
			mapidList.addAll(cartListFromDB); //중복을 고려 않고 두 컬렉션 병합
			mapidList = new ArrayList<Integer>(new TreeSet<Integer>(mapidList)); //TreeSet을 통해 중복 제거 후 cartList에 담는다.
			
			//DB를 비우고 합집합을 넣는다.
			cartmapper.deleteAllCartListByMemid(memid);
			List<Cart> cartList = new ArrayList<Cart>();
			for(Integer i : mapidList) {
				Cart c = new Cart();
				c.setMapid(i);
				c.setMemid(memid);
				cartList.add(c);
			}
			System.out.println(cartList);
			state = cartmapper.addCartList(cartList); //return값이 0이면 삽입된게 없다. 1이상이면 삽입 성공.
			if(state == -1) {
				message.replace("state", "장바구니에 추가할 수 없습니다.\n다시 시도해주세요.");
			}
		}//로그인 끝
		//로그인 하지 않았다면 session에 장바구니 정보 저장.
		else {
			//기존의 cartList세션에 장바구니를 새로 추가하는 경우.
			if(session.getAttribute("cartList") != null) {
				cartListParam = (List<Integer>) session.getAttribute("cartList");
				mapidList.addAll(cartListParam);
				mapidList = new ArrayList<Integer>(new TreeSet<Integer>(mapidList));
				session.setAttribute("cartList", mapidList);
			} 
			//세션에 처음 cartList를 저장한다면
			else {
				session.setAttribute("cartList", mapidList);
			}
		}//비로그인 끝
		return message;
	}

	@Transactional
	public List<Strumn> getCartList(HttpSession session) {
		//version 2.0
		if(session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			String memid = member.getMemid();
			List<Integer> mapidList = cartmapper.getCartList(memid);
			if(!mapidList.isEmpty()) {
				return strumnmapper.getListByMapList(mapidList);
			} else {
				return null;
			}
		} else if(session.getAttribute("cartList") != null) {
			@SuppressWarnings("unchecked")
			List<Integer> mapidList = (List<Integer>) session.getAttribute("cartList");
			return strumnmapper.getListByMapList(mapidList);
		} else {
			return null;
		}
	}
	
	@Transactional
	public int addCartListOnSignin(HttpSession session) {
		int state = -1; //의미: return값이 -1일 때 데이터를 삽입하는 DB 처리 안된 것(DB안에 이미 장바구니 정보가 모두 있을 때 별도의 데이터 삽입이 이뤄지지 않는다).
		
		//SignController에서 이 메소드를 호출하기 전에 세션의 member가 있다는 것을 확인.
		Member member = (Member) session.getAttribute("member");
		String memid = member.getMemid();
		List<Integer> cartListFromDB = cartmapper.getCartList(memid); //DB에서 로그인한 ID에 대한 장바구니 정보를 전부 불러온다.
		
		//SignController에서 이 메소드를 호출하기 전에 세션의 cartList가 있다는 것을 확인.
		@SuppressWarnings("unchecked")
		List<Integer> mapidList = (List<Integer>) session.getAttribute("cartList"); //Session 내의 장바구니 정보를 불러온다.
		log.info("병합점: " + mapidList);
		
		//두 컬렉션의 합집합
		mapidList.addAll(cartListFromDB); //중복을 고려 않고 두 컬렉션 병합
		mapidList = new ArrayList<Integer>(new TreeSet<Integer>(mapidList)); //TreeSet을 통해 중복 제거 후 cartList에 담는다.
		log.info("병합후: " + mapidList);
		
		//DB를 비우고 합집합을 넣는다.
		cartmapper.deleteAllCartListByMemid(memid);
		List<Cart> cartList = new ArrayList<Cart>();
		for(Integer i : mapidList) {
			Cart c = new Cart();
			c.setMapid(i);
			c.setMemid(memid);
			cartList.add(c);
		}
		System.out.println(cartList);
		state = cartmapper.addCartList(cartList); //return값이 0이면 삽입된게 없다. 1이상이면 삽입 성공.
		if(state>=1) {
			session.removeAttribute("cartList");
		}
		return state;
	}
	
	@Transactional
	public Map<String,String> deleteCartByMapid(List<Integer> mapidList, HttpSession session) {
		Map<String,String> message = new HashMap<String,String>();
		int state =-1;
		message.put("state", "제거됐습니다.");
		if(session.getAttribute("member") != null) {
			state = cartmapper.deleteCartByMapid(mapidList);
			if(state<1){
				message.replace("state", "\n 다시시도해주세요.");
			}
		} else {
			if(session.getAttribute("cartList") != null) {
				@SuppressWarnings("unchecked")
				List<Integer> mapidListSession = (List<Integer>) session.getAttribute("cartList");
				mapidListSession.removeAll(mapidList);
				if(mapidListSession.isEmpty()) session.removeAttribute("cartList");
				else session.setAttribute("cartList", mapidListSession);
			} else {
				message.replace("state", " 제거에 실패했습니다.\n페이지를 새로고침해서 확인하세요.");
			}
		}
		return message;
	}
}