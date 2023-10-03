/**
 * 
 */
package portal.user.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.user.mapper.UserMapper;
import portal.user.service.UserService;
import portal.user.vo.UserVO;

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
	public int getCountOfFindUserList(Map<String, Object> params) {
		return userMapper.getCountOfFindUserList(params);
	}

	@Override
	public Map<String, String> getUser(String userNo) {
		return userMapper.getUser(userNo);
	}

    @Override
    public UserVO getUserInfoByUserId(String userId) {
        return userMapper.getUserInfoByUserId(userId);
    }

	@Override
	public void saveUser(Map<String, String> userInfo) {
		
		String userNo = userInfo.get("userNo");
		
		if (StringUtils.isBlank(userNo)) {
			
			//직원 기본정보 신규 등록
			userMapper.insertUser(userInfo);
			
			//연차 정보 입력
			userMapper.insertAnnual(userInfo);
			
		} else {
			
			Map<String, String> user = userMapper.getUser(userNo);
			
			//입사일자가 달라진경우 올해 연차 다시 계산
			if (!user.get("joinDt").contentEquals(userInfo.get("joinDt"))) {
				userMapper.updateAnnual(userInfo);
			}
			
			//직원 기본정보 수정
			userMapper.updateUser(userInfo);
		}
	}

	@Override
	public int findUserId(String userId) {
		return userMapper.findUserId(userId);
	}

	@Override
	public List<Map<String, String>> findUsedAnnualList(Map<String, String> params) {
		return userMapper.findUsedAnnualList(params);
	}

	@Override
	public Map<String, String> getUserAnnualSummary(Map<String, String> params) {
		return userMapper.getUserAnnualSummary(params);
	}

	@Override
	public void saveAnnualInfo(Map<String, String> params) {
		
		if (StringUtils.isBlank(params.get("annualNo"))) {
			userMapper.insertAnnualInfo(params);
		} else {
			userMapper.updateAnnualInfo(params);
		}
		
		//연차정보 수정
		userMapper.updateAnnual(params);
	}

	@Override
	public void deleteAnnualInfo(String annualNo) {
		userMapper.deleteAnnualInfo(annualNo);
	}
	
}
