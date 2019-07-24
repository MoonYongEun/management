package user.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserDTO {
	private int corp_seq;
	private String login_id;
	private String login_pwd;
	private String corp_name;
	private String corp_dpt;
	
}
