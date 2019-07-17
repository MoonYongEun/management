package user.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserDTO {
	private int seq;
	private String id;
	private String pwd;
	private String name;
	private String department;
	
}
