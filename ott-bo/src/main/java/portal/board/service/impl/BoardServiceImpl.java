package portal.board.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.board.mapper.BoardMapper;
import portal.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<Map<String, Object>> findBoardList(Map<String, Object> params) {
		return boardMapper.findBoardList(params);
	}

	@Override
	public int getCountOfBoardList(Map<String, Object> params) {
		return boardMapper.getCountOfBoardList(params);
	}

	@Override
	public Map<String, String> getBoardInfo(String id) {
		return boardMapper.getBoardInfo(id);
	}

	@Override
	public void saveInfo(Map<String, String> params) {
		if(StringUtils.isBlank(params.get("board_id")) ) {
			//insert
			boardMapper.insertSaveInfo(params);
		}else{
			//update
			boardMapper.updateSaveInfo(params);
		}
	}

	@Override
	public String getWriterInfo(String id) {
		return boardMapper.getWriterInfo(id);
	}

}
