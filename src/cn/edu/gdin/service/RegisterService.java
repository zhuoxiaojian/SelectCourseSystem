package cn.edu.gdin.service;

import cn.edu.gdin.dao.RegisterDao;
import cn.edu.gdin.entity.IpCount;
import cn.edu.gdin.entity.Register;

public class RegisterService {
	private RegisterDao registerDao ;
	

	public void setRegisterDao(RegisterDao registerDao) {
		this.registerDao = registerDao;
	}


	public Register login(Register register){
		
		return registerDao.register(register);
		
	}
	
	public Register FinPwd(String username){
		return registerDao.FindPwd(username);
	}
	
	public void UpdatPwd(Register register){
		registerDao.UdpatePwd(register);
	}
	public void savorupda(IpCount ipCount){
		registerDao.savorupda(ipCount);
	}
	
	public <T> void addLog(T entity){
		this.registerDao.addLog(entity);
	}
}
