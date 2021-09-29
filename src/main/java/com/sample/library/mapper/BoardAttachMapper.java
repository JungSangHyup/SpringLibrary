package com.sample.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.sample.library.domain.BoardAttachVO;
import com.sample.library.domain.Criteria;

public interface BoardAttachMapper {

	int insertAttach(BoardAttachVO boardattachVO);
	
	
	int insertAttaches(List<BoardAttachVO> boardattachList);
	
	
	List<BoardAttachVO> getAttachesByBno(int bno);
	
	
	List<BoardAttachVO> getAttachesByUuids(List<String> uuidList);
	
	
	List<BoardAttachVO> getImages();
	
	
	@Select("SELECT * FROM qnaattach WHERE uploadpath = #{uploadpath}")
	List<BoardAttachVO> getAttachesByUploadpath(String uploadpath);
	
	
	@Delete("DELETE FROM qnaattach WHERE bno = #{bno}")
	int deleteAttachesByBno(int bno);
	
	
	int deleteAttachesByUuids(List<String> uuidList);


	List<BoardAttachVO> getImagesWithPaging(Criteria cri);
	
	int getTotalImages();
	
}
