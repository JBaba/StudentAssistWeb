package com.studentAssist.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateSession
{
  private static SessionFactory sess = null;
  
  public static final synchronized SessionFactory getSessionFactory()
  {
    if ((sess != null) && (!sess.isClosed())) {
      return sess;
    }
    return sess = new Configuration().configure().buildSessionFactory();
  }
}
