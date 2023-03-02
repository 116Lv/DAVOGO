package portal.code.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface CodeMapper {

	public List<Map<String, Object>> findCodeList(Map<String, Object> params);

	public int getCountOfCodeList(Map<String, Object> params);

	public Map<String, Object> getCodeInfo(String id);

	public void insertSaveInfo(Map<String, String> params);

	public void updateSaveInfo(Map<String, String> params);

}
