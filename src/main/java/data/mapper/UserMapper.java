package data.mapper;

import data.entity.Test;
import data.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    User getUserByUsername(String username);

    List<User> getAllUser();

    int updateUser(User user);

    int addUser(User user);
}
