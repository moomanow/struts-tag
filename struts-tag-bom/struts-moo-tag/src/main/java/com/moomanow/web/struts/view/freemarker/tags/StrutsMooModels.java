package com.moomanow.web.struts.view.freemarker.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.util.ValueStack;

public class StrutsMooModels {
	private ValueStack stack;
    private HttpServletRequest req;
    private HttpServletResponse res;
    
    protected SetValueByStringModel setValueByString;
    
    public StrutsMooModels(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
        this.stack = stack;
        this.req = req;
        this.res = res;
    }
	
    
    public SetValueByStringModel getSetValueByString() {
    	if(setValueByString ==null){
    		setValueByString = new SetValueByStringModel(stack, req, res);
    	}
		return setValueByString;
	}
    
}
