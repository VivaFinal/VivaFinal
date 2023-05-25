package web.service.face;

import java.util.HashMap;

public interface KakaoService {


	/**
	 * accesstoken 가져오기 
	 * 
	 * @param code
	 * @return 
	 */
	public String getAccessToken(String code);

	/**
	 *로그아웃
	 * 
	 * @param attribute
	 */
	public void kakaoLogout(String access_Token);

	/**
	 * access Token
	 * 
	 * @param access_Token
	 * @return
	 */
	public HashMap<String, Object> getUserInfo(String access_Token);


}
