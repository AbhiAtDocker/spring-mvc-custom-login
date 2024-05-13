package com.example.security.demosecurity.user.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration	 {

	
	@Bean
	public UserDetailsService userDetailService() {
		
		return new UserInfoUserDetailsService();
	}

	/****
	 * 
	 * @param http
	 * @return
	 * @throws Exception
	 */
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		
		   http.csrf().disable()
		   .authorizeHttpRequests(auth -> auth
		   .requestMatchers("/images/**", "/css/**", "/js/**", "/WEB-INF/**").permitAll()	   
		  .anyRequest().authenticated() )
		   .formLogin(form -> form .loginPage("/login")
		  .defaultSuccessUrl("/welcome") .permitAll() )
		   .logout(logout -> logout
		  .logoutUrl("/logout")
		  .logoutSuccessUrl("/login?logout") 
		  .permitAll() //
		  .logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET")));
		 
		
		/* http
         .csrf().disable()  // Disable CSRF protection for example purposes
         .authorizeHttpRequests(auth -> auth
             .anyRequest().authenticated()  // Require authentication for all requests
         )
         .formLogin(Customizer.withDefaults());  // Enable default form login
*/
     return http.build();
		
		
		
	   
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		//return new BCryptPasswordEncoder();
		return NoOpPasswordEncoder.getInstance();
	}
	
	@Bean
	public AuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(userDetailService());
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		return authenticationProvider;
	}
	
	
	
	
	
}
