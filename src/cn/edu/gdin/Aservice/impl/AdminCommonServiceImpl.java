package cn.edu.gdin.Aservice.impl;

import java.util.List;
import java.util.Map;

import cn.edu.gdin.Adao.AdminCommonDao;
import cn.edu.gdin.Aservice.AdminCommonService;
import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.entity.SelectCourse;

public class AdminCommonServiceImpl implements AdminCommonService{

	private AdminCommonDao adminCommonDao;
	public void setAdminCommonDao(AdminCommonDao adminCommonDao) {
		this.adminCommonDao = adminCommonDao;
	}
	public <T> void sava(T entity) {
		// TODO Auto-generated method stub
		this.adminCommonDao.sava(entity);
	}

	public <T> void remove(T entity) {
		// TODO Auto-generated method stub
		this.adminCommonDao.remove(entity);
	}

	public <T> void update(T entity) {
		// TODO Auto-generated method stub
		this.adminCommonDao.update(entity);
	}

	public <T> T findById(Class<T> entityClass, String id) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.findById(entityClass, id);
	}

	public <T> List<T> findAll(Class<T> entityclass) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.findAll(entityclass);
	}

	public <T> List<T> getIncidentData(Class<T> entityclass, int page,int rows) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getIncidentData(entityclass, page, rows);
	}

	public <T> Long getTotal(Class<T> entityclass) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getTotal(entityclass);
	}
	public SelectCourse findByTwoId(String id1, String id2) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.findByTwoId(id1, id2);
	}
	public <T> Long findByParam(Class<T> entityclass, String name, String param) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.findByParam(entityclass, name, param);
	}
	public <T> Object[] getColumnName(Class<T> entityclass) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getColumnName(entityclass);
	}
	public <T> List<T> getByParamData(Class<T> entityclass, 
			String param0,String param1) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getByParamData(entityclass, param0, param1);
	}
	public <T> Long getByParamTotal(Class<T> entityclass, String param0,String param1) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getByParamTotal(entityclass, param0,param1);
	}
	public <T> List<T> Register(Class<T> entityclass, Object param0,
			Object param1) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.Register(entityclass, param0, param1);
	}
	public <T> T findId(Class<T> entityclass, Integer id) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.findId(entityclass, id);
	}
	public List<TCS> Count(String tenum, int page, int rows) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.Count(tenum, page, rows);
	}
	public Long TotalCount(String tenum) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.TotalCount(tenum);
	}
	public List<SelectCourse> SInfo(String tenum, String cno) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.SInfo(tenum, cno);
	}
	public <T> List<T> getResultData(Class<T> entityclass, Object param0,
			Object param1, int page, int rows) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getResultData(entityclass, param0, param1, page, rows);
	}
	public <T> Long TotalResultData(Class<T> entityclass, Object param0,
			Object param1) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.TotalResultData(entityclass, param0, param1);
	}
	public <T> List<T> getGDTwoParam(Class<T> entitycalss, Object param0,
			Object param1) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getGDTwoParam(entitycalss, param0, param1);
	}
	public <T> List<T> getResultTJ(Class<T> entityclass, Object param0,
			Object param1, Object param2) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getResultTJ(entityclass, param0, param1, param2);
	}
	public <T> List<T> getByMoreParams(Class<T> entityclass, int page,
			int rows, String... strings) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getByMoreParams(entityclass, page, rows, strings);
	}
	public <T> Long TotalByMoreParams(Class<T> entityclass, String... strings) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.TotalByMoreParams(entityclass, strings);
	}
	public <T> List<T> SortResultByCourse(String cno) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.SortResultByCourse(cno);
	}
	public <T> List<T> SortResultByStuclass(String stuclass,String cno) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.SortResultByStuclass(stuclass,cno);
	}
	public <T> List<T> getUserIpByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, int page, int rows) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getUserIpByParam(entityclass, obj1, obj2, obj3, obj4, page, rows);
	}
	public <T> Long TotalUserIpByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.TotalUserIpByParam(entityclass, obj1, obj2, obj3, obj4);
	}
	public <T> List<T> getUserLogByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, Object obj5, Object obj6,
			int page, int rows) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getUserLogByParam(entityclass, obj1, obj2, obj3, obj4, obj5, obj6, page, rows);
	}
	public <T> Long TotalUserLogByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.TotalUserLogByParam(entityclass, obj1, obj2, obj3, obj4, obj5, obj6);
	}
	public <T> List<T> getEntityByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, Object obj5, Object obj6,
			int page, int rows) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getEntityByParam(entityclass, obj1, obj2, obj3, obj4, obj5, obj6, page, rows);
	}
	public <T> Long TotalEntityByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.TotalEntityByParam(entityclass, obj1, obj2, obj3, obj4, obj5, obj6);
	}
	public <T> String getMaxNum(String str, String str1) {
		// TODO Auto-generated method stub
		return this.adminCommonDao.getMaxNum(str, str1);
	}
   
}
