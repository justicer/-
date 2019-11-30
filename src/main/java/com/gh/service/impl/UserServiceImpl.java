package com.gh.service.impl;

import com.gh.dao.UserDao;
import com.gh.entity.User;
import com.gh.service.UserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("UserService")
public class UserServiceImpl implements UserService {

    @Autowired
    public UserDao userDao;

    public User getUserById(int id){
        return userDao.selectByPrimaryKey(id);
    }

	public void addUser(User user) {
		// TODO Auto-generated method stub
		userDao.insertSelective(user);
	}

	public int deleteUser(Integer id) {
		// TODO Auto-generated method stub
		return userDao.deleteByPrimaryKey(id);
	}

	public List selectAllUser() {
		// TODO Auto-generated method stub
		return userDao.selectAllUser();
	}

}
