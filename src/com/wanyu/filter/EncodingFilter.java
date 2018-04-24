package com.wanyu.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;
import java.util.logging.Filter;

/**
 * Created by samsung on 2017/10/13.
 */
@WebFilter(urlPatterns = {"/*"},
        initParams =@WebInitParam(name="encoder",value = "utf-8") )
public class EncodingFilter implements javax.servlet.Filter {
    private String encod="";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encod=filterConfig.getInitParameter("encoder");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding(encod);
        filterChain.doFilter(servletRequest, servletResponse);//传入到下个过滤器或服务器资源
    }

    @Override
    public void destroy() {

    }
}
