package team.lazybear.bearbnb.defense;

import javax.servlet.DispatcherType;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class XssFilterConfiguration {
	/**
	 * xss过滤拦截器註冊到 spring
	 */
	@Bean
	public FilterRegistrationBean xssFilterRegistrationBean() {
		FilterRegistrationBean initXssFilterBean = new FilterRegistrationBean();
		initXssFilterBean.setFilter(new XSSEscapeFilter());
		initXssFilterBean.setOrder(1);
		initXssFilterBean.setEnabled(true);
		initXssFilterBean.addUrlPatterns("/member/*");
		initXssFilterBean.setDispatcherTypes(DispatcherType.REQUEST);
		return initXssFilterBean;
	}
}
