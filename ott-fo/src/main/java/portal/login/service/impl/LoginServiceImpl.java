package portal.login.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.login.mapper.LoginMapper;
import portal.login.service.LoginService;
import portal.user.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public int checkUserData(UserVO userVO) {
		return loginMapper.checkUserData(userVO);
	}

}
