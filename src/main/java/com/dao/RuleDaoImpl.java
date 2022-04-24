package com.dao;

import com.entity.Rule;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

@Repository
public class RuleDaoImpl implements RuleDao {
    private   SessionFactory sessionFactory;

    public Rule get(String name, String password) {
        Session session = this.sessionFactory.openSession();
        Query ruleQuery = session.createQuery("from Rule where name='"+name+"' and password ='"+password+"'");
        Rule rule = (Rule) ruleQuery.uniqueResult();
        session.close();
        return rule;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return  sessionFactory;
    }
}
