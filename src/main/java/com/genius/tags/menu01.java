package com.genius.tags;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class menu01 extends SimpleTagSupport {
	private String uri;
	private String value;
	
	public void setUri(String uri) {
		this.uri = uri;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public void doTag() throws JspException, IOException {
		JspContext context = getJspContext();
		JspWriter out = context.getOut();
		
		StringBuffer tag = new StringBuffer();

		tag.append("<div class='openLeftSide'>");
		tag.append("<div class='menu01'>");
		tag.append("<img alt='menu01.jsp' src='../image/menu01.png' />");
		tag.append("<div class='text'>");
		tag.append("<a href='"+ uri +"' class='changePage'>"+value+"</a>");
		tag.append("</div>");
		tag.append("</div>");
		tag.append("</div>");
		
		out.println(tag);
		
	}
}
