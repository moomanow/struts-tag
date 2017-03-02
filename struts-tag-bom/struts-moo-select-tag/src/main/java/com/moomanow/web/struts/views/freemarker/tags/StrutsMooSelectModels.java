package com.moomanow.web.struts.views.freemarker.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.util.ValueStack;

public class StrutsMooSelectModels {
    private ValueStack stack;
    private HttpServletRequest req;
    private HttpServletResponse res;
    
    private SelectModel select2Model;
	
	public StrutsMooSelectModels(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
        this.stack = stack;
        this.req = req;
        this.res = res;
    }
	
    public SelectModel getSelect2() {
    	if(select2Model ==null){
    		select2Model = new SelectModel(stack, req, res);
    	}
		return select2Model;
	}
}
