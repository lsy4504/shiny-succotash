package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.dao.IMemeberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl  implements IMemberSerivce{
	IMemeberDAO memeberDAO;
	static IMemberSerivce memberSerivce;
	private MemberServiceImpl() {
		memeberDAO=MemberDAOImpl.getInstance();
	}
	public static IMemberSerivce getInstance() {
		if(memberSerivce==null) {
			memberSerivce=new MemberServiceImpl();
		}
		return memberSerivce;
	}
	
	@Override
	public ServiceResult registMember(MemberVO member) {
		ServiceResult result = null;
		if(memeberDAO.selectMember(member.getMem_id())==null) {
			int res =memeberDAO.insertMeber(member);
			if(res>0) {
				result=ServiceResult.OK;
			}else {
				result=ServiceResult.FAILED;
			}
		}else {
		result=ServiceResult.PKDUPLICATED;
		}
		return result;
	}

	@Override
	public List<MemberVO> retrieveMemberList() {
		List<MemberVO> memberList= memeberDAO.selectMemberList();
		return memberList;
	}

	@Override
	public MemberVO retrieveMember(String mem_id) {
//		memeberDAO.insertMeber(mem_id);
		return null;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
