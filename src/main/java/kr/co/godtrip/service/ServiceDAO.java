package kr.co.godtrip.service;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ServiceDAO {

	public ServiceDAO() {
		System.out.println("-----ServiceDAO() 객체생성됨");
	}

	@Autowired
	SqlSession sqlSession;

	public void serviceInsert(ServiceDTO dto) {
		sqlSession.insert("service.serviceInsert", dto);
	}

	public void serviceDelete(int cno) {
		sqlSession.delete("service.serviceDelete", cno);
	}

	public void serviceUpdate(ServiceDTO dto) {
		sqlSession.update("service.serviceUpdate", dto);
	}

	public List<ServiceDTO> serviceList() {
		return sqlSession.selectList("service.serviceList");
	}

	public ServiceDTO serviceDetail(int c_code) {
		return sqlSession.selectOne("service.serviceDetail", c_code);
	}
	
	public List<ServiceDTO> serviceList(int page, int limit) {
	        int offset = (page - 1) * limit;
	        return sqlSession.selectList("service.serviceList", null, new RowBounds(offset, limit));
	}

	public int getTotalCount() {
	        return sqlSession.selectOne("service.getTotalCount");
	}
	
	
	
}
