package action.tra;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Command;
import model.tra.TradeBoardDAO;
import model.tra.TradeBoardVO;

public class TradeBoardListAction implements Command {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		
		
//		ActionForward forward = new ActionForward();
	       
		  int pageSize=5;
		  if(request.getParameter("pagesize")!=null&&request.getParameter("pagesize")!=""){
			  pageSize=Integer.parseInt(request.getParameter("pagesize"));
		  }
		  int pageSizeref=pageSize-1;
		  

		  //시작 페이지
		    int TradeBoardCurrentPage = 1;
	        String page = request.getParameter("page");
	        String tra_header=request.getParameter("tra_head");

	        if(tra_header==null||tra_header==""||tra_header.equals("전체")) tra_header="전체";
	        //가져온페이지가 널이아니면 시작페이지를 가져온 페이지로
	        if(page != null&&page!="")  TradeBoardCurrentPage = Integer.parseInt(page);
	        int tradeStartNum=TradeBoardCurrentPage*pageSize-pageSizeref; //시작 글번호
	        int tradeEndNum=pageSize; //끝번호 사실상 의미없음. pageSize와 같은값.
	        
	        //검색 옵션
	        String opt = request.getParameter("opt");
	        //검색조건
	        String condition=request.getParameter("condition");
	        //한글검색씨 꺠짐떄문에 처리
	        if(condition!=null) {
	        	
	        	condition=URLDecoder.decode(request.getParameter("condition"),"UTF-8");
	        }
	        
	        
	        
	        
	        //검색조건,검색내용,시작페이지 글번호 hashmap에 담음
	       HashMap<String, Object> listOpt = new HashMap<String, Object>();
	        listOpt.put("opt", opt);
	        listOpt.put("condition", condition);
	        listOpt.put("tra_head",tra_header);
	        //첫 시작 글번호 
	        listOpt.put("start", tradeStartNum);
	        listOpt.put("end",tradeEndNum);
	        TradeBoardDAO dao = TradeBoardDAO.getInstance();
	        
	        //전체 게시물숫자 조회
	        int listCount = dao.getBoardListCount(listOpt,tra_header);
	        //,시작 글 번호 사용안하고있음? 왜냐하면 위의 쿼리에서 알아서 걸러버림. 지울것.
	        int TradeBoardNumberSize=listCount-(TradeBoardCurrentPage-1) *pageSize;
	        
	        
	        
	        //게시물 내용 담음
	        ArrayList<TradeBoardVO> list =  dao.getBoardList(listOpt);

	        

	        
	        
	        //한번에 보여줄 페이징의 수
	        int pageBlock=5;
	        
	        //전체 페이지 크기
	        int pageCount = listCount / pageSize + ( listCount % pageSize == 0 ? 0 : 1 );
	       
	        
	        int startPage = (int)((TradeBoardCurrentPage-1)/pageBlock) * pageBlock + 1;
	        int endPage = startPage +pageBlock- 1;
	        
	        //蹂댁뿬吏��뒗 �럹�씠吏�媛� 留덉�留� �럹�씠吏��씪寃쎌슦 留덉�留됲럹�씠吏��뒗 maxpage�씠�떎.
	        if(endPage > pageCount)    endPage = pageCount;
	        
	        
	        
	      
	      
			
	        
	        
	        
	        
	        
	        
	        request.setAttribute("pageSize", pageSize);
	        
	        
	        //�럹�씠吏� �닽�옄�뿉���븳 �꽕�젙
	        request.setAttribute("TradeBoardCurrentPage", TradeBoardCurrentPage);
	        request.setAttribute("pageCount", pageCount);
	        request.setAttribute("startPage", startPage);
	        request.setAttribute("endPage", endPage);
	        request.setAttribute("pageBlock", pageBlock);
	        request.setAttribute("pagesize", pageSize);

	        //珥� 寃뚯떆臾쇱닔,寃뚯떆臾쇰궡�슜�쓣 �떞怨좎엳�쓬.
	        request.setAttribute("listCount", listCount);
	        request.setAttribute("list", list);
	        request.setAttribute("tra_head", tra_header);
	        
	        //寃��깋�떆 寃��깋議곌굔�쓣 �쑀吏��븯湲곗쐞�빐 �꽕�젙�븿.
	        if(opt!=null) {
	        request.setAttribute("opt", opt);
	        request.setAttribute("condition", condition);
	       }
			return "/view/tra/list.jsp";
	        
	      	        
	       
	       
	    }

}
