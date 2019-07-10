package user.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserDTO {
	private int seq;
	private String name;
	private String kor;
	private String math;
	private String eng;
	
}
