package portal.core.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.support.lob.DefaultLobHandler;

@Configuration
@MapperScan(basePackages = "portal.**.mapper")
public class MapperConfig {
    
    @Value("${mybatis.mapper.locations}")
    private Resource[] mapperLocations;

    @Value("${mybatis.config-location}")
    private Resource configLocation;

	@Bean
	@Lazy
	public DefaultLobHandler lobHandler() {
		return new DefaultLobHandler();
	}

    // @Bean
    // public MapperScannerConfigurer mapperScannerConfigurer(@Value("${mybatis.mapper.base.package}") String basePackage) {
    //     MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
    //     mapperScannerConfigurer.setBasePackage(basePackage);
    //     return mapperScannerConfigurer;
    // }

    @Bean
    public SqlSessionFactoryBean sqlSession(DataSource dataSource) throws IOException {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setConfigLocation(configLocation);
        sqlSessionFactoryBean.setMapperLocations(mapperLocations);
        return sqlSessionFactoryBean;
    }

}
