package web.service.face;


import web.dto.Users;

public interface UsersService {

	/**
	 * 로그인 인증 처리
	 * 
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(Users users);

	/**
	 * 회원의 닉네임 조회
	 * 
	 * @param member - 닉네임을 조회하려는 사용자의 정보
	 * @return 사용자의 닉네임
	 */
	public String getNick(Users users);

	/**
	 * 신규 회원 가입
	 * 
	 * @param member - 신규 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean join(Users users);

	/**
	 * 유저 아이디 조회
	 * 
	 * @param users
	 * @return
	 */
	public Users getNo(Users users);

	/**
	 * 카카오 ID 있으면 true값
	 * 
	 * @param userInfo
	 */
	public boolean getkakaoId(Users users);


	/**
	 * 카카오 정보를 받아와서 회원가입
	 * 
	 * @param users
	 * @return
	 */
	public void kakaojoin(Users users);

	/**
	 * 중복 아이디 검사
	 * 
	 * @param users
	 * @return
	 */
	public int idCheck(Users users);

	/**
	 * 중복 닉네임 검사
	 * 
	 * @param users
	 * @return
	 */
	public int nickCheck(Users users);

	/**
	 * 회원 정보 조회
	 * 
	 * @param users
	 * @return
	 */
	public int selectAll(Users users);

	/**
	 * 아이디찾기 - 사용자 이름과 이메일 존재여부
	 * 
	 * @param users
	 * @return
	 */
	public Users nameEmailCheck(Users users);

	/**
	 * 비밀번호 찾기 - 사용자 아이디와 이메일 존재여부
	 * 
	 * @param users
	 * @return
	 */
	public Users idEmailCheck(Users users);

	/**
	 * 비밀번호 찾기 - 새로운 비밀번호 설정하기
	 * 
	 * @param users
	 */
	public void update(Users users);

	/**
	 * 회원 모든 정보 저장
	 * 
	 * @param userNo
	 * @return 
	 */
	public Users selectAllInfo(int userNo);
}
