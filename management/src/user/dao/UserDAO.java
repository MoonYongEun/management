package user.dao;

import java.util.List;

import user.bean.UserDTO;

public interface UserDAO {

	public List<UserDTO> selectList();

}
