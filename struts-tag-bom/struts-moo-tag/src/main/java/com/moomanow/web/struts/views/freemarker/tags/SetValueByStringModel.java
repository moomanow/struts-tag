package com.moomanow.web.struts.views.freemarker.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.freemarker.tags.TagModel;

import com.moomanow.web.struts.components.SetValueByString;
import com.opensymphony.xwork2.util.ValueStack;

public class SetValueByStringModel extends TagModel {

	public SetValueByStringModel(ValueStack stack, HttpServletRequest req,HttpServletResponse res) {
		super(stack, req, res);
	}

	@Override
	protected Component getBean() {
		return new SetValueByString(stack);
	}

}
