package data.service.imple;

import data.entity.Test;
import data.entity.User;
import data.mapper.TestMapper;
import data.mapper.UserMapper;
import data.service.ITestService;
import data.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImple implements IUserService {

    @Autowired
    private UserMapper userMapper;

    public User getUserByName(String username) {
        return userMapper.getUserByUsername(username);
    }

    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    public int changePwd(User user) {
        return userMapper.updateUser(user);
    }

    public int delUserByName(String username) {
        return userMapper.delUserByName(username);
    }
}
