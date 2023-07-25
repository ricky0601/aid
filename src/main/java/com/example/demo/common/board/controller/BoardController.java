package com.example.demo.common.board.controller;

import java.util.Map;

import com.example.demo.common.board.domain.Board;
import com.example.demo.common.board.dto.BoardForm;
import com.example.demo.common.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class BoardController {

    @GetMapping("/board/form")
    public String addBoardForm() {
        return "/board/addBoardForm";
    }

    private final BoardService service;

    @Autowired
    public BoardController(BoardService service) {
        this.service = service;
    }

    /**
     * 게시판 등록 Controller
     */
    @PostMapping("/board/new")
    public String addBoard(BoardForm boardForm) {
        //게시판 등록 메서드 호출
        service.addBoard(boardForm);

        //TODO 목록 개발 전까지는 /board/form 으로 return
        return "redirect:/board/list";
    }

    /**
     * 게시판 상세 페이지 연결 Controller
     */

    @GetMapping("/board/detail")
    public String getBoardDetail(@RequestParam int boardSeq, Model model) {
        //게시판 상세정보 조회 메서드 호출
        Board board = service.getBoardDetail(boardSeq);
        model.addAttribute("board", board);

        return "board/boardDetail";
    }
    /**
     * 게시만 목록 페이지 연결 Controller
     */
    @GetMapping("/boardList")
    public String getBoardList(@RequestParam(required = false, defaultValue="1")int pageNum, Model model) {
        //게시판 목록 조회 메서드 호출
        Map<String, Object> result = service.getBoardList(pageNum);
        model.addAttribute("pageNum", pageNum);
        //Service 결과 모두 model에 설정
        model.addAllAttributes(result);
        return "/common/board/boardList";
    }

    @ResponseBody
    @PostMapping("/board/checkPassword")
    public boolean checkPassword(@RequestParam int boardSeq, @RequestParam String password, Model model) {
        //게시판 등록 메서드 호출
        boolean result = service.checkBoardOwner(boardSeq, password);
        return result;
    }
    /**
     * 게시물 정보 삭제 Controller Method
     */
    @PostMapping("/board/delete")
    public String deleteBoard(@RequestParam int boardSeq) {
        //게시판 등록 메소드 호출
        service.deleteBoard(boardSeq);
        return "redirect:/board/list";
    }
}
