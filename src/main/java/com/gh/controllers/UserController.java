package com.gh.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.gh.entity.User;
import com.gh.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

    @Autowired
    private UserService userService;

    
    // 根据id查找用户
    @RequestMapping(value="/list")
    public String showUserName(HttpServletRequest request, Model model){
        
    	List<User> list = userService.selectAllUser();
    	model.addAttribute("list", list);
    	
        return "list";
       
    }
    
    // 添加用户页面
    @RequestMapping(value="/addToPage")
    public String addToPage(HttpServletRequest request, Model model) {
        return "showName";
    }
    
 // 添加页面
    @RequestMapping(value="/add")
    public String addUser(HttpServletRequest request, Model model,User user) {
    	
    	 if(user != null){
    		userService.addUser(user);
             return "redirect:http://localhost:8080/ssm_test/user/list";
         }
    	request.setAttribute("error", "添加用户错误！");
        return "error";
    }
    
 // 添加页面
    @RequestMapping(value="/delete")
    public String deleteUser(HttpServletRequest request, Model model,Integer id) {
    	int i = userService.deleteUser(id);
        return null;
    }

}
