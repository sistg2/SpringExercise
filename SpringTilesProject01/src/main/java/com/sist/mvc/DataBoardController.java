package com.sist.mvc;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import com.sist.databoard.dao.*;
import java.io.*;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("databoard")
public class DataBoardController {
	@Autowired
	private DataBoardDAO dao;
	
	@RequestMapping("databoard_list.do")
	public String databoard_list(String page, Model model) {
		if(page==null)
			page = "1";
		int curpage = Integer.parseInt(page);
		List<DataBoardVO> list = dao.databoardListData(curpage);
		int totalpage = dao.databoardTotalPage();
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		
		return "databoard/databoard_list";
	}
	
	@RequestMapping("databoard_insert.do")
	public String databoard_insert() {
		return "databoard/databoard_insert";
	}

	@RequestMapping("databoard_insert_ok.do")
	public String databoard_insert_ok(DataBoardVO vo) {
		List<MultipartFile> list = vo.getFiles();
		String fn = "";
		String fs = "";
		
		if(list!=null && list.size()>0) {
			for(MultipartFile mf : list) {
				String filename = mf.getOriginalFilename();
				fn += filename + ",";
				
				String dir = "c:\\download";
				try {
					mf.transferTo(new File(dir + "\\" + filename)); //upload
				} catch (Exception ex) {}
				
				File file = new File(dir + "\\" + filename);
				long size = file.length();
				
				fs += size+",";
			}
			fn = fn.substring(0, fn.lastIndexOf(","));
			fs = fs.substring(0, fs.lastIndexOf(","));
			
			vo.setFilename(fn);
			vo.setFilesize(fs);
			vo.setFilecount(list.size());
		} else {
			vo.setFilename("");
			vo.setFilesize("");
			vo.setFilecount(0);
		}
		
		dao.databoardInsert(vo);
		
		return "redirect:databoard_list.do";
	}
	
	@RequestMapping("databoard_detail.do")
	public String databoard_detail(int no, Model model) {
		DataBoardVO vo = dao.databoardDetailData(no);
		
		if(vo.getFilecount() > 0) {
			StringTokenizer st = new StringTokenizer(vo.getFilename(), ",");
			while(st.hasMoreTokens()) {
				vo.getFList().add(st.nextToken());
			}
			st = new StringTokenizer(vo.getFilesize(), ",");
			while(st.hasMoreTokens()) {
				vo.getSList().add(st.nextToken());
			}
			
			model.addAttribute("fList", vo.getFList());
			model.addAttribute("sList", vo.getSList());
		}
		
		model.addAttribute("vo", vo);
		
		return "databoard/databoard_detail";
	}
	
	@RequestMapping("databoard_download.do")
	public void databoard_download(String fn, HttpServletResponse response) {
		try {
			File file = new File("c:\\download\\" + fn);
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fn, "UTF-8"));
			response.setContentLength((int)file.length());
			
			// 다운로드 => 서버에서 파일 읽기
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			// 읽은 파일을 클라이언트에 쓰기
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			
			int i = 0;
			byte[] buffer = new byte[1024];
			while((i=bis.read(buffer, 0, 1024)) != -1) {
				bos.write(buffer, 0, i);
			}
			bis.close();
			bos.close();
		} catch (Exception ex) {}
	}
	
	
}







