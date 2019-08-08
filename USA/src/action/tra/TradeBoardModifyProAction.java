package action.tra;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Command;
import model.tra.TradeBoardDAO;
import model.tra.TradeBoardVO;

public class TradeBoardModifyProAction implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println("여기는 모디파이 프로 액션"+num);
		int fileSize= 5*1024*1024;
		
		String uploadPath = request.getServletContext().getRealPath("/UploadFolder");

		System.out.println(uploadPath +"//업로드폴더?");
		TradeBoardDAO dao = TradeBoardDAO.getInstance();
		TradeBoardVO border = new TradeBoardVO();
		
		try {
			
			MultipartRequest multi = new MultipartRequest
					(request, uploadPath, fileSize, "euc-kr", new DefaultFileRenamePolicy());

			String fileName = "";
			Enumeration<String> names = multi.getFileNames();
			if(names.hasMoreElements())
			{
				String name = names.nextElement();
				fileName = multi.getFilesystemName(name);
				String existFile=request.getParameter("board.board_file");
				if(fileName == null)	// ������ ���ο� ������ ÷�� ���ߴٸ� ���� ���ϸ��� ����
					border.setBoard_file(existFile);
				else	// ���ο� ������ ÷������ ���
					border.setBoard_file(fileName);
			}
			
			
			
			
	
			
			border.setBoard_num(num); 
			border.setBoard_id(multi.getParameter("board_id")); // ���簪
			border.setBoard_subject(multi.getParameter("board_subject"));
			border.setBoard_content(multi.getParameter("board_content"));
			border.setBoard_file(fileName);
			
			boolean result = dao.updateBoard(border);
			
			if(result){
				System.out.println("컨텐츠로 넘어가기위한 단계");
				return "/view/tra/content.do?num="+num;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 등록 실패 " + e.getMessage());
		}
		
		
		
		return "/view/tra/content.do?num="+num;
	}

}