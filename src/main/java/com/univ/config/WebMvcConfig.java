package com.univ.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.univ.common.FileManagerService;
import com.univ.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired
	private PermissionInterceptor interceptor;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**") // web image path
				// .addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH); //
				// file path
				.addResourceLocations("file://" + FileManagerService.FILE_UPLOAD_PATH); // file path(AWS)
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor).addPathPatterns("/**").excludePathPatterns("/favicon.ico", "/error",
				"/static/**", "/univ/user/**");
	}
}
