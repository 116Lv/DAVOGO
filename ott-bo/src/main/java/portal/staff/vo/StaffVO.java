package portal.staff.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StaffVO implements Serializable {
	
	private static final long serialVersionUID = 3648719021896573251L;
	
	private String staffId;
	private String password;
	private String staffName;
	
	private int id;
	private int email;
	private int phone;
	private int address;
	private int joinDate;
	private int leave;
	
	private String searchText;
}
