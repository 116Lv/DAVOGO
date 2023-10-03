package portal.login.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import portal.user.vo.UserVO;

@Mapper
public interface LoginMapper {

	public int checkUserData(UserVO userVO);

}
