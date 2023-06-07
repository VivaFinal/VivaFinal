package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.controller.UsersController;
import web.dao.face.UsersDao;
import web.dto.UserProfile;
import web.dto.Users;
import web.service.face.UsersService;


@Service
public class UsersServiceImpl implements UsersService {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	@Autowired UsersDao usersDao;
	@Autowired ServletContext context;
	
	
	@Override
	public boolean login(Users users) {
		int loginChk = usersDao.selectCntMember(users);
		
		if( loginChk > 0 )	return true;
		return false;
	}

	@Override
	public String getNick(Users users) {
		return usersDao.selectNickByMember(users);
	}
	
	@Override
	public boolean join(Users users) {
		
		//중복된 ID인지 확인
		if ( usersDao.selectCntById(users) > 0 ) {
			return false;
		}
		
		//회원 가입(삽입)
		usersDao.insert(users);
		
		//회원가입 결과 확인
		if( usersDao.selectCntById(users) > 0 ) {
			return true;
		}
		
		return false;
	}
	
	@Override
		public Users getNo(Users users) {
			return usersDao.getUserNo(users);
		}
	
	@Override
	public boolean getkakaoId(Users users) {

		//중복된 kakaoId인지 확인
		if(usersDao.selectByKakaoId(users)>0) {
			logger.info("카카오로 로그인한적이 있다");
			return true;
		} else {
			logger.info("카카오로 로그인한적이 없다");
			return false;
		}
		
	}

	@Override
	public void kakaojoin(Users users) {

		usersDao.insertkakao(users);
	}
	
	@Override
	public int idCheck(Users users) {
		
		return usersDao.checkUserId(users);
	}
	
	@Override
	public int nickCheck(Users users) {

		return usersDao.checkUserNick(users);
	}
	
	@Override
	public int selectAll(Users users) {
		return usersDao.selectAllInfo(users);
	}

	@Override
	public Users nameEmailCheck(Users users) {
		return usersDao.checkUserNameEmail(users);
	}

	@Override
	public Users idEmailCheck(Users users) {
		return usersDao.checkUserIdEmail(users);
	}
	
	@Override
	public void update(Users users) {
		usersDao.updatePw(users);
	}
	@Override
	public Users selectAllInfo(int userNo) {
		return usersDao.selectUserAll(userNo);
	}
	
	
	@Override
	public void deleteInfo(int userno) {

		usersDao.deleteInfo(userno);
		
	}

	@Override
	public Map<String, Object> profileInfo(Users users) {
		return usersDao.selectProfile(users);
	}

	@Override
	public void insertProfile(Users users, MultipartFile profile ) {
	//파일이 저장될 경로
      String storedPath = context.getRealPath("profile");
      File storedFolder = new File(storedPath);
      
      if( !storedFolder.exists() ) {
         storedFolder.mkdir();
      }
      
      if ( profile.getSize() <= 0 ) {
    	  // 파일 크기가 0보다 작거나 같으면 종료한다
    	  return;
      }
      
      // 파일이 저장될 이름
      String originName = profile.getOriginalFilename();
      
      // 저장될 파일 정보 객체
      File dest = null;
      String storedName = null;
      
      //저장된 파일이름 중복을 방지하는 로직임
      do {
      
         storedName = UUID.randomUUID().toString().split("-")[0];
         
         dest = new File(storedFolder, storedName);
         
      }while(dest.exists());
      
      try {
    	  profile.transferTo(dest);
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      UserProfile file = new UserProfile();
      
      file.setUserNo( users.getUserNo() );
      file.setOriginname(originName);
      file.setStoredname(storedName);
      file.setFilesize((int)profile.getSize());
      
      logger.info("file: {}", file);
	
      //유저 프로필사진 수정
	  usersDao.insertUserProfile(file);
	  //유저 비밀번호,닉네임 수정
	  usersDao.insertUserInfo(users);
		
	}

	@Override
	public boolean selectFileNo(UserProfile userProfile) {

		int fileNoChk = usersDao.selectCntProfile(userProfile);
		
		logger.info("filenoChk : {}", fileNoChk);
		
		if( fileNoChk == 0 ) {
			return false;
		}
		return true;
	}
	
	@Override
	public void updateProfile(Users users, MultipartFile profile) {

	//파일이 저장될 경로
      String storedPath = context.getRealPath("profile");
      File storedFolder = new File(storedPath);
      
      if( !storedFolder.exists() ) {
         storedFolder.mkdir();
      }
      
      if ( profile.getSize() <= 0 ) {
    	  // 파일 크기가 0보다 작거나 같으면 종료한다
    	  return;
      }
      
      // 파일이 저장될 이름
      String originName = profile.getOriginalFilename();
      
      // 저장될 파일 정보 객체
      File dest = null;
      String storedName = null;
      
      //저장된 파일이름 중복을 방지하는 로직임
      do {
      
         storedName = UUID.randomUUID().toString().split("-")[0];
         
         dest = new File(storedFolder, storedName);
         
      }while(dest.exists());
      
      try {
    	  profile.transferTo(dest);
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      UserProfile file = new UserProfile();
      
      file.setUserNo( users.getUserNo() );
      file.setOriginname(originName);
      file.setStoredname(storedName);
      file.setFilesize((int)profile.getSize());
      
      logger.info("file: {}", file);
	
      
      //유저 프로필사진 수정
	  usersDao.updateUserProfile(file);
	  //유저 비밀번호,닉네임 수정
	  usersDao.insertUserInfo(users);
		
	}
}
