package portal.review.vo;

import lombok.Getter;
import lombok.Setter;
import portal.common.vo.BaseVO;

@Getter
@Setter
public class ReviewVO {
	
	private static final long serialVersionUID = 3648719021896573251L;

	private int reviewID;
	private int game_name;
	private int nickname;
	private int writeDate;
	private int content;
	private int point;
	private int hide;
	private int hideReason;
	
	/** 검색조건 */
	private String searchText;
	
}
