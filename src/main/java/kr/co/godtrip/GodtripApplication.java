package kr.co.godtrip;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SpringBootApplication
public class GodtripApplication {

	public static void main(String[] args) {
		SpringApplication.run(GodtripApplication.class, args);
	}
	
	@Bean   //내부적으로 객체를 생성해라
	   //template에서 만든 정보를 데이터소스에 가져온다
	   public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
	      SqlSessionFactoryBean bean=new SqlSessionFactoryBean();
	      
	      bean.setDataSource(dataSource);
	      Resource[] res=new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*.xml");
	      
	      bean.setMapperLocations(res);
	      return bean.getObject();
	      // spring boot +mybatis 그대로 사용하면 된다
	   }
	   ////////////////////////////////////////////////////////
	   
	   /////////mapper에서 sql 쿼리문을 가져오면 자동으로 변환시켜 준다
	   @Bean
	   public SqlSessionTemplate sqlSession(SqlSessionFactory factory) {
	       return  new SqlSessionTemplate(factory);
	   }      

}
