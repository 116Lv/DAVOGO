package portal.code.service;

import java.util.List;
import java.util.Map;

public interface CodeService {

	public List<Map<String, Object>> findCodeList(Map<String, Object> params);

	public int getCountOfCodeList(Map<String, Object> params);

	public Map<String, Object> getCodeInfo(String id);

	public void saveInfo(Map<String, String> params);

	
}
