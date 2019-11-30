package com.gh.service;

import java.util.List;

import com.gh.entity.User;

public interface UserService {

     User getUserById(int id);

	void addUser(User user);

	int deleteUser(Integer id);

	List<User> selectAllUser();

}
