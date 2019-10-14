package com.sist.databoard.dao;
import java.util.*;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DataBoardDAO extends SqlSessionDaoSupport {
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<DataBoardVO> databoardListData(int page) {
		List<DataBoardVO> list = new ArrayList<DataBoardVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rowSize = 10;
		int start = (rowSize * page) - (rowSize - 1);
		int end = rowSize * page;
		map.put("pStart", start);
		map.put("pEnd", end);
		getSqlSession().update("databoardListData", map);
		list = (List<DataBoardVO>)map.get("pResult");
		
		return list;
	}
	
	public void databoardInsert(DataBoardVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pName", vo.getName());
		map.put("pSubject", vo.getSubject());
		map.put("pContent", vo.getContent());
		map.put("pPwd", vo.getPwd());
		map.put("pFilename", vo.getFilename());
		map.put("pFilesize", vo.getFilesize());
		map.put("pFilecount", vo.getFilecount());
		
		getSqlSession().update("databoardInsert", map);
	}
	
	public DataBoardVO databoardDetailData(int no) {
		DataBoardVO vo = new DataBoardVO();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", no);
		
		getSqlSession().update("databoardDetailData", map);
		List<DataBoardVO> list = (List<DataBoardVO>)map.get("pResult");
		vo = list.get(0);
		
		return vo;
	}
	
	public int databoardTotalPage() {
		int total = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		getSqlSession().update("databoardTotalPage", map);
		
		total = (Integer)map.get("pTotal");
		
		return total;
	}
	
}









