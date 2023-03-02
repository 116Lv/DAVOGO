package portal.user.service;

import java.util.List;
import java.util.Map;

/**
 * @author 116Lv
 *
 */
public interface UserService {

	/**
	 * 직원 목록 조회
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> findUserList(Map<String, Object> params);

	/**
	 * 직원 검색 결과 건수 조회
	 * @param params
	 * @return
	 */
	public int getCountOfUserList(Map<String, Object> params);

	
	
}
