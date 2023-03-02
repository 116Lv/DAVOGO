package portal.common.vo;

import java.io.Serializable;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BaseVO implements Serializable {

	private static final long serialVersionUID = -2334283759708847379L;

	private PaginationInfo pageInfo;
	
	private String orderColumn;
	
	private String orderType;
	
	private int pageUnit;
	
}
