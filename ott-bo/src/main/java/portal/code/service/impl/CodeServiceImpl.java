package portal.code.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.code.mapper.CodeMapper;
import portal.code.service.CodeService;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	private CodeMapper codeMapper;

	@Override
	public List<Map<String, Object>> findCodeList(Map<String, Object> params) {
		return codeMapper.findCodeList(params);
	}

	@Override
	public int getCountOfCodeList(Map<String, Object> params) {
		return codeMapper.getCountOfCodeList(params);
	}

	@Override
	public Map<String, Object> getCodeInfo(String id) {
		return codeMapper.getCodeInfo(id);
	}

	@Override
	public void saveInfo(Map<String, String> params) {
		if(StringUtils.isBlank(params.get("code")) ) {
			//insert
			codeMapper.insertSaveInfo(params);
		}else{
			//update
			codeMapper.updateSaveInfo(params);
		}
	}
	
	
}
