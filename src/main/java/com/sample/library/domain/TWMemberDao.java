package com.sample.library.domain;

public interface TWMemberDao {
	
	public MemberVO getID(String useremail, String username);
	public MemberVO getPW(String userid, String username, String useremail);
	public boolean FindId(String useremail, String username);
	public boolean FindPW(String userid, String username, String useremail);
}
