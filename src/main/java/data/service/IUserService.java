package data.service;


import data.entity.Test;
import data.entity.User;

import java.util.List;

public interface IUserService {

    User getUserByName(String username);

    List<User> getAllUser();

    int updateUser(User user);

    int addUser(User user);

    int changePwd(User user);

    int delUserByName(String username);

    int updateUserAuz(User user);
}
