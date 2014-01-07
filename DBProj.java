 import java.sql.*;
import java.util.*;
import com.mysql.jdbc.Driver;
public class DBProj{

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/db";
//  Database credentials
    static final String USER = "root";
    static final String PASS = "aritra";
   
   public static void main(String[] args) {
   Connection conn = null;
   Statement stmt = null;
   try{
      //STEP 2: Register JDBC driver
    
        Scanner s =new Scanner(System.in);
      //STEP 3: Open a connection
      System.out.println("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
      String sql;
     String choice;  


     System.out.println("Enter choice\n1.Query\n2.Update\n3.Batch \n4.Exit\n");
     choice=s.nextLine();
      
      //Scanner sc  ;
    //  sql = "SELECT * FROM Event";
      if(choice.compareTo("1")==0){    
        System.out.println("Enter Query\n");
       sql=s.nextLine();
      ResultSet rs = stmt.executeQuery(sql);
      ResultSetMetaData rsMetaData = rs.getMetaData();
      
      int colCount = rsMetaData.getColumnCount();
      for(int i = 1; i <= colCount; i++) {
    	  System.out.print(String.format("%-25s ",rsMetaData.getColumnLabel(i)) );
      }
      System.out.println();
      //STEP 5: Extract data from result set
      while(rs.next()){
         //Retrieve by column name
    	  for(int i= 1; i <= colCount; i++) {
    		  System.out.print(String.format("%-25s ",rs.getObject(i)));
    	  }
    	  System.out.println();
         
      }
      //STEP 6: Clean-up environment
      rs.close();
     }
      else if (choice.compareTo("2")==0){
       System.out.println("Enter UpdateQuery\n");
       sql=s.nextLine();
       stmt.executeUpdate(sql);
       System.out.println("Updated successfully\n"); 
      }
       
       else if(choice.compareTo("3")==0){

      
    System.out.println("Batch update\n");
}
      else {

           System.exit(1);
              }
 
      stmt.close();
      conn.close();
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            stmt.close();
      }catch(SQLException se2){
      }// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
  
}//end main
}
