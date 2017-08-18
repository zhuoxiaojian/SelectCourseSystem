package cn.edu.gdin.entity;



public  class Register implements java.io.Serializable {

	

	private Integer id;
	private String username;
	private String password;
	private String power;

	
	public Register() {
	}


	public Register(String username, String password, String power) {
		this.username = username;
		this.password = password;
		this.power = power;
	}



	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPower() {
		return this.power;
	}

	public void setPower(String power) {
		this.power = power;
	}

}