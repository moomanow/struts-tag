package com.moomanow.web.struts.views;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.views.TagLibraryDirectiveProvider;
import org.apache.struts2.views.TagLibraryModelProvider;

import com.moomanow.web.struts.components.Select2;
import com.moomanow.web.struts.views.freemarker.tags.StrutsMooSelect2Models;
import com.opensymphony.xwork2.util.ValueStack;

public class StrutsMooSelect2TagLibrary implements TagLibraryDirectiveProvider, TagLibraryModelProvider {

	
	
	@Override
	public Object getModels(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
		return new StrutsMooSelect2Models(stack, req, res);
	}

	@Override
	public List<Class> getDirectiveClasses() {
		Class[] directives =
                new Class[]{
                        Select2.class
                };
        return Arrays.asList(directives);
	}

}
