package kr.or.ddit.member.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.dao.IMemeberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;

public class AuthenticateServiceImpl /*implements IAuthenticateService*/{
//	IMemeberDAO memeberDAO= new MemberDAOImpl();

//	
//	@Override
//	public Object authenticate(MemberVO member) {
//		Object result=null;
//		MemberVO savedMember= memeberDAO.selectMember(member.getMem_id());
//		if (savedMember!=null) {
//			if(savedMember.getMem_pass().equals(member.getMem_pass())) {
//				result=savedMember;
//			}else {
//				result=ServiceResult.INVALIDPASSWORD;
//			}
//		}else {
//			
//			result=ServiceResult.PKNOTFOUND;
//		}
//		return result;
//	}
}
