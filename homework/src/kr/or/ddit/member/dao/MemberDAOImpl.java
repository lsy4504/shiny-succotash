package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.MemberVO;

public class MemberDAOImpl implements IMemeberDAO {
	SqlMapClient sqlMapClinet;
	static IMemeberDAO memeberDAO;

	private MemberDAOImpl() {
		sqlMapClinet = CustomSqlMapClientBuilder.getSqlMapClient();
	}

	public static IMemeberDAO getInstance() {
		if (memeberDAO == null) {
			memeberDAO = new MemberDAOImpl();
		}
		return memeberDAO;
	}

	@Override
	public MemberVO selectMember(String mem_id) {
		try {
			MemberVO member = (MemberVO) sqlMapClinet.queryForObject("Member.selectMember", mem_id);
			return member;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<MemberVO> selectMemberList() {
		try {
			List<MemberVO> memberList = sqlMapClinet.queryForList("Member.selectMemberList");
			return memberList;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int insertMeber(MemberVO member) {
		try {

			return sqlMapClinet.update("Member.insertMember", member);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateMember(MemberVO member) {
		return 0;
	}

	@Override
	public int deleteMember(String mem_id) {
		return 0;
	}
}
