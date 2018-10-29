package bean;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapClient {
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader( "bean/sqlMapConfig.xml" );
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build( reader );
			session = factory.openSession( true );		// true 	auto commit
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	public static SqlSession getSession() {
		return session;
	}
}