package kr.or.ddit.dao.board;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.BoardVO;

public class BoardDaoImpl implements IBoardDao {
	
	private static BoardDaoImpl dao;

	private BoardDaoImpl() { }

	public static BoardDaoImpl getInstance() {
		if (dao == null) {
			dao = new BoardDaoImpl();
		}
		return dao;
	}

	@Override
	public List<BoardVO> boardPrintAll() {
		SqlSession session = null;
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			session= MybatisUtil.getSqlSession();
			boardList = session.selectList("board.boardPrintAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return boardList;
	}

	@Override
	public int insertBoard(BoardVO boardVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("board.insertBoard",boardVo);
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
	public int updateBoard(BoardVO boardVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("board.updateBoard",boardVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) { 
				session.commit();}
				session.close();
		}
		return cnt;
	}

	@Override
	public int deleteBoard(String board_no) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("board.deleteBoard",board_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) { 
				session.commit();}
				session.close();
		}
		return cnt;
	}

	@Override
	public BoardVO searchBoardbyBoard_no(String board_no) {
		SqlSession session = null;
		BoardVO boardVo = null;
		try {
			session= MybatisUtil.getSqlSession();
			boardVo = session.selectOne("board.searchBoardbyBoard_no", board_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				session.close();
		}
		return boardVo;
	}

	@Override
	public List<BoardVO> getBoard_QUES(String board_ctgry_no) {
		SqlSession session = null;
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			session= MybatisUtil.getSqlSession();
			boardList = session.selectList("board.getBoard_QUES",board_ctgry_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				session.close();
		}
		return boardList;
	}
	
	@Override
	public List<BoardVO> getBoard_ALER(String board_ctgry_no) {
		SqlSession session = null;
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			session= MybatisUtil.getSqlSession();
			boardList = session.selectList("board.getBoard_ALER",board_ctgry_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return boardList;
	}
	
	@Override
	public List<BoardVO> getBoard_PROD(String board_ctgry_no) {
		SqlSession session = null;
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			session= MybatisUtil.getSqlSession();
			boardList = session.selectList("board.getBoard_PROD",board_ctgry_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return boardList;
	}
	
	@Override
	public List<BoardVO> getBoard_HOTE(String board_ctgry_no) {
		SqlSession session = null;
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			session= MybatisUtil.getSqlSession();
			boardList = session.selectList("board.getBoard_HOTE",board_ctgry_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return boardList;
	}
	
	@Override
	public List<BoardVO> getBoard_SALO(String board_ctgry_no) {
		SqlSession session = null;
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			session= MybatisUtil.getSqlSession();
			boardList = session.selectList("board.getBoard_SALO",board_ctgry_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return boardList;
	}

	@Override
	public BoardVO viewBoard(int board_no) {
		SqlSession session = null;
		//	게시글 정보를 담을 BoardVO 객체 생성
		BoardVO board = new BoardVO();
		
		try {
			session = MybatisUtil.getSqlSession();
			board = session.selectOne("board.viewBoard", board_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				session.close();
		}
		return board;
	}

	@Override
	public int viewPlus(String board_no) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("board.viewPlus",board_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) { 
				session.commit();}
				session.close();
		}
		return cnt;
	}

	@Override
	public int selectBoardimageByBoard_no(String board_no) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("board.selectBoardimageByBoard_no");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}


	@Override
	public int updateReview(BoardVO boardVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("board.updateReview");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.commit();
			}	session.close();
		}
		return cnt;
	}

	@Override
	public String findOrderNo(String value) {
		SqlSession session = null;
		String orderNo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			orderNo = session.selectOne("board.findOrderNo", value);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return orderNo;
	}

	@Override
	public int insertReview(BoardVO boardVo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("board.insertReview", boardVo);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return cnt;
	}

	@Override
	public List<BoardVO> printAllCtgry(String ctgry) {
		SqlSession session = null;
		List<BoardVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("board.printAllCtgry",ctgry);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public List<BoardVO> mypageReview(String mem_id) {
		SqlSession session = null;
		List<BoardVO> list = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("board.mypageReview", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
				
		return list;
	}
}
