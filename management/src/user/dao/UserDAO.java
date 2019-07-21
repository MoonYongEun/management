package user.dao;

import java.util.List;
import java.util.Map;

import user.bean.UserDTO;

public interface UserDAO {

	public List<UserDTO> selectList();

	public void write(UserDTO userDTO);

	public String loginCheck(Map<String, String> map);

	public String checkId(String id);

	public List<UserDTO> search(Map<String, String> map);

	public void delete(String seq);

}
