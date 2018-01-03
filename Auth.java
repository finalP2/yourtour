1111111package net.madvirus.spring4.chap08.auth;1111111

public class Auth {

	private String id;
	private String name;

	public Auth(String email, String name) {
		this.id = email;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

}
