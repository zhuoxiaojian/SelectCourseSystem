package cn.edu.gdin.service;

import java.util.List;

import cn.edu.gdin.dao.TCSCountDao;
import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.entity.SelectCourse;

public class TCSCountService {
	private TCSCountDao tCSCountDao;
	public void settCSCountDao(TCSCountDao tCSCountDao) {
		this.tCSCountDao = tCSCountDao;
	}
	
	public List<TCS> stu_count(String tenum){
		return this.tCSCountDao.Count(tenum);
	}
	
	public List sinfo(String tenum,String cno){
		return this.tCSCountDao.SInfo(tenum,cno);
	}

	public List<TCS> admin_count(){
		return this.tCSCountDao.ACount();
	}
}
