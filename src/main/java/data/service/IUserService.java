package data.service;


import data.entity.Test;
import data.entity.User;

import java.util.List;

public interface IUserService {
    User getUserByName(String username);
}