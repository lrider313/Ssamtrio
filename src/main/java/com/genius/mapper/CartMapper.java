package com.genius.mapper;

import java.util.List;

import com.genius.model.Cart;

public interface CartMapper {
	int addCart(Cart cart);
	List<Cart> getCartList(String memid);
}
