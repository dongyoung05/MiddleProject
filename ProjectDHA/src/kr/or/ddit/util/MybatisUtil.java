package kr.or.ddit.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtil {

	private static SqlSessionFactory sqlSessionFactory = null;
	
	static {
		InputStream in = null;
		try {
			in = Resources.getResourceAsStream(
						"kr/or/ddit/mybatis/config/mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
					
		} catch (Exception e) {
			System.out.println("mybatis초기화실패");
			e.printStackTrace();
		} finally {
			if(in !=null) try {in.close(); } catch(IOException e) {}
		}
	}
	
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
	
	
}