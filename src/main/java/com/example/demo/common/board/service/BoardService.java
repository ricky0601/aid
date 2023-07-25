package com.example.demo.common.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.common.board.dao.BoardMapper;
import com.example.demo.common.board.domain.Board;
import com.example.demo.common.board.dto.BoardForm;
import com.example.demo.common.board.dto.BoardList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService {

    private final BoardMapper mapper;

    @Autowired
    public BoardService(BoardMapper mapper) {
        this.mapper = mapper;
    }
    /**
     * 게시판 등록 Service Method
     */
    public void addBoard(BoardForm boardForm) {
        try {
            //등록용 파라미터 정제 (DTO -> Domain)
            Board board = new Board();
            board.setTitle(boardForm.getTitle());
            board.setWriter(boardForm.getWriter());
            board.setPassword(boardForm.getPassword());
            board.setContents(boardForm.getContents());
            //게시판 등록
            int resultCount = mapper.insertBoard(board);
            System.out.println("게시판 등록 완료 (건수 : "+resultCount+"건)");
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 게시판 상세 정보 조회
     */
    public Board getBoardDetail(int boardSeq) {
        Board board = null;
        try {
            //게시판 상세 정보 조회
            board = mapper.selectBoardInfo(boardSeq);

            System.out.println("[1] 게시판 상세 조회 완료");
            //해당 게시물 조회수 1 증가
            mapper.updateBoardHits(boardSeq);
            System.out.println("[2] 게시물 조회수 증가 완료");
        }catch(Exception e) {
            e.printStackTrace();
        }
        return board;
    }

    /**
     * 게시판 목록 조회
     */
    public Map<String, Object> getBoardList(int pageNum){
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            //[1]게시물 총 건수 조회
            int totalCount = mapper.selectBoardListTotalCount();
            result.put("totalCount", totalCount);

            System.out.println("[1] 게시물 총 건수 조회 완료("+totalCount+"건)");
            //[2]게시판 목록 조회
            //목록 조회용 파라미터 설정
            int listNum = 10;	//게시판 페이지 별 건수 설정
            int startNum = (pageNum -1) * listNum;	//게시판 목록 조회 시작점 설정

            Map<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("startNum",startNum);
            paramMap.put("listNum", listNum);

            //게시판 목록 조회
            List<Board> dbBoardList = mapper.selectBoardList(paramMap);
            List<BoardList> boardList = new ArrayList<BoardList>();
            int listStartNum = ((pageNum-1)*listNum)+1;
            for (Board board: dbBoardList) {
                BoardList listObj = new BoardList();

                listObj.setNo(listStartNum++);
                listObj.setBoardSeq(board.getBoardSeq());
                listObj.setTitle(board.getTitle());
                listObj.setWriter(board.getWriter());
                listObj.setHits(board.getHits());
                listObj.setRegDt(board.getRegDt());
                boardList.add(listObj);
            }
            result.put("boardList", boardList);
            System.out.println("[2] 게시물 목록 조회 완료");
            //게시판 페이지 생성
            //[3-1] 페이징 계산용 변수 설정
            int pageUnitNum = 5;
            //[3-2] 총 페이징 계산
            int totalPagingNum = (totalCount / listNum) + (totalCount % pageUnitNum == 0 ? 0:1);
            //[3-3] 배열 값 비교하여 페이징 시작 번호 return
            int totalPagingUnitNum = (totalPagingNum / pageUnitNum) + (totalPagingNum % pageUnitNum==0?0:1);
            for (int i =0; i<totalPagingUnitNum ; i++) {
                //단위 별 시작 페이지 번호와 종료 페이지 번호를 구한 뒤 비교하여 포함되는 페이징 그룹 return
                int startUnitNum = (i*pageUnitNum) +1;
                int endUnitNum =(i+1)*pageUnitNum;
                //페이징 단위 종료 번호가 총 페이징 번호보다 클 경우 총 페이징 번호가 마지막이 됨
                if (endUnitNum > totalPagingNum) {
                    endUnitNum = totalPagingNum;
                }
                if (pageNum >= startUnitNum && pageNum <= endUnitNum) {
                    result.put("startUnitNum", startUnitNum);
                    result.put("endUnitNum", endUnitNum);
                    result.put("totalPagingNum", totalPagingNum);

                    break;
                }
            }
            System.out.println("[3] 게시판 페이징 설정 완료");
        }catch(Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    /**
     * 게시물 소유 확인 Service Method
     */
    public boolean checkBoardOwner(int boardSeq, String password) {
        boolean result = false;
        try {
            //게시물 패스워드 일치 여부 확인
            Map<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("boardSeq", boardSeq);
            paramMap.put("password", password);

            //일치하는 게시물 있는지 확인
            int totalCount = mapper.selectBoardPasswordForCheck(paramMap);
            System.out.println("게시물 총 건수 조회 완료("+totalCount +"건)");

            if (totalCount >0) {
                result = true;
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    /**
     * 게시물 정보 삭제 Service Method
     */
    public void deleteBoard(int boardSeq) {
        try {
            //게시물 삭제
            mapper.deleteBoard(boardSeq);
            System.out.println("게시물 삭제 완료");
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}
