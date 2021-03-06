package user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import user.bean.UserDTO;

@Repository
public class UserDAOMyBatis implements UserDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserDTO> selectList() {
		return sqlSession.selectList("userSQL.selectList");
	}

	@Override
	public void write(UserDTO userDTO) {
		sqlSession.insert("userSQL.write", userDTO);
	}

	@Override
	public String loginCheck(Map<String, String> map) {
		return sqlSession.selectOne("userSQL.loginCheck", map);
	}

	@Override
	public String checkId(String login_id) {
		return sqlSession.selectOne("userSQL.checkId", login_id);
	}

	@Override
	public List<UserDTO> search(Map<String, String> map) {
		return sqlSession.selectList("userSQL.search", map);
	}

	@Override
	public void delete(String corp_seq) {
		sqlSession.delete("userSQL.delete", corp_seq);
		
	}

	@Override
	public UserDTO userModify(String login_id) {
		return sqlSession.selectOne("userSQL.userModify", login_id);
	}

	@Override
	public void userUpdate(Map<String, String> map) {
		sqlSession.update("userSQL.userUpdate", map);
		
	}

}
