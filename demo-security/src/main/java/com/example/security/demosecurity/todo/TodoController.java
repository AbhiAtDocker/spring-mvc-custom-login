package com.example.security.demosecurity.todo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;


@Controller
public class TodoController {
   
	@Autowired
	private TodoRepository_ todoRepo;
	
	/*
	public TodoController(TodoRepository_ todoRepository) {
		this.todoRepo = todoRepository;
	}
	*/
	@GetMapping(value="/add-task")
	public String addTask(@RequestParam String username, ModelMap model) {
	 model.put("name", username);
	 return "add-todo";
	}
	
	@GetMapping(value="/update-task")
	public String updateTask(@RequestParam Integer id, ModelMap model) {
	 Todo todo = todoRepo.findById(id).get();
	 model.addAttribute("todo", todo);
	 return "update-todo";
	}
	
	@PostMapping(value="/add-todo")
	public String addTodo(@ModelAttribute Todo todo, ModelMap model, HttpSession session) {
		Todo todoSaved = todoRepo.save(todo);
		//get todolist from session and save item in it.
		//List<Todo> todoList = (List<Todo>) session.getAttribute("TodoList");
		//todoList.add(todoSaved);
		List<Todo> todoList = todoRepo.findByUsername(todo.getUsername());
		model.put("todoList", todoList);
		return "todo-list";
	}
	
	@GetMapping("/get-todo-list")
	public String fetchTodoListByUser(@RequestParam String user, ModelMap model, HttpSession session){
		List<Todo> todoList = todoRepo.findByUsername(user);
		model.put("todoList", todoList);
		//if(todoList.size()>0)
		//((List<Todo>)session.getAttribute("todoList")).addAll(todoList);
		return "todo-list";
	}
	
	
	@PostMapping("/update-todo")
	public String updateTodoUser(@ModelAttribute Todo todo, ModelMap model,HttpSession session){
		Todo todoUpdated = todoRepo.save(todo);
		List<Todo> todoList = todoRepo.findByUsername((String)session.getAttribute("name"));
		model.put("todoList", todoList);
		//if(todoList.size()>0)
		//((List<Todo>)session.getAttribute("todoList")).addAll(todoList);
		return "todo-list";
	}
	
	@GetMapping("/delete-todo")
	public String deleteTodoUser(@RequestParam int id, ModelMap model,HttpSession session){
		 todoRepo.deleteById(id);
		List<Todo> todoList = todoRepo.findByUsername((String)session.getAttribute("name"));
		model.put("todoList", todoList);
		//if(todoList.size()>0)
		//((List<Todo>)session.getAttribute("todoList")).addAll(todoList);
		return "todo-list";
	}
}
