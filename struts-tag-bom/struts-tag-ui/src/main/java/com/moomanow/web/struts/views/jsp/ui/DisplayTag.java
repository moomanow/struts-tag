
package com.moomanow.web.struts.views.jsp.ui;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ui.AbstractClosingTag;

import com.moomanow.web.struts.components.Display;
import com.opensymphony.xwork2.util.ValueStack;



public class DisplayTag extends AbstractClosingTag {

	public static int seq=1;
	
    private static final long serialVersionUID = 2792301046860819658L;

    public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
        return new Display(stack, req, res);
    }
    
    
    
    @Override
    protected void populateParams() {
    	super.populateParams();
    	
    	Display display = ((Display) component);
    	
    	display.setSeq(seq++);
    }
}
