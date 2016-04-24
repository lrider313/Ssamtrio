package com.genius.mapper;

import java.util.List;

import com.genius.model.Cart;

public interface CartMapper {
	int addCart(Cart cart);
	int addCartList(List<Cart> cartList);
	List<Integer> getCartList(String memid);
	int deleteCartByMapid(List<Integer> mapidList);
	int deleteAllCartListByMemid(String memid);
}
