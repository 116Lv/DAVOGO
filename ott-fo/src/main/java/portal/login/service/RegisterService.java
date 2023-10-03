package portal.login.service;

import java.util.Map;

public interface RegisterService {

	public void insertUserInfo(Map<String, String> params);

	public int checkUserData(Map<String, String> params);
}
