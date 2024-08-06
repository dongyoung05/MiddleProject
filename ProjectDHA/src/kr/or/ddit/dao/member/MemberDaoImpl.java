package kr.or.ddit.dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	// 싱글톤
	private static IMemberDao dao;
	
	private MemberDaoImpl() {	}
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}
//================싱글톤 끝=================================================================	
	
	@Override
	public List<MemberVO> selectMemberList() {
		SqlSession session = null;
		List<MemberVO> mlist = null;
		try {
			session = MybatisUtil.getSqlSession();
			mlist = session.selectList("Member.selectMemberList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mlist;
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		SqlSession session = null;
		int cnt = 0;	// 성공여부를 cnt로 저장저장....
		try {
			session=MybatisUtil.getSqlSession();
			
			cnt = session.insert("Member.insertMember", memberVo);
			if(cnt > 0) session.commit();	// cnt가 1이면 성공이니 커밋
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();	// session자원 닫아주기
		}
		return cnt;
	}

	@Override
	public MemberVO selectGetMemberId(String mem_id) {
		SqlSession session = null;
		MemberVO mvo = null;
		try {
			session=MybatisUtil.getSqlSession();
			
			mvo = session.selectOne("Member.selectGetMemberId", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return mvo;
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		SqlSession session = null;
		int cnt = 0;	// 성공여부를 cnt로 저장저장....
		try {
			session=MybatisUtil.getSqlSession();
			
			cnt = session.update("Member.updateMember", memberVo);
			if(cnt > 0) session.commit();	// cnt가 1이면 성공이니 커밋
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();	// session자원 닫아주기
		}
		return cnt;
	}

	@Override
	public int delMember(String mem_id) {
		SqlSession session = null;
		int cnt = 0;	// 성공여부를 cnt로 저장저장....
		try {
			session=MybatisUtil.getSqlSession();
			
			cnt = session.update("Member.delMember", mem_id);
			if(cnt > 0) session.commit();	// cnt가 1이면 성공이니 커밋
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();	// session자원 닫아주기
		}
		return cnt;
	}
	
	@Override
	public int checkMemberId(String mem_id) {
		SqlSession session = null;
		int cnt = 0;	// 성공여부를 cnt로 저장저장....
		try {
			session=MybatisUtil.getSqlSession();
			
			cnt = session.selectOne("Member.checkMemberId", mem_id);
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}
	@Override
	public MemberVO loginMember(MemberVO memberVo) {
		SqlSession session = null;
		MemberVO mvo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			mvo = session.selectOne("Member.loginMember", memberVo);
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return mvo;
	}
	
	@Override
	public String findId(MemberVO memberVo) {
		SqlSession session=null;
		String id = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			id = session.selectOne("Member.findId", memberVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return id;
	}
	
	@Override
	public MemberVO findPass(MemberVO memberVo) {
	
		SqlSession session=null;
		MemberVO pass = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			pass = session.selectOne("Member.findPass", memberVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return pass;
	}
	@Override
	public List<MemberVO> blackListAll() {
		SqlSession session=null;
		List<MemberVO> blacklist = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			blacklist = session.selectList("Member.blackMemberList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return blacklist;
	}
	@Override
	public MemberVO blackListSelect(String mem_id) {
		SqlSession session = null;
		MemberVO mvo = null;
		try {
			session = MybatisUtil.getSqlSession();
			mvo = session.selectOne("Member.blackListSelect", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return mvo;
	}
	@Override
	public int blackMemberInsert(MemberVO memberVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Member.blackMemberInsert", memberVo);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}
	@Override
	public int blackMemberDelete(String mem_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("Member.blackMemberDelete", mem_id);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}
	
	@Override
	public MemberVO blacklistLogin(String mem_id) {
		SqlSession session = null;
		MemberVO mvo = null;
		try {
			session = MybatisUtil.getSqlSession();
			mvo = session.selectOne("Member.blacklistLogin", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return mvo;
	}
	
	@Override
	public List<MemberVO> searchMemberAdmin(Map<String, String> map) {
		SqlSession session = null;
		List<MemberVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("Member.searchMemberAdmin", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.commit();
		}
		return list;
	}
	@Override
	public List<MemberVO> searchBlackMember() {
		SqlSession session = null;
		List<MemberVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("Member.searchBlackMember");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.commit();
		}
		return list;
	}
}
