package com.sist.news.dao;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class NewsDAO {
	@Autowired
	private MongoTemplate mt;
	
	public void newsDrop() {
		mt.dropCollection("news");
	}
	
	public void newsInsert(NewsVO vo) {
		mt.insert(vo, "news");
	}
	
	public List<NewsVO> newsListData(int page) {
		int rowSize = 10;
		int skip = (page * rowSize) - rowSize;		
		List<NewsVO> list = new ArrayList<NewsVO>();
		
		Query query = new Query();
		query.skip(skip).limit(rowSize);
		
		query.with(new Sort(Sort.Direction.ASC, "no"));
		list = mt.find(query, NewsVO.class, "news");
				
		return list;
	}
	
	public int newsTotalPage() {
		int total = 0;
		Query query = new Query();
		int count = (int)mt.count(query, "news");
		total = (int)(Math.ceil(count/10.0));
		return total;
	}
	
	public NewsVO newsDetailData(int no) {
		NewsVO vo = new NewsVO();
		BasicQuery query = new BasicQuery("{no:"+no+"}"); // find({no:1})
		vo = mt.findOne(query, NewsVO.class, "news"); // find() : List, findOne() : 객체단위
		return vo;
	}
}






