package portal.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.user.mapper.UserMapper;
import portal.user.service.UserService;

/**
 * @author 116Lv
 *
 */
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<Map<String, Object>> findUserList(Map<String, Object> params) {
		return userMapper.findUserList(params);
	}

	@Override
	public int getCountOfUserList(Map<String, Object> params) {
		return userMapper.getCountOfUserList(params);
	}

}
