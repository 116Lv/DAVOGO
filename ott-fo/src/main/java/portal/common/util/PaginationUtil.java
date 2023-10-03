package portal.common.util;

import java.util.Map;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class PaginationUtil {

	/**
	 * 페이징 처리 파라미터 설정
	 * @param params
	 */
	public static PaginationInfo setPaginationInfo(Map<String, Object> params) throws Exception {
		
		if (MapUtil.getValue(params, "pageIndex") == null)
			params.put("pageIndex", 1);
		if (MapUtil.getValue(params, "pageUnit") == null)
			params.put("pageUnit", 10);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(MapUtil.getIntValue(params, "pageIndex"));
		paginationInfo.setRecordCountPerPage(MapUtil.getIntValue(params, "pageUnit"));
		paginationInfo.setPageSize(5);
		paginationInfo.setTotalRecordCount(0);
		
		params.put("firstIndex", paginationInfo.getFirstRecordIndex());
		params.put("lastIndex", paginationInfo.getLastRecordIndex());
		params.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		
		return paginationInfo;
	}
	
}
