package kr.co.godtrip.payment;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class FinalreserveDAO {
   public FinalreserveDAO() {
      System.out.println("-----FinalreserveDAO() 객체생성됨");
   }
   
   @Autowired
   SqlSession sqlSession;
   
   public List<FinalreserveDTO> finalreserveList() {
        return sqlSession.selectList("finalreserve.selectAll");
    }
}
