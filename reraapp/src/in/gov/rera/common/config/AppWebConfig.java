package in.gov.rera.common.config;

import in.gov.rera.interceptor.AdminInterceptor;
import in.gov.rera.interceptor.AgentInterceptor;
import in.gov.rera.interceptor.AuthorityUserInterceptor;
import in.gov.rera.interceptor.ChiefAuthorityUserInterceptor;
import in.gov.rera.interceptor.HelpDeskUserInterceptor;
import in.gov.rera.interceptor.OperatorUserInterceptor;
import in.gov.rera.interceptor.ProjectInterceptor;
import in.gov.rera.interceptor.PublicDomainInterceptor;
import in.gov.rera.interceptor.SessionInterceptor;
import in.gov.rera.interceptor.UnregProjectInterceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles2.TilesConfigurer;
import org.springframework.web.servlet.view.tiles2.TilesViewResolver;

@Configuration
@ComponentScan("in.gov.*")
@EnableWebMvc
public class AppWebConfig extends WebMvcConfigurerAdapter {

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer
				.setDefinitions(new String[] {"WEB-INF/tiles/homePageTiles.xml","WEB-INF/tiles/internalPagesTiles.xml","WEB-INF/tiles/adminPageTiles.xml","WEB-INF/tiles/agentPagesTiles.xml","WEB-INF/tiles/usersPageTiles.xml","WEB-INF/tiles/helpdeskTiles.xml","WEB-INF/tiles/postRegistration.xml","WEB-INF/tiles/publicDomainTiles.xml","WEB-INF/tiles/plotsTiles.xml","WEB-INF/tiles/unregisteredProject.xml"});
		tilesConfigurer.setCheckRefresh(true);
		return tilesConfigurer;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	TilesViewResolver viewResolver() {
		TilesViewResolver viewResolver = new TilesViewResolver();
		return viewResolver;
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver createMultipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		resolver.setMaxInMemorySize(500*1024*1024);
		return resolver;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		 registry.addInterceptor(getSessionInterceptor()).addPathPatterns("/**");
		 registry.addInterceptor(getAdminInterceptor()).addPathPatterns("/admin/**");
		 registry.addInterceptor(getAgentInterceptor()).addPathPatterns("/agent/**");
		 registry.addInterceptor(getProjectInterceptor()).addPathPatterns("/project/**");
		 registry.addInterceptor(getAuthorityUserInterceptor()).addPathPatterns("/authority/**");
		 registry.addInterceptor(getOperatorUserInterceptor()).addPathPatterns("/operator/**");
		 registry.addInterceptor(getSuperAuthorityUserInterceptor()).addPathPatterns("/super/**");
		 registry.addInterceptor(getHelpDeskUserInterceptor()).addPathPatterns("/helpdesk/**");
		 
		 registry.addInterceptor(getPublicDomainInterceptor()).addPathPatterns("/publicDomain/**");
	      
		 registry.addInterceptor(getUnregProjectInterceptor()).addPathPatterns("/unRegProject/**");
		//super.addInterceptors(registry);
	}
	
	@Bean
	public PublicDomainInterceptor getPublicDomainInterceptor() {
	    return new PublicDomainInterceptor();
	}
	
	@Bean
	public UnregProjectInterceptor getUnregProjectInterceptor() {
	    return new UnregProjectInterceptor();
	}
	
	@Bean
	public SessionInterceptor getSessionInterceptor() {
	    return new SessionInterceptor();
	}
	
	
	@Bean
	public AgentInterceptor getAgentInterceptor() {
	    return new AgentInterceptor();
	}
	@Bean
	public AdminInterceptor getAdminInterceptor() {
	    return new AdminInterceptor();
	}
	@Bean
	public ProjectInterceptor getProjectInterceptor() {
	    return new ProjectInterceptor();
	}
	
	@Bean
	public ChiefAuthorityUserInterceptor getSuperAuthorityUserInterceptor() {
	    return new ChiefAuthorityUserInterceptor();
	}
	@Bean
	public HelpDeskUserInterceptor getHelpDeskUserInterceptor() {
	    return new HelpDeskUserInterceptor();
	}
	@Bean
	public AuthorityUserInterceptor getAuthorityUserInterceptor() {
	    return new AuthorityUserInterceptor();
	}
	@Bean
	public OperatorUserInterceptor getOperatorUserInterceptor() {
	    return new OperatorUserInterceptor();
	}
	
}
