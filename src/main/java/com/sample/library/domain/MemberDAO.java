package com.sample.library.domain;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.*;

public class MemberDAO implements TWMemberDao{
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Override
	public MemberVO getID(String useremail, String username) {
		String sql ="select*from users where useremail=? and username=?";
		try {
			return template.queryForObject(sql,new Object[] {useremail,username},new RowMapper<MemberVO>() {
				@Override
				public MemberVO mapRow(ResultSet rs,int rowNum)throws SQLException{
					MemberVO m = new MemberVO();
					m.setUserid(rs.getString("userid"));
					m.setUserpass(rs.getString("userpass"));
					m.setUsername(rs.getString("username"));
					m.setGender(rs.getString("gender"));
					m.setBirthday(rs.getString("birthday"));
					m.setUserphone(rs.getString("userphone"));
					return m;
				}
			});
		}catch(Exception e) {
			return null;
		}
	}
	@Override
	public boolean FindId(String useremail,String username) {
		MemberVO m = getID(useremail,username);
		
		if(m!=null) {
			String id = m.getUserid();
			return true;
		}return false;
	}

	@Override
	public MemberVO getPW(String userid, String username, String useremail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean FindPW(String userid, String username, String useremail) {
		// TODO Auto-generated method stub
		return false;
	}
}
