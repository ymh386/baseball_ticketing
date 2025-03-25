package com.baseball.app.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baseball.app.boards.BoardDAO;
import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.BoardFileDTO;
import com.baseball.app.boards.CommentDTO;
import com.baseball.app.pages.Pager;

@Repository
public class QnaDAO implements BoardDAO {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.baseball.app.qna.QnaDAO.";
	
	//-----------------------------------------------------------------	

	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getTotalCount");
	}

	@Override
	public int updateHit(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//-----------------------------------------------------------------

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {

		return sqlSession.selectOne(NAMESPACE+"getDetail", boardDTO);
	}

	@Override
	public int add(BoardDTO boardDTO) throws Exception {

		System.out.println(boardDTO.getBoardTitle());
		System.out.println(boardDTO.getBoardContent());
		System.out.println(boardDTO.getUserId());
		
		return sqlSession.insert(NAMESPACE+"add", boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {

		return sqlSession.update(NAMESPACE+"update", boardDTO);
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {

		return sqlSession.delete(NAMESPACE+"delete", boardDTO);
	}
	
	
	//
	public int addFile(BoardFileDTO boardFileDTO) {
		
		return sqlSession.insert(NAMESPACE+"addFile", boardFileDTO);		
	}
	
	
	//
	public BoardFileDTO getFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", boardFileDTO);
	}
	
	
	//
	public int deleteFile(BoardFileDTO boardFileDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteFile", boardFileDTO);
	}
	
	
	//
	public int deleteAllFile(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteAllFile", boardDTO);
	}
	
	
	//
	public int addComment(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"addComment", boardDTO);
	}
	
	
	//
	public List<CommentDTO> getCommentList(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getCommentList", boardDTO);
	}
	
	
	//
	public int deleteComment(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"deleteComment", boardDTO);
	}
	
	

}
