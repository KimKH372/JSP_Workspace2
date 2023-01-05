package mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;
import mvc.model.FileImageDTO;

public class BoardController {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	static int boardNum = 0;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if (command.equals("/BoardListAction.do")) {
			requestBoardList(request);

			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardWriteForm.do")) { // 글쓰기 폼
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);
		}else if (command.equals("/BoardWriteAction.do")) {
			requestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		} else if (command.equals("/BoardViewAction.do")) {
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);
		} else if (command.equals("/BoardView.do")) { 
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardUpdateAction.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		} else if (command.equals("/BoardDeleteAction.do")) {
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
	}
			
	// 해다 게시판 목록에 보여주는 비지니스 로직.
		public void requestBoardList(HttpServletRequest request) {

			int listCount = BoardController.LISTCOUNT;
			String RequestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = RequestURI.substring(contextPath.length());
			
			BoardDAO dao = BoardDAO.getInstance();
			
			List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
			
			int pageNum = 1;
			// 목록 게시판 보여줄 갯수 5개.
			int limit = LISTCOUNT;
			
			if (request.getParameter("pageNum") != null)
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			String items = request.getParameter("items");
			String text = request.getParameter("text");
			
			int total_record = dao.getListCount(items, text);
			
			boardlist = dao.getBoardList(pageNum, limit, items, text);
			int total_page;

			
			if (total_record % limit == 0) {
				total_page = total_record / limit;
				Math.floor(total_page);
			} else {
				total_page = total_record / limit; // 11/5 = 2.2
				double total_page_test = Math.floor(total_page); // 2.2 -> 2 , 내림.
				System.out.println("total_page_test의 값 한번 찍어보기." + total_page_test);
				total_page = total_page + 1; // 2 + 1 -> 3
			}
			
			request.setAttribute("RequestURI", RequestURI);
			request.setAttribute("contextPath", contextPath);
			request.setAttribute("command", command);

			request.setAttribute("listCount", listCount);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("total_page", total_page);
			request.setAttribute("total_record", total_record);
			request.setAttribute("boardlist", boardlist);
			request.setAttribute("boardNum", boardNum);
		}
		
		public void requestLoginName(HttpServletRequest request) {

			String id = request.getParameter("id");

			BoardDAO dao = BoardDAO.getInstance();
			String name = dao.getLoginNameById(id);

			request.setAttribute("name", name);
		}
		public void requestBoardWrite(HttpServletRequest request) {
			String realFolder =  "#";
			String encType = "utf-8"; // 인코딩 타입
			int maxSize = 10 * 1024 * 1024; // 최대 업로드될 파일의 크기10Mb

			MultipartRequest multi;
			
			try {
				multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
				BoardDAO dao = BoardDAO.getInstance();
				int test = dao.getListCount(null, null);
				System.out.println("test 값확인 :"+ test);
				
				if (test==0) {
					boardNum = 1;
				} else {
					boardNum += 1;
				}
				BoardDTO board = new BoardDTO();
				FileImageDTO fileDTO = new FileImageDTO();
				ArrayList<FileImageDTO> fileLists = new ArrayList<FileImageDTO>();
				
				board.setId(multi.getParameter("id"));
				board.setName(multi.getParameter("name"));
				board.setSubject(multi.getParameter("subject"));
				board.setContent(multi.getParameter("content"));
				
				System.out.println(multi.getParameter("name"));
				System.out.println(multi.getParameter("subject"));
				System.out.println(multi.getParameter("content"));
				
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
				String regist_day = formatter.format(new java.util.Date());
				
				board.setHit(0);
				board.setRegist_day(regist_day);
				board.setIp(request.getRemoteAddr());
				
				dao.insertBoard(board);
				Enumeration files = multi.getFileNames();
				
				while (files.hasMoreElements()) {
					UUID uuid = UUID.randomUUID();
					FileImageDTO fileDTO2 = new FileImageDTO();
					String fname = (String) files.nextElement();
					
					String fileName = multi.getFilesystemName(fname);
					
					String uploadFileName = uuid.toString() + "_" + fileName;
					fileDTO2.setFileName(uploadFileName);
					fileDTO2.setRegist_day(regist_day);
					fileDTO2.setNum(boardNum);
					
					fileLists.add(fileDTO2);
					
					if(!fileName.equals("")) {
						String fullFileName = realFolder + "/" + fileName;
						File f1 = new File(fullFileName);
					     if(f1.exists()) {
					    	 File newFile = new File(realFolder + "/" + uploadFileName);
					    	 f1.renameTo(newFile);
					     }
				}
					System.out.println("uploadFileName : 반복문안에 파일명" + uploadFileName);
					System.out.println("해당 파일 위치 경로가 찍히는지 여부 : " + realFolder);
				}
				if(fileLists != null) {
					dao.insertImage(fileLists);
					System.out.println("boardNum:" + boardNum);
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		public void requestBoardView(HttpServletRequest request) {
			BoardDAO dao = BoardDAO.getInstance();
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			BoardDTO board = new BoardDTO();
			ArrayList<FileImageDTO> fileLists = new ArrayList<FileImageDTO>();
			board = dao.getBoardByNum(num, pageNum);
			System.out.println("getBoardByNum 메서드 출력후" + board);
			System.out.println("num : " + num);
			fileLists = dao.getBoardImageByNum(num);
			System.out.println("getBoardImageByNum 메서드 출력후" + fileLists);
			
			for (int i = 0; i < fileLists.size(); i++) {
				FileImageDTO ex = fileLists.get(i);
				String ex2 = ex.getFileName();
				System.out.println("ex2 밖에 반복문 테스트" + ex2);
			}
			request.setAttribute("num", num);
			request.setAttribute("page", pageNum);
			request.setAttribute("board", board);
			
			request.setAttribute("fileLists", fileLists);
		}
		public void requestBoardUpdate(HttpServletRequest request) {
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			BoardDAO dao = BoardDAO.getInstance();
			
			BoardDTO board = new BoardDTO();

			board.setNum(num);
			board.setName(request.getParameter("name"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			String regist_day = formatter.format(new java.util.Date());

			board.setHit(0);
			board.setRegist_day(regist_day);
			board.setIp(request.getRemoteAddr());

			dao.updateBoard(board);
		}
		public void requestBoardDelete(HttpServletRequest request) {

			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));

			BoardDAO dao = BoardDAO.getInstance();

			dao.deleteBoard(num);
		}
	}
