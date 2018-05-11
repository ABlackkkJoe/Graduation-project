package cn.smbms.filter;

import cn.smbms.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SysFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest rq = (HttpServletRequest)servletRequest;
        HttpServletResponse rp = (HttpServletResponse)servletResponse;

        User userSession = (User)rq.getSession().getAttribute("userSession");
        if (null == userSession) {   // 说明未保存登录状态
            rp.sendRedirect(rq.getContextPath() + "/error.jsp");
        } else {
            // 如果保存了登录状态, 继续往下传
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
