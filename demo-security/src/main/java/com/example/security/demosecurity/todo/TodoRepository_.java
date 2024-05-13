package com.example.security.demosecurity.todo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TodoRepository_ extends JpaRepository<Todo, Integer>{
	public List<Todo> findByUsername(String username);
}
