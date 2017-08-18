package cn.edu.gdin.Adao;

import java.util.List;
import java.util.Map;

import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.entity.SelectCourse;


public interface AdminCommonDao {
	public <T> void sava(T entity); // 保存信息，无返回值；

	public <T> void remove(T entity); // 删除信息

	public <T> void update(T entity); // 更新信息

	public <T> T findById(Class<T> entityClass, String id); // 通过id来查找某一个信息；
    
	public <T> T findId(Class<T> entityclass,Integer id);
	
	public <T> List<T> findAll(Class<T> entityclass); // 使用范型List<>，查询所有的信息
	
	public <T> List<T> getIncidentData(Class<T> entityclass,int page,int rows);//easyui
	
	public <T> Long getTotal(Class<T> entityclass);//总记录数
	
	public <T> Long findByParam(Class<T> entityclass,String name,String param);//根据某个条件进行统计

	public SelectCourse findByTwoId(String id1,String id2);
	
	public <T> Object[] getColumnName(Class<T> entityclass);//获取数据库的列名
	
	public <T> List<T> getByParamData(Class<T> entityclass,String param0,String param1);//混合查询
	public <T> Long getByParamTotal(Class<T> entityclass,String param0,String param1);//混合查询中的总记录数
    
	/**
	 * 查询注册的用是否已注册过，查询注册的角色是否在数据库中。
	 * @param entityclass
	 * @param param0
	 * @param param1
	 * @return
	 */
	public <T> List<T> Register(Class<T> entityclass,Object param0,Object param1);//查询注册的用是否已注册过，查询注册的角色是否在数据库中。
	
	public List<TCS> Count(String tenum,int page,int rows);
	
	public Long TotalCount(String tenum);
	
	public List<SelectCourse> SInfo(String tenum,String cno);
	
	
	public <T> List<T> getResultData(Class<T> entityclass,Object param0,Object param1,int page,int rows);
	public <T> Long TotalResultData(Class<T> entityclass,Object param0,Object param1);
	
	public <T> List<T> getGDTwoParam(Class<T> entitycalss,Object param0,Object param1);
	public <T> List<T> getResultTJ(Class<T> entityclass,Object param0,Object param1,Object param2);/**成绩统计*/

	public <T> List<T> getByMoreParams(Class<T> entityclass,int page,int rows,String...strings);
	public <T> Long TotalByMoreParams(Class<T> entityclass,String...strings);
	
	public <T> List<T> SortResultByCourse(String cno);
	public <T> List<T> SortResultByStuclass(String stuclass,String cno);
	
	public <T> List<T> getUserIpByParam(Class<T> entityclass,Object obj1,Object obj2,Object obj3,Object obj4,int page,int rows);
	public <T> Long TotalUserIpByParam(Class<T> entityclass,Object obj1,Object obj2,Object obj3,Object obj4);
	
	public <T> List<T> getUserLogByParam(Class<T> entityclass,Object obj1,Object obj2,Object obj3,Object obj4,Object obj5,Object obj6,int page,int rows);
	public <T> Long TotalUserLogByParam(Class<T> entityclass,Object obj1,Object obj2,Object obj3,Object obj4,Object obj5,Object obj6);
	
	public <T> List<T> getEntityByParam(Class<T> entityclass,Object obj1,Object obj2,Object obj3,Object obj4,Object obj5,Object obj6,int page,int rows);
	public <T> Long TotalEntityByParam(Class<T> entityclass,Object obj1,Object obj2,Object obj3,Object obj4,Object obj5,Object obj6);
	
	public <T> String getMaxNum(String str,String str1);
}
