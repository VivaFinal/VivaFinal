package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.UsersDao;
import web.dto.Users;
import web.service.face.UsersService;


@Service
public class UsersServiceImpl implements UsersService {

@Autowired UsersDao usersDao;
	
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
		if( usersDao.selectCntById(users) > 0 ) {
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
	
}
