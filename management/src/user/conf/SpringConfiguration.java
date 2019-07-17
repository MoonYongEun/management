package user.conf;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfiguration {
	
	@Bean(name="dataSource",destroyMethod="close")
	public BasicDataSource getBasicDataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		basicDataSource.setUrl("jdbc:mysql://localhost:3306/management?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false");
		basicDataSource.setUsername("management");
		basicDataSource.setPassword("spring");
		basicDataSource.setMinIdle(3);
		basicDataSource.setMaxTotal(20);
		
		return basicDataSource;
	}
}

