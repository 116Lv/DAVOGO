package portal.core.config;

import org.springframework.beans.factory.annotation.Value;

import lombok.RequiredArgsConstructor;

//@Slf4j
//@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig //extends WebSecurityConfigurerAdapter 
{
    
    @Value("#{'${jwt.ignorePath}'.split(',')}")
    private String[] ignorePath;

//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }

//    @Bean @Lazy
//    @Override
//    public AuthenticationManager authenticationManagerBean() throws Exception {
//        return super.authenticationManagerBean();
//    }

//    @Override
//    public void configure(WebSecurity web) {
//        web.ignoring().antMatchers(ignorePath);
//    }
//    
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//            .authorizeRequests()    				// 다음 리퀘스트에 대한 사용권한 체크
//            .antMatchers("/**").permitAll()        	// 인증 관련된 요청은 누구나 접근가능
//            .anyRequest().authenticated()       	// 그외 나머지 요청은 인증된 경우만 접근 가능
//        .and()
//            .formLogin()
//            .loginPage("/login/loginForm")
//            .loginProcessingUrl("/login.do")
//            .defaultSuccessUrl("/main.do", true)
//            .permitAll()
//        .and()
//            .logout()
//            .invalidateHttpSession(true)
//            .deleteCookies("JSESSIONID")
//            .logoutRequestMatcher(new AntPathRequestMatcher("/logout.do"));
//    }
}
