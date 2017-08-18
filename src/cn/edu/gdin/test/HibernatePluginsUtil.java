package cn.edu.gdin.test;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
 
import org.hibernate.cfg.Configuration;
import org.hibernate.mapping.Column;
import org.hibernate.mapping.PersistentClass;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edu.gdin.entity.Course;
/**
 * 通过Hibernate配置获取数据库表的具体信息
 * @author 晚风工作室 www.soservers.com
 *
 */
public class HibernatePluginsUtil extends HibernateDaoSupport {
 
    // public static String getTablenameByObject(Class c){
    // SingleTableEntityPersister
    // entityPersister=(SingleTableEntityPersister).getSessionFactory().getClassMetadata(POJO.class).
    //
    // //获得pojo对应表名：
    // String tableName = entityPersister.getTableName();
    // //entityPersister中还包含pojo的属性、属性值、以及属性对应的数据库表字段等配置信息。
    //
    // }
    private static Configuration hibernateConf = new Configuration();
 
    /**
     * 获得Hibernate持久化类
     * @param clazz
     * @return PersistentClass
     */
    @SuppressWarnings("unchecked")
    private static PersistentClass getPersistentClass(Class clazz) {
        synchronized (HibernatePluginsUtil.class) {
            PersistentClass pc = hibernateConf.getClassMapping(clazz.getName());
            if (pc == null) {
                hibernateConf = hibernateConf.addClass(clazz);
                pc = hibernateConf.getClassMapping(clazz.getName());
            }
            return pc;
        }
         
    }
 
    /**
     * 获得表名
     * 
     * @param clazz 映射到数据库的po类
     * @return String
     */
    @SuppressWarnings("unchecked")
    public static String getTableName(Class clazz) {
        return getPersistentClass(clazz).getTable().getName();
    }
 
    /**
     * 获得列名
     * 
     * @param clazz 映射到数据库的po类
     * @param icol 第几列
     * @return String
     */
    @SuppressWarnings("unchecked")
    public static String getColumnName(Class clazz, int icol) {
        // return getPersistentClass( clazz
        // ).getTable().getPrimaryKey().getColumn( 0 ).getName(); //獲取主鍵名
        return getPersistentClass(clazz).getTable().getColumn(icol).getName();
    }
 
    /**
     * 获得所有列名
     * 
     * @param clazz 映射到数据库的po类
     * @return List<String> 列名
     */
    @SuppressWarnings("unchecked")
    public static List<String> getColumnNames(Class clazz) {
        Iterator<Column> itr = getPersistentClass(clazz).getTable().getColumnIterator();
        List<String> columns = new ArrayList<String>();
        while (itr.hasNext()) {
            Column tmp = itr.next();
            columns.add(tmp.getName());
            
        }
        return columns;
    }
 
     public static void main(String[] args) {
		List list = getColumnNames(Course.class);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).toString());
		}
	}
 
}