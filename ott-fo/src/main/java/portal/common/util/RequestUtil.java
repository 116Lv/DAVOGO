package portal.common.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class RequestUtil {
    
    /**
     * client의 IP 조회
     * @return
     */
    public static String getClientIp() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        String remoteAddr = request.getHeader("X-FORWARDED-FOR");
        return StringUtils.isBlank(remoteAddr) ? request.getRemoteAddr() : remoteAddr;
    }
}
