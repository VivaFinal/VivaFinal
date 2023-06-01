package web.service.face;

import java.util.List;

import web.dto.Credit;
import web.dto.Users;

public interface CreditService {

	/**
	 * 회원의 크레딧 사용 내역 전체 조회하기
	 * 
	 * @param userNo - userNo
	 * @return Credit 내역 전체
	 */
	public List<Credit> getCreditList(Credit userNo);

	/** 회원 등급 확인하기
	 * 
	 * @param user - userNo
	 * @return (0:일반회원, 1 : 업로더)
	 */
	public String chkUserGrade(Users user);

}
