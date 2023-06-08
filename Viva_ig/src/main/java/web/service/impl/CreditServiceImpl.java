package web.service.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import web.dao.face.CreditDao;
import web.dto.Credit;
import web.dto.TossApi;
import web.dto.Users;
import web.service.face.CreditService;

@Service
public class CreditServiceImpl implements CreditService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CreditDao creditDao;
	
	@Override
	public List<Credit> getCreditList(Credit userNo) {
		logger.info("getCreditList()");
		
		//credit 전체 내역 뽑아오기
		return creditDao.selectAllCreditList(userNo);
	}

	@Override
	public String chkUserGrade(Users user) {
		logger.info("chkUserGrade()");
		return creditDao.selectUserGrade(user);
	}
	
	@Override
	public int selectCreditAcc(Credit userNo) {
		logger.info("selectCreditAcc()");
		
		return creditDao.selectCreditAcc(userNo);
	}
	
	
	@Override
	public void deleteDeal(Credit deal) {
		logger.info("deleteDeal()");
		
		creditDao.deleteDeal(deal);
		
	}

//--------------------------------------------------------------------
	//결제 요청단계 중, 생성된 결제 정보를 전달하는 중
	//크레딧 tb 에 생성 해주면서, tossApi tb에 생성해줘야함
	@Transactional
	@Override
	public int addPurchaseInfo(JSONObject jsonObject) {
		logger.info("addPurchaseInfo()");
		
		//JSONObject 는 mybatis 에서 인식이 안되므로, 
		//HashMap 으로 지정해서 보내줘야한다!
		//null로 초기화를 해줘야하는게 맞을지 모르겠다.
		Map<String, Object> tossData = null;
		
	    try {
	    	tossData = new ObjectMapper().readValue(jsonObject.toString(), Map.class);
	     } catch (JsonParseException e) {
	         e.printStackTrace();
	     } catch (JsonMappingException e) {
	         e.printStackTrace();
	     } catch (IOException e) {
	         e.printStackTrace();
	     }

	    //잘 담겨진걸 알 수 있다.
	    logger.info("tossData: {}",tossData);
	    
	    //이렇게 찍으니 null 값이 나온다..ㅠㅠ 이유는 모르겠다...
//	    logger.info("tossData.amount: {}",tossData.get("amount"));
	    //이렇게 확인해보니, amount라는 키값은 cart라는 키 오브젝트에 포함된 키라서 나오지를 않는거였다. 
//	    for (String key : tossData.keySet()) {
//	        logger.info("Key: {} " + key);
//	    }
	    //그러므로 차라리 totalAmount라고 쓰는게 좋겠다.
	    logger.info("tossData: {}",tossData.get("totalAmount"));
	    //null 값이 발생하지 않고 잘 출력됨을 알수있다!

	    //지금까지 확인 끝. 본격 작업!
	    
	    //---------------------------------
//트랜잭션 시작 --------------------------------
	    //1. credit TB에 충전 정보 생성하기
	    
		//크레딧DTO 초기화
		Credit credit = new Credit();

		//dealNo 받아오기
		int num = creditDao.selectNextDealNo();
		logger.info("dealNo : {}", num);
		credit.setDealNo(num);
		
		//충전내역 만들 회원번호 설정(임시)
		credit.setUserNo(44);
		
		//dealCategory = 1 : 충전 설정하기
		credit.setDealCategory(1);
		
		//금액 설정
		int price = 0;
		price = (int) ((int) tossData.get("totalAmount") *0.1);
		credit.setAmount(price);
		
		//결제 승인 시각 전달
		logger.info("결제승인 시간: {}", tossData.get("approvedAt"));
		
		//HashMap에 담긴 승인시각은 String 형식으로 반환되기에 Timestamp로 직접 캐스팅할 수 없으므로, Date로 변환한 다음 Timestamp로 변환해야한다.
		//String 에 담기
		String approvedAtStr = (String) tossData.get("approvedAt");
		
		//SimpleDateFormat 을 사용하여 java.util.Date로 파싱한다.
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssX");
		Date parsedDate = null;
		try {
		    parsedDate = dateFormat.parse(approvedAtStr);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		logger.info("parseDate : {}", parsedDate.getTime());
		
		//timestamp에  date 타입으로 파싱한 정보를 넣어준다.
		java.sql.Timestamp chargeTime = new java.sql.Timestamp(parsedDate.getTime());
		
		//timestamp 형식으로 지정된 DTO의 값에 넣어준다..
		credit.setDealDate(chargeTime);
		//2023-06-08T11:19:21+09:00 -> DB에서는 23/06/08 11:19:21.000000000 이 된걸 확인할수 있다..

		//입력할 크레딧 정보 확인하기
		logger.info("크레딧 정보 : {}", credit);
		
		//크레딧 정보 생성하기
		creditDao.insertcharge(credit);
		
		//------------------------------
		//2. tossAPi TB에 정보 생성하기

		//TossApi DTO 초기화
		TossApi toss = new TossApi();
		
		toss.setDealNo(credit.getDealNo());
		toss.setUserNo(credit.getUserNo());
		toss.setOrderId((String) tossData.get("orderId"));
		toss.setPaymentKey((String) tossData.get("paymentKey"));
		toss.setMethod((String) tossData.get("method"));
		toss.setTotalAmount((int) tossData.get("totalAmount"));
		
		toss.setApprovedAt(chargeTime);
		
		logger.info("toss정보 : {}", toss);
		
		//토스정보 생성할 메소드
		creditDao.insertTossData(toss);
		
//		---------------------------------------
		//3. 완성된 데이터를 담아서 보내주기
//		TossApi chargeOkData = creditDao.selectByTossNo(toss.getTossNo());
		//생성된 정보를 보내줄 준비.. dealNo만.. 
		return num;
		
		
	}
}
