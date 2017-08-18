package cn.edu.gdin.service;

import java.util.List;

import cn.edu.gdin.entity.Course;

public interface IncidentDataProcessService {
	public List getIncidentData(int page,int rows,String str);
	public Long getTotal(String str);
    public void deleteData(String id);
	
	public void addData(Course course);
	public void editData(Course course);
	public <T> String getMaxNum(String str,String str1);
	public <T> void addLog(T enityclass);
}
