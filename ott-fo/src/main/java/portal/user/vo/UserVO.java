package portal.user.vo;

import java.io.Serializable;

import javax.validation.constraints.NotEmpty;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO implements Serializable //implements UserDetails 
{

	private static final long serialVersionUID = -172900517055522973L;

    @NotEmpty
    private String userId;
    
    private String email;
    
    private String emailId;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @NotEmpty
    private String password;

    private String userName;

    @JsonIgnore
    private String role;
    
    public String getEmailId() {
    	return StringUtils.substringBefore(this.email, "@");
    }

}
