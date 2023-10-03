package portal.login.service.impl;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import portal.login.service.RegisterService;
import portal.login.mapper.RegisterMapper;


@Service
public class RegisterServiceImpl implements RegisterService {
	
	@Autowired
	private RegisterMapper registerMapper;

	@Override
	public void insertUserInfo(Map<String, String> params) {
		registerMapper.insertUserInfo(params);
	}

	@Override
	public int checkUserData(Map<String, String> params) {
		return registerMapper.checkUserData(params);
	}
	
}
