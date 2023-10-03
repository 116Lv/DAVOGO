/**
 * 
 */
package portal.user.service;

import java.util.List;
import java.util.Map;

import portal.user.vo.UserVO;

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
	public int getCountOfFindUserList(Map<String, Object> params);

	/**
	 * 직원 정보 조회
	 * @param userNo
	 * @return
	 */
	public Map<String, String> getUser(String userNo);
	
	/**
	 * 사용자 정보 조회
	 * @param userId
	 * @return
	 */
	public UserVO getUserInfoByUserId(String userId);
	
	/**
	 * 직원 정보 저장
	 * @param userInfo
	 */
	public void saveUser(Map<String, String> userInfo);

	/**
	 * 직원ID 중복체크를 위한 사용 갯수 조회
	 * @param userId
	 * @return
	 */
	public int findUserId(String userId);
	
	/**
	 * 연차 내역
	 * @param params
	 * @return
	 */
	public List<Map<String, String>> findUsedAnnualList(Map<String, String> params);
	
	/**
	 * 연차 요약 정보
	 * @param params
	 * @return
	 */
	public Map<String, String> getUserAnnualSummary(Map<String, String> params);
	
	/**
	 * 연차 정보 저장
	 * @param params
	 */
	public void saveAnnualInfo(Map<String, String> params);
	
	/**
	 * 연차정보 삭제
	 * @param annualNo
	 */
	public void deleteAnnualInfo(String annualNo);
	
}
