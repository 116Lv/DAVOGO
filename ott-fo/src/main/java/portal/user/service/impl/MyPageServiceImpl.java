package portal.user.service.impl;

import java.util.Map;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.user.mapper.MyPageMapper;
import portal.user.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;
	
	@Override
	public void saveUserInfo(Map params) {
		
		Map userInfo = myPageMapper.getUserInfo(params);
		
		if (userInfo == null) {
			throw new RuntimeException("현재비밀번호 불일치");
		}
		
		params.put("userId", userInfo.get("userId"));
		
		myPageMapper.updateUserPassword(params);
		
	}

}
