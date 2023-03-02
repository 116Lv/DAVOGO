package portal.common.util;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

@Component
public class MessageUtil {
    
    @Resource
    private MessageSource source;

    public static MessageSource messageSource;

    @PostConstruct
    public void initialize() {
        messageSource = source;
    }

    public static String getMessage(String msgCode) {
        return messageSource.getMessage(msgCode, null, null);
    }

    public static String getMessage(String msgCode, Object... messageArgs) {
        return messageSource.getMessage(msgCode, messageArgs, null);
    }
}
