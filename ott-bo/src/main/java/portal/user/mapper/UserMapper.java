/**
 * 
 */
package portal.user.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
	public int getCountOfUserList(Map<String, Object> params);

	
}
