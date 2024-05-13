package com.example.security.demosecurity.user.config;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.example.security.demosecurity.repository.UserRepository;
import com.example.security.demosecurity.user.MyUserDetails;
import com.example.security.demosecurity.user.User;

public class UserInfoUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepository repository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<User> user = repository.findByName(username);
		user.map(MyUserDetails::new)
		.orElseThrow(()->new UsernameNotFoundException("User Not Found : " + username));
		return new MyUserDetails(user.get());
	}

}
