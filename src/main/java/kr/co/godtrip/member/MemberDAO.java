package kr.co.godtrip.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

		public MemberDAO() {
			System.out.println("----MemberDAO() end");
		}
		
		@Autowired
		SqlSession sqlSession;
		//회원가입
		public void insert(MemberDTO dto) {
			sqlSession.insert("member.insert",dto);
		}
		
		//중복체크 id, email
		public int duplicateId(String id) {
			return sqlSession.selectOne("member.duplicateId",id);
		}
		
		public int duplicateemail(String email) {
			return sqlSession.selectOne("member.duplicateEmail",email);
		}
		
		//로그인
		public MemberDTO loginProc(String id, String passwd) {
		    Map<String, String> paramMap = new HashMap<>();
		    paramMap.put("id", id);
		    paramMap.put("passwd", passwd);
		    return sqlSession.selectOne("member.loginProc", paramMap);
		}
		
}
