package com.moomanow.web.struts.views.freemarker.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.util.ValueStack;

public class StrutsMooModels {
    private ValueStack stack;
    private HttpServletRequest req;
    private HttpServletResponse res;
	
	public StrutsMooModels(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
        this.stack = stack;
        this.req = req;
        this.res = res;
    }
}
