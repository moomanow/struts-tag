package com.moomanow.web.struts.components;

import java.io.Writer;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.annotations.StrutsTag;
import org.apache.struts2.views.annotations.StrutsTagAttribute;

import com.moomanow.authentication.bean.UserAuthenticationBean;
import com.moomanow.web.struts.StrutsMooAuthenticationConstants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.inject.Inject;
import com.opensymphony.xwork2.util.ValueStack;

@StrutsTag(name="authen", tldBodyContent="JSP", tldTagClass="com.moomanow.web.struts.views.jsp.ui.AuthenTag", description="Assigns a value to a variable in a specified scope")
public class Authen extends Component {

    Boolean answer;
    String code;
    protected String sessionUserBeanKey = StrutsMooAuthenticationConstants.SESSION.USER_BEAN_KEY;
    
    @Inject(value = StrutsMooAuthenticationConstants.STRUTS.USER_BEAN_KEY, required = false)
    public void setSessionUserBeanKey(String sessionUserBeanKey) {
        this.sessionUserBeanKey = sessionUserBeanKey;
    }
    @StrutsTagAttribute(description="authen code", type="String,...,String", required=true)
    public void setCode(String code) {
		this.code = code;
	}
	public Authen(ValueStack stack) {
		super(stack);
	}

    public boolean start(Writer writer) {
    	Map<String, Object> session = ActionContext.getContext().getSession();
    	UserAuthenticationBean userBean = (UserAuthenticationBean) session.get(sessionUserBeanKey);
		Set<String> privileges;
		if( userBean != null){
			privileges = userBean.getPrivileges();
		}else{
			privileges = new HashSet<String>();
		}
    	String[] privilegesCode = code.split(",");
		for (String privilege : privilegesCode) {
			if(privileges.contains(privilege)) {
				return true;
			}
		}
		//No privilege
		return false;
    }
    
    public boolean end(Writer writer, String body) {
        return super.end(writer, body);
    }
}
