package com.sample.library.mapper;

import java.util.Date;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sample.library.domain.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class) // @Component 계열 애노테이션에 해당함
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {

	@Autowired
	private BoardMapper boardMapper;

	@Test
	public void testInsert() {

		boardMapper.deleteAll();

		Random random = new Random();

		for (int i = 1; i <= 127; i++) {
			BoardVO boardVO = new BoardVO();

			int num = boardMapper.nextNum(); // insert할 새글번호 가져오기

			boardVO.setBoardId(num);
			boardVO.setUserid("user1");
			boardVO.setSubject("글제목" + i + " 입니다.");
			boardVO.setContent("글내용" + i + " 입니다.\n글내용 테스트");
			boardVO.setRegdate(new Date());
			boardVO.setStatus("답변 대기중");

			boardMapper.insert(boardVO);
		} // for

	}

}
