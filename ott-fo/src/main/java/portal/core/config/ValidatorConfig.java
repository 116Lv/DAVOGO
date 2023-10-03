package portal.core.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.springmodules.validation.commons.DefaultValidatorFactory;

// @Configuration
public class ValidatorConfig {

    @Value("classpath:/egovframework/validator/validator-rules-let.xml,classpath:/egovframework/validator/let/**/*.xml")
    private Resource[] validationConfigLocations;

    @Bean
    public DefaultBeanValidator beanValidator() {
        DefaultBeanValidator beanValidator = new DefaultBeanValidator();
        beanValidator.setValidatorFactory(validatorFactory());
        return beanValidator;
    }

    @Bean
    public DefaultValidatorFactory validatorFactory() {
        DefaultValidatorFactory validatorFactory = new DefaultValidatorFactory();
        validatorFactory.setValidationConfigLocations(validationConfigLocations);
        return validatorFactory;
    }

}
