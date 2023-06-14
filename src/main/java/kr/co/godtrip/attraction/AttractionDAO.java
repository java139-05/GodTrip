package kr.co.godtrip.attraction;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.godtrip.member.MemberDTO;
//@Repository : CRUD로직 구현하겠다/클래스를 자동으로 객체화 시켜준다. 
@Repository
public class AttractionDAO {
	
	
	public AttractionDAO() {
		System.out.println("----AttractionDAO() end");
	}//AttractionDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	public void attractioninsert(Map<String, Object> map) {
		sqlSession.insert("attraction.attractioninsert",map);
	}//insert() end 
	//mapper에서 namespce="attraction"의 id="attractioninsert"에 가서 쿼리문을 map에 받아오는것
	
	

	//목록list
	public List<Map<String, Object>> list(){
		return sqlSession.selectList("attraction.attractionlist");
	}//list() end 
	
	
	
	//상세보기Detail
	public Map<String, Object> detail(int tour_code){
		return sqlSession.selectOne("attraction.detail", tour_code);
	}//detail() end 
	
	
	
	//수정update
    public void update(Map<String, Object> map) {
        sqlSession.update("attraction.update", map);
    }//update() end
	
	
	
	
	public String filename(int tour_code) {
        return sqlSession.selectOne("attraction.filename", tour_code);
    }//filename() end
    
	
    //삭제
    public void delete(int tour_code) {
        sqlSession.delete("attraction.delete", tour_code);
    }//delete() end
    

	
	


}//class end 
