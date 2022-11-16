package team.lazybear.bearbnb.defense;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

/*
 这个Filter 是可以拦截到请求的
 */

public class XSSEscapeFilter extends HttpFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// XssHttpServletRequestWrapper 是自己定義的類
		// 攔截request 確定有沒有圖謀不軌的東西，去掉之後再回傳改過乾淨的request
		chain.doFilter(new XssHttpServletRequestWrapper((HttpServletRequest) request), response);
//		System.out.println(" Filter執行了！");
//		chain.doFilter(request, response);

	}

	public XSSEscapeFilter() {
		super();
	}

}
