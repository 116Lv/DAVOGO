package portal.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	public List<Map<String, Object>> findBoardList(Map<String, Object> params);

	public int getCountOfBoardList(Map<String, Object> params);

	public Map<String, String> getBoardInfo(String id);

	public void saveInfo(Map<String, String> params);

	public String getWriterInfo(String id);

}
