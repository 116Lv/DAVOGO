package portal;

import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class FrontBootApplication {
	
	public static void main(String[] args) {
		System.out.println("##### FrontBootApplication Start #####");

		SpringApplication springApplication = new SpringApplication(FrontBootApplication.class);
		springApplication.setBannerMode(Banner.Mode.OFF);
		//springApplication.setLogStartupInfo(false);
		springApplication.run(args);

		System.out.println("##### FrontBootApplication End #####");
	}

}
