package portal.core.config;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.filter.CommonsRequestLoggingFilter;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import portal.core.interceptor.AuthenticInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "portal", excludeFilters = {
		@ComponentScan.Filter(type = FilterType.ANNOTATION, value = Service.class),
		@ComponentScan.Filter(type = FilterType.ANNOTATION, value = Repository.class),
		@ComponentScan.Filter(type = FilterType.ANNOTATION, value = Mapper.class)
	})
public class WebConfig implements WebMvcConfigurer {

	@Value("${file.storePath}")
    private String fileStorePath;
	
    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
        interceptor.setParamName("language");
        return interceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	
        registry.addInterceptor(localeChangeInterceptor());
        
        registry.addInterceptor(new AuthenticInterceptor())
	        .addPathPatterns(
	        		"/**/*.do")
	        .excludePathPatterns(
	        		"/signIn.do",
	        		"/login.do",
	        		"/logout.do",
	        		"/main.do",
	        		"/movie.do",
	        		"/tv.do",
	        		"/comm.do",
	        		"/signUp.do",
	        		"/register.do"
	        		);
    }
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**").addResourceLocations("classpath:/static/images/");
        registry.addResourceHandler("/attach/**").addResourceLocations("classpath:/static/attach/");
        registry.addResourceHandler("/css/**").addResourceLocations("classpath:/static/css/");
        registry.addResourceHandler("/fonts/**").addResourceLocations("classpath:/static/fonts/");
        registry.addResourceHandler("/js/**").addResourceLocations("classpath:/static/js/");
        registry.addResourceHandler("/img/**").addResourceLocations("file:///"+ fileStorePath);
    }

	@Bean
    public CommonsRequestLoggingFilter requestLoggingFilter() {
        CommonsRequestLoggingFilter filter = new CommonsRequestLoggingFilter() {
            @Override
            protected void afterRequest(HttpServletRequest request, String message) {
                //log를 찍지 못하도록 override
            }
        };
        filter.setIncludeHeaders(true);
        filter.setIncludeQueryString(true);
        filter.setIncludePayload(true);
        filter.setIncludeClientInfo(true);
        filter.setMaxPayloadLength(100000);
        return filter;
    }
    
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("forward:/index.jsp");
	}
    
	@Override
	public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
		SimpleMappingExceptionResolver simpleMappingExceptionResolver = new SimpleMappingExceptionResolver();

		simpleMappingExceptionResolver.setDefaultErrorView("cmm/error/egovError");

		Properties mappings = new Properties();
		mappings.setProperty("org.springframework.dao.DataAccessException", "cmm/error/dataAccessFailure");
		mappings.setProperty("org.springframework.transaction.TransactionException", "cmm/error/transactionFailure");
		mappings.setProperty("org.egovframe.rte.fdl.cmmn.exception.EgovBizException", "cmm/error/egovError");
		mappings.setProperty("org.springframework.security.AccessDeniedException", "cmm/error/accessDenied");

		simpleMappingExceptionResolver.setExceptionMappings(mappings);

		exceptionResolvers.add(simpleMappingExceptionResolver);
	}
	
	@Bean
    public MappingJackson2JsonView jsonView() {
    	return new MappingJackson2JsonView();
    }
}
