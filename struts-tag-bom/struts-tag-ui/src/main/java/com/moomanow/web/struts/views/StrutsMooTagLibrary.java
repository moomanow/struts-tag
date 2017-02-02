package com.moomanow.web.struts.views;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.views.TagLibraryDirectiveProvider;
import org.apache.struts2.views.TagLibraryModelProvider;

import com.moomanow.web.struts.components.*;
import com.opensymphony.xwork2.util.ValueStack;

public class StrutsMooTagLibrary implements TagLibraryDirectiveProvider, TagLibraryModelProvider {

	
	
	@Override
	public Object getModels(ValueStack arg0, HttpServletRequest arg1, HttpServletResponse arg2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Class> getDirectiveClasses() {
		Class[] directives =
                new Class[]{
                        Paging.class,
                        Display.class
                };
        return Arrays.asList(directives);
	}

}
