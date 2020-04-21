package com.yi.ex02;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.ReplyVO;
import com.yi.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReplyDAOTest {
	
	@Autowired
	private ReplyDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
//	@Test
	public void testInsert() throws Exception {
		ReplyVO vo = new ReplyVO();
		vo.setBno(2095);
		vo.setReplyer("user01");
		vo.setReplytext("댓글을 test해봅니다.");
		dao.insert(vo);
	}
	
//	@Test
	public void testList() throws Exception {
		dao.list(2101);
	}
	
//	@Test
	public void testUpdate() throws Exception {
		ReplyVO vo = new ReplyVO();
		vo.setRno(5);
		vo.setReplytext("댓글 test중");
		dao.update(vo);
	}
	
//	@Test
	public void testDelete() throws Exception {
		dao.delete(5);
	}
	
	@Test
	public void testTotalCount() throws Exception{
		dao.totalCount(2101);
	}
}
