package com.baseball.app.files;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;


@Component
public class FileDownView extends AbstractView {

	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println("fileDown View");
//		Iterator<String> it = model.keySet().iterator();
//		
//		while(it.hasNext()) {
//			System.out.println(it.next());
//		}
		
		FileDTO fileDTO = (FileDTO)model.get("file"); //보드 파일 dto
		String path = (String)model.get("kind"); // qna
		
		path = request.getSession().getServletContext().getRealPath("/resources/images/"+path+"/");
		// 가져올 경로 지정
		
		File file = new File(path, fileDTO.getFileName());
		// 파일이름 맞는 것 가져오기
		
		//한글 Encoding 처리
		//Filter에서 했다면 생략 가능
		response.setCharacterEncoding("UTF-8");
		
		//파일의 크기
		response.setContentLength((int)file.length());
		
		//다운시 파일명 지정
		String name = fileDTO.getOriginalName();
		//인코딩 설정
		name = URLEncoder.encode(name, "UTF-8");
		
		//타입을 헤더에 설정
		response.setHeader("Content-Disposition", "attachment;fileName=\""+name+"\"");
		response.setHeader("Content-transfer-Encoding", "binary");
		
		FileInputStream fi = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		
		FileCopyUtils.copy(fi, out);
		
		//자원 해제
		out.close();
		fi.close();
		
		
	}
	
	
	
	
	
	
	
	
	
	

}
