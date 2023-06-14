package kr.co.godtrip.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	
	public ProductDAO() {
		System.out.println("----ProductDAO()객체생성됨");
	}
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	
	
	
	
}//class end 
