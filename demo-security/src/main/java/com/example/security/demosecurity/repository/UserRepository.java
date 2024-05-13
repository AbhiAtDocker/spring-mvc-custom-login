package com.example.security.demosecurity.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.security.demosecurity.user.User;

public interface UserRepository extends JpaRepository<User, Integer>{
     
	Optional<User> findByName(String name);
}
