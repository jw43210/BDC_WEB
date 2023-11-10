package com.easyfactory.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp");
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("redirect:/main");
		registry.addViewController("/main").setViewName("main");
		registry.addViewController("/main2").setViewName("main2");
		
		registry.addViewController("/member/signup").setViewName("member/signup");
		registry.addViewController("/member/update").setViewName("member/update");
		registry.addViewController("/member/updateCheck").setViewName("member/updateCheck");
		
		registry.addViewController("/agency/agency").setViewName("/agency/agency");
		registry.addViewController("/agency/seller").setViewName("/agency/seller");
		
		registry.addViewController("/sellers/settlementManagement").setViewName("/sellers/settlementManagement");
		
		registry.addViewController("/adminOnly/agencyTotal").setViewName("/adminOnly/agencyTotal");
		registry.addViewController("/adminOnly/sellerTotal").setViewName("/adminOnly/sellerTotal");
	}

	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasenames("message.label");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}
}
