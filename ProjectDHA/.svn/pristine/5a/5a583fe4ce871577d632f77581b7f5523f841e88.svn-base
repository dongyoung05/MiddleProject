package kr.or.ddit.service.notice;

import java.util.List;

import kr.or.ddit.dao.notice.INoticeDao;
import kr.or.ddit.dao.notice.NoticeDaoImpl;
import kr.or.ddit.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {
	private INoticeDao dao;
	
	private static NoticeServiceImpl service;

	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}

	public static NoticeServiceImpl getInstance() {
		if (service == null) {
			service = new NoticeServiceImpl();
		}
		return service;
	}


	@Override
	public List<NoticeVO> printAllNotice() {
		return dao.printAllNotice();
	}

	@Override
	public int insertNotice(NoticeVO NoticeVo) {
		return dao.insertNotice(NoticeVo);
	}

	@Override
	public int updateNotice(NoticeVO NoticeVo) {
		return dao.updateNotice(NoticeVo);
	}

	@Override
	public int deleteNotice(String notice_no) {
		return dao.deleteNotice(notice_no);
	}

	@Override
	public NoticeVO searchNoticeByNotice_no(String notice_no) {
		return dao.searchNoticeByNotice_no(notice_no);
	}

}
