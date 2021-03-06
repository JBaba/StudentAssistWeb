package com.studentAssist.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ApartmentDetails {
    public static String[] apartmentNames = new String[]{"Maple Square", "Garden Club", "Autumn Hollow", "Cooper Chase", "Arbor Oaks", "Centennial Court", "Center Point", "Cottonwood Ridge N", "Cottonwood Ridge S", "Creek Bend", "Meadow Run", "Oak Landing", "Pecan Place", "Heightson Pecan", "Lofts", "Timber Brook", "University Village", "West Crossing", "Woodland Springs", "Arlington Hall", "Brazos House", "Kalpana Chawla Hall ", "Lipscomb Hall North ", "Lipscomb Hall South", "Trinity House", "Vandergriff Hall", "Manor Apartments", "University Oaks", "Zen Apartments", "Richlyn Apt", "Benge Oaks", "Pine woods ", "Vintage pads", "heights on pecan"};
    public static String[] apartmentType = new String[]{"on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "on", "dorms", "dorms", "dorms", "dorms", "dorms", "dorms", "dorms", "off", "off", "off", "off", "off", "off", "off", "on"};

    public static void addAptsToNewDb() {
        Session session = null;
        try {
            try {
                SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
                session = sessionFactory.openSession();
                session.beginTransaction();
                int i = 0;
                while (i < apartmentNames.length) {
                    Apartments apartment = new Apartments();
                    apartment.setApartmentName(apartmentNames[i]);
                    apartment.setApartmentType(apartmentType[i]);
                    apartment.setAddedDate(new Date());
                    session.save((Object)apartment);
                    ++i;
                }
                session.getTransaction().commit();
            }
            catch (Exception e) {
                e.printStackTrace();
                if (session != null) {
                    session.close();
                }
            }
        }
        finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public static void addAllApartments() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://apurv.cqzmtisgrhoa.us-east-1.rds.amazonaws.com:3306", "apurvk", "12345678");
            stmt = conn.createStatement();
            String sql = "SELECT *from project3.apartments";
            rs = stmt.executeQuery(sql);
            System.out.println("{");
            while (rs.next()) {
                String name = rs.getString("name");
                String type = rs.getString("type");
                System.out.print("\"" + type + "\"");
                System.out.println(",");
            }
            System.out.println("}");
            rs.close();
            stmt.close();
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}