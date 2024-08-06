package kr.or.ddit.dao.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.ReplyVO;

public class ReplyDaoImpl implements IReplyDao {
	
	private static ReplyDaoImpl dao;

	private ReplyDaoImpl() {
	}

	public static ReplyDaoImpl getInstance() {
		if (dao == null) {
			dao = new ReplyDaoImpl();
		}
		return dao;
	}


	@Override
	public List<ReplyVO> replyPrintAll() {
		SqlSession session= null;
		List<ReplyVO> list = null;
		try {
			session= MybatisUtil.getSqlSession();
			list = session.selectList("reply.replyPrintAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public int insertReply(ReplyVO replyVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("reply.insertReply",replyVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.commit();
				session.close();
			}
		}
		return cnt;
	}

	@Override
	public int updateReply(ReplyVO replyVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("reply.updateReply",replyVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.commit();
				session.close();
			}
		}
		return cnt;
	}

	@Override
	public int deleteReply(ReplyVO replyVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("reply.deleteReply",replyVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.commit();
				session.close();
			}
		}
		return cnt;
	}

	@Override
	public List<ReplyVO> searchReplyBoard_no(String board_no) {
		SqlSession session = null;
		List<ReplyVO> list = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("reply.searchReplyBoard_no", board_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	

}	