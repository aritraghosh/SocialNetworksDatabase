import com.mysql.jdbc.Driver;
import java.sql.*;
import java.util.Scanner;
import java.util.logging.*;
import java.lang.*;
import java.net.*;
import java.io.*;
import java.util.Date;


public class Testing
{
    public static void main(String[] args)
    {
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                ResultSet rs=null;
                Statement st=null;
                //Enter ur database name.
                String database = "db";
                String url_mysql="jdbc:mysql://localhost/"+database;
                //username for phpmyadmin
                String User="root";
                //password for phpmyadmin
                String Password="aritra";
                con=DriverManager.getConnection(url_mysql,User,Password);
                System.out.println("Connection successful\n");
                
            }
            catch(Exception e)
            {
                System.out.println("[ERROR] AddDocument.java: connection failed \n"+e.toString());
            }
        }
    }
