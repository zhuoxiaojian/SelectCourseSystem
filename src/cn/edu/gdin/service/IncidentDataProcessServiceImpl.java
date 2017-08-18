package cn.edu.gdin.service;

import java.util.List;

import cn.edu.gdin.dao.IncidentDataProcessDao;
import cn.edu.gdin.entity.Course;

public class IncidentDataProcessServiceImpl implements
		IncidentDataProcessService {

	private IncidentDataProcessDao incidentDataProcessDao;

	public IncidentDataProcessDao getIncidentDataProcessDao() {
		return incidentDataProcessDao;
	}

	public void setIncidentDataProcessDao(
			IncidentDataProcessDao incidentDataProcessDao) {
		this.incidentDataProcessDao = incidentDataProcessDao;
	}


	public List getIncidentData(int page,int rows,String str) {
		return incidentDataProcessDao.getIncidentData(page, rows,str);
	}
	public Long getTotal(String str){
		return incidentDataProcessDao.getTotal(str);
	}
	
    public void deleteData(String id){
    	incidentDataProcessDao.deleteData(id);
    	return ;
    }
	
	public void addData(Course course){
         incidentDataProcessDao.addData(course);
         return;
    }
	public void editData(Course course){
        incidentDataProcessDao.editData(course);
        return;
   }

	public <T> void addLog(T enityclass) {
		// TODO Auto-generated method stub
		this.incidentDataProcessDao.addLog(enityclass);
	}

	public <T> String getMaxNum(String str, String str1) {
		// TODO Auto-generated method stub
		return this.incidentDataProcessDao.getMaxNum(str, str1);
	}
}	
