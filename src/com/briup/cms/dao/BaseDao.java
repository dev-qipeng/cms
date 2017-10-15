package com.briup.cms.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

/**
 * 基础dao
 */
@Repository("baseDao")
@SuppressWarnings("unchecked")
public class BaseDao<M> {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void save(M model){
		getSession().save(model);
	}
	public M findById(Long id){
		return (M) getSession().load(getEntityClass(), id);
	}
	public void saveOrUpdate(M model) {
		getSession().saveOrUpdate(model);
	}
	public void delete(M model){
		getSession().delete(model);
	}
	public void delete(long id) {
		getSession().delete(this.findById(id));
	}

	public void update(M model) {
		getSession().update(model);
	}
	public List<M> findByHql(String hql,Object... os){
		Query query = getSession().createQuery(hql);
		for(int i=0;i<os.length;i++){
			query.setParameter(i, os[i]);
		}
		return query.list();
	}
	
	public List<M> findAll(){
		return getSession().createCriteria(getEntityClass()).list();
	} 
	
	
	public Class<M> getEntityClass() {
		ParameterizedType parameterizedType = (ParameterizedType) (getClass()
				.getGenericSuperclass());
		return (Class<M>) (parameterizedType.getActualTypeArguments()[0]);
	}
}
