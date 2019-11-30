package com.gh.dao;

import java.util.List;

import com.gh.entity.User;

public interface UserDao {

    int deleteByPrimaryKey(Integer id);

    void insert(User user);

    void insertSelective(User user);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User user);

    List<User> selectAllUser();

}
