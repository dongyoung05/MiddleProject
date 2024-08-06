package kr.or.ddit.service.reply;

import java.util.List;

import kr.or.ddit.dao.reply.IReplyDao;
import kr.or.ddit.dao.reply.ReplyDaoImpl;
import kr.or.ddit.vo.ReplyVO;

public class ReplyServiceImpl implements IReplyService {
	private IReplyDao dao;
	
	private static ReplyServiceImpl service;

	private ReplyServiceImpl() {
		dao = ReplyDaoImpl.getInstance();
	}

	public static ReplyServiceImpl getInstance() {
		if (service == null) {
			service = new ReplyServiceImpl();
		}
		return service;
	}


	@Override
	public List<ReplyVO> replyPrintAll() {
	
		return dao.replyPrintAll();
	}

	@Override
	public int insertReply(ReplyVO replyVo) {
	
		return dao.insertReply(replyVo);
	}

	@Override
	public int updateReply(ReplyVO replyVo) {
	
		return dao.updateReply(replyVo);
	}

	@Override
	public int deleteReply(ReplyVO replyVo) {
	
		return dao.deleteReply(replyVo);
	}

	@Override
	public List<ReplyVO> searchReplyBoard_no(String board_no) {
	
		return dao.searchReplyBoard_no(board_no);
	}

}
