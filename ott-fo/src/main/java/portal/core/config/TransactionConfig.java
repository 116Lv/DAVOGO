package portal.core.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.interceptor.DefaultTransactionAttribute;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;
import org.springframework.transaction.interceptor.RuleBasedTransactionAttribute;
import org.springframework.transaction.interceptor.TransactionInterceptor;

@Configuration
public class TransactionConfig {
    
    @Value("${transaction.read.timeout}")
    private int transactionReadTimeout = 20;

    @Value("${transaction.write.timeout}")
    private int transactionWriteTimeout = 20;

    @Autowired
	private DataSource dataSource;

    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean
    public TransactionInterceptor txAdvice(@Qualifier("transactionManager") DataSourceTransactionManager transactionManager) {
        TransactionInterceptor txAdvice = new TransactionInterceptor();
        
        Properties txAttributes = new Properties();

        List<RollbackRuleAttribute> rollbackRules = new ArrayList<RollbackRuleAttribute>();
        rollbackRules.add(new RollbackRuleAttribute(Exception.class));

        DefaultTransactionAttribute readOnlyAttribute = new DefaultTransactionAttribute(TransactionDefinition.PROPAGATION_SUPPORTS);
        readOnlyAttribute.setReadOnly(true);
        readOnlyAttribute.setTimeout(transactionReadTimeout);
        
        RuleBasedTransactionAttribute writeAttribute = new RuleBasedTransactionAttribute(TransactionDefinition.PROPAGATION_REQUIRED, rollbackRules);
        writeAttribute.setTimeout(transactionWriteTimeout);

        String readOnlyTransactionAttributesDefinition = readOnlyAttribute.toString();
        String writeTransactionAttributesDefinition = writeAttribute.toString();

        txAttributes.setProperty("create*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("insert*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("update*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("delete*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("save*", writeTransactionAttributesDefinition);
        txAttributes.setProperty("*", readOnlyTransactionAttributesDefinition);

        txAdvice.setTransactionAttributes(txAttributes);
        txAdvice.setTransactionManager(transactionManager);

        return txAdvice;
    }

    @Bean
    public Advisor txAdviceAdvisor(@Qualifier("txAdvice") TransactionInterceptor txAdvice) {
        AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
        pointcut.setExpression("execution(* portal..impl.*Impl.*(..))");
        return new DefaultPointcutAdvisor(pointcut, txAdvice);
    }
}
