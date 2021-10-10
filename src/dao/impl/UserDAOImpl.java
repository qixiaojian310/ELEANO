package dao.impl;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDAO;
import db.DBConnect;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.JdbcUtils;
import utils.MD5Utils;
import vo.CartProduct;
import vo.User;

public class UserDAOImpl implements UserDAO {

    public int queryByUserID(User user) throws Exception {
        // TODO Auto-generated method stub
        int flag = 0;
        String sql = "select * from customer where customerID=?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try{

            dbc = new DBConnect() ;

            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setString(1,user.getUserID()) ;


            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                if(rs.getString("passwords").equals(user.getUserPassword())){
                    System.out.println("user"+user.getUserPassword());
                    System.out.println("pwd"+MD5Utils.getPwd(rs.getString("passwords")));
                    flag = 1;
                }
            }
            rs.close() ;
            pstmt.close() ;
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            // 关闭数据库连接
            dbc.close() ;
        }
        return flag;
    }

    @Override
    public int SignUpUser(User user) throws Exception {
        int flag = 0;
        String sql_1 = "select * from customer where customerID=?";
        String sql_2 = "INSERT INTO customer VALUES(?,?,?,?,?)";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        try{

            dbc = new DBConnect() ;
            pstmt = dbc.getConnection().prepareStatement(sql_1) ;
            pstmt.setString(1,user.getUserID()) ;

            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){

                if(rs.getString("customerID").equals(user.getUserID())){
                    return flag;
                }
            }
            rs.close() ;
            pstmt = dbc.getConnection().prepareStatement(sql_2);
            pstmt.setString(1,user.getUserID());
            pstmt.setString(2,user.getUserPassword());
            pstmt.setString(3,user.getUserPhone());
            pstmt.setString(4,user.getUserEmail());
            pstmt.setString(5,user.getNickName());
            pstmt.executeUpdate();

            flag = 1;
            pstmt.close() ;
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            // 关闭数据库连接
            dbc.close() ;
        }
        return flag;
    }
    public User ReturnUser(String userID){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select customerID AS UserID,passwords AS UserPassword,phone AS UserPhone,email AS UserEmail,NickName AS NickName from customer where customerID=?";
        User user1 = null;
        try {
            user1 = runner.query(sql,new BeanHandler<>(User.class),userID);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user1;
    }
    public void ChangeUser(String userid,String password,String phone,String email,String nickname){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "UPDATE customer SET passwords = ?,phone = ?,email = ?,NickName = ? WHERE customerID = ?";
        try {
            runner.update(sql,password,phone,email,nickname,userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public boolean ValidateID(String UserID){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from customer where customerID=?";
        User user1 = null;
        try {
            user1 = runner.query(sql,new BeanHandler<>(User.class),UserID);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user1 == null;
    }
}
