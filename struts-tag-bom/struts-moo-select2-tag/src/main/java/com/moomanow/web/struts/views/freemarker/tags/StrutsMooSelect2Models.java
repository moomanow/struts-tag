package com.moomanow.web.struts.views.freemarker.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.util.ValueStack;

public class StrutsMooSelect2Models {
    private ValueStack stack;
    private HttpServletRequest req;
    private HttpServletResponse res;
    
    private Select2Model select2Model;
	
	public StrutsMooSelect2Models(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
        this.stack = stack;
        this.req = req;
        this.res = res;
    }
	
    public Select2Model getSelect2() {
    	if(select2Model ==null){
    		select2Model = new Select2Model(stack, req, res);
    	}
		return select2Model;
	}
}
