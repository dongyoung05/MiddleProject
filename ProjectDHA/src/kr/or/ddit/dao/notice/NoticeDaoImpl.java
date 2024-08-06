package kr.or.ddit.dao.notice;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.NoticeVO;

public class NoticeDaoImpl implements INoticeDao {
	
	private static NoticeDaoImpl dao;

	private NoticeDaoImpl() {
	}

	public static NoticeDaoImpl getInstance() {
		if (dao == null) {
			dao = new NoticeDaoImpl();
		}
		return dao;
	}


	@Override
	public List<NoticeVO> printAllNotice() {
		SqlSession session = null;
		List<NoticeVO> list = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("notice.printAllNotice");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int insertNotice(NoticeVO NoticeVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("notice.insertNotice",NoticeVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.commit();
			} 	session.close();
		}
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO NoticeVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("notice.updateNotice", NoticeVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.commit();
			} 	session.close();
		}
		return cnt;
	}

	@Override
	public int deleteNotice(String notice_no) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("notice.deleteNotice",notice_no);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(session != null) {
				session.commit();
			} 	session.close();
	}
		return cnt;

}

	@Override
	public NoticeVO searchNoticeByNotice_no(String notice_no) {
		SqlSession session = null;
		NoticeVO noticeVo = null;
		try {
			session = MybatisUtil.getSqlSession();
			noticeVo = session.selectOne("notice.searchNoticeByNotice_no",notice_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return noticeVo;
	}
}
