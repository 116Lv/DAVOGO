package portal.core.config;

import org.egovframe.rte.fdl.cmmn.aspect.ExceptionTransfer;
import org.egovframe.rte.fdl.cmmn.exception.handler.ExceptionHandler;
import org.egovframe.rte.fdl.cmmn.exception.manager.DefaultExceptionHandleManager;
import org.egovframe.rte.fdl.cmmn.exception.manager.ExceptionHandlerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.AntPathMatcher;

import portal.core.exception.EgovSampleExcepHndlr;
import portal.core.exception.EgovSampleOthersExcepHndlr;

//context-aspect.xml
@Configuration
public class AspectConfig {
    
    @Autowired
	private AntPathMatcher antPathMatcher;
    
    @Bean
    public ExceptionTransfer exceptionTransfer(
            @Qualifier("defaultExceptionHandleManager") DefaultExceptionHandleManager defaultExceptionHandleManager,
            @Qualifier("otherExceptionHandleManager") DefaultExceptionHandleManager otherExceptionHandleManager) {
        ExceptionTransfer exceptionTransfer = new ExceptionTransfer();
        exceptionTransfer.setExceptionHandlerService(new ExceptionHandlerService[] {
			defaultExceptionHandleManager, otherExceptionHandleManager
		});
        return exceptionTransfer;
    }

    @Bean
    public DefaultExceptionHandleManager defaultExceptionHandleManager() {
        DefaultExceptionHandleManager exceptionHandleManager = new DefaultExceptionHandleManager();
        exceptionHandleManager.setReqExpMatcher(antPathMatcher);
        exceptionHandleManager.setPatterns(new String[] { "**service.impl.*" });
        exceptionHandleManager.setHandlers(new ExceptionHandler[] { egovHandler() });
        return exceptionHandleManager;
    }

    @Bean
    public DefaultExceptionHandleManager otherExceptionHandleManager() {
        DefaultExceptionHandleManager exceptionHandleManager = new DefaultExceptionHandleManager();
        exceptionHandleManager.setReqExpMatcher(antPathMatcher);
        exceptionHandleManager.setPatterns(new String[] { "**service.impl.*" });
        exceptionHandleManager.setHandlers(new ExceptionHandler[] { otherHandler() });
        return exceptionHandleManager;
    }

    @Bean
    public EgovSampleExcepHndlr egovHandler() {
        return new EgovSampleExcepHndlr();
    }

    @Bean
    public EgovSampleOthersExcepHndlr otherHandler() {
        return new EgovSampleOthersExcepHndlr();
    }
}
