/**
 * 
 */
package portal.user.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import portal.user.vo.UserVO;

/**
 * 직원 관리
 * @author 116Lv
 *
 */
@Mapper
public interface UserMapper {

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
	 * 직원 정보 등록
	 * @param userInfo
	 */
	public void insertUser(Map<String, String> userInfo);
	
	/**
	 * 연차정보 등록
	 * @param userInfo
	 */
	public void insertAnnual(Map<String, String> userInfo);
	
	/**
	 * 직원 정보 수정
	 * @param userInfo
	 */
	public void updateUser(Map<String, String> userInfo);
	
	/**
	 * 연차정보 수정
	 * @param userInfo
	 */
	public void updateAnnual(Map<String, String> userInfo);
	
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
	 * 연차 정보 등록
	 * @param params
	 */
	public void insertAnnualInfo(Map<String, String> params);
	
	/**
	 * 연차 정보 수정
	 * @param params
	 */
	public void updateAnnualInfo(Map<String, String> params);
	
	/**
	 * 연차정보 삭제
	 * @param annualNo
	 */
	public void deleteAnnualInfo(String annualNo);
	

}
