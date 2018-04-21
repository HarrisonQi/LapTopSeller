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
}
